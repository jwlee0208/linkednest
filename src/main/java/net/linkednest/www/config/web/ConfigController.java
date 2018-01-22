package net.linkednest.www.config.web;

import net.linkednest.common.util.PagedList;
import net.linkednest.www.board.dto.BoardCategoryDto;
import net.linkednest.www.board.dto.BoardDto;
import net.linkednest.www.board.service.BoardCategoryService;
import net.linkednest.www.board.service.BoardService;
import net.linkednest.www.common.dto.ShareDto;
import net.linkednest.www.common.service.CommonService;
import net.linkednest.www.share.service.ShareService;
import net.linkednest.www.user.dto.UserDto;
import net.linkednest.www.user.service.UserService;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
@RequestMapping(value= "/properties/config")
@SessionAttributes("userInfo")
public class ConfigController {
    public static final int DEFAULT_PAGE_NO    = 1;
    public static final int DEFAULT_PAGE_SIZE  = 10;

    @Autowired
    private BoardService boardService;

    @Autowired
    private BoardCategoryService boardCategoryService;

    @Autowired
    private ShareService shareService;

    @Autowired
    private UserService userService;

    @Autowired
    private CommonService commonService;

    @RequestMapping(value="/main")
    public String getConfig(HttpServletRequest request, Model model, HttpSession session) throws Exception{
        UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
        if(null != sessionInfo){

        }else{
            return "redirect:/login?redirectPage=" + request.getRequestURI();
        }
        model.addAttribute("userInfo", sessionInfo);
        return "properties/config/config";
    }

    @RequestMapping(value="/board/list")
    public String getBoardList(HttpServletRequest request, Model model, BoardDto boardDto, HttpSession session) throws Exception{
        UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
        if(null != sessionInfo){
            boardDto.setCreateUserId(sessionInfo.getUserId());
        }else{
            return "redirect:/login?redirectPage=" + request.getRequestURI();
        }
        model = this.getBoardCommonList(request, model, boardDto);
        return "properties/config/board/accordionList";
    }

    @RequestMapping(value="/board/list/{menuId}")
    public String getBoardList(HttpServletRequest request, Model model, BoardDto boardDto, HttpSession session, @PathVariable int menuId) throws Exception{

        return this.getBoardList(request, model, boardDto, session);
    }

    private Model getBoardCommonList(HttpServletRequest request, Model model, BoardDto boardDto) throws Exception{
        // 검색 조건
        String searchCondition = request.getParameter("searchCondition");
        String searchText      = request.getParameter("searchText");
        String startDate       = request.getParameter("startDate");
        String endDate         = request.getParameter("endDate");

        int    pageNo          = (StringUtils.isNotEmpty(StringUtils.defaultString(request.getParameter("pageNo")))) ? Integer.parseInt(request.getParameter("pageNo")) : DEFAULT_PAGE_NO;
        int    listRowCnt      = (StringUtils.isNotEmpty(StringUtils.defaultString(request.getParameter("listRowCnt")))) ? Integer.parseInt(request.getParameter("listRowCnt")) : 10;

        String createUserId    = boardDto.getCreateUserId();

        Map<String, Object> paramMap = new HashMap<String, Object>();
        // searching condition setting
        paramMap.put("searchCondition", searchCondition);
        paramMap.put("searchText"     , searchText);
        paramMap.put("startDate"      , startDate);
        paramMap.put("endDate"        , endDate);
        paramMap.put("createUserId"   , createUserId);

        int    totalListCnt    = boardService.getListCnt(paramMap);

        paramMap.put("pageNo"         , pageNo);
        paramMap.put("listRowCnt"     , listRowCnt);
        paramMap.put("totalListCnt"   , totalListCnt);
        paramMap.put("pageSize"       , DEFAULT_PAGE_SIZE);

        PagedList result       = boardService.getBoardPagedList(paramMap);

        model.addAttribute("pagedResult", result);
        return model;

    }

