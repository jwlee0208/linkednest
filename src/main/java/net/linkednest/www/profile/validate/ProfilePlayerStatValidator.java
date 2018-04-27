package net.linkednest.www.profile.validate;

import net.linkednest.common.validate.BaseValidator;
import net.linkednest.common.validate.ValidationUtil;
import net.linkednest.www.profile.dto.ProfileDto;
import net.linkednest.www.profile.dto.ProfileStatFielderDto;
import net.linkednest.www.profile.dto.ProfileStatHitterDto;
import net.linkednest.www.profile.dto.ProfileStatPitcherDto;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.validation.BindingResult;

import java.util.List;

/**
 * Created by 9000209 on 2018-01-17.
 */
public class ProfilePlayerStatValidator extends BaseValidator {
    public static void insertValidate(BindingResult result, ProfileDto profileDto) {
        ProfilePlayerStatValidator.commonValidate(result, profileDto);
    }

    public static void updateValidate(BindingResult result, ProfileDto profileDto) {
        ProfilePlayerStatValidator.commonValidate(result, profileDto);
    }

    public static void deleteValidate(BindingResult result, Object obj) {
        // to-do
    }

    private static void commonValidate(BindingResult result, ProfileDto profileDto) {
        // hitting stat
        ProfilePlayerStatValidator.hitStatValidate(result, profileDto.getProfileStatHitterList());
        // pitching stat
        ProfilePlayerStatValidator.pitchStatValidate(result, profileDto.getProfileStatPitcherList());
        // fielding stat
        ProfilePlayerStatValidator.fieldStatValidate(result, profileDto.getProfileStatFielderList());
    }

    private static void hitStatValidate(BindingResult result, List<ProfileStatHitterDto> profileStatHitterList) {
        if (CollectionUtils.isNotEmpty(profileStatHitterList)) {
            profileStatHitterList.stream().forEach(hitStat -> {
                // hTeamName
                ValidationUtil.rejectIfEmpty(result, "profileStatHitterDto.hTeamName", "profile.player.stat.hit.hTeamName.empty", "팀명을 입력해 주세요.");
                // hStatYear
                ValidationUtil.rejectIfEmpty(result, "profileStatHitterDto.hStatYear", "profile.player.stat.hit.hStatYear.empty", "년도를 입력해 주세요.");
                // g
                ValidationUtil.rejectIfEmpty(result, "profileStatHitterDto.g", "profile.player.stat.hit.g.empty", "g를 입력해 주세요.");
                // ab
                ValidationUtil.rejectIfEmpty(result, "profileStatHitterDto.ab", "profile.player.stat.hit.ab.empty", "ab를 입력해 주세요.");
                // r
                ValidationUtil.rejectIfEmpty(result, "profileStatHitterDto.r", "profile.player.stat.hit.r.empty", "r를 입력해 주세요.");
                // h
                ValidationUtil.rejectIfEmpty(result, "profileStatHitterDto.h", "profile.player.stat.hit.h.empty", "h를 입력해 주세요.");
                // twoB
                ValidationUtil.rejectIfEmpty(result, "profileStatHitterDto.twoB", "profile.player.stat.hit.twoB.empty", "twoB를 입력해 주세요.");
                // threeB
                ValidationUtil.rejectIfEmpty(result, "profileStatHitterDto.threeB", "profile.player.stat.hit.threeB.empty", "threeB를 입력해 주세요.");
                // hr
                ValidationUtil.rejectIfEmpty(result, "profileStatHitterDto.hr", "profile.player.stat.hit.hr.empty", "hr를 입력해 주세요.");
                // rbi
                ValidationUtil.rejectIfEmpty(result, "profileStatHitterDto.rbi", "profile.player.stat.hit.rbi.empty", "rbi를 입력해 주세요.");
                // bb
                ValidationUtil.rejectIfEmpty(result, "profileStatHitterDto.bb", "profile.player.stat.hit.bb.empty", "bb를 입력해 주세요.");
                // so
                ValidationUtil.rejectIfEmpty(result, "profileStatHitterDto.so", "profile.player.stat.hit.so.empty", "so를 입력해 주세요.");
                // sb
                ValidationUtil.rejectIfEmpty(result, "profileStatHitterDto.sb", "profile.player.stat.hit.sb.empty", "sb를 입력해 주세요.");
                // cs
                ValidationUtil.rejectIfEmpty(result, "profileStatHitterDto.cs", "profile.player.stat.hit.cs.empty", "cs를 입력해 주세요.");
                // avg
                ValidationUtil.rejectIfEmpty(result, "profileStatHitterDto.avg", "profile.player.stat.hit.avg.empty", "avg를 입력해 주세요.");
                // obp
                ValidationUtil.rejectIfEmpty(result, "profileStatHitterDto.obp", "profile.player.stat.hit.obp.empty", "obp를 입력해 주세요.");
                // slg
                ValidationUtil.rejectIfEmpty(result, "profileStatHitterDto.slg", "profile.player.stat.hit.slg.empty", "slg를 입력해 주세요.");
                // ops
                ValidationUtil.rejectIfEmpty(result, "profileStatHitterDto.ops", "profile.player.stat.hit.ops.empty", "ops를 입력해 주세요.");
            });
        }
    }

