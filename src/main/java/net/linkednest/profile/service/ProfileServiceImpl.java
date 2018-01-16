package net.linkednest.profile.service;

import java.util.List;
import java.util.Optional;

import javax.annotation.Resource;

import net.linkednest.common.Constants.DBConstants;
import net.linkednest.profile.ProfileConstants;
import org.apache.commons.codec.binary.StringUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import net.linkednest.profile.dao.ProfileDao;
import net.linkednest.profile.dto.LeagueInfoDto;
import net.linkednest.profile.dto.ProfileAttrDto;
import net.linkednest.profile.dto.ProfileAttrElementMapDto;
import net.linkednest.profile.dto.ProfileCareerDto;
import net.linkednest.profile.dto.ProfileContactInfoDto;
import net.linkednest.profile.dto.ProfileDto;
import net.linkednest.profile.dto.ProfilePlayerDto;
import net.linkednest.profile.dto.ProfileStatFielderDto;
import net.linkednest.profile.dto.ProfileStatHitterDto;
import net.linkednest.profile.dto.ProfileStatPitcherDto;
import net.linkednest.profile.dto.ProfileStreamDto;
import net.linkednest.profile.dto.ProfileTeamDto;
import net.linkednest.profile.dto.SearchProfileDto;

@Service
public class ProfileServiceImpl implements ProfileService{
	
	private static final Log logger = LogFactory.getLog(ProfileServiceImpl.class);
	
	@Resource(name="profileDao")
	private ProfileDao profileDao;


	/**
	 * @brief 프로파일 정보 목록 조회(none-paging)
	 * @param profileInfo
	 * @return
	 */
	@Override
	public List<ProfileDto> getProfileInfos(ProfileDto profileInfo){
		return this.profileDao.selectProfileInfos(profileInfo);				
	}
	/**
	 * @brief 프로파일 정보 조회
	 * @param profileInfo
	 * @return
	 */
	@Override
	public ProfileDto getProfileInfo(ProfileDto profileInfo){
		return this.profileDao.selectProfileInfo(profileInfo);				
	}
	/**
	 * @brief 프로파일 검색 정보 조회
	 * @param searchProfileDto
	 * @return
	 */
	@Override
	public List<ProfileDto> getSearchedProfileList(SearchProfileDto searchProfileDto){
		return this.profileDao.selectSearchedProfileList(searchProfileDto);
	}
	/**
	 * @brief 프로파일 검색 정보 갯수 조회
	 * @param searchProfileDto
	 * @return
	 */
	@Override
	public int getSearchedProfileListCnt(SearchProfileDto searchProfileDto){
		return this.profileDao.selectSearchedProfileListCnt(searchProfileDto);
	}
	
	/**
	 * @brief 프로필 검색 목록 화면에서 리스트 필터링을 위한 속성 목록 조회
	 * @param profileDto
	 * @return
	 */
	public List<ProfileAttrDto> getProfileAttrElementList(ProfileDto profileDto) {
//		logger.debug("[ProfileServiceImpl.getProfileAttrElementList] select result : " + this.profileDao.selectProfileAttrElementList(profileDto));
		return this.profileDao.selectProfileAttrElementList(profileDto);
	}

	/**
	 * Insert Profile Infos
	 *
	 * @param profileDto
	 * @return Integer
	 */
	public int addProfileInfos(ProfileDto profileDto) {
		
		int profileId = this.addProfileInfo(profileDto);
		logger.debug("profileId is " + profileId);
		
		if (profileId > 0) {
			String profileType = profileDto.getProfileType();
			if( ProfileConstants.PROFILE_TYPE_PLAYER.equals(profileType) ) {	// insert player's profile infos
				this.insertProfileForPlayer(profileId, profileDto);
			} else if ( ProfileConstants.PROFILE_TYPE_COACH.equals(profileType) ){	// insert coach's profile infos
				this.insertProfileForCoach(profileId, profileDto);
			} else if ( ProfileConstants.PROFILE_TYPE_TEAM.equals(profileType) ){	// insert team's profile infos
				this.insertProfileForTeam(profileId, profileDto);
			}
			// insert common profile infos
			this.insertProfileCommonInfos(profileId, profileDto);
		}
		return 1;
	}

