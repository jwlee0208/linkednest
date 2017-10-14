package net.linkednest.runtime.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class EditorInterceptor extends HandlerInterceptorAdapter{
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav) throws Exception{

        String uri = request.getRequestURI(); 
        if(uri.indexOf("/popImageSelector") > 0){
//            response.sendRedirect(request.getRequestURL().toString().replace("http://", "https://"));
        }        
    }
}
