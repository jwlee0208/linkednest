package net.linkednest.www.profile.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.linkednest.common.service.impl.CommonServiceImpl;
import net.linkednest.www.profile.dto.*;
import net.linkednest.www.user.dto.UserDto;
import org.apache.commons.codec.binary.StringUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import net.linkednest.www.profile.dao.ProfileDao;

@Service("profileService")
public class ProfileServiceImpl implements ProfileService{
	
	private static final Log logger = LogFactory.getLog(ProfileServiceImpl.class);
	
	@Resource(name="profileDao")
	private ProfileDao profileDao;

	@Resource(name="CommonServiceImpl")
	private CommonServiceImpl commonService;


	private static final String PROFILE_TYPE_PLAYER 	= "1";
	private static final String PROFILE_TYPE_COACH 		= "2";
	private static final String PROFILE_TYPE_TEAM 		= "3";
	
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
			if( StringUtils.equals(profileType, PROFILE_TYPE_PLAYER)) {
				// insert player's profile infos
				this.insertProfileForPlayer(profileId, profileDto);
			} else if (StringUtils.equals(profileType, PROFILE_TYPE_COACH)){
				// insert coach's profile infos
				this.insertProfileForCoach(profileId, profileDto);
			} else if (StringUtils.equals(profileType, PROFILE_TYPE_TEAM)){
				// insert team's profile infos
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
				if (StringUtils.equals(actionType, "insert")) {
					this.addProfilePlayerInfo(profilePlayerParamObj);
				} else if (StringUtils.equals(actionType, "update")) {
					this.updateProfilePlayerInfo(profilePlayerParamObj);
				}
			} catch (Exception e) {
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
		if (profileCareerParamList != null && profileCareerParamList.size() > 0){
			for(ProfileCareerDto profileCareerParam : profileCareerParamList){
				profileCareerParam.setProfileId(profileId);
				try {
					this.addProfileCareerInfo(profileCareerParam);
				} catch (Exception e) {
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				}
			}
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
		if (profileStatFielderParamList != null && profileStatFielderParamList.size() > 0) {
			for(ProfileStatFielderDto profileStatFielderParam : profileStatFielderParamList){
				profileStatFielderParam.setProfileId(profileId);
				try {
					this.addProfileStatFielderInfo(profileStatFielderParam);
				} catch (Exception e) {
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				}
			}
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
				if (StringUtils.equals(profileType, PROFILE_TYPE_PLAYER)) {
					this.updateProfileForPlayer(profileId, profileDto);
				} else if (StringUtils.equals(profileType, PROFILE_TYPE_COACH)) {
					this.updateProfileForCoach(profileId, profileDto);
				} else if (StringUtils.equals(profileType, PROFILE_TYPE_TEAM)) {
					this.updateProfileForTeam(profileId, profileDto);
				}

				this.updateProfileCommonInfos(profileId, profileDto);

			} catch (Exception e){
				e.printStackTrace();
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			}

		}

		return 1;
	}


	private void updateProfileForPlayer(int profileId, ProfileDto profileDto) {

		this.updateProfilePlayerInfo(profileId, profileDto);

		this.updateProfileCareerInfos(profileId, profileDto);

		this.updateProfileStatInfos(profileId, profileDto);
	}

	private void updateProfileForCoach(int profileId, ProfileDto profileDto) {

		this.updateProfilePlayerInfo(profileId, profileDto);

		this.updateProfileCareerInfos(profileId, profileDto);
	}

