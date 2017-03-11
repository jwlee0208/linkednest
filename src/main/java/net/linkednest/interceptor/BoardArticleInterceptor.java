package net.linkednest.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.linkednest.board.dto.BoardArticleDto;
import net.linkednest.board.dto.BoardDto;
import net.linkednest.common.dto.ShareDto;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.linkednest.board.dto.BoardArticleDto;
import net.linkednest.board.dto.BoardDto;
import net.linkednest.common.dto.ShareDto;

@Component
public class BoardArticleInterceptor extends HandlerInterceptorAdapter {    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
        
        return true;
    }
    
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav) throws Exception{
        
        // create meta tag info's dynamically
        // it is for searching portal like google, naver etc,.
        this.createMetaTag(request, response, handler, mav);
    }
    
    /**
     * @brief create meta tag info's dynamically
     * @param request
     * @param response
     * @param handler
     * @param mav
     */
    public void createMetaTag(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav) {
        String title        = "::: Share Yours :::  ";
        String description  = "Share your experiences, knowledge, information.";
        String content      = "Share's Main page";
        String authorNm     = "lee jinwon";
        String filePath     = "";
        String url          = "";
        String shareName    = "";
        
        String uri          = request.getRequestURI();
        
        if(mav!= null && !mav.isEmpty()){
            Map<String, Object> model = mav.getModel();
            
            if(uri.indexOf("view") > 0){
                if((!model.isEmpty()) && model.containsKey("contentInfo")){
                    BoardArticleDto contentInfo = (BoardArticleDto)model.get("contentInfo");
                    
                    if(contentInfo != null){
                        title       += contentInfo.getTitle();
                        content     = contentInfo.getContentText();
                        authorNm    = contentInfo.getAuthorNm();
                        filePath    = contentInfo.getFilePath();
                        url         = request.getRequestURL().toString();
                        
                        
                        if(!content.isEmpty() && content.length() > 250){
                            content = content.substring(0, 250);
                        }
                        description = content;
                    }
                }else{
//                    System.out.println("N/A");
                }  
                
                if((!model.isEmpty()) && model.containsKey("shareInfo")){
                   ShareDto shareInfo = (ShareDto)model.get("shareInfo");
                   if(shareInfo != null){
                       shareName = shareInfo.getShareName();
                   }
                }
            }else if(uri.indexOf("list") > 0){
                if((!model.isEmpty()) && model.containsKey("boardInfo")){
                    BoardDto boardInfo = (BoardDto)model.get("boardInfo");
                    if(boardInfo != null){
                        title       += boardInfo.getBoardName();
                        content     = boardInfo.getBoardName();
                        url         = request.getRequestURL().toString();
                        description = boardInfo.getBoardName();
                    }
                }else{
//                    System.out.println("N/A");
                }
            }
        }
        request.setAttribute("title"        , title);
        request.setAttribute("content"      , content);
        request.setAttribute("description"  , description);
        request.setAttribute("authorNm"     , authorNm);
        request.setAttribute("filePath"     , filePath);
        request.setAttribute("url"          , url);  
        request.setAttribute("shareName"    , shareName);  
    }
}
