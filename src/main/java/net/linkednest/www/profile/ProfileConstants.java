package net.linkednest.www.profile;

import net.linkednest.common.Constants.Constants;
import org.springframework.util.StringUtils;

/**
 * Created by 9000209 on 2018-01-16.
 */
public enum ProfileConstants implements Constants {
    PROFILE_TYPE_PLAYER("1"),
    PROFILE_TYPE_COACH("2"),
    PROFILE_TYPE_TEAM("3");

    private String code;

    ProfileConstants(String code) {
        this.code = code;
    }

    @Override
    public String getCode() {
        return this.code;
    }

    @Override
    public boolean equals(String compareVal) {
        return StringUtils.pathEquals(this.code, compareVal);
    }

}