	/**
	 * Insert Player's Profile Infos
	 *
	 * @param profileId
	 * @param profileDto
	 */
	private void insertProfileForPlayer(int profileId, ProfileDto profileDto) {
		// 1. default profile info
		this.insertProfilePlayerInfo(profileId, profileDto);
		// 2. career info list
		this.insertProfileCareerInfos(profileId, profileDto);
		// 3. statistic
		this.insertProfileStatInfos(profileId, profileDto);
	}

	/**
	 * Insert Coach's Profile Infos
	 *
	 * @param profileId
	 * @param profileDto
	 */
	private void insertProfileForCoach(int profileId, ProfileDto profileDto) {
		// 1. default profile info
		this.insertProfilePlayerInfo(profileId, profileDto);
		// 2. career info list
		this.insertProfileCareerInfos(profileId, profileDto);
	}

	/**
	 * Insert Team's Profile Infos
	 *
	 * @param profileId
	 * @param profileDto
	 */
	private void insertProfileForTeam(int profileId, ProfileDto profileDto) {
		Optional<ProfileTeamDto> profileTeamParam = Optional.of(profileDto.getProfileTeamDto());
		if (profileTeamParam.isPresent()) {
			ProfileTeamDto profileTeamParamObj = profileTeamParam.get();
			profileTeamParamObj.setProfileId(profileId);
			try {
				this.addProfileTeamInfo(profileTeamParamObj);
			} catch (Exception e) {
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			}
		}
	}

	/**
	 * Insert Player's Profile Info
	 *
	 * @param profileId
	 * @param profileDto
	 */
	private void insertProfilePlayerInfo (int profileId, ProfileDto profileDto) {
		this.mergeProfilePlayerInfo(profileId, profileDto, "insert");
	}

	/**
	 * Insert Or Update Player's Profile Info
	 *
	 * @param profileId
	 * @param profileDto
	 * @param actionType
	 */
	private void mergeProfilePlayerInfo(int profileId, ProfileDto profileDto, String actionType) {
		Optional<ProfilePlayerDto> profilePlayerParam = Optional.of(profileDto.getProfilePlayerDto());
		if(profilePlayerParam.isPresent()){
			ProfilePlayerDto profilePlayerParamObj = profilePlayerParam.get();
			profilePlayerParamObj.setProfileId(profileId);
			try {
				if (StringUtils.equals(actionType, DBConstants.DB_SQL_INSERT)) {
					this.addProfilePlayerInfo(profilePlayerParamObj);
				} else if (StringUtils.equals(actionType, DBConstants.DB_SQL_UPDATE)) {
					this.updateProfilePlayerInfo(profilePlayerParamObj);
				}
			} catch (Exception e) {
				// Transaction rollback
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			}
		}
	}

	/**
	 * Insert Career Infos for Player, Coach
	 *
	 * @param profileId
	 * @param profileDto
	 */
	private void insertProfileCareerInfos(int profileId, ProfileDto profileDto) {
		List<ProfileCareerDto> profileCareerParamList = profileDto.getProfileCareerList();
		if (CollectionUtils.isNotEmpty(profileCareerParamList)){
			profileCareerParamList.stream().forEach(profileCareerParam -> {
				profileCareerParam.setProfileId(profileId);
				try {
					this.addProfileCareerInfo(profileCareerParam);
				} catch (Exception e) {
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				}
			});
		}
	}

	/**
	 * Insert Profile Statistics Infos
	 *
	 * @param profileId
	 * @param profileDto
	 */
	private void insertProfileStatInfos(int profileId, ProfileDto profileDto) {
		// 3.1. hitting statistic
		List<ProfileStatHitterDto> profileStatHitterParamList = profileDto.getProfileStatHitterList();
		if (CollectionUtils.isNotEmpty(profileStatHitterParamList)) {
			profileStatHitterParamList.stream().forEach(profileStatHitterParam -> {
				profileStatHitterParam.setProfileId(profileId);
				try {
					this.addProfileStatHitterInfo(profileStatHitterParam);
				} catch (Exception e) {
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				}
			});
		}
		// 3.2. fielding statistic
		List<ProfileStatFielderDto> profileStatFielderParamList = profileDto.getProfileStatFielderList();
		if (CollectionUtils.isNotEmpty(profileStatFielderParamList)) {
			profileStatFielderParamList.stream().forEach(profileStatFielderParam -> {
				profileStatFielderParam.setProfileId(profileId);
				try {
					this.addProfileStatFielderInfo(profileStatFielderParam);
				} catch (Exception e) {
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				}
			});
		}
		// 3.3. pitching statistic
		List<ProfileStatPitcherDto> profileStatPitcherParamList = profileDto.getProfileStatPitcherList();
		if (CollectionUtils.isNotEmpty(profileStatPitcherParamList)) {
			profileStatPitcherParamList.stream().forEach(profileStatPitcherParam -> {
				profileStatPitcherParam.setProfileId(profileId);
				try {
					this.addProfileStatPitcherInfo(profileStatPitcherParam);
				} catch (Exception e) {
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				}
			});
		}
	}

