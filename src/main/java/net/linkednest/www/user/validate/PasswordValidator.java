package net.linkednest.www.user.validate;


import net.linkednest.common.validate.BaseValidator;
import net.linkednest.common.validate.ValidationUtil;
import net.linkednest.www.user.dto.UserDto;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;

public class PasswordValidator extends BaseValidator {
    /**
     * insert validation
     * @param result
     * @param userDto
     */
    public static void insertValidate(BindingResult result, UserDto userDto){

        
        
    }
    
    /**
     * update validation
     * @param result
     * @param userDto
     */
    public static void updateValidate(BindingResult result, UserDto userDto){
        ValidationUtil.rejectIfEmpty(result, "passwd", "user.regist.passwd.empty", "비밀번호가 입력되지 않았습니다.");
        
        ValidationUtil.rejectIfEmpty(result, "passwdChk", "user.regist.passwd.empty", "비밀번호가 입력되지 않았습니다.");

        if(!StringUtils.isEmpty(userDto.getPasswd())){
            ValidationUtil.rejectIfNotMinLength(result, "passwd", "user.regist.passwd.short", "비밀번호가 8자리 이상이어야 합니다.", 8);
            
            if(!StringUtils.isEmpty(userDto.getPasswd()) && !StringUtils.isEmpty(userDto.getPasswdChk())){
                ValidationUtil.rejectIfNotMatchedPasswd(result, "passwd", "passwdChk", "user.regist.passwd.unmatched", "비밀번호가 일치하지 않습니다.");
            }
        }

        if(!StringUtils.isEmpty(userDto.getPasswdChk())){
            ValidationUtil.rejectIfNotMinLength(result, "passwdChk", "user.regist.passwd.short", "비밀번호가 8자리 이상이어야 합니다.", 8);

            if(!StringUtils.isEmpty(userDto.getPasswd()) && !StringUtils.isEmpty(userDto.getPasswdChk())){
                ValidationUtil.rejectIfNotMatchedPasswd(result, "passwd", "passwdChk", "user.regist.passwd.unmatched", "비밀번호가 일치하지 않습니다.");
            }
        }
        /*
        if(!StringUtils.isEmpty(userDto.getPasswd()) && !StringUtils.isEmpty(userDto.getPasswdChk())){
            ValidationUtil.rejectIfNotMatchedPasswd(result, "passwd", "passwdChk", "user.regist.passwd.unmatched", "비밀번호가 일치하지 않습니다.");
        } 
        */     
    }
    
    /**
     * delete validation
     * @param result
     * @param userDto
     */
    public static void deleteValidate(BindingResult result, UserDto userDto){
        
    }



}
