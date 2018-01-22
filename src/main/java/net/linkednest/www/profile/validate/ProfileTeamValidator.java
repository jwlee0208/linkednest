package net.linkednest.www.profile.validate;

import net.linkednest.common.validate.BaseValidator;
import net.linkednest.common.validate.ValidationUtil;
import net.linkednest.www.profile.dto.ProfileTeamDto;
import org.apache.commons.lang3.StringUtils;
import org.springframework.validation.BindingResult;

/**
 * Created by 9000209 on 2018-01-16.
 */
public class ProfileTeamValidator extends BaseValidator {

    public static void insertValidate(BindingResult result, ProfileTeamDto profileTeamDto) {
        ProfileTeamValidator.commonValidate(result, profileTeamDto);
    }

    public static void updateValidate(BindingResult result, ProfileTeamDto profileTeamDto) {
        ProfileTeamValidator.commonValidate(result, profileTeamDto);
    }

    public static void deleteValidate(BindingResult result, ProfileTeamDto profileTeamDto){
        // to-do
    }

    private static void commonValidate(BindingResult result, ProfileTeamDto profileTeamDto) {
        // name
        ValidationUtil.rejectIfEmpty(result, "leagueId", "profile.team.leagueId.empty", "리그 정보가 선택되지 않았습니다.");
        // city
        ValidationUtil.rejectIfEmpty(result, "city", "profile.team.city.empty", "도시(연고지)가 입력되지 않았습니다.");
        // establishedDate
        ValidationUtil.rejectIfEmpty(result, "establishedDate", "profile.team.establishedDate.empty", "창단일자가 입력되지 않았습니다.");
        if (StringUtils.isNotEmpty(profileTeamDto.getEstablishedDate())) {
            ValidationUtil.rejectIfNotRegEx(result, "establishedDate", "profile.team.establishedDate.wrongformat", "창단일자가 형식에 맞지 않습니다.", ValidationUtil.REG_EX_YYYY_MM_DD);
        }
    }
}
