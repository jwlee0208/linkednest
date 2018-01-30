package net.linkednest.www.profile.web;

import net.linkednest.common.paging.PageHolder;
import net.linkednest.common.util.FileUpload;
import net.linkednest.www.common.dto.CodeDto;
import net.linkednest.www.common.service.CommonService;
import net.linkednest.www.profile.ProfileConstants;
import net.linkednest.www.profile.validate.ProfileValidator;
import net.linkednest.www.profile.dto.*;
import net.linkednest.www.profile.service.ProfileService;
import net.linkednest.www.user.dto.UserDto;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.xerces.impl.dv.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value="/profile")
public class ProfileController {

	private static final Log logger = LogFactory.getLog(ProfileController.class);
	
	@Autowired
	private FileUpload fileUpload;

	@Autowired
	private ProfileService profileService;

	@Autowired
	private CommonService commonService;

	private static final int PROFILE_LIST_CNT_9X3 = 9*3;

	/**
	 * @brief Profile View
	 * 
	 * @param model
	 * @param profileType
	 * @param profileId
	 * @return
	 */
	@RequestMapping(value="/view/{profileType}/{profileId}")
	public String getProfileView(Model model, @PathVariable String profileType, @PathVariable int profileId){
		
		ProfileDto profileDto = new ProfileDto();
		profileDto.setProfileId(profileId);
		profileDto.setProfileType(profileType);
		logger.debug("[ProfileController][getProfileView] profileDto : " + profileDto.toString());
		ProfileDto selectedProfileInfo = this.profileService.getProfileInfo(profileDto);
		logger.debug("[ProfileController][getProfileView] selectedProfileInfo : " + selectedProfileInfo.toString());
		model.addAttribute("profileInfo", selectedProfileInfo);
		
		return "/profile/profileView";
	}

	/**
	 * Profile Modification Page
	 *
	 * @param model
	 * @param profileType
	 * @param profileId
	 * @return
	 */
	@RequestMapping(value="/modify/{profileType}/{profileId}")
	public String getProfileUpdateInfo(Model model, @PathVariable String profileType, @PathVariable int profileId){
		
		ProfileDto profileDto = new ProfileDto();
		profileDto.setProfileId(profileId);
		profileDto.setProfileType(profileType);
		logger.debug("[ProfileController][getProfileUpdateInfo] profileDto : " + profileDto.toString());

		// profile 정보 조회
		ProfileDto selectedProfileInfo = this.profileService.getProfileInfo(profileDto);
		logger.debug("[ProfileController][getProfileUpdateInfo] selectedProfileInfo : " + selectedProfileInfo.toString());
		model.addAttribute("profileInfo", selectedProfileInfo);
		
		profileDto.setCatId1(selectedProfileInfo.getCatId1());
		// profile 속성 정보 조회
		List<ProfileAttrDto> attrElementList = this.profileService.getProfileAttrElementList(profileDto);
		
		model.addAttribute("attrElementList", attrElementList);
		
		return "/profile/modify";
	}
	
	/**
	 * @brief Profile List
	 * @param model
	 * @param session
	 * @param profileType
	 * @param catId
	 * @return
	 */
	@RequestMapping(value="/list/{profileType}/{catId}")
	public String getProfileList(Model model, HttpSession session, @PathVariable int profileType, @PathVariable String catId){
		
        UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
		boolean isLogon     = (sessionInfo != null) ? true : false;
        
		ProfileDto profileDto = new ProfileDto();
		profileDto.setCatId1(catId);

		// profile 속성 목록 조회
		List<ProfileAttrDto> attrElementList = this.profileService.getProfileAttrElementList(profileDto);
		
		model.addAttribute("isLogon"		, isLogon);
		model.addAttribute("profileType"	, profileType);
		model.addAttribute("catagoryId"		, catId);
		model.addAttribute("attrElementList", attrElementList);
		return "/profile/profileList";
	}

