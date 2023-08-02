package net.linkednest.runtime;

import net.linkednest.www.user.dto.UserDto;
import net.linkednest.www.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * Created by 9000209 on 2018-01-31.
 */
public class CustomAuthenticationProvider implements AuthenticationProvider {
    @Autowired
    private UserService             userService;
    @Autowired
    private BCryptPasswordEncoder   passwordEncoder;

    @Override
    public Authentication authenticate (Authentication authentication) throws AuthenticationException {
        String userId = (String) authentication.getPrincipal();
        String passwd = (String) authentication.getCredentials();

        UserDto userDto = new UserDto();
        userDto.setUserId(userId);
        UserDto userInfo = null;
        try {
            userInfo = userService.selectUserInfo(userDto);
            if (!passwordEncoder.matches(passwd, userInfo.getPasswd())) {
                throw new BadCredentialsException("Password is not matched!!!");
            }
            return new UsernamePasswordAuthenticationToken(userId, passwd, null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}