	/**
	 * Insert Common Profile Infos
	 *
	 * @param profileId
	 * @param profileDto
	 */
	private void insertProfileCommonInfos(int profileId, ProfileDto profileDto) {
		ProfileContactInfoDto profileContactInfoParam = profileDto.getProfileContactInfoDto();
		if(profileContactInfoParam != null){
			profileContactInfoParam.setProfileId(profileId);
			try {
				this.addProfileContactInfo(profileContactInfoParam);
			} catch (Exception e) {
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			}
		}

		List<ProfileStreamDto> profileStreamParamList = profileDto.getProfileStreamList();
		if(CollectionUtils.isNotEmpty(profileStreamParamList)){
			profileStreamParamList.stream().forEach(profileStreamParam -> {
				profileStreamParam.setProfileId(profileId);
				try {
					this.addProfileStreamInfo(profileStreamParam);
				} catch (Exception e) {
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				}
			});
		}

		List<ProfileAttrElementMapDto> profileAttrElementMapParamList = profileDto.getProfileAttrElementMapList();
		if(CollectionUtils.isNotEmpty(profileAttrElementMapParamList)){

			profileAttrElementMapParamList.stream()
					.filter(profileAttrElementMapParam -> profileAttrElementMapParam.getProfileAttrElementId() > 0)
					.forEach(profileAttrElementMapParam -> {
						profileAttrElementMapParam.setProfileId(profileId);
						try {
							this.addProfileAttrElemMapInfo(profileAttrElementMapParam);
						} catch (Exception e) {
							TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
						}
			});
		}
	}

	/**
	 * Update Profile Infos
	 *
	 * @param profileDto
	 * @return
	 */
	public int updateProfileInfos(ProfileDto profileDto){
		
		int profileId = profileDto.getProfileId();	//this.addProfileInfo(profileDto);
		
		logger.debug("profileId is " + profileId);
		
		if(profileId > 0){
			try {
				// update to profile info 
				this.profileDao.updateProfileInfo(profileDto);		
				String profileType = profileDto.getProfileType();
				if (ProfileConstants.PROFILE_TYPE_PLAYER.equals(profileType)) {
					this.updateProfileForPlayer(profileId, profileDto);
				} else if (ProfileConstants.PROFILE_TYPE_COACH.equals(profileType)) {
					this.updateProfileForCoach(profileId, profileDto);
				} else if (ProfileConstants.PROFILE_TYPE_TEAM.equals(profileType)) {
					this.updateProfileForTeam(profileId, profileDto);
				}
				// Update Profile For Common Infos
				this.updateProfileCommonInfos(profileId, profileDto);

			} catch (Exception e){
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				e.printStackTrace();
			}
		}
		return 1;
	}

	/**
	 * Update Profile For Player
	 *
	 * @param profileId
	 * @param profileDto
	 */
	private void updateProfileForPlayer(int profileId, ProfileDto profileDto) {

		this.updateProfilePlayerInfo(profileId, profileDto);

		this.updateProfileCareerInfos(profileId, profileDto);

		this.updateProfileStatInfos(profileId, profileDto);
	}

	/**
	 * Update Profile For Coach
	 *
	 * @param profileId
	 * @param profileDto
	 */
	private void updateProfileForCoach(int profileId, ProfileDto profileDto) {

		this.updateProfilePlayerInfo(profileId, profileDto);

		this.updateProfileCareerInfos(profileId, profileDto);
	}

	/**
	 * Update Profile For Team
	 *
	 * @param profileId
	 * @param profileDto
	 */
	private void updateProfileForTeam(int profileId, ProfileDto profileDto) {
		ProfileTeamDto profileTeamParam = profileDto.getProfileTeamDto();
		if(profileTeamParam != null){
			profileTeamParam.setProfileId(profileId);
			try {
				this.updateProfileTeamInfo(profileTeamParam);
			} catch (Exception e){
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				e.printStackTrace();
			}
		}
	}