    private static void pitchStatValidate(BindingResult result, List<ProfileStatPitcherDto> profileStatPitcherList) {
        if (CollectionUtils.isNotEmpty(profileStatPitcherList)) {
            profileStatPitcherList.stream().forEach(pitchStat -> {
                // pTeamName
                ValidationUtil.rejectIfEmpty(result, "profileStatPitcherDto.pTeamName", "profile.player.stat.pitch.pTeamName.empty", "팀명을 입력해 주세요.");
                // pStatYear
                ValidationUtil.rejectIfEmpty(result, "profileStatPitcherDto.pStatYear", "profile.player.stat.pitch.pStatYear.empty", "년도를 입력해 주세요.");
                // inn
                ValidationUtil.rejectIfEmpty(result, "profileStatPitcherDto.inn", "profile.player.stat.pitch.inn.empty", "inn를 입력해 주세요.");
                // w
                ValidationUtil.rejectIfEmpty(result, "profileStatPitcherDto.w", "profile.player.stat.pitch.w.empty", "w를 입력해 주세요.");
                // l
                ValidationUtil.rejectIfEmpty(result, "profileStatPitcherDto.l", "profile.player.stat.pitch.l.empty", "l를 입력해 주세요.");
                // era
                ValidationUtil.rejectIfEmpty(result, "profileStatPitcherDto.era", "profile.player.stat.pitch.era.empty", "era를 입력해 주세요.");
                // g
                ValidationUtil.rejectIfEmpty(result, "profileStatPitcherDto.g", "profile.player.stat.pitch.g.empty", "g를 입력해 주세요.");
                // gs
                ValidationUtil.rejectIfEmpty(result, "profileStatPitcherDto.gs", "profile.player.stat.pitch.gs.empty", "gs를 입력해 주세요.");
                // sv
                ValidationUtil.rejectIfEmpty(result, "profileStatPitcherDto.sv", "profile.player.stat.pitch.sv.empty", "sv를 입력해 주세요.");
                // svo
                ValidationUtil.rejectIfEmpty(result, "profileStatPitcherDto.svo", "profile.player.stat.pitch.svo.empty", "svo를 입력해 주세요.");
                // ip
                ValidationUtil.rejectIfEmpty(result, "profileStatPitcherDto.ip", "profile.player.stat.pitch.ip.empty", "ip를 입력해 주세요.");
                // h
                ValidationUtil.rejectIfEmpty(result, "profileStatPitcherDto.h", "profile.player.stat.pitch.h.empty", "h를 입력해 주세요.");
                // r
                ValidationUtil.rejectIfEmpty(result, "profileStatPitcherDto.r", "profile.player.stat.pitch.r.empty", "r를 입력해 주세요.");
                // er
                ValidationUtil.rejectIfEmpty(result, "profileStatPitcherDto.er", "profile.player.stat.pitch.er.empty", "er를 입력해 주세요.");
                // hr
                ValidationUtil.rejectIfEmpty(result, "profileStatPitcherDto.hr", "profile.player.stat.pitch.hr.empty", "hr를 입력해 주세요.");
                // bb
                ValidationUtil.rejectIfEmpty(result, "profileStatPitcherDto.bb", "profile.player.stat.pitch.bb.empty", "bb를 입력해 주세요.");
                // so
                ValidationUtil.rejectIfEmpty(result, "profileStatPitcherDto.so", "profile.player.stat.pitch.so.empty", "so를 입력해 주세요.");
                // avg
                ValidationUtil.rejectIfEmpty(result, "profileStatPitcherDto.avg", "profile.player.stat.pitch.avg.empty", "avg를 입력해 주세요.");
                // whip
                ValidationUtil.rejectIfEmpty(result, "profileStatPitcherDto.whip", "profile.player.stat.pitch.whip.empty", "whip를 입력해 주세요.");
                // k
                ValidationUtil.rejectIfEmpty(result, "profileStatPitcherDto.k", "profile.player.stat.pitch.k.empty", "k를 입력해 주세요.");
            });
        }
    }