	private void updateProfileForTeam(int profileId, ProfileDto profileDto) {
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

	private void updateProfileCommonInfos(int profileId, ProfileDto profileDto) {
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
	}

	private void updateProfilePlayerInfo(int profileId, ProfileDto profileDto) {
		this.mergeProfilePlayerInfo(profileId, profileDto, "update");
	}

	private void updateProfileCareerInfos(int profileId, ProfileDto profileDto) {
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
	}

	private void updateProfileStatInfos(int profileId, ProfileDto profileDto) {
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

	@Override
	public void sendMailProfile(ProfileDto profileInfo, HttpSession session, ProfileMailReq request) {
		UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");

		ProfileDto profileInfoRes = this.getProfileInfo(profileInfo);

		// Velocity Template 에 Mapping할 Data Map
		Map<String, Object> contentMap = new HashMap<String, Object>();
		contentMap.put("mailTo"         , request.getMailTo());
		contentMap.put("profileInfo" 	, this.getBody(profileInfoRes));
		contentMap.put("message"		, request.getMessage());

		// Send Mail
		this.commonService.commonSendMailTemplate(sessionInfo, "[linkedNest.net] Check Out!!" + profileInfoRes.getName() + "'s Profile!!!", "mailTemplates/profileTemplate.vm", contentMap);
	}

	private String getBody(ProfileDto profileInfo) {
		StringBuffer sb = new StringBuffer();
		String profileContent = "\n" +
				"\n" +
				"<!DOCTYPE HTML>\n" +
				"<!--[if IE 7 ]>\t\t <html class=\"no-js ie ie7 lte7 lte8 lte9\" lang=\"ko-KR\"> <![endif]-->\n" +
				"<!--[if IE 8 ]>\t\t <html class=\"no-js ie ie8 lte8 lte9\" lang=\"ko-KR\"> <![endif]-->\n" +
				"<!--[if IE 9 ]>\t\t <html class=\"no-js ie ie9 lte9>\" lang=\"ko-KR\"> <![endif]-->\n" +
				"<!--[if (gt IE 9)|!(IE)]><!--> <html class=\"no-js\" lang=\"ko-KR\"> <!--<![endif]-->\n" +
				"<head>\n" +
				"<meta charset=\"UTF-8\">\n" +
				"<meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge\" />\n" +
				"<meta http-equiv=\"Pragma\" content=\"no-cache\">\n" +
				"<meta http-equiv=\"expires\" content=\"-1\">\n" +
				"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
				"<link rel=\"apple-touch-icon\" sizes=\"57x57\" href=\"/img/common/apple-icon-57x57.png\">\n" +
				"<link rel=\"apple-touch-icon\" sizes=\"60x60\" href=\"/img/common/apple-icon-60x60.png\">\n" +
				"<link rel=\"apple-touch-icon\" sizes=\"72x72\" href=\"/img/common/apple-icon-72x72.png\">\n" +
				"<link rel=\"apple-touch-icon\" sizes=\"76x76\" href=\"/img/common/apple-icon-76x76.png\">\n" +
				"<link rel=\"apple-touch-icon\" sizes=\"114x114\" href=\"/img/common/apple-icon-114x114.png\">\n" +
				"<link rel=\"apple-touch-icon\" sizes=\"120x120\" href=\"/img/common/apple-icon-120x120.png\">\n" +
				"<link rel=\"apple-touch-icon\" sizes=\"144x144\" href=\"/img/common/apple-icon-144x144.png\">\n" +
				"<link rel=\"apple-touch-icon\" sizes=\"152x152\" href=\"/img/common/apple-icon-152x152.png\">\n" +
				"<link rel=\"apple-touch-icon\" sizes=\"180x180\" href=\"/img/common/apple-icon-180x180.png\">\n" +
				"<link rel=\"icon\" type=\"image/png\" sizes=\"192x192\" href=\"/img/common/android-icon-192x192.png\">\n" +
				"<link rel=\"icon\" type=\"image/png\" sizes=\"32x32\" href=\"/img/common/favicon-32x32.png\">\n" +
				"<link rel=\"icon\" type=\"image/png\" sizes=\"96x96\" href=\"/img/common/favicon-96x96.png\">\n" +
				"<link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"/img/common/favicon-16x16.png\">\n" +
				"<link rel=\"manifest\" href=\"/manifest.json\">\n" +
				"<meta name=\"msapplication-TileColor\" content=\"#ffffff\">\n" +
				"<meta name=\"msapplication-TileImage\" content=\"/img/common/ms-icon-144x144.png\">\n" +
				"<meta name=\"theme-color\" content=\"#ffffff\">\n" +
				"<title>LinkedNest - Link Between Player With Club</title>\n" +
				"\n" +
				"<script type=\"text/javascript\" src=\"/js/jquery-1.11.1.min.js\"></script>\n" +
				"<script type=\"text/javascript\" src=\"/js/jquery-validate.min.js\"></script>\n" +
				"<script type=\"text/javascript\" src=\"/js/jquery.form.min.js\"></script>\n" +
				"<script type=\"text/javascript\" src=\"/js/jquery-ui.min.js\"></script>\n" +
				"\n" +
				"<link rel=\"stylesheet\" href=\"/lib/bootstrapV4/css/bootstrap.min.css\">\n" +
				"<script type=\"text/javascript\" src=\"/lib/bootstrapV4/js/bootstrap.min.js\"></script>\n" +
				"<script src=\"/lib/tether/js/tether.min.js\"></script>\n" +
				"<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/base.css\" />\n" +
				"<link rel=\"stylesheet\" href=\"/css/jquery/jquery-ui.min.css\">\n" +
				"<!--[if (gte IE 6)&(lte IE 8)]><script type=\"text/javascript\" src=\"/js/selectivizr-min.js\"></script><![endif]-->\n" +
				"\n" +
				"</head>\n" +
				"<body>\n" +
				"<script type=\"text/javascript\" src=\"/js/home/home.js\"></script>\n" +
				"<div class=\"navbar navbar-light navbar-toggleable-md bd-navbar\">\n" +
				"<div id=\"google_translate_element\"></div><script type=\"text/javascript\">\n" +
				"function googleTranslateElementInit() {\n" +
				"  new google.translate.TranslateElement({pageLanguage: 'ko', layout: google.translate.TranslateElement.InlineLayout.SIMPLE, multilanguagePage: true, gaTrack: true, gaId: 'UA-65838621-1'}, 'google_translate_element');\n" +
				"}\n" +
				"</script><script type=\"text/javascript\" src=\"//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit\"></script>\n" +
				"</div>\n" +
				"\n" +
				"<nav class=\"navbar navbar-toggleable-md navbar-inverse bg-primary\" role=\"navigation\" style=\"background-color: #e3f2fd;\">\n" +
				"<input type=\"hidden\" id=\"menuId\" name=\"menuId\" value=\"\" />\n" +
				"\n" +
				"<button class=\"navbar-toggler navbar-toggler-right\" type=\"button\" data-toggle=\"collapse\" data-target=\"#nav-collapse-player-menu-list\" aria-controls=\"nav-collapse-player-menu-list\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n" +
				"<span class=\"navbar-toggler-icon\"></span>\n" +
				"</button>\n" +
				"\n" +
				"\n" +
				"<a class=\"navbar-brand\" href=\"javascript:;\" onclick=\"javascript:goHome();\"><span style=\"color: white; font-size: 25px; font-weight: bold;\">L</span>inked<span style=\"color: white; font-size: 25px; font-weight: bold;\">N</span>est\n" +
				"- <span style=\"color: white; font-size: 15px;\">Looking For Chances</span>\n" +
				"</a>\n" +
				"\n" +
				"<div class=\"collapse navbar-collapse\" id=\"nav-collapse-player-menu-list\">\n" +
				"<ul class=\"nav navbar-nav  mr-auto\">\n" +
				"<li class=\"nav-item\"><a class=\"nav-link\" href=\"javascript:;\" onclick=\"javascript:goHome();\">Home</a></li>\n" +
				"<li class=\"nav-item\"><a class=\"nav-link\" href=\"javascript:;\" onclick=\"javascript:goProfileList(1, '01010100');\">Player List</a></li>\n" +
				"<li class=\"nav-item\"><a class=\"nav-link\" href=\"javascript:;\" onclick=\"javascript:goProfileList(2, '01010200');\">Coach List</a></li>\n" +
				"<li class=\"nav-item\"><a class=\"nav-link\" href=\"javascript:;\" onclick=\"javascript:goProfileList(3, '01010300');\">Team List</a></li>\n" +
				"<li class=\"nav-item\"><a class=\"nav-link\" href=\"/profile/leagueList\">League List</a></li>\n" +
				"\n" +
				"\n" +
				"</ul>\n" +
				"<form class=\"navbar-form navbar-right\" role=\"search\">\n" +
				"<a onclick=\"javascript:goRegist(6);\" class=\"btn btn-outline-secondary\">Sign Up</a>\n" +
				"<a onclick=\"javascript:goLogin(7);\" class=\"btn btn-outline-success\">Sign In</a>\n" +
				"</form>\n" +
				"</div>\n" +
				"\n" +
				"</nav>\n" +
				"<div role=\"main\">\n" +
				"<script type=\"text/javascript\" src=\"/js/jquery-1.11.1.min.js\"></script>\n" +
				"<script type=\"text/javascript\" src=\"/js/jquery-validate.min.js\"></script>\n" +
				"<script type=\"text/javascript\" src=\"/js/jquery.form.min.js\"></script>\n" +
				"<script type=\"text/javascript\" src=\"/js/jquery-ui.min.js\"></script>\n" +
				"<script type=\"text/javascript\" src=\"/js/holder.js\"></script>\n" +
				"<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/base.css\" />\n" +
				"<style type=\"text/css\">\n" +
				"\t.form-group .col-sm-10 {vertical-align : middle;}\n" +
				"</style>\n" +
				"<div class=\"container\">\n" +
				"<br />\n" +
				"<h1 id=\"btn-groups\" class=\"page-header\">Profile&nbsp;&nbsp;<small>Detail</small></h1>\n" +
				"<hr />\n" +
				"<form id=\"viewFrm\" name=\"viewFrm\" method=\"post\" class=\"form-horizontal\" role=\"form\">\n" +
				"<input type=\"hidden\" id=\"profileId\" name=\"profileId\" value=\"57\" />\n" +
				"<div style=\"display:none;\"><h2>Lee Jae Soon&nbsp;<small>Profile</small></h2></div>\n" +
				"<div style=\"padding-top:20px;\"></div>\n" +
				"<div class=\"form-group row\">\n" +
				"<div class=\"col-sm-5\">\n" +
				"<img src=\"http://jwlee0208.cdn3.cafe24.com//uploadfiles/2017-08-08/1502201949433.JPG\" class=\"img-fluid rounded mx-auto d-block\" />\n" +
				"</div>\n" +
				"<div class=\"col-sm-7\">\n" +
				"</div>\n" +
				"</div>\n" +
				"<ul class=\"nav nav-tabs flex-column flex-sm-row\" id=\"profileTab\">\n" +
				"<li class=\"nav-item\">\n" +
				"<a class=\"flex-sm-fill text-sm-center nav-link active\" data-toggle=\"pill\" href=\"#playerInfo\">Player Information</a>\n" +
				"</li>\n" +
				"<li class=\"nav-item\">\n" +
				"<a class=\"flex-sm-fill text-sm-center nav-link\" data-toggle=\"pill\" href=\"#playerAttribute\">Player Attribute</a>\n" +
				"</li>\n" +
				"<li class=\"nav-item\">\n" +
				"<a class=\"flex-sm-fill text-sm-center nav-link\" data-toggle=\"pill\" href=\"#career\">Career</a>\n" +
				"</li>\n" +
				"<li class=\"nav-item\">\n" +
				"<a class=\"flex-sm-fill text-sm-center nav-link\" data-toggle=\"pill\" href=\"#streamList\">Play Streamming</a>\n" +
				"</li>\n" +
				"<li class=\"nav-item\">\n" +
				"<a class=\"flex-sm-fill text-sm-center nav-link\" data-toggle=\"pill\" href=\"#statistic\">Statistics</a>\n" +
				"</li>\n" +
				"<li class=\"nav-item\">\n" +
				"<a class=\"flex-sm-fill text-sm-center nav-link\" data-toggle=\"pill\" href=\"#introduce\">Introduce</a>\n" +
				"</li>\n" +
				"<li class=\"nav-item\">\n" +
				"<a class=\"flex-sm-fill text-sm-center nav-link\" data-toggle=\"pill\" href=\"#contact\">Contact</a>\n" +
				"</li>\n" +
				"</ul>\n" +
				"<br />\n" +
				"<div class=\"tab-content\">\n" +
				"<div id=\"playerInfo\" class=\"tab-pane active\" role=\"tabpanel\">\n" +
				"<div class=\"form-group row\">\n" +
				"<label for=\"\" class=\"col-sm-2 col-form-label\">Player's Name</label>\n" +
				" <div class=\"col-sm-10\">\n" +
				"<p class=\"form-control-static\">Lee Jae Soon</p>\n" +
				"</div>\n" +
				"</div>\n" +
				"<div class=\"form-group row\">\n" +
				"<label for=\"\" class=\"col-sm-2 col-form-label\">Height / Weight</label>\n" +
				"<div class=\"col-sm-10\">\n" +
				"<p class=\"form-control-static\">174.0&nbsp;cm (5.7 feet) / 73.0&nbsp;kg (160.9 found)</p>\n" +
				"</div>\n" +
				"</div>\n" +
				"<div class=\"form-group row\">\n" +
				"<label for=\"\" class=\"col-sm-2 col-form-label\">Date Of Birth</label>\n" +
				"<div class=\"col-sm-10\">\n" +
				"<p class=\"form-control-static\">2017-09-17</p>\n" +
				"</div>\n" +
				"</div>\n" +
				"<div class=\"form-group row\">\n" +
				"<label for=\"\" class=\"col-sm-2 col-form-label\">Birth Place</label>\n" +
				"<div class=\"col-sm-10\">\n" +
				"<p class=\"form-control-static\">Korea,seoul</p>\n" +
				"</div>\n" +
				"</div>\n" +
				"<div class=\"form-group row\">\n" +
				"<label for=\"\" class=\"col-sm-2 col-form-label\">Education</label>\n" +
				"<div class=\"col-sm-10\">\n" +
				"<p class=\"form-control-static\">Attending Seonam Univ.</p>\n" +
				"</div>\n" +
				"</div>\n" +
				"<div class=\"form-group row\">\n" +
				"<label for=\"\" class=\"col-sm-2 col-form-label\">Hobbies</label>\n" +
				"<div class=\"col-sm-10\">\n" +
				"<p class=\"form-control-static\"></p>\n" +
				"</div>\n" +
				"</div>\n" +
				"<div class=\"form-group row\">\n" +
				"<label for=\"\" class=\"col-sm-2 col-form-label\">Favorite Foods</label>\n" +
				"<div class=\"col-sm-10\">\n" +
				"<p class=\"form-control-static\">American food</p>\n" +
				"</div>\n" +
				"</div>\n" +
				"<div class=\"form-group row\">\n" +
				"<label for=\"\" class=\"col-sm-2 col-form-label\">Nationality</label>\n" +
				"<div class=\"col-sm-10\">\n" +
				"<p class=\"form-control-static\">\n" +
				"SOUTH KOREA\n" +
				"</p>\n" +
				"</div>\n" +
				"</div>\n" +
				"<div class=\"form-group row\">\n" +
				"<label for=\"\" class=\"col-sm-2 col-form-label\">Language</label>\n" +
				"<div class=\"col-sm-10\">\n" +
				"<p class=\"form-control-static\">\n" +
				"Korean\n" +
				"</p>\n" +
				"</div>\n" +
				"</div>\n" +
				"<div class=\"form-group row\">\n" +
				"<label for=\"\" class=\"col-sm-2 col-form-label\">Status</label>\n" +
				"<div class=\"col-sm-10\">\n" +
				"<p class=\"form-control-static\">\n" +
				"<a class=\"btn btn-info\">Temporary Saved</a>\n" +
				"</p>\n" +
				"</div>\n" +
				"</div>\n" +
				"</div>\n" +
				"<div id=\"playerAttribute\" class=\"tab-pane\" role=\"tabpanel\">\n" +
				"<div class=\"form-group row\">\n" +
				"<label for=\"\" class=\"col-sm-2 col-form-label\">Throw</label>\n" +
				"<div class=\"col-sm-10\">\n" +
				"<p class=\"form-control-static\">Right </p>\n" +
				"</div>\n" +
				"</div>\n" +
				"<div class=\"form-group row\">\n" +
				"<label for=\"\" class=\"col-sm-2 col-form-label\">Throw Type</label>\n" +
				"<div class=\"col-sm-10\">\n" +
				"<p class=\"form-control-static\">Three Quarter</p>\n" +
				"</div>\n" +
				"</div>\n" +
				"<div class=\"form-group row\">\n" +
				"<label for=\"\" class=\"col-sm-2 col-form-label\">Hit</label>\n" +
				"<div class=\"col-sm-10\">\n" +
				"<p class=\"form-control-static\">Switch Hitter</p>\n" +
				"</div>\n" +
				"</div>\n" +
				"<div class=\"form-group row\">\n" +
				"<label for=\"\" class=\"col-sm-2 col-form-label\">Position</label>\n" +
				"<div class=\"col-sm-10\">\n" +
				"<p class=\"form-control-static\">Pitcher</p>\n" +
				"</div>\n" +
				"</div>\n" +
				"<div class=\"form-group row\">\n" +
				"<label for=\"\" class=\"col-sm-2 col-form-label\">Main Position</label>\n" +
				"<div class=\"col-sm-10\">\n" +
				"<span class=\"btn btn-danger\">Pitcher</span>\n" +
				"</div>\n" +
				"</div>\n" +
				"</div>\n" +
				"<div id=\"career\" class=\"tab-pane\" role=\"tabpanel\">\n" +
				"</div>\n" +
				"<div id=\"streamList\" class=\"tab-pane\" role=\"tabpanel\">\n" +
				"<h3><small>Lee Jae Soon - Half Pitching</small></h3>\n" +
				"<div class=\"embed-responsive embed-responsive-16by9\"><iframe src=\"https://www.youtube.com/embed/3UUegPwDgUM?ecver=2\" style=\"position:absolute;width:100%;height:100%;left:0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe></div>\n" +
				"<h3><small>Lee Jae Soon - Half Pitching from the side</small></h3>\n" +
				"<div class=\"embed-responsive embed-responsive-16by9\"><iframe src=\"https://www.youtube.com/embed/jBxR51wN8vQ?ecver=2\" style=\"position:absolute;width:100%;height:100%;left:0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe></div>\n" +
				"<h3><small>Lee Jae Soon - Pitching from the front</small></h3>\n" +
				"<div class=\"embed-responsive embed-responsive-16by9\"><iframe src=\"https://www.youtube.com/embed/YhZt3t2ZRwQ?ecver=2\" style=\"position:absolute;width:100%;height:100%;left:0\" width=\"641\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe></div>\n" +
				"</div>\n" +
				"<div id=\"statistic\" class=\"tab-pane\" role=\"tabpanel\">\n" +
				"<h3><small>Pitching Stat</small></h3>\n" +
				"<table class=\"table table-bordered table-hover\">\n" +
				"<thead class=\"\">\n" +
				"<tr>\n" +
				"<th>Team</th>\n" +
				"<th>Year</th>\n" +
				"<th>INN</th>\n" +
				"<th>W</th>\n" +
				"<th>L</th>\n" +
				"<th>ERA</th>\n" +
				"<th>G</th>\n" +
				"<th>GS</th>\n" +
				"<th>SV</th>\n" +
				"<th>SVO</th>\n" +
				"<th>IP</th>\n" +
				"<th>H</th>\n" +
				"<th>R</th>\n" +
				"<th>ER</th>\n" +
				"<th>HR</th>\n" +
				"<th>BB</th>\n" +
				"<th>SO</th>\n" +
				"<th>AVG</th>\n" +
				"<th>WHIP</th>\n" +
				"<th>K</th>\n" +
				"</tr>\n" +
				"</thead>\n" +
				"<tbody>\n" +
				"<tr>\n" +
				"<td><p class=\"form-control-static\">Seonam Univ.</p></td>\n" +
				"<td><p class=\"form-control-static\">2017</p></td>\n" +
				"<td><p class=\"form-control-static\">2.67</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"<td><p class=\"form-control-static\">15.0</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"<td><p class=\"form-control-static\">2.67</p></td>\n" +
				"<td><p class=\"form-control-static\">6</p></td>\n" +
				"<td><p class=\"form-control-static\">7</p></td>\n" +
				"<td><p class=\"form-control-static\">5</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"<td><p class=\"form-control-static\">6</p></td>\n" +
				"<td><p class=\"form-control-static\">1</p></td>\n" +
				"<td><p class=\"form-control-static\">0.462</p></td>\n" +
				"<td><p class=\"form-control-static\">4.0</p></td>\n" +
				"<td><p class=\"form-control-static\">1</p></td>\n" +
				"</tr>\n" +
				"<tr>\n" +
				"<td><p class=\"form-control-static\">Seonam Univ.</p></td>\n" +
				"<td><p class=\"form-control-static\">2016</p></td>\n" +
				"<td><p class=\"form-control-static\">3.0</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"<td><p class=\"form-control-static\">1</p></td>\n" +
				"<td><p class=\"form-control-static\">15.0</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"<td><p class=\"form-control-static\">3.0</p></td>\n" +
				"<td><p class=\"form-control-static\">4</p></td>\n" +
				"<td><p class=\"form-control-static\">5</p></td>\n" +
				"<td><p class=\"form-control-static\">5</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"<td><p class=\"form-control-static\">3</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"<td><p class=\"form-control-static\">0.308</p></td>\n" +
				"<td><p class=\"form-control-static\">2.33</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"</tr>\n" +
				"<tr>\n" +
				"<td><p class=\"form-control-static\">Shinheung High School</p></td>\n" +
				"<td><p class=\"form-control-static\">2015</p></td>\n" +
				"<td><p class=\"form-control-static\">29.3</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"<td><p class=\"form-control-static\">4</p></td>\n" +
				"<td><p class=\"form-control-static\">2.48</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"<td><p class=\"form-control-static\">29.3</p></td>\n" +
				"<td><p class=\"form-control-static\">26</p></td>\n" +
				"<td><p class=\"form-control-static\">39</p></td>\n" +
				"<td><p class=\"form-control-static\">39</p></td>\n" +
				"<td><p class=\"form-control-static\">0</p></td>\n" +
				"<td><p class=\"form-control-static\">26</p></td>\n" +
				"<td><p class=\"form-control-static\">7</p></td>\n" +
				"<td><p class=\"form-control-static\">1.79</p></td>\n" +
				"<td><p class=\"form-control-static\">1.79</p></td>\n" +
				"<td><p class=\"form-control-static\">7</p></td>\n" +
				"</tr>\n" +
				"</tbody>\n" +
				"</table>\n" +
				"</div>\n" +
				"<div id=\"introduce\" class=\"tab-pane\" role=\"tabpanel\">\n" +
				"<div class=\"form-group row\">\n" +
				"<div class=\"col-sm-12\">\n" +
				"<p class=\"form-control-static\">Lee Jaesoon is side-arm pitcher.<br /> Now he attending Seonam Univ.<br /> Although he don't have many records, possible to check out throw the ball as well.<br /> He can throw about 90.72 mile(146km).<br /><br />빠른 직구를 던질 수 있고 공식 기록 상으로 최고 시속은 145km입니다.<br />공의 속도보다는 많은 공의 회전 수로 좋은 무브먼트를 가지고 있습니다.<br /><br />변화구는 느린커브와 슬라이더를 구사합니다.<br />느린 커브의 경우, 카운트를 잡을 때 주로 사용하며 종으로 떨어집니다.<br /><br />슬라이더는 가장 자신있게 던지는 변화구종으로, 커터와 비슷한 궤적을 보이며<br />구속은 130km대로, 예리하고 날카롭게 들어가 우타자의 헛스윙을 유도하는데에 자신감이 있습니다.<br /><br />타자를 상대할 때 전력을 다해 삼진을 잡으려 던지는, 적극적인 성향입니다.<br />결정구는 가장 자신있는 몸쪽 빠른 직구로, 강한 타자일수록 더 적극적으로 사용합니다.<br />어렷을 적부터 승부사 기질이 있다는 평가를 받았으며 자신감 또한 충만합니다.<br /><br />적응력이 좋아 어떤 환경에서도 긍정적인 마인드를 보여주고 <br />야구에 대한 열정은 누구에게도 지지 않을 정도로 강합니다.</p>\n" +
				"</div>\n" +
				"</div>\n" +
				"</div>\n" +
				"<div id=\"contact\" class=\"tab-pane\" role=\"tabpanel\">\n" +
				"<div class=\"form-group row\">\n" +
				"<label for=\"\" class=\"col-sm-3 col-form-label\">Email</label>\n" +
				"<div class=\"col-sm-9\">\n" +
				"<p class=\"form-control-static\"><a href=\"/cdn-cgi/l/email-protection#c5e5afb6aaaaabfcf285aba4b3a0b7eba6aaa8\"><span class=\"__cf_email__\" data-cfemail=\"462c352929287f710628273023346825292b\">[email&#160;protected]</span></a></p>\n" +
				"</div>\n" +
				"</div>\n" +
				"<div class=\"form-group row\">\n" +
				"<label for=\"\" class=\"col-sm-3 col-form-label\">Phone No.</label>\n" +
				"<div class=\"col-sm-9\">\n" +
				"<p class=\"form-control-static\"><a href=\"tel:01036706890\">01036706890</a></p>\n" +
				"</div>\n" +
				"</div>\n" +
				"<div class=\"form-group row\">\n" +
				"<label for=\"\" class=\"col-sm-3 col-form-label\">Cell Phone No.</label>\n" +
				"<div class=\"col-sm-9\">\n" +
				"<p class=\"form-control-static\"><a href=\"tel:01036706890\">01036706890</a></p>\n" +
				"</div>\n" +
				"</div>\n" +
				"<div class=\"form-group row\">\n" +
				"<label for=\"\" class=\"col-sm-3 col-form-label\">Instagram ID</label>\n" +
				"<div class=\"col-sm-9\">\n" +
				"<p class=\"form-control-static\"><a href=\"https://instagram.com/sooney\">sooney</a></p>\n" +
				"</div>\n" +
				"</div>\n" +
				"<div class=\"form-group row\">\n" +
				"<label for=\"\" class=\"col-sm-3 col-form-label\">Address</label>\n" +
				"<div class=\"col-sm-9\">\n" +
				"<p class=\"form-control-static\"><a>104dong-201ho, 21, Inchang 2-ro 63beon-gil, Guri-si, Gyeonggi-do, Republic of Korea</a></p>\n" +
				"</div>\n" +
				"</div>\n" +
				"</div>\n" +
				"<br />\n" +
				"</form>\n" +
				"</div>\n" +
				"</div>\n" +
				"<script style=\"display: none !important;\">!function(e,t,r,n,c,a,l){function i(t,r){return r=e.createElement('div'),r.innerHTML='<a href=\"'+t.replace(/\"/g,'&quot;')+'\"></a>',r.childNodes[0].getAttribute('href')}function o(e,t,r,n){for(r='',n='0x'+e.substr(t,2)|0,t+=2;t<e.length;t+=2)r+=String.fromCharCode('0x'+e.substr(t,2)^n);return i(r)}try{for(c=e.getElementsByTagName('a'),l='/cdn-cgi/l/email-protection#',n=0;n<c.length;n++)try{(t=(a=c[n]).href.indexOf(l))>-1&&(a.href='mailto:'+o(a.href,t+l.length))}catch(e){}for(c=e.querySelectorAll('.__cf_email__'),n=0;n<c.length;n++)try{(a=c[n]).parentNode.replaceChild(e.createTextNode(o(a.getAttribute('data-cfemail'),0)),a)}catch(e){}}catch(e){}}(document);</script><script>\n" +
				"    $(document).ready(function() {\n" +
				"        $(\"img\").addClass(\"media-object\");\n" +
				"// \t$(\"img\").attr(\"width\", \"95%\");\n" +
				"        $(\"img\").attr(\"height\", \"300px\");\n" +
				"        $(\"img\").off(\"error\");\n" +
				"        $(\"img\").on(\"error\", function(){\n" +
				"            $(this).attr(\"src\", '/img/no_image.png');\n" +
				"        });\n" +
				"\n" +
				"    });\n" +
				"\n" +
				"    $(function(){\n" +
				"\n" +
				"        $(\"#deleteBtn\").on(\"click\", function(){\n" +
				"\n" +
				"            if(confirm('Do you delete this information?')){\n" +
				"                $.ajax({\n" +
				"                    url : '/player/deletePlayerInfo.json',\n" +
				"                    data : $(\"#viewFrm\").serialize(),\n" +
				"                    dataType : 'json',\n" +
				"                    method : 'post',\n" +
				"                    success : function(data){\n" +
				"                        console.log(data);\n" +
				"\n" +
				"                        var result = data.result;\n" +
				"                        if(result == 'ok'){\n" +
				"                            location.href = \"/profile/list/1\";\n" +
				"                        }\n" +
				"                    }\n" +
				"                });\n" +
				"            }\n" +
				"        });\n" +
				"\n" +
				"        $(\"#listBtn\").on(\"click\", function(){\n" +
				"            location.href = \"/player/playerPortal\";\n" +
				"        });\n" +
				"\n" +
				"        $(\"#modifyBtn\").on(\"click\", function(){\n" +
				"            var frm = $(\"#viewFrm\");\n" +
				"            frm.attr(\"action\",\"/player/modify\");\n" +
				"            frm.attr(\"method\",\"get\");\n" +
				"            frm.submit();\n" +
				"// \t\tlocation.href = \"/player/modify\";\n" +
				"        });\n" +
				"\n" +
				"\n" +
				"    });\n" +
				"</script>\n" +
				"</div>\n" +
				"<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/footer.css\" />\n" +
				"<input type=\"hidden\" id=\"buildType\" value=\"prod\" />\n" +
				"<style>\n" +
				".blog-footer {\n" +
				"  padding: 40px 0;\n" +
				"  color: #999;\n" +
				"  text-align: center;\n" +
				"  background-color: #f9f9f9;\n" +
				"  border-top: 1px solid #e5e5e5;\n" +
				"}\n" +
				".blog-footer p:last-child {\n" +
				"  margin-bottom: 0;\n" +
				"}\n" +
				"\n" +
				"</style>\n" +
				"\n" +
				"<script>\n" +
				"if($(\"#buildType\").val()=='prod'){\n" +
				"\t(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){\n" +
				"\t(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\n" +
				"\tm=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\n" +
				"\t})(window,document,'script','//www.google-analytics.com/analytics.js','ga');\n" +
				"\n" +
				"\tga('create', 'UA-65838621-1', 'auto');\n" +
				"\tga('send', 'pageview');\n" +
				"}\n" +
				"</script>\n" +
				"\n" +
				"<script type=\"text/javascript\" src=\"http://wcs.naver.net/wcslog.js\"></script>\n" +
				"<script type=\"text/javascript\">\n" +
				"\tif(!wcs_add) var wcs_add = {};\n" +
				"\twcs_add[\"wa\"] = \"47918035f92e80\";\n" +
				"\twcs_do();\n" +
				"</script>\n" +
				"<footer class=\"footer\">\n" +
				"<p><a href=\"https://www.facebook.com/jwlee0524\" target=\"_blank\" class=\"btn btn-primary\">Facebook</a>\n" +
				"&nbsp;&nbsp;&nbsp;<a target=\"_blank\" class=\"btn btn-primary\" href=\"/aboutUs\">contact</a>\n" +
				"&nbsp;&nbsp;&nbsp;<a target=\"_blank\" class=\"btn btn-primary\" href=\"/share/main\">Share</a></p>\n" +
				"<p>Copyrightⓒ2014 All right reserved by LinkedNest</p>\n" +
				"<p>|&nbsp;<a href=\"/common/privateRule\" class=\"btn btn_link\" target=\"_blank\">Private Policy</a>&nbsp;|&nbsp;<a href=\"/common/useRule\" class=\"btn btn_link\" target=\"_blank\">Terms of Use</a>&nbsp;|</p>\n" +
				"<p><a href=\"#\">back to top</a></p>\n" +
				"</footer>\n" +
				"</body>\n" +
				"</html>";
		return profileContent;
	}
}
