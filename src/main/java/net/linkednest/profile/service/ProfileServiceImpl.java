package net.linkednest.profile.service;

import java.util.List;

import javax.annotation.Resource;

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

@Service("profileService")
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
	public List<ProfileAttrDto> getProfileAttrElementList(ProfileDto profileDto){
//		logger.debug("[ProfileServiceImpl.getProfileAttrElementList] select result : " + this.profileDao.selectProfileAttrElementList(profileDto));
		return this.profileDao.selectProfileAttrElementList(profileDto);
	}
	
	public int addProfileInfos(ProfileDto profileDto){
		
		int profileId = this.addProfileInfo(profileDto);
		
		logger.debug("profileId is " + profileId);
		
		if(profileId > 0){
			if(profileDto.getProfileType().equals("1")){
				ProfilePlayerDto profilePlayerParam = profileDto.getProfilePlayerDto();
				if(profilePlayerParam != null){
					profilePlayerParam.setProfileId(profileId);
					try {
						this.addProfilePlayerInfo(profilePlayerParam);						
					} catch (Exception e) {
						TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					}
				}
				List<ProfileCareerDto> profileCareerParamList = profileDto.getProfileCareerList();
				if(profileCareerParamList != null && profileCareerParamList.size() > 0){
					for(ProfileCareerDto profileCareerParam : profileCareerParamList){
						profileCareerParam.setProfileId(profileId);
						try {
							this.addProfileCareerInfo(profileCareerParam);							
						} catch (Exception e) {
							TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
						}
					}
				}
				List<ProfileStatHitterDto> profileStatHitterParamList = profileDto.getProfileStatHitterList();
				if(profileStatHitterParamList != null && profileStatHitterParamList.size() > 0){
					for(ProfileStatHitterDto profileStatHitterParam : profileStatHitterParamList){
						profileStatHitterParam.setProfileId(profileId);
						try {
							this.addProfileStatHitterInfo(profileStatHitterParam);								
						} catch (Exception e) {
							TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
						}
					}
				}
				
				List<ProfileStatFielderDto> profileStatFielderParamList = profileDto.getProfileStatFielderList();
				if(profileStatFielderParamList != null && profileStatFielderParamList.size() > 0){
					for(ProfileStatFielderDto profileStatFielderParam : profileStatFielderParamList){
						profileStatFielderParam.setProfileId(profileId);
						try {
							this.addProfileStatFielderInfo(profileStatFielderParam);								
						} catch (Exception e) {
							TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
						}
					}
				}
				
				List<ProfileStatPitcherDto> profileStatPitcherParamList = profileDto.getProfileStatPitcherList();
				if(profileStatPitcherParamList != null && profileStatPitcherParamList.size() > 0){
					for(ProfileStatPitcherDto profileStatPitcherParam : profileStatPitcherParamList){
						profileStatPitcherParam.setProfileId(profileId);
						try {
							this.addProfileStatPitcherInfo(profileStatPitcherParam);								
						} catch (Exception e) {
							TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
						}
					}
				}			
				
			}else if(profileDto.getProfileType().equals("2")){
				ProfilePlayerDto profilePlayerParam = profileDto.getProfilePlayerDto();
				if(profilePlayerParam != null){
					profilePlayerParam.setProfileId(profileId);
					try {
						this.addProfilePlayerInfo(profilePlayerParam);						
					} catch (Exception e) {
						TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					}
				}
				List<ProfileCareerDto> profileCareerParamList = profileDto.getProfileCareerList();
				if(profileCareerParamList != null && profileCareerParamList.size() > 0){
					for(ProfileCareerDto profileCareerParam : profileCareerParamList){
						profileCareerParam.setProfileId(profileId);
						try {
							this.addProfileCareerInfo(profileCareerParam);							
						} catch (Exception e) {
							TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
						}
					}
				}
			}else if(profileDto.getProfileType().equals("3")){
				ProfileTeamDto profileTeamParam = profileDto.getProfileTeamDto();
				if(profileTeamParam != null){
					profileTeamParam.setProfileId(profileId);
					try {
						this.addProfileTeamInfo(profileTeamParam);						
					} catch (Exception e) {
						TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					}
				}
			}
			
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
			if(profileStreamParamList != null && profileStreamParamList.size() > 0){
				for(ProfileStreamDto profileStreamParam : profileStreamParamList){
					profileStreamParam.setProfileId(profileId);
					try {
						this.addProfileStreamInfo(profileStreamParam);						
					} catch (Exception e) {
						TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					}
				}
			}
			
			
			List<ProfileAttrElementMapDto> profileAttrElementMapParamList = profileDto.getProfileAttrElementMapList();
			if(profileAttrElementMapParamList != null && profileAttrElementMapParamList.size() > 0){
				for(ProfileAttrElementMapDto profileAttrElementMapParam : profileAttrElementMapParamList){
					if(profileAttrElementMapParam.getProfileAttrElementId() > 0){
						profileAttrElementMapParam.setProfileId(profileId);
						try {
							this.addProfileAttrElemMapInfo(profileAttrElementMapParam);													
						} catch (Exception e) {
							TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
						}
					}
				}
			}
		}
		
		return 1;
	}

	public int updateProfileInfos(ProfileDto profileDto){
		
		int profileId = profileDto.getProfileId();	//this.addProfileInfo(profileDto);
		
		logger.debug("profileId is " + profileId);
		
		if(profileId > 0){
			try {
				// update to profile info 
				this.profileDao.updateProfileInfo(profileDto);		
				
				if(profileDto.getProfileType().equals("1")){
					ProfilePlayerDto profilePlayerParam = profileDto.getProfilePlayerDto();
					if(profilePlayerParam != null){
						profilePlayerParam.setProfileId(profileId);
						try {
							this.updateProfilePlayerInfo(profilePlayerParam);							
						} catch (Exception e){
							TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
						}
					}
					List<ProfileCareerDto> profileCareerParamList = profileDto.getProfileCareerList();
					if(profileCareerParamList != null && profileCareerParamList.size() > 0){
//						this.profileDao.deleteProfileCareerInfo(profileId);
						for(ProfileCareerDto profileCareerParam : profileCareerParamList){
							profileCareerParam.setProfileId(profileId);
							try {
								this.addProfileCareerInfo(profileCareerParam);
							} catch (Exception e){
								e.printStackTrace();
								TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
							}							
						}
					}
					List<ProfileStatHitterDto> profileStatHitterParamList = profileDto.getProfileStatHitterList();
					if(profileStatHitterParamList != null && profileStatHitterParamList.size() > 0){
						this.profileDao.deleteProfileStatHitterInfo(profileId);
						for(ProfileStatHitterDto profileStatHitterParam : profileStatHitterParamList){
							profileStatHitterParam.setProfileId(profileId);
							try {
								this.addProfileStatHitterInfo(profileStatHitterParam);	
							} catch (Exception e){
								e.printStackTrace();
								TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
							}														
						}
					}
					
					List<ProfileStatFielderDto> profileStatFielderParamList = profileDto.getProfileStatFielderList();
					if(profileStatFielderParamList != null && profileStatFielderParamList.size() > 0){
						this.profileDao.deleteProfileStatFielderInfo(profileId);
						for(ProfileStatFielderDto profileStatFielderParam : profileStatFielderParamList){
							profileStatFielderParam.setProfileId(profileId);
							try {
								this.addProfileStatFielderInfo(profileStatFielderParam);	
							} catch (Exception e){
								e.printStackTrace();
								TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
							}							
						}
					}
					
					List<ProfileStatPitcherDto> profileStatPitcherParamList = profileDto.getProfileStatPitcherList();
					if(profileStatPitcherParamList != null && profileStatPitcherParamList.size() > 0){
						this.profileDao.deleteProfileStatPitcherInfo(profileId);
						for(ProfileStatPitcherDto profileStatPitcherParam : profileStatPitcherParamList){
							profileStatPitcherParam.setProfileId(profileId);
							try {
								this.addProfileStatPitcherInfo(profileStatPitcherParam);	
							} catch (Exception e){
								e.printStackTrace();
								TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
							}														
						}
					}			
					
				}else if(profileDto.getProfileType().equals("2")){
					ProfilePlayerDto profilePlayerParam = profileDto.getProfilePlayerDto();
					if(profilePlayerParam != null){
						profilePlayerParam.setProfileId(profileId);
						try {
							this.updateProfilePlayerInfo(profilePlayerParam);							
						} catch (Exception e){
							TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
						}
					}
					List<ProfileCareerDto> profileCareerParamList = profileDto.getProfileCareerList();
					if(profileCareerParamList != null && profileCareerParamList.size() > 0){
//						this.profileDao.deleteProfileCareerInfo(profileId);
						for(ProfileCareerDto profileCareerParam : profileCareerParamList){
							profileCareerParam.setProfileId(profileId);
							try {
								this.addProfileCareerInfo(profileCareerParam);
							} catch (Exception e){
								e.printStackTrace();
								TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
							}							
						}
					}
				}else if(profileDto.getProfileType().equals("3")){
					ProfileTeamDto profileTeamParam = profileDto.getProfileTeamDto();
					if(profileTeamParam != null){
						profileTeamParam.setProfileId(profileId);
						try {
							this.updateProfileTeamInfo(profileTeamParam);
						} catch (Exception e){
							e.printStackTrace();
							TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
						}						
					}
				}
				
				ProfileContactInfoDto profileContactInfoParam = profileDto.getProfileContactInfoDto();
				if(profileContactInfoParam != null){
					profileContactInfoParam.setProfileId(profileId);
					try {
						this.updateProfileContactInfo(profileContactInfoParam);
					} catch (Exception e){
						e.printStackTrace();
						TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					}											
				}
				
				
				List<ProfileStreamDto> profileStreamParamList = profileDto.getProfileStreamList();
				if(profileStreamParamList != null && profileStreamParamList.size() > 0){
					this.profileDao.deleteProfileStreamInfo(profileId);
					for(ProfileStreamDto profileStreamParam : profileStreamParamList){
						profileStreamParam.setProfileId(profileId);
						try {
							this.addProfileStreamInfo(profileStreamParam);
						} catch (Exception e){
							e.printStackTrace();
							TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
						}																	
					}
				}
				
				List<ProfileAttrElementMapDto> profileAttrElementMapParamList = profileDto.getProfileAttrElementMapList();
				if(profileAttrElementMapParamList != null && profileAttrElementMapParamList.size() > 0){
					this.profileDao.deleteProfileAttrElemMapInfo(profileId);
					for(ProfileAttrElementMapDto profileAttrElementMapParam : profileAttrElementMapParamList){
						if(profileAttrElementMapParam.getProfileAttrElementId() > 0){
							profileAttrElementMapParam.setProfileId(profileId);
							this.addProfileAttrElemMapInfo(profileAttrElementMapParam);						
						}
					}
				}
				
			} catch (Exception e){
				e.printStackTrace();
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			}
			
		}
		
		return 1;
	}
	
	
	private int addProfileInfo(ProfileDto profileDto){
		return this.profileDao.insertProfileInfo(profileDto);
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
