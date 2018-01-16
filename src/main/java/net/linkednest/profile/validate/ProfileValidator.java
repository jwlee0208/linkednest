package net.linkednest.profile.validate;

import net.linkednest.common.validate.BaseValidator;
import net.linkednest.common.validate.ValidationUtil;
import net.linkednest.profile.dto.ProfileDto;
import org.apache.commons.lang3.StringUtils;
import org.springframework.validation.BindingResult;

/**
 * Created by 9000209 on 2018-01-16.
 */
public class ProfileValidator extends BaseValidator {

    public static void insertValidate(BindingResult result, ProfileDto profileDto) {
        // Common Info
        ProfileValidator.commonValidate(result, profileDto);

        if (StringUtils.equals("01010100", profileDto.getCatId1())) {
            ProfilePlayerValidator.insertValidate(result, profileDto.getProfilePlayerDto());
        } else if (StringUtils.equals("01010200", profileDto.getCatId1())) {

        } else if (StringUtils.equals("01010300", profileDto.getCatId1())) {
            ProfileTeamValidator.insertValidate(result, profileDto.getProfileTeamDto());
        }
        // Contact Info
        ProfileContactValidator.insertValidate(result, profileDto.getProfileContactInfoDto());
    }

    public static void updateValidate(BindingResult result, ProfileDto profileDto) {
        // Common Info
        ProfileValidator.commonValidate(result, profileDto);

        if (StringUtils.equals("01010100", profileDto.getCatId1())) {
            ProfilePlayerValidator.updateValidate(result, profileDto.getProfilePlayerDto());
        } else if (StringUtils.equals("01010200", profileDto.getCatId1())) {

        } else if (StringUtils.equals("01010300", profileDto.getCatId1())) {
            ProfileTeamValidator.updateValidate(result, profileDto.getProfileTeamDto());
        }
        // Contact Info
        ProfileContactValidator.updateValidate(result, profileDto.getProfileContactInfoDto());
    }

    public static void deleteValidate(BindingResult result, Object obj ){

    }

    private static void commonValidate(BindingResult result, ProfileDto profileDto) {
        // name
        ValidationUtil.rejectIfEmpty(result, "name", "profile.player.name.empty", "이름을 입력해 주세요.");
        if (StringUtils.isNotEmpty(profileDto.getName())) {
            ValidationUtil.rejectIfNotMaxLength(result, "name", "profile.player.name.length.over", "이름을 20자 이하로 입력해 주세요", 20);
        }
        // catId1
        ValidationUtil.rejectIfEmpty(result, "catId1", "profile.player.catId1.empty", "첫번째 카테고리가 선택되지 않았습니다.");
        // catId2
        ValidationUtil.rejectIfEmpty(result, "catId2", "profile.player.catId2.empty", "두번째 카테고리가 선택되지 않았습니다.");
        // introduce
        ValidationUtil.rejectIfEmpty(result, "introduce", "profile.player.introduce.empty", "자기소개를 입력해 주세요.");
    }

}
