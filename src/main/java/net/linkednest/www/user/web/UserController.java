package net.linkednest.www.user.web;

import net.linkednest.common.constant.CommonConstant;
import net.linkednest.common.util.AES256Util;
import net.linkednest.common.validate.JsonResponse;
import net.linkednest.www.common.dto.CodeDto;
import net.linkednest.www.common.dto.MailDto;
import net.linkednest.www.common.dto.ShareDto;
import net.linkednest.www.common.service.CommonService;
import net.linkednest.www.share.service.ShareService;
import net.linkednest.www.share.service.ShareServiceImpl;
import net.linkednest.www.user.dto.UserDto;
import net.linkednest.www.user.service.UserService;
import net.linkednest.www.user.service.UserServiceImpl;
import net.linkednest.www.user.validate.PasswordValidator;
import net.linkednest.www.user.validate.UserValidator;
import net.sf.json.JSONObject;
import org.apache.commons.lang.LocaleUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.velocity.app.VelocityEngine;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
@RequestMapping(value="/user")
@SessionAttributes("userInfo")
public class UserController {
    
    Log log = LogFactory.getLog(this.getClass());
    
	@Autowired
	private UserService userService;
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private ShareService shareService;
	
    @Inject
    private VelocityEngine          velocityEngine;
    
    @Inject
    private MessageSourceAccessor   messageSource;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    /**
     * View Page For Joinning Member
     *
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping(value="/regist")
	public String registUser(Model model, HttpServletRequest request) throws Exception{
	    this.setRequiredInfos(model, request);
		return "/user/regist";
	}
	
	private void setRequiredInfos(Model model, HttpServletRequest request) throws Exception{
        String        referer       = request.getHeader("Referer");
        log.info("[ REFER ] : " + referer);           
        
        // Nation List 
        CodeDto nationCodeDto = new CodeDto();
        nationCodeDto.setCodeType("01");
        List<CodeDto> nationList    = this.commonService.selectCodeList(nationCodeDto);
        
        // Language List 
        CodeDto       langCodeDto   = new CodeDto();
        langCodeDto.setCodeType("02");
        List<CodeDto> languageList  = this.commonService.selectCodeList(langCodeDto);
        
        model.addAttribute("prevPage"       , referer);
        model.addAttribute("nationList"     , nationList);
        model.addAttribute("languageList"   , languageList);
	    
	}

    /**
     * [OLD] Action For Joinning Member
     *
     * @param model
     * @param userDto
     * @param result
     * @return
     * @throws Exception
     */
	@RequestMapping(value="/regist.json")
	@ResponseBody
	public JSONObject registUser(Model model, @Valid @ModelAttribute UserDto userDto, BindingResult result) throws Exception{

	    JSONObject    returnObj    = new JSONObject();
		String        resultCode   = "REGIST_0000";
		String        resultMsg    = "";
		
		int           registResult = 0;
		
		if(result.hasErrors()){
			resultCode   = "REGIST_0001"; 	
			resultMsg    = "invalid_parameter";
		}else{
			
			String hashedPassword = passwordEncoder.encode(userDto.getPasswd());    // BCrypt.hashpw(userDto.getPasswd(), BCrypt.gensalt());
			
			userDto.setPasswd(hashedPassword);
			
			registResult = this.userService.insertUserInfo(userDto);
			
			if(registResult > 0){
	             resultCode  = "REGIST_0000";
	             resultMsg   = "completed";
			}else{
                resultCode  = "REGIST_0002";
                resultMsg   = "duplicated_user";
			}
		}
		returnObj.put("returnCode", resultCode);
		returnObj.put("resultMsg", resultMsg);
		
		return returnObj;
	}

