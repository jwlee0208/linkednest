package net.linkednest.www.user.validate;


import net.linkednest.www.user.dto.UserDto;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;

import net.linkednest.common.validate.BaseValidator;
import net.linkednest.common.validate.ValidationUtil;

public class UserValidator extends BaseValidator{
    /**
     * insert validation
     *
     * @param result
     * @param userDto
     */
    public static void insertValidate(BindingResult result, UserDto userDto){
        // 사용자 아이디
        ValidationUtil.rejectIfEmpty(result, "userId", "user.regist.userId.empty", "아이디가 입력되지 않았습니다.");
        if(!StringUtils.isEmpty(userDto.getUserId())){
            ValidationUtil.rejectIfNotRegEx(result, "userId", "user.regist.userId.regex", "아이디는 영문과 숫자만 사용가능합니다.", ValidationUtil.REG_EX_ENG_NUM);
        }
        // 사용자 명
        ValidationUtil.rejectIfEmpty(result, "userNm", "user.regist.userNm.empty", "이름이 입력되지 않았습니다.");        
        // 패스워드
        ValidationUtil.rejectIfEmpty(result, "passwd", "user.regist.passwd.empty", "비밀번호가 입력되지 않았습니다.");
        // 패스워드 체크
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
        // 전화번호
        if(StringUtils.hasLength(userDto.getPhoneNo())){
            ValidationUtil.rejectIfNotRegEx(result, "phoneNo", "user.regist.phoneNo.regex", "전화번호 형식에 맞지 않습니다.", ValidationUtil.REG_EX_CELL_PHONE_NO);
        }
        //이메일
        if(!StringUtils.isEmpty(userDto.getEmail())){
            ValidationUtil.rejectIfEmpty(result, "email", "user.regist.email.empty", "이메일이 입력되지 않았습니다.");
            ValidationUtil.rejectIfNotRegEx(result, "email", "user.regist.email.regex", "이메일 형식에 맞지 않습니다.", ValidationUtil.REG_EX_EMAIL);
        }
        
    }
    
    /**
     * update validation
     *
     * @param result
     * @param userDto
     */
    public static void updateValidate(BindingResult result, UserDto userDto){
        ValidationUtil.rejectIfEmpty(result, "userNm", "user.regist.userNm.empty", "이름이 입력되지 않았습니다.");        
        
        if(StringUtils.hasLength(userDto.getPhoneNo())){
            ValidationUtil.rejectIfNotRegEx(result, "phoneNo", "user.regist.phoneNo.regex", "전화번호 형식에 맞지 않습니다.", ValidationUtil.REG_EX_CELL_PHONE_NO);
        }
        
        if(!StringUtils.isEmpty(userDto.getEmail())){
            ValidationUtil.rejectIfEmpty(result, "email", "user.regist.email.empty", "이메일이 입력되지 않았습니다.");
            ValidationUtil.rejectIfNotRegEx(result, "email", "user.regist.email.regex", "이메일 형식에 맞지 않습니다.", ValidationUtil.REG_EX_EMAIL);
        }        
    }
    
    /**
     * delete validation
     *
     * @param result
     * @param userDto
     */
    public static void deleteValidate(BindingResult result, UserDto userDto){
        
    }



}