    @RequestMapping(value = "/board/write")
    public String createBoard(HttpServletRequest request, Model model, BoardDto boardDto, HttpSession session) throws Exception{

        UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
        BoardCategoryDto boardCategoryDto = new BoardCategoryDto();
        if(null != sessionInfo){
            boardCategoryDto.setCreateUserId(sessionInfo.getUserId());
        }else{
            return "redirect:/login?redirectPage=" + request.getRequestURI();
        }
        model.addAttribute("categoryList", this.boardService.getBoardCategoryList(boardCategoryDto));
        return "properties/config/board/write";
    }

    @SuppressWarnings("serial")
    @RequestMapping(value = "/board/insertBoardAction.json", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject insertBoardAction(@Valid BoardDto boardDto, BindingResult bindingResult, HttpSession session) throws Exception {
        JSONObject    jsonObj         = new JSONObject();
        int           insertResult    = 0;
        UserDto       sessionInfo     = (UserDto)session.getAttribute("userInfo");

        if(null != sessionInfo){
            boardDto.setCreateUserId(sessionInfo.getUserId());
            boardDto.setCreateUserName(sessionInfo.getUserNm());

            if(bindingResult.hasErrors()){
                jsonObj.put("validate", false);
            }
        }

        insertResult = this.boardService.insertBoardInfo(boardDto);
        jsonObj.put("result", (insertResult > 0) ? true : false);
        return jsonObj;
    }

    @RequestMapping(value = "/board/view")
    public String getBoardContent(HttpServletRequest request, Model model, BoardDto boardDto, @RequestParam(value="selectedBoardId", required=false) int selectedBoardId) throws Exception{

        BoardDto boardInfo      = null;
        BoardDto prevBoardInfo  = null;
        BoardDto nextBoardInfo  = null;

        if(selectedBoardId > 0){
            boardDto.setBoardId(selectedBoardId);
            // 글 조회
            boardInfo     = this.boardService.selectBoardInfo(boardDto);
            // 이전 글 조회
            prevBoardInfo = this.boardService.getPrevBoardInfo(boardDto);
            // 다음 글 조회
            nextBoardInfo = this.boardService.getNextBoardInfo(boardDto);
        }

        model.addAttribute("boardInfo"    , boardInfo);
        model.addAttribute("prevBoardInfo", prevBoardInfo);
        model.addAttribute("nextBoardInfo", nextBoardInfo);

        model.addAttribute("boardId"      , boardDto.getBoardId());

        return "properties/config/board/view";
    }
    /**
     * 게시판 수정 페이지
     * @param model
     * @param boardDto
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/board/modify")
    public String modifyBoard(HttpServletRequest request, Model model, BoardDto boardDto, HttpSession session, @RequestParam(value="selectedBoardId", required=false) int selectedBoardId) throws Exception{

        UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
        BoardDto boardInfo = null;
        BoardCategoryDto boardCategoryDto = new BoardCategoryDto();
        if(null != sessionInfo){
            boardCategoryDto.setCreateUserId(sessionInfo.getUserId());
            if(selectedBoardId > 0){
                boardDto.setBoardId(selectedBoardId);
            }
            boardInfo = boardService.getBoardInfo(boardDto);
        }else{
            return "redirect:/login?redirectPage=" + request.getRequestURI();
        }

        model.addAttribute("categoryList", this.boardService.getBoardCategoryList(boardCategoryDto));
        model.addAttribute("boardInfo"   , boardInfo);
        return "properties/config/board/write";
    }

    @SuppressWarnings("serial")
    @RequestMapping(value = "/board/modifyBoardAction.json", method = {RequestMethod.POST})
    @ResponseBody
    public JSONObject modifyBoardAction(
            Locale locale
            , Model model
            , HttpServletRequest request
            , HttpServletResponse response
            , HttpSession session
            , BoardDto boardDto
            , BindingResult bindingResult) throws Exception {

        JSONObject jsonObj        = new JSONObject();
        int        modifyResult   = 0;
        UserDto    sessionInfo    = (UserDto)session.getAttribute("userInfo");

        if(null != sessionInfo){
            boardDto.setModifyUserId(sessionInfo.getUserId());
            boardDto.setModifyUserName(sessionInfo.getUserNm());

            if(bindingResult.hasErrors()){
                jsonObj.put("validate", false);
            }
        }
        modifyResult = this.boardService.modifyBoardInfo(boardDto);

        jsonObj.put("result", (modifyResult > 0) ? true : false);
        return jsonObj;
    }

    @RequestMapping(value="/board/categoryList")
    public String getCategoryList(Model model, HttpSession session) throws Exception{
        model = this.setBoardCategoryInfo(model, session);
        return "properties/config/board/categoryList";
    }

    @RequestMapping(value="/board/ajaxCategoryList")
    public String getAjaxCategoryList(Model model, HttpSession session) throws Exception{
        model = this.setBoardCategoryInfo(model, session);
        return "properties/config/board/ajaxCategoryList";
    }

    private Model setBoardCategoryInfo(Model model, HttpSession session){
        BoardCategoryDto boardCategoryDto = new BoardCategoryDto();
        List<BoardCategoryDto> boardCategoryList = null;
        UserDto    sessionInfo    = (UserDto)session.getAttribute("userInfo");
        if(sessionInfo != null){
            boardCategoryDto.setCreateUserId(sessionInfo.getUserId());
            try {
                boardCategoryList = this.boardCategoryService.getBoardCategoryList(boardCategoryDto);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        model.addAttribute("boardCategoryList", boardCategoryList);
        return model;
    }

    @RequestMapping(value = "/board/writeCategory")
    public String createBoardCategory(HttpServletRequest request, Model model, HttpSession session) throws Exception{
        UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
        if(null == sessionInfo){
            return "redirect:/login?redirectPage=" + request.getRequestURI();
        }
        return "properties/config/board/writeCategory";
    }


    @SuppressWarnings("serial")
    @RequestMapping(value = "/board/insertBoardCategoryAction.json", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject insertBoardCategoryAction(@Valid BoardCategoryDto boardCategoryDto, BindingResult bindingResult, HttpSession session) throws Exception {

        JSONObject    jsonObj         = new JSONObject();
        int           insertResult    = 0;
        UserDto       sessionInfo     = (UserDto)session.getAttribute("userInfo");

        if(null != sessionInfo){
            boardCategoryDto.setCreateUserId(sessionInfo.getUserId());
            if(bindingResult.hasErrors()){
                jsonObj.put("validate", false);
            }
        }
        insertResult = this.boardCategoryService.insertBoardCategory(boardCategoryDto);

        jsonObj.put("result", (insertResult > 0) ? true : false);
        return jsonObj;
    }

    @RequestMapping(value = "/board/viewCategory")
    public String getBoardCategoryContent(HttpServletRequest request, Model model, BoardCategoryDto boardCategoryDto, @RequestParam(value="selectedBoardCategoryId", required=false) int selectedBoardCategoryId) throws Exception{

        BoardCategoryDto boardCategoryInfo      = null;
        BoardCategoryDto prevBoardCategoryInfo  = null;
        BoardCategoryDto nextBoardCategoryInfo  = null;

        if(selectedBoardCategoryId > 0){
            boardCategoryDto.setBoardCategoryId(selectedBoardCategoryId);
            // 글 조회
            boardCategoryInfo     = this.boardCategoryService.getBoardCategoryInfo(boardCategoryDto);
            // 이전 글 조회
            prevBoardCategoryInfo = this.boardCategoryService.getPrevBoardCategoryInfo(boardCategoryDto);
            // 다음 글 조회
            nextBoardCategoryInfo = this.boardCategoryService.getNextBoardCategoryInfo(boardCategoryDto);
        }
        model.addAttribute("boardCategoryInfo"    , boardCategoryInfo);
        model.addAttribute("prevBoardCategoryInfo", prevBoardCategoryInfo);
        model.addAttribute("nextBoardCategoryInfo", nextBoardCategoryInfo);

        model.addAttribute("boardCategoryId"      , boardCategoryDto.getBoardCategoryId());

        return "properties/config/board/viewCategory";
    }

    @RequestMapping(value = "/board/modifyCategory")
    public String modifyBoardCategory(HttpServletRequest request, Model model, BoardCategoryDto boardCategoryDto, HttpSession session, @RequestParam(value="selectedBoardCategoryId", required=false) int selectedBoardCategoryId) throws Exception{

        UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
        BoardCategoryDto boardCategoryInfo = new BoardCategoryDto();
        if(null != sessionInfo){
            boardCategoryDto.setCreateUserId(sessionInfo.getUserId());
            if(selectedBoardCategoryId > 0){
                boardCategoryDto.setBoardCategoryId(selectedBoardCategoryId);
            }
            boardCategoryInfo = boardCategoryService.getBoardCategoryInfo(boardCategoryDto);

        }else{
            return "redirect:/login?redirectPage=" + request.getRequestURI();
        }
        model.addAttribute("boardCategoryInfo"   , boardCategoryInfo);
        return "properties/config/board/writeCategory";
    }

    @SuppressWarnings("serial")
    @RequestMapping(value = "/board/modifyBoardCategoryAction.json", method = {RequestMethod.POST})
    @ResponseBody
    public JSONObject modifyBoardCategoryAction(
            Locale locale
            , Model model
            , HttpServletRequest request
            , HttpServletResponse response
            , HttpSession session
            , BoardCategoryDto boardCategoryDto
            , BindingResult bindingResult) throws Exception {

        JSONObject jsonObj        = new JSONObject();
        int        modifyResult   = 0;
        UserDto    sessionInfo    = (UserDto)session.getAttribute("userInfo");

        if(null != sessionInfo){
            if(bindingResult.hasErrors()){
                jsonObj.put("validate", false);
            }
        }
        modifyResult = this.boardCategoryService.updateBoardCategory(boardCategoryDto);
        jsonObj.put("result", (modifyResult > 0) ? true : false);
        return jsonObj;
    }

    @RequestMapping(value="/priv/modifyShareProfile")
    public String getShareProfileInfo(Model model, HttpSession session) throws Exception{
        this.shareService.setShareInfo(model, session);
        return "properties/config/share/write";
    }

    @RequestMapping(value="/priv/modifyShareProfileAction")
    public JSONObject modifyShareProfileInfo(HttpServletRequest request, Model model, HttpSession session, ShareDto shareDto) throws Exception{
        JSONObject resultObj       = new JSONObject();
        UserDto    sessionInfo     = (UserDto)session.getAttribute("userInfo");

        if(sessionInfo != null){
            if(shareDto != null){
                int updateResult = this.shareService.updateShareInfo(shareDto);
                if(updateResult > 0){
                    resultObj.put("code"    , "ok");
                    resultObj.put("message" , "success");
                }else{
                    resultObj.put("code"    , "error");
                    resultObj.put("message" , "not updated");
                }
            }else{
                resultObj.put("code"    , "error");
                resultObj.put("message" , "invalid object(null)");
            }
        }else{
            resultObj.put("code"    , "error");
            resultObj.put("message" , "invalid session");
        }

        return resultObj;
    }

    @RequestMapping(value="/priv/info")
    public String getPrivateInfo(HttpServletRequest request, Model model, HttpSession session){
        this.commonService.getPrivateInfo(request, model, session);
        return "user/ajaxPrivateInfo";
    }

    @RequestMapping(value="/priv/modifyUserInfo")
    public String modifyRegistInfo(HttpServletRequest request, Model model, HttpSession session) throws Exception{
        UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
        if(sessionInfo == null){
            return "redirect:/board/article/arcodionList";
        }
        model.addAttribute("userInfo", sessionInfo);
        return "properties/config/priv/write";
    }

}
