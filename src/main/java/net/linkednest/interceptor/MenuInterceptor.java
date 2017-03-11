package net.linkednest.interceptor;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MenuInterceptor  extends HandlerInterceptorAdapter {
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav) throws Exception{
//        System.out.println("inter uri : " + request.getRequestURI());
//        System.out.println("inter url : " + request.getRequestURL());
//        System.out.println("inter remote port : " + request.getRemotePort() +", server port : " + request.getServerPort());
        
        String uri = request.getRequestURI(); 
        Pattern p = Pattern.compile("[/+]");
        if(uri.indexOf("/board/article/main") > 0 || uri.indexOf("/share") > 0){
            
            String[] str = p.split(uri);
            request.setAttribute("userId", str[str.length - 1]);
        }else if(uri.indexOf("/config") > 0){
            String[] str = p.split(uri);
            request.setAttribute("userId", str[str.length - 1]);
        }else{
            
        }
    }
}