    private static void fieldStatValidate(BindingResult result, List<ProfileStatFielderDto> profileStatFielderList) {
        if (CollectionUtils.isNotEmpty(profileStatFielderList)) {
            profileStatFielderList.stream().forEach(fieldStat -> {
                // fTeamName
                ValidationUtil.rejectIfEmpty(result, "profileStatFielderDto.fTeamName", "profile.player.stat.field.fTeamName.empty", "팀명을 입력해 주세요.");
                // fStatYear
                ValidationUtil.rejectIfEmpty(result, "profileStatFielderDto.fStatYear", "profile.player.stat.field.fStatYear.empty", "년도를 입력해 주세요.");
                // pos
                ValidationUtil.rejectIfEmpty(result, "profileStatFielderDto.pos", "profile.player.stat.field.pos.empty", "pos를 입력해 주세요.");
                // g
                ValidationUtil.rejectIfEmpty(result, "profileStatFielderDto.g", "profile.player.stat.field.g.empty", "g를 입력해 주세요.");
                // gs
                ValidationUtil.rejectIfEmpty(result, "profileStatFielderDto.gs", "profile.player.stat.field.gs.empty", "gs를 입력해 주세요.");
                // inn
                ValidationUtil.rejectIfEmpty(result, "profileStatFielderDto.inn", "profile.player.stat.field.inn.empty", "inn를 입력해 주세요.");
                // tc
                ValidationUtil.rejectIfEmpty(result, "profileStatFielderDto.tc", "profile.player.stat.field.tc.empty", "tc를 입력해 주세요.");
                // po
                ValidationUtil.rejectIfEmpty(result, "profileStatFielderDto.po", "profile.player.stat.field.po.empty", "po를 입력해 주세요.");
                // a
                ValidationUtil.rejectIfEmpty(result, "profileStatFielderDto.a", "profile.player.stat.field.a.empty", "a를 입력해 주세요.");
                // e
                ValidationUtil.rejectIfEmpty(result, "profileStatFielderDto.e", "profile.player.stat.field.e.empty", "e를 입력해 주세요.");
                // dp
                ValidationUtil.rejectIfEmpty(result, "profileStatFielderDto.dp", "profile.player.stat.field.dp.empty", "dp를 입력해 주세요.");
                // sb
                ValidationUtil.rejectIfEmpty(result, "profileStatFielderDto.sb", "profile.player.stat.field.sb.empty", "sb를 입력해 주세요.");
                // cs
                ValidationUtil.rejectIfEmpty(result, "profileStatFielderDto.cs", "profile.player.stat.field.cs.empty", "cs를 입력해 주세요.");
                // sbpct
                ValidationUtil.rejectIfEmpty(result, "profileStatFielderDto.sbpct", "profile.player.stat.field.sbpct.empty", "sbpct를 입력해 주세요.");
                // pb
                ValidationUtil.rejectIfEmpty(result, "profileStatFielderDto.pb", "profile.player.stat.field.pb.empty", "pb를 입력해 주세요.");
                // cWp
                ValidationUtil.rejectIfEmpty(result, "profileStatFielderDto.cWp", "profile.player.stat.field.cWp.empty", "cWp를 입력해 주세요.");
                // fpct
                ValidationUtil.rejectIfEmpty(result, "profileStatFielderDto.fpct", "profile.player.stat.field.fpct.empty", "fpct를 입력해 주세요.");
                // rf
                ValidationUtil.rejectIfEmpty(result, "profileStatFielderDto.rf", "profile.player.stat.field.rf.empty", "rf를 입력해 주세요.");
            });
        }
    }

}