	/**
	 * Update Profile For Common Infos
	 *
	 * @param profileId
	 * @param profileDto
	 */
	private void updateProfileCommonInfos(int profileId, ProfileDto profileDto) {
		ProfileContactInfoDto profileContactInfoParam = profileDto.getProfileContactInfoDto();
		// update info for contact
		if(profileContactInfoParam != null){
			profileContactInfoParam.setProfileId(profileId);
			try {
				this.updateProfileContactInfo(profileContactInfoParam);
			} catch (Exception e){
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				e.printStackTrace();
			}
		}

		// update list for stream
		List<ProfileStreamDto> profileStreamParamList = profileDto.getProfileStreamList();
		if(CollectionUtils.isNotEmpty(profileStreamParamList)){
			// 기존의 동영상 목록 제거(초기화)
			this.profileDao.deleteProfileStreamInfo(profileId);
			// 새로운 동영상 목록 추가
			profileStreamParamList.stream().forEach(profileStreamParam -> {
				profileStreamParam.setProfileId(profileId);
				try {
					this.addProfileStreamInfo(profileStreamParam);
				} catch (Exception e){
					e.printStackTrace();
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				}
			});
		}

		// update list for profile's attribute map
		List<ProfileAttrElementMapDto> profileAttrElementMapParamList = profileDto.getProfileAttrElementMapList();

		if (CollectionUtils.isNotEmpty(profileAttrElementMapParamList)) {
			// 기존의 profile attribute mapping 정보 제거
			this.profileDao.deleteProfileAttrElemMapInfo(profileId);
			// 새로운 profile attribute mapping 정보 추가
			profileAttrElementMapParamList.stream()
					.filter(profileAttrElementMapParam -> profileAttrElementMapParam.getProfileAttrElementId() > 0)
					.forEach(profileAttrElementMapParam -> {
				profileAttrElementMapParam.setProfileId(profileId);
				this.addProfileAttrElemMapInfo(profileAttrElementMapParam);
			});
		}
	}

	/**
	 * updating player profile
	 *
	 * @param profileId
	 * @param profileDto
	 */
	private void updateProfilePlayerInfo(int profileId, ProfileDto profileDto) {
		this.mergeProfilePlayerInfo(profileId, profileDto, DBConstants.DB_SQL_UPDATE);
	}

	/**
	 * updating profile > career info
	 *
	 * @param profileId
	 * @param profileDto
	 */
	private void updateProfileCareerInfos(int profileId, ProfileDto profileDto) {
		List<ProfileCareerDto> profileCareerParamList = profileDto.getProfileCareerList();
		if(CollectionUtils.isNotEmpty(profileCareerParamList)){
//						this.profileDao.deleteProfileCareerInfo(profileId);
			profileCareerParamList.stream().forEach(profileCareerParam -> {
				profileCareerParam.setProfileId(profileId);
				try {
					this.addProfileCareerInfo(profileCareerParam);
				} catch (Exception e){
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					e.printStackTrace();
				}
			});
		}
	}

	/**
	 * updating profile > stat info
	 *
	 * @param profileId
	 * @param profileDto
	 */
	private void updateProfileStatInfos(int profileId, ProfileDto profileDto) {
		/**********************************
		 * Updating Hitting Stats
		 **********************************/
		List<ProfileStatHitterDto> profileStatHitterParamList = profileDto.getProfileStatHitterList();
		if(CollectionUtils.isNotEmpty(profileStatHitterParamList)){
			// 기존의 타격 기록 정보 삭제(초기화)
			this.profileDao.deleteProfileStatHitterInfo(profileId);
			// 새로운 타격 기록 정보 추가
			profileStatHitterParamList.stream().forEach(profileStatHitterParam -> {
				profileStatHitterParam.setProfileId(profileId);
				try {
					this.addProfileStatHitterInfo(profileStatHitterParam);
				} catch (Exception e){
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					e.printStackTrace();
				}
			});
		}
		/**********************************
		 * Updating Fielding Stats
		 **********************************/
		List<ProfileStatFielderDto> profileStatFielderParamList = profileDto.getProfileStatFielderList();
		if(CollectionUtils.isNotEmpty(profileStatFielderParamList)){
			// 기존의 수비 기록 정보 삭제(초기화)
			this.profileDao.deleteProfileStatFielderInfo(profileId);
			// 새로운 수비 기록 정보 추가
			profileStatFielderParamList.stream().forEach(profileStatFielderParam -> {
				profileStatFielderParam.setProfileId(profileId);
				try {
					this.addProfileStatFielderInfo(profileStatFielderParam);
				} catch (Exception e){
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					e.printStackTrace();
				}
			});
		}
		/**********************************
		 * Updating Ptiching Stats
		 **********************************/
		List<ProfileStatPitcherDto> profileStatPitcherParamList = profileDto.getProfileStatPitcherList();
		if(CollectionUtils.isNotEmpty(profileStatPitcherParamList)){
			// 기존의 피칭 기록 정보 삭제(초기화)
			this.profileDao.deleteProfileStatPitcherInfo(profileId);
			// 새로운 피칭 기록 정보 추가
			profileStatPitcherParamList.stream().forEach(profileStatPitcherParam -> {
				profileStatPitcherParam.setProfileId(profileId);
				try {
					this.addProfileStatPitcherInfo(profileStatPitcherParam);
				} catch (Exception e){
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					e.printStackTrace();
				}
			});
		}
	}

