package net.linkednest.www.profile.validate;

import net.linkednest.common.validate.BaseValidator;
import net.linkednest.common.validate.ValidationUtil;
import net.linkednest.www.profile.dto.ProfilePlayerDto;
import org.apache.commons.lang3.StringUtils;
import org.springframework.validation.BindingResult;

/**
 * Created by 9000209 on 2018-01-16.
 */
public class ProfilePlayerValidator extends BaseValidator {

    public static void insertValidate(BindingResult result, ProfilePlayerDto profilePlayerDto) {
        ProfilePlayerValidator.commonValidate(result, profilePlayerDto);
    }

    public static void updateValidate(BindingResult result, ProfilePlayerDto profilePlayerDto) {
        ProfilePlayerValidator.commonValidate(result, profilePlayerDto);
    }

    public static void deleteValidate(BindingResult result, Object obj ){
        // to-do
    }

    private static void commonValidate(BindingResult result, ProfilePlayerDto profilePlayerDto) {
        // height
        ValidationUtil.rejectIfNotMinLength(result, "profilePlayerDto.height", "profile.player.height.empty", "키를 입력해 주세요.", 1);
        if (profilePlayerDto.getHeight() > 0) {
            ValidationUtil.rejectIfNotRegEx(result, "profilePlayerDto.height", "profile.player.height.regex", "키는 숫자와 \".\"만 입력 가능합니다.", ValidationUtil.REG_EX_DECIMAL_POINT);
        }
        // weight
        ValidationUtil.rejectIfNotMinLength(result, "profilePlayerDto.weight", "profile.player.weight.empty", "몸무게를 입력해 주세요.", 1);
        if (profilePlayerDto.getWeight() > 0) {
            ValidationUtil.rejectIfNotRegEx(result, "profilePlayerDto.weight", "profile.player.weight.regex", "몸무게는 숫자와 \".\"만 입력 가능합니다.", ValidationUtil.REG_EX_DECIMAL_POINT);
        }
        // birthDate
        ValidationUtil.rejectIfEmpty(result, "profilePlayerDto.birthDate", "profile.player.birthDate.empty", "생년월일을 입력해 주세요.");
        if (StringUtils.isNotEmpty(profilePlayerDto.getBirthDate())) {
            ValidationUtil.rejectIfNotRegEx(result, "profilePlayerDto.birthDate", "profile.player.birthDate.regex", "생년월일이 형식에 맞지 않습니다.", ValidationUtil.REG_EX_YYYY_MM_DD);
        }
        // birthPlace
        ValidationUtil.rejectIfEmpty(result, "profilePlayerDto.birthPlace", "profile.player.birthPlace.empty", "출생지를 입력해 주세요.");
        // education
        ValidationUtil.rejectIfEmpty(result, "profilePlayerDto.education", "profile.player.education.empty", "출신 학교를 입력해 주세요.");
        /*// hobbies
        ValidationUtil.rejectIfEmpty(result, "profilePlayerDto.hobbies", "profile.player.hobbies.empty", "취미를 입력해 주세요.");
        // favoriteFood
        ValidationUtil.rejectIfEmpty(result, "profilePlayerDto.favoriteFood", "profile.player.favoriteFood.empty", "좋아하는 음식을 입력해 주세요.");*/
        // language
        ValidationUtil.rejectIfEmpty(result, "profilePlayerDto.language", "profile.player.language.empty", "모국어를 입력해 주세요.");
        // nationality
        ValidationUtil.rejectIfEmpty(result, "profilePlayerDto.nationality", "profile.player.nationality.empty", "국적을 입력해 주세요.");
    }
}
