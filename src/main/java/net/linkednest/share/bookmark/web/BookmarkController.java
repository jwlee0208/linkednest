package net.linkednest.share.bookmark.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.linkednest.share.bookmark.dto.BookmarkDto;
import net.linkednest.share.bookmark.service.BookmarkService;
import net.linkednest.www.user.dto.UserDto;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;


@Controller
@RequestMapping(value="/share/bookmark")
public class BookmarkController {
    Log log = LogFactory.getLog(BookmarkController.class);
    
    @Autowired
    private BookmarkService bookmarkService;
    
    @RequestMapping(value="/{userId}/list", method=RequestMethod.GET)
    public String getBookmarkList(HttpServletRequest request, Model model, BookmarkDto bookmarkDto, @PathVariable String userId, HttpSession session)throws Exception{
        UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
        bookmarkDto.setUserId(userId);
        model.addAttribute("bookmarkList", this.bookmarkService.getBookmarkList(bookmarkDto));
        model.addAttribute("userId"      , userId);
        model.addAttribute("userInfo"    , sessionInfo);
        return "bookmark/bookmarkList";
    }
    
    @RequestMapping(value="{userId}/add", method=RequestMethod.GET)
    public String addBookmarkPage(HttpServletRequest request, Model model, BookmarkDto bookmarkDto, @PathVariable String userId, HttpSession session) throws Exception{
        UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
        if(sessionInfo != null){
            bookmarkDto.setUserId(sessionInfo.getUserId());
        }else{
            return "redirect:/login?redirectPage=" + request.getRequestURI();
        }
        model.addAttribute("userInfo", sessionInfo);
        return "bookmark/addBookmark";
    }
    
    @RequestMapping(value="{userId}/add", method=RequestMethod.POST)
    @ResponseBody
    public JSONObject addBookmarkInfo(HttpServletRequest request, Model model, BookmarkDto bookmarkDto, @PathVariable String userId, HttpSession session) throws Exception{
        
        UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
        if(sessionInfo != null){
            bookmarkDto.setUserId(sessionInfo.getUserId());
        }
        
        int result = this.bookmarkService.addBookmarkInfo(bookmarkDto);
        
        JSONObject resultObj = new JSONObject();
        if(result > 0){
            resultObj.put("status", "ADD_BOOKMARK_0000");
            resultObj.put("result", "insert successfully");
        }else{
            resultObj.put("status", "ADD_BOOKMARK_0001");
            resultObj.put("result", "insert faliure");            
        }
        return resultObj;
    }
}