	/**
	 * Adding basically profile info
	 *
	 * @param profileDto
	 * @return int
	 * 			profileId
	 */
	private int addProfileInfo(ProfileDto profileDto){
		int profileId = 0;
		try {
			// insert profile information
			profileId = this.profileDao.insertProfileInfo(profileDto);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			return profileId;
		}
	}
	
	private int addProfilePlayerInfo(ProfilePlayerDto profilePlayerDto){
		return this.profileDao.insertProfilePlayerInfo(profilePlayerDto);
	}

	private int updateProfilePlayerInfo(ProfilePlayerDto profilePlayerDto){
		return this.profileDao.updateProfilePlayerInfo(profilePlayerDto);
	}

	private int addProfileContactInfo(ProfileContactInfoDto profileContactInfoDto){
		return this.profileDao.insertProfileContactInfo(profileContactInfoDto);
	}

	private int updateProfileContactInfo(ProfileContactInfoDto profileContactInfoDto){
		return this.profileDao.updateProfileContactInfo(profileContactInfoDto);
	}

	private int addProfileStatHitterInfo(ProfileStatHitterDto profileStatHitterDto){
		return this.profileDao.insertProfileStatHitterInfo(profileStatHitterDto);
	}
	
	private int addProfileStatFielderInfo(ProfileStatFielderDto proStatFielderDto){
		return this.profileDao.insertProfileStatFielderInfo(proStatFielderDto);
	}
	
	private int addProfileStatPitcherInfo(ProfileStatPitcherDto profileStatPitcherDto){
		return this.profileDao.insertProfileStatPitcherInfo(profileStatPitcherDto);
	}
	
	private int addProfileCareerInfo(ProfileCareerDto profileCareerDto){
		return this.profileDao.insertProfileCareerInfo(profileCareerDto);
	}

	private int addProfileStreamInfo(ProfileStreamDto profileStreamDto){
		return this.profileDao.insertProfileStreamInfo(profileStreamDto);
	}
	
	private int addProfileAttrElemMapInfo(ProfileAttrElementMapDto profileAttrElementMapDto){
		return this.profileDao.insertProfileAttrElemMapInfo(profileAttrElementMapDto);
	}
	
	private int addProfileTeamInfo(ProfileTeamDto profileTeamDto){
		return this.profileDao.insertProfileTeamInfo(profileTeamDto);
	}
	
	private int updateProfileTeamInfo(ProfileTeamDto profileTeamDto){
		return this.profileDao.updateProfileTeamInfo(profileTeamDto);
	}
	
	@Override
	public int addLeagueInfo(LeagueInfoDto leagueInfoDto){
		return this.profileDao.insertLeagueInfo(leagueInfoDto);
	}
	
	@Override
	public List<LeagueInfoDto> getLeagueInfoList(){
		return this.profileDao.selectLeagueInfoList();
	}
	
	@Override
	public LeagueInfoDto getLeagueInfo(int leagueId){
		LeagueInfoDto leagueInfoDto = new LeagueInfoDto();
		leagueInfoDto.setLeagueId(leagueId);
		return this.profileDao.selectLeagueInfo(leagueInfoDto);
	}
}