    /**
     * Action For Joinning Member
     *
     * @param model
     * @param request
     * @param userDto
     * @param result
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/registAction")
    @ResponseBody	
    public JsonResponse registUser2(Model model, HttpServletRequest request, @ModelAttribute UserDto userDto, BindingResult result) throws Exception{
                
        log.info("[ UserController.registAction() ][ userDto.toString() ] : " + userDto.toString()); 
        
        JsonResponse returnObj = new JsonResponse();
        
        UserValidator.insertValidate(result, userDto);
        
        String resultCode   = "REGIST_0000";
        String resultMsg    = org.apache.commons.lang3.StringUtils.EMPTY;
        
        int    registResult = 0;
        
        if(result.hasErrors()){
            resultCode = "REGIST_0001";     
            
            returnObj.setStatus(resultCode);
            returnObj.setResult(result.getAllErrors());
        }else{
            
            String hashedPassword = passwordEncoder.encode(userDto.getPasswd());    // BCrypt.hashpw(userDto.getPasswd(), BCrypt.gensalt());
            
            userDto.setPasswd(hashedPassword);
            
            String      encryptedEmail       = org.apache.commons.lang3.StringUtils.EMPTY;
            String      encryptedPhoneNo     = org.apache.commons.lang3.StringUtils.EMPTY;
            AES256Util aes256util           = null;
            try {

                aes256util = new AES256Util(CommonConstant.IV);
                
                try {
                    encryptedEmail      = aes256util.encrypt(userDto.getEmail());
                    encryptedPhoneNo    = aes256util.encrypt(userDto.getPhoneNo());
                } catch (NoSuchAlgorithmException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                    encryptedEmail   = userDto.getEmail();
                    encryptedPhoneNo = userDto.getPhoneNo();
                } catch (GeneralSecurityException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                    encryptedEmail = userDto.getEmail();
                    encryptedPhoneNo = userDto.getPhoneNo();
                }    
            }catch (UnsupportedEncodingException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
            }finally{
                userDto.setEmail(encryptedEmail);
                userDto.setPhoneNo(encryptedPhoneNo);
            }
            
            UserDto duplicatedUser = this.userService.selectUserInfo(userDto);
            
            if(duplicatedUser == null){
                registResult = this.userService.insertUserInfo(userDto);
               
                if(registResult > 0){  
                    log.info("[ UserController.registAction() ][ userDto.toString() ][ 2nd ] : " + userDto.toString()); 
                    
                    resultCode  = "REGIST_0000";
                    resultMsg   = "completed";       
                    
                    // create share(blog) 
                    ShareDto shareDto = new ShareDto();
                    shareDto.setUserId(userDto.getUserId());
                    shareDto.setShareName(userDto.getUserNm() +"'s Share");
                    shareDto.setIntroduce("Please, fill out your introduce.");
                    shareDto.setShareType("1");
                    
                    this.shareService.insertShareInfo(shareDto);
                                        
                    this.sendWelcomeMail(userDto);
                    
                }else{
                    resultCode  = "REGIST_0002";
                    resultMsg   = "Occurred Error during registration process.\nPlease, Try again process.\nAnd Please, Send Email To Administrator, If This Error Occurred Again.\nEmail Address : jwlee0208@gmail.com";
                }

            }else{
                resultCode  = "REGIST_0003";
                resultMsg   = "This User Id is Already Used.\nPlease, Try Another User Id.";
            }
            
            returnObj.setStatus(resultCode);   
            returnObj.setResult(resultMsg);

        }

        return returnObj;
    }

    /**
     * Complete Joinning Member
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(method = RequestMethod.GET, value="/registOk")
    public String registOk(HttpServletRequest request) throws Exception{
        return "/user/registOk";
    }

    /**
     * View Page For Modifying Member
     *
     * @param request
     * @param model
     * @param session
     * @param userId
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/modify/{userId}")
    public String modifyUser(HttpServletRequest request, Model model, HttpSession session, @PathVariable String userId) throws Exception{
        this.commonService.getPrivateInfo(request, model, session);
        this.setRequiredInfos(model, request);
        return "/user/ajaxRegistForm";
    }

    /**
     * Action For Modifying Member
     *
     * @param model
     * @param request
     * @param session
     * @param status
     * @param userDto
     * @param result
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/modifyAction")
    @ResponseBody   
    public JsonResponse modifyUser(Model model, HttpServletRequest request, HttpSession session, SessionStatus status, @ModelAttribute UserDto userDto, BindingResult result) throws Exception{
                
        log.info("[ UserController.registAction() ][ userDto.toString() ] : " + userDto.toString()); 
        
        JsonResponse returnObj = new JsonResponse();
        
        UserValidator.updateValidate(result, userDto);
        
        String resultCode   = "REGIST_0000";
        String resultMsg    = org.apache.commons.lang3.StringUtils.EMPTY;
        
        int    updateResult = 0;
        
        if(result.hasErrors()){
            resultCode = "REGIST_0001";     
            
            returnObj.setStatus(resultCode);
            returnObj.setResult(result.getAllErrors());
        }else{
            
            updateResult = this.userService.modifyUserInfo(userDto);
            
            if(updateResult > 0){  
                log.info("[ UserController.registAction() ][ userDto.toString() ][ 2nd ] : " + userDto.toString()); 
                    
                resultCode  = "REGIST_0000";
                resultMsg   = "complelted";
                
                UserDto modifiedUserInfo = this.userService.selectUserInfo(userDto);
                
                session.removeAttribute("userInfo");
                session.setAttribute("userInfo", modifiedUserInfo);
                
                // 다국어 설정 필요.
                Locale language = null;
                
                if(StringUtils.isEmpty(modifiedUserInfo.getLanguage())){
                    language = Locale.ENGLISH;
                }else{
                    language = LocaleUtils.toLocale(modifiedUserInfo.getLanguage());
                }

                // User의 사용 language 설정 값에 따른 Locale 설정
                session.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, language);    
                
             }else{
                resultCode  = "REGIST_0002";
                resultMsg   = "insert_error";
             }
            
            returnObj.setStatus(resultCode);
            returnObj.setResult(resultMsg);

        }

        return returnObj;
    }  
    
    @RequestMapping(value="/forgotPassword")
    public String forgotPasswordView(){
        return "/user/forgotPassword";
    }

    /**
     * Reset Password
     *
     * @param encryptMail
     * @param model
     * @return
     */
    @RequestMapping(value="/resetPassword")
    public String resetPasswordView(@RequestParam("v") String encryptMail, Model model){
        
        String decryptedEmail = org.apache.commons.lang3.StringUtils.EMPTY;
        AES256Util aes256util = null;
        
        try {

            aes256util = new AES256Util(CommonConstant.IV);
            
            try {
                decryptedEmail = aes256util.decrypt(encryptMail);
                System.out.println("decryptedEmail : " + decryptedEmail);
            } catch (NoSuchAlgorithmException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
                decryptedEmail = encryptMail;
            } catch (GeneralSecurityException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
                decryptedEmail = encryptMail;
            }    
        }catch (UnsupportedEncodingException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
        }
        model.addAttribute("email", decryptedEmail);
        return "/user/resetPassword";
    }
    