	/**
	 * @brief ajaxProfileList
	 *
	 * @param request
	 * @param model
	 * @param searchProfileDto
	 * @param session
	 * @return
	 */
    @RequestMapping("/ajaxProfileList")
    public String getAjaxProfileList(HttpServletRequest request, Model model, SearchProfileDto searchProfileDto, HttpSession session){
    	logger.error("[ ProfileController.getAjaxProfileList() ][ Param ] searchProfileDto : " + searchProfileDto.toString());
    	
    	if(StringUtils.isNotEmpty(searchProfileDto.getSearchText())){
    	    searchProfileDto.setSearchText(new String(Base64.decode(searchProfileDto.getSearchText())));
    	}
    	
        List<ProfileDto> 	profileList = null;
        PageHolder			pageHolder 	= null;
        int                 profileCnt  = 0;
        
        searchProfileDto.setListSize(this.PROFILE_LIST_CNT_9X3);
        
        try {
            profileList = profileService.getSearchedProfileList(searchProfileDto);
            profileCnt  = profileService.getSearchedProfileListCnt(searchProfileDto);

            if(profileCnt > 0){
                pageHolder = new PageHolder(profileCnt, searchProfileDto.getPage(), this.PROFILE_LIST_CNT_9X3);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            model.addAttribute("searchProfileInfo"   , searchProfileDto);
            model.addAttribute("profileList"         , profileList);
            model.addAttribute("pageHolder"          , pageHolder);
        }
        
        return "/profile/ajaxProfileList";
    }

    /**
     * @brief Profile Registration Page
	 *
     * @param model
     * @param session
     * @param profileType
     * @return
     */
    @RequestMapping(value="/regist/{profileType}/{catId}", method=RequestMethod.GET)
    public String getProfileRegistPage(Model model, HttpSession session, @PathVariable String profileType, @PathVariable String catId) throws Exception {
		System.out.printf(" ----------- [start] regist profile page ---------- \n");
        UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
		boolean isLogon     = (sessionInfo != null) ? true : false;

    	ProfileDto profileDto = new ProfileDto();
    	profileDto.setCatId1(catId);
    	profileDto.setProfileType(profileType);
    	
    	List<ProfileAttrDto> profileAttrList = this.profileService.getProfileAttrElementList(profileDto);
    	
    	List<LeagueInfoDto> leagueInfoList = null;
    	if(profileType.equals(ProfileConstants.PROFILE_TYPE_TEAM)){
    		leagueInfoList = this.profileService.getLeagueInfoList();
    	}

		// Nation List
		CodeDto nationCodeDto = new CodeDto();
		nationCodeDto.setCodeType("01");
		List<CodeDto> nationList    = commonService.selectCodeList(nationCodeDto);

		// Language List
		CodeDto       langCodeDto   = new CodeDto();
		langCodeDto.setCodeType("02");
		List<CodeDto> languageList  = commonService.selectCodeList(langCodeDto);

		model.addAttribute("isLogon"		, isLogon);
    	model.addAttribute("profileType"	, profileType);
    	model.addAttribute("categoryId"		, catId);	
    	model.addAttribute("profileAttrList", profileAttrList);
    	model.addAttribute("leagueInfoList"	, leagueInfoList);
		model.addAttribute("nationList"     , nationList);
		model.addAttribute("languageList"   , languageList);

		return "/profile/regist";
    }

	/**
	 * Profile Registration
	 *
	 * @param profileDto
	 * @param session
	 * @return
	 * @throws Exception
	 */
    @RequestMapping(value="/registAction", method=RequestMethod.POST)
    @ResponseBody
    public JSONObject  registProfile(ProfileDto profileDto, HttpSession session, BindingResult bindingResult) throws Exception{
		System.out.printf(" ----------- [start] regist profile action ---------- \n");

    	JSONObject 		result 				= new  JSONObject();
		// Uploading Profile Image & Setting Image Path
		this.uploadProfileImage(profileDto);

    	profileDto.setTitle(profileDto.getName());

    	System.out.printf("profileDto is $s\n", profileDto.toString());
    	logger.debug("profileDto is " + profileDto.toString());
    	
    	// validation 
		// ProfileValidator.insertValidate(bindingResult, profileDto);

		int addCnt = 0;
		if (bindingResult.hasErrors()) {

		} else {
			// service call : insert tables
			addCnt = this.profileService.addProfileInfos(profileDto);
		}

    	result.put("result"	, (addCnt > 0) ? "success" : "error");
    	result.put("message", (addCnt > 0) ? "success!!!" : "error!!!");
    	
    	return result;
    }

	/**
	 * Profile Modification
	 *
	 * @param profileDto
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/modifyAction", method=RequestMethod.POST)
    @ResponseBody
    public JSONObject  modifyProfile(ProfileDto profileDto, HttpSession session, BindingResult bindingResult) throws Exception{
    	JSONObject 		result 				= new  JSONObject(); 

    	// Uploading Profile Image & Setting Image Path
    	this.uploadProfileImage(profileDto);
    	
    	profileDto.setTitle(profileDto.getName());
    	
    	logger.debug("profileDto is " + profileDto.toString());
    	
    	// validation
		ProfileValidator.updateValidate(bindingResult, profileDto);
    	
    	// service call : insert tables
    	int addCnt = this.profileService.updateProfileInfos(profileDto);
    	
    	result.put("result"	, (addCnt > 0) ? "success" : "error");
    	result.put("message", (addCnt > 0) ? "success!!!" : "error!!!");
    	
    	return result;
    }

	/**
	 * [Common] Uploading Profile Image & Setting Image Path
	 *
	 * @param profileDto
	 * @throws Exception
	 */
    private void uploadProfileImage(ProfileDto profileDto) throws Exception {
		MultipartFile 	profileImg 			= profileDto.getProfileImg();

		String 			imageUploadResult 	= StringUtils.EMPTY;
		String 			filePath			= StringUtils.EMPTY;

		if(profileImg != null){
			// 물리 경로에 파일 업로드
			imageUploadResult = fileUpload.uploadFile(profileImg);
		}

		boolean isValidImageUploadResult = !imageUploadResult.equals(StringUtils.EMPTY) && !imageUploadResult.equals("fileSizeError") && !imageUploadResult.equals("fileExtensionError");
		if(isValidImageUploadResult){
			filePath = imageUploadResult;
			profileDto.setProfileImgPath(filePath);
		}
	}

	/**
	 * View Page For Regist League Info
	 *
	 * @param model
	 * @param session
	 * @return
	 */
    @RequestMapping(value="/registLeague", method=RequestMethod.GET)
    public String registLeague(Model model, HttpSession session){
    	return "/profile/registLeague";
    }

	/**
	 * Regist League Info
	 *
	 * @param model
	 * @param session
	 * @param leagueInfoDto
	 * @return
	 * @throws Exception
	 */
    @RequestMapping(value="/registLeagueAction", method=RequestMethod.POST)
    @ResponseBody
    public JSONObject registLeague(Model model, HttpSession session, LeagueInfoDto leagueInfoDto) throws Exception{
    	JSONObject resultObj = new JSONObject();
    	MultipartFile leagueLogoImg = leagueInfoDto.getLeagueImg();
    	
    	String 			imageUploadResult 	= StringUtils.EMPTY;
    	String 			filePath			= StringUtils.EMPTY;
    	
    	logger.info("[ LeagueInfo Img ] leagueLogoImg.isEmpty() : " + leagueLogoImg.isEmpty());
    	logger.info("[ LeagueInfo Img ] leagueLogoImg : " + leagueLogoImg);
    	
    	if(null != leagueLogoImg){
    		imageUploadResult = fileUpload.uploadFile(leagueLogoImg);	
    	}

    	boolean isValidImageUploadResult = !imageUploadResult.equals(StringUtils.EMPTY) && !imageUploadResult.equals("fileSizeError") && !imageUploadResult.equals("fileExtensionError");
    	if(isValidImageUploadResult){
    		filePath = imageUploadResult;
    		leagueInfoDto.setLeagueImgPath(filePath);
    	}

    	// validation
    	logger.error("leagueDto info is " + leagueInfoDto.toString());
    	// insert data 
    	int result = this.profileService.addLeagueInfo(leagueInfoDto);
    	
    	if(result > 0){
    		resultObj.put("code", "success");
    		resultObj.put("message", "success!!!");
    	}else{
    		resultObj.put("code", "error");
    		resultObj.put("message", "failed registration!!!");
    	}
    	
    	return resultObj;
    }

	/**
	 * get league info list
	 *
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/leagueList")
    public String getLeagueInfoList(Model model, HttpSession session) throws Exception{
    	UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
		boolean isLogon     = (sessionInfo != null) ? true : false;

        model.addAttribute("isLogon"		, isLogon);
    	model.addAttribute("leagueList", this.profileService.getLeagueInfoList());
    	return "/profile/leagueList";
    }

	/**
	 * get league info detail
	 *
	 * @param model
	 * @param session
	 * @param leagueId
	 * @return
	 */
	@RequestMapping(value="/leagueView/{leagueId}")
    public String getLeagueInfo(Model model, HttpSession session, @PathVariable int leagueId){
    	
    	LeagueInfoDto leagueInfo = this.profileService.getLeagueInfo(leagueId);
    	
    	model.addAttribute("leagueInfo", leagueInfo);
    	return "/profile/leagueView";
    }

    @RequestMapping(value="/sendMailPopup/{profileType}/{profileId}", method = RequestMethod.POST)
	public String sendProfileMailPopup(Model model, @PathVariable String profileType, @PathVariable int profileId) {
		ProfileDto profileDto = new ProfileDto();
		profileDto.setProfileId(profileId);
		profileDto.setProfileType(profileType);
		logger.debug("[ProfileController][sendProfileMailPopup] profileDto : " + profileDto.toString());
		ProfileDto selectedProfileInfo = this.profileService.getProfileInfo(profileDto);
		logger.debug("[ProfileController][sendProfileMailPopup] selectedProfileInfo : " + selectedProfileInfo.toString());
		model.addAttribute("profileInfo", selectedProfileInfo);

		return "profile/profileView";
	}

    @RequestMapping(value="/sendMail/{profileType}/{pId}", method = RequestMethod.POST)
    @ResponseBody
	public String sendProfileMail(Model model, HttpSession session, ProfileMailReq request, @PathVariable String profileType, @PathVariable int pId) {
		ProfileDto profileDto = new ProfileDto();
		profileDto.setProfileId(pId);
		profileDto.setProfileType(profileType);
		logger.debug("[ProfileController][getProfileView] profileDto : " + profileDto.toString());
		this.profileService.sendMailProfile(profileDto, session, request);
		return "/profile/profileView";
	}
}
