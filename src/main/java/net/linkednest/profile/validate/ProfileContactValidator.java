package net.linkednest.profile.validate;

import net.linkednest.common.validate.BaseValidator;
import net.linkednest.common.validate.ValidationUtil;
import net.linkednest.profile.dto.ProfileContactInfoDto;
import org.apache.commons.lang.StringUtils;
import org.springframework.validation.BindingResult;

/**
 * Created by 9000209 on 2018-01-16.
 */
public class ProfileContactValidator extends BaseValidator {

    public static void insertValidate(BindingResult result, ProfileContactInfoDto profileContactInfoDto) {
        ProfileContactValidator.commonValidate(result, profileContactInfoDto);
    }

    public static void updateValidate(BindingResult result, ProfileContactInfoDto profileContactInfoDto) {
        ProfileContactValidator.commonValidate(result, profileContactInfoDto);
    }

    public static void deleteValidate(BindingResult result, Object obj ){
        // to-do
    }

    private static void commonValidate(BindingResult result, ProfileContactInfoDto profileContactInfoDto) {
        if (StringUtils.isNotEmpty(profileContactInfoDto.getEmail())) {
            ValidationUtil.rejectIfNotRegEx(result, "email", "profile.contact.email.regex", "잘못된 이메일 형식이 입력 되었습니다.", ValidationUtil.REG_EX_EMAIL);
        }

        if (StringUtils.isNotEmpty(profileContactInfoDto.getCellPhoneNo())) {
            ValidationUtil.rejectIfNotRegEx(result, "cellPhoneNo", "profile.contant.cellPhoneNo.regex", "스마트폰 번호 형식이 맞지 않습니다.", ValidationUtil.REG_EX_CELL_PHONE_NO);
        }

        if (StringUtils.isNotEmpty(profileContactInfoDto.getPhoneNo())) {
            ValidationUtil.rejectIfNotRegEx(result, "phoneNo", "profile.contant.phoneNo.regex", "전화번호가 형식에 맞지 않습니다.", ValidationUtil.REG_EX_NORMAL_PHONE_NO);
        }

        if (StringUtils.isNotEmpty(profileContactInfoDto.getWebsiteUrl())) {
            ValidationUtil.rejectIfNotRegEx(result, "websiteUrl", "profile.contant.websiteUrl.regex", "URL이 형식에 맞지 않습니다.", ValidationUtil.REG_EX_URL);
        }
    }
}
