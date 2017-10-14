/**
 * 1. FileName	: AuthenticationInterceptor.java
 * 2. Package	: net.linkednest.runtime.interceptor
 * 3. Comments	: 	
 * 4. Author	: leejinwon
 * 5. DateTime	: 2014. 8. 28. 오후 6:04:21
 * 6. History	:
 * -----------------------------------------------------------------
 *	Date		 |	Name			|	Comment
 * -------------  -----------------   ------------------------------
 * 2014. 8. 28.		 | leejinwon			|	최초작성
 * -----------------------------------------------------------------
 **/

package net.linkednest.runtime.interceptor;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.linkednest.www.user.dto.UserDto;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Component
public class AuthenticationInterceptor extends HandlerInterceptorAdapter{
    
    final Log log = LogFactory.getLog(this.getClass());
    
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		String uri = request.getRequestURI();
		log.info("[ AuthenticationInterceptor.perHandle() ] url : " + uri);
		if(!uri.endsWith("login") && !uri.endsWith("logout.page") && !uri.endsWith("regist")){	
			
			HttpSession session = request.getSession();
			UserDto userInfo = (UserDto) session.getAttribute("userInfo");
			
			if (StringUtils.isEmpty(session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME))) {
				session.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, Locale.ENGLISH);
				System.out.println("a");
			}else{
				System.out.println("b");
			}
		}
		
		return true;
	}
}