    @RequestMapping(value="/sendForgotPwMail")
    public JSONObject sendResetPwMail(UserDto userDto){
        JSONObject  result  = new JSONObject();
        String      email   = userDto.getEmail();
        
        if(!StringUtils.isEmpty(email)){
            
            String encryptedEmail = org.apache.commons.lang3.StringUtils.EMPTY;
            AES256Util aes256util = null;
            try {

                aes256util = new AES256Util(CommonConstant.IV);
                
                try {
                    encryptedEmail = aes256util.encrypt(email);
                } catch (NoSuchAlgorithmException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                    encryptedEmail = email;
                } catch (GeneralSecurityException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                    encryptedEmail = email;
                }    
            }catch (UnsupportedEncodingException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
            }finally{
                userDto.setEmail(encryptedEmail);
            }
            
            // email을 이용, userInfo를 조회
            UserDto userInfo = null;
            try {
                userInfo = this.userService.selectUserInfo(userDto);

                if(userInfo != null){
                    // 메일 발송
                    this.sendForgotPwMail(userInfo);    
                    result.put("code"   , "ok");
                    result.put("message", "check out your mail box!");                
                }else{
                    result.put("code"   , "error");
                    result.put("message", "No registed user's email address.");                
                }

            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }else{
            result.put("code"   , "error");
            result.put("message", "Occurred Error.");
        }
        
        return result;
    }
    
    @RequestMapping(value="resetPasswordAction")
    @ResponseBody
    public JsonResponse resetPasswordAction(UserDto userDto, BindingResult result){
        JsonResponse returnObj = new JsonResponse();
        int        updateResult = 0;
        // 1. validation
        PasswordValidator.updateValidate(result, userDto);
        
        String resultCode   = "UPDATE_PW_0000";

        if(result.hasErrors()){
            resultCode = "UPDATE_PW_0001";     
            
            returnObj.setStatus(resultCode);
            returnObj.setResult(result.getAllErrors());
        }else{
            // 2. update password
            String hashedPassword = passwordEncoder.encode(userDto.getPasswd());    // BCrypt.hashpw(userDto.getPasswd(), BCrypt.gensalt());
            userDto.setPasswd(hashedPassword);
            
            try {
                updateResult = userService.modifyUserInfo(userDto);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            returnObj.setStatus(updateResult < 1 ? "UPDATE_PW_0002" : "UPDATE_PW_0000");
            returnObj.setResult(updateResult < 1 ? "Error occurred" : "Your password successfully updated.");
        }

        return returnObj;
    }

    /**
     * Send Mail For Welcome
     *
     * @param userDto
     */
    private void sendWelcomeMail(UserDto userDto){
        // 메시지 다국어 처리
        String welcomeMsg = null;
        
        try{
            welcomeMsg = messageSource.getMessage("welcome.joinning", new Locale(userDto.getLanguage())); 
        }catch(Exception e){
            e.printStackTrace();
            log.error("[ UserController.registAction() ][ welcomeMsg ] Error Occured...");
            welcomeMsg = "Welcome!!!";
        }

        // Velocity Template 에 Mapping할 Data Map
        Map<String, Object> contentMap = new HashMap<String, Object>();
        contentMap.put("mailTo"         , userDto.getUserNm());
        contentMap.put("welcomeMessage" , welcomeMsg);
        contentMap.put("userId"			, userDto.getUserId());

        // Sending Mail
        this.commonSendMailTemplate(userDto, "[linkedNest.net] Congraturation! Happy join us!!", "mailTemplate/welcomeJoinningTemplate.vm", contentMap);
    }
    
    private void sendForgotPwMail(UserDto userDto){
        // 메시지 다국어 처리
        String forgotMsg = "";
        String localeStr = userDto.getLanguage();
        if(StringUtils.isEmpty(localeStr)){
            localeStr = "kr";
        }
        try{
            forgotMsg = messageSource.getMessage("forgot.password", new Locale(localeStr)); 
        }catch(Exception e){
            e.printStackTrace();
            log.error("[ UserController.registAction() ][ forgotMsg ] Error Occured...");
            forgotMsg = "Welcome!!!";
        }

        // Sending Mail
        if(!StringUtils.isEmpty(userDto.getEmail())){
            // Velocity Template 에 Mapping할 Data Map
            Map<String, Object> contentMap = new HashMap<String, Object>();
            contentMap.put("userId"         , userDto.getUserId());
            contentMap.put("forgotMessage"  , forgotMsg);
            contentMap.put("encryptedMail"  , userDto.getEmail());

            // Sending Mail
            this.commonSendMailTemplate(userDto, "[linkedNest.net] Reset your password!!", "mailTemplate/forgotPassword.vm", contentMap);
            
        }
    }
    
    private void commonSendMailTemplate(UserDto userDto, String title, String mailTemplateUrl, Map<String, Object> contentMap){
        // Sending Mail
        AES256Util aes256util = null;
        try {
            aes256util = new AES256Util(CommonConstant.IV);
            
            String decryptedEmail = null;
            try {
                decryptedEmail = aes256util.decrypt(userDto.getEmail());
            } catch (NoSuchAlgorithmException e1) {
                // TODO Auto-generated catch block
//                e1.printStackTrace();
                decryptedEmail = userDto.getEmail();
            } catch (GeneralSecurityException e1) {
                // TODO Auto-generated catch block
//                e1.printStackTrace();
                decryptedEmail = userDto.getEmail();
            } finally{
                MailDto mailInfo = new MailDto();
                mailInfo.setContentType("text/html; charset=utf-8");
                mailInfo.setMailFrom("linkednest@gmail.com");
                mailInfo.setMailTo(decryptedEmail);
                mailInfo.setMailSubject(title);
                mailInfo.setTemplateName(mailTemplateUrl);
                                                
                // Velocity Template 에 Mapping할 Data Map
                mailInfo.setModel(contentMap);
                
                // setting content
                String body = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, mailTemplateUrl, "UTF-8", mailInfo.getModel());
                mailInfo.setMailContent(body);
                
                // mail 발송
                try{
                    commonService.sendMail(mailInfo);    
                }catch(Exception e){
                    e.printStackTrace();
                    log.info("[ 메일 발송 오류 ]");
                }                       
            }         
        } catch (UnsupportedEncodingException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
    }
}
