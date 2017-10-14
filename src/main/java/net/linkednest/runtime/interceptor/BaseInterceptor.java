package net.linkednest.runtime.interceptor;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.linkednest.www.user.dto.UserDto;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;


public class BaseInterceptor extends HandlerInterceptorAdapter{
    final Log log = LogFactory.getLog(this.getClass());

    @Value("${build.type}")
    private String buildType;
    
    public void setValues(HttpServletRequest request){
        request.setAttribute("buildType", buildType);
    }
    
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{        
        this.setValues(request);
        
		HttpSession session = request.getSession();
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		
		if (StringUtils.isEmpty(session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME))) {
			session.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, Locale.ENGLISH);
		}
        
        return true;
    }
    
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav) throws Exception{
        
    }
}
