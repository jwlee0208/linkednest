package net.linkednest.www.board.web;

import net.linkednest.common.util.FileUpload;
import net.linkednest.common.util.PagedList;
import net.linkednest.www.board.dto.BoardArticleDto;
import net.linkednest.www.board.dto.BoardCategoryDto;
import net.linkednest.www.board.dto.BoardDto;
import net.linkednest.www.board.dto.SlideshareLinkDto;
import net.linkednest.www.board.service.BoardArticleServiceImpl;
import net.linkednest.www.board.service.BoardCategoryServiceImpl;
import net.linkednest.www.board.service.BoardServiceImpl;
import net.linkednest.www.common.dto.ShareDto;
import net.linkednest.www.common.web.EditorController;
import net.linkednest.www.share.service.ShareServiceImpl;
import net.linkednest.www.user.dto.UserDto;
import net.linkednest.www.user.service.UserServiceImpl;
import net.sf.json.JSONObject;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jboss.logging.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = {"/board/article", "/share"})
public class BoardArticleController {

    Log log = LogFactory.getLog(this.getClass());
    
	public static final int 	DEFAULT_PAGE_NO 				= 1;
	public static final int 	DEFAULT_PAGE_SIZE 				= 3;

	// Related to image upload
	public static final long 	MAX_UPLOAD_FILE_SIZE 			= 20480000;
	public static final String 	FILE_EXTENSIONS_IMAGES 			= "jpg, jpeg, png, gif, bmp";
	public static final int 	DB_RESULT_SUCCESS 				= 1;
	
	public static final int 	DEFAULT_THUMBNAIL_IMAGE_WIDTH 	= 314;
	public static final int 	DEFAULT_THUMBNAIL_IMAGE_HEIGHT 	= 166;
	
	private static final int 	THUMBNAIL_IMAGE_WIDTH_SMALL 	= 64;
	private static final int 	THUMBNAIL_IMAGE_HEIGHT_SMALL 	= 64;
	private static final int 	THUMBNAIL_IMAGE_WIDTH_MIDDLE 	= 256;
	private static final int 	THUMBNAIL_IMAGE_HEIGHT_MIDDLE 	= 256;
	private static final int 	THUMBNAIL_IMAGE_WIDTH_LARGE 	= 400;
	private static final int 	THUMBNAIL_IMAGE_HEIGHT_LARGE 	= 400;

	@Resource(name = "BoardServiceImpl")
	private BoardServiceImpl boardService;

	@Resource(name = "BoardArticleServiceImpl")
	private BoardArticleServiceImpl boardArticleService;
	
	@Resource(name = "BoardCategoryServiceImpl")
	private BoardCategoryServiceImpl boardCategoryService;

	@Resource(name = "fileUpload")
	private FileUpload fileUpload;
	
	@Resource(name = "EditorController")
	private EditorController editorController;
	
    @Resource(name = "ShareServiceImpl")
    private ShareServiceImpl shareService;

    @Resource(name = "UserServiceImpl")
    private UserServiceImpl userService;
    
	/*	
	// spring-data-redis 사용.
	@Autowired
	private RedisTemplate<String, List<BoardArticleDto>> redisTemplate;
	// spring-data-redis 사용.
	@Resource(name="redisTemplate")
	private ValueOperations<String, List<BoardArticleDto>> valueOps;
	 */

    @RequestMapping(value={"/", ""})
    public String getShareRoot(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto) throws Exception{
        return this.getBoardArticleList(request, model, boardArticleDto);
    }
    
	/**
	 * 게시글 목록 조회
	 * @param request
	 * @param model
	 * @param boardArticleDto
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = {"/list", "/main"}, method = {RequestMethod.POST, RequestMethod.GET})
	public String getBoardArticleList(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto) throws Exception{
	    return this.getCommonBoardArticleList(request, model, boardArticleDto);
	}
	
	/**
	 * @brief 게시글 목록 조회
	 * @param request
	 * @param model
	 * @param boardArticleDto
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = {"/main/{userId}", "/{userId}"}, method = {RequestMethod.POST, RequestMethod.GET})
	public String getBoardArticleList(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto, @PathVariable String userId) throws Exception{
	    boardArticleDto.setCreateUserId(userId);
        return this.getCommonBoardArticleList(request, model, boardArticleDto);
    }
	
	/**
	 * 게시글 목록 조회
	 * @param request
	 * @param model
	 * @param boardArticleDto
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = {"/list/{boardId}"}, method = {RequestMethod.POST, RequestMethod.GET})
	public String getBoardArticleList(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto, @PathVariable int boardId) throws Exception {
		return this.getCommonBoardArticleList(request, model, boardArticleDto);
	}

    @RequestMapping(value = {"/{userId}/list"}, method = {RequestMethod.POST, RequestMethod.GET})
    public String getBoardArticleMainList(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto, @PathVariable String userId) throws Exception {
        boardArticleDto.setCreateUserId(userId);
        return this.getCommonBoardArticleList(request, model, boardArticleDto);
    }

	/**
	 * 게시글 목록 조회
	 * @param request
	 * @param model
	 * @param boardArticleDto
	 * @param boardId
	 * @param userId
	 * @return
	 * @throws Exception
	 */
    @RequestMapping(value = {"/{userId}/list/{boardId}"}, method = {RequestMethod.POST, RequestMethod.GET})
    public String getBoardArticleList(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto, @PathVariable int boardId, @PathVariable String userId) throws Exception {
        boardArticleDto.setCreateUserId(userId);
        return this.getCommonBoardArticleList(request, model, boardArticleDto);
    }

    /**
     * 게시글 목록 조회(공통 메서드)
     * @param request
     * @param model
     * @param boardArticleDto
     * @return
     * @throws Exception
     */
	private String getCommonBoardArticleList(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto) throws Exception{
	    
        model = this.getBoardCommonListForJson(request, model, boardArticleDto);
        
        int     boardId     = boardArticleDto.getBoardId();
        String  boardType   = null;
        if(boardId > 0){
            BoardDto boardDto   = new BoardDto();
            boardDto.setBoardId(boardArticleDto.getBoardId());
            BoardDto boardInfo  = boardService.getBoardCategoryAndBoardInfo(boardDto);
            model.addAttribute("boardInfo", boardInfo);            
            
            boardType = boardInfo.getBoardType();
        }
        
        String page = "board/article/list";
        
        if(boardId > 0){
            if(boardType.equals("1")){
                page = "board/article/imageList";
            }else if(boardType.equals("2")){
                page = "board/article/thumbList";
            }            
        }else{
            page = "board/article/arcodionList";
        }
        
        if(!StringUtils.isEmpty(boardArticleDto.getCreateUserId())){
            UserDto userParam = new UserDto();
            userParam.setUserId(boardArticleDto.getCreateUserId());
            UserDto userDto = this.userService.selectUserInfo(userParam);
            if(userDto == null){
                model.addAttribute("isWritable", false);
                page = "board/article/arcodionList";
            }else{
                model.addAttribute("isWritable", true);
            }
        }
        
        return page;

	}
	
	
	private Model getBoardCommonListForJson(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto) throws Exception{
		// 검색 조건
		String searchCondition = request.getParameter("searchCondition");
		String searchText      = request.getParameter("searchText");
		String startDate       = request.getParameter("startDate");
		String endDate         = request.getParameter("endDate");
		String type			   = StringUtils.defaultIfEmpty(request.getParameter("type"), "blog");
		
		int    boardId         = boardArticleDto.getBoardId();
		// 페이징 관련 params
		int    pageNo          = (request.getParameter("pageNo") != null) ? Integer.parseInt(request.getParameter("pageNo")) : DEFAULT_PAGE_NO;
		int    listRowCnt      = (request.getParameter("listRowCnt") != null) ? Integer.parseInt(request.getParameter("listRowCnt")) : 10;
		int    pageSize        = (request.getParameter("pageSize") != null) ? Integer.parseInt(request.getParameter("pageSize")) : DEFAULT_PAGE_SIZE;
		int    totalListCnt    = 0;
		
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// searching condition setting
		paramMap.put("boardId"        , boardId);
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchText"     , searchText);
		paramMap.put("startDate"      , startDate);
		paramMap.put("endDate"        , endDate);
		paramMap.put("type"        	  , type);
		
		List<BoardArticleDto> boardArticleList;	
		
/*
		try{
			
			boardArticleList = valueOps.get("selectBoardArticle"+boardId+"ListAll");
			totalListCnt = boardArticleList.size();
			
			System.out.println(">>> redis pagedList print");
			
		}catch(Exception e){
			BoardArticleDto boardArticleObj = new BoardArticleDto();
			if(boardId > 0){
			    boardArticleObj.setBoardId(boardId);    
			}
*/			
			boardArticleList = boardArticleService.getBoardArticleList(boardArticleDto);
			totalListCnt = boardArticleList.size();	
/*			
			valueOps.set("selectBoardArticle"+boardId+"ListAll", boardArticleList);
			System.out.println(">>> redis pagedList setted");
*/			
			model = this.getBoardCommonList(request, model, boardArticleDto);
/*			
			return model;
			
		}finally{
			
		}
*/		
/*			
		int startRow = (pageNo - 1) * listRowCnt;
		int endRow 	 = pageNo * listRowCnt;
		
		List<BoardArticleDto> pagedArticleList = new ArrayList<BoardArticleDto>();
		
		if(null != boardArticleList){
			BoardArticleDto boardArticleObjt;
			for(int i = 0; i < boardArticleList.size() ; i++){
				
				if((startRow - 1) <= i && i <= (endRow - 1)){					
					boardArticleObjt = boardArticleList.get(i);
					pagedArticleList.add(boardArticleObjt);
				}
			}
		}
		
		PagedList pagedList = new PagedList(pagedArticleList, pageNo, pageSize, totalListCnt, startRow, endRow, listRowCnt);
		
		model.addAttribute("pagedResult", pagedList);
*/		
		model.addAttribute("boardId", boardId);
		
		return model;
	}
	
	
	
	/**
	 * 페이징을 위한 리스트 조회
	 * @param request
	 * @param model
	 * @param boardArticleDto
	 * @return
	 * @throws Exception
	 */
	private Model getBoardCommonList(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto) throws Exception{
		// 검색 조건
		String searchCondition = request.getParameter("searchCondition");
		String searchText      = request.getParameter("searchText");
		String startDate       = request.getParameter("startDate");
		String endDate         = request.getParameter("endDate");
		String createUserId    = (!StringUtils.isEmpty(boardArticleDto.getCreateUserId())) ? boardArticleDto.getCreateUserId() : "";
		String type			   = StringUtils.defaultIfEmpty(request.getParameter("type"), "blog");
		
		int    boardId         = boardArticleDto.getBoardId();
		// 페이징 관련 params
		int    pageNo          = (request.getParameter("pageNo") != null) ? Integer.parseInt(request.getParameter("pageNo")) : DEFAULT_PAGE_NO;
		int    listRowCnt      = (request.getParameter("listRowCnt") != null) ? Integer.parseInt(request.getParameter("listRowCnt")) : 10;

		Map<String, Object> paramMap = new HashMap<String, Object>();
		// searching condition setting
		paramMap.put("boardId"        , boardId);
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchText"     , searchText);
		paramMap.put("startDate"      , startDate);
		paramMap.put("endDate"        , endDate);
		paramMap.put("createUserId"   , createUserId);

		int totalListCnt = boardArticleService.selectArticleListCnt(paramMap);
		
		// paging condition setting
		paramMap.put("pageNo"         , pageNo);
		paramMap.put("listRowCnt"     , listRowCnt);
		paramMap.put("totalListCnt"   , totalListCnt);
		paramMap.put("pageSize"       , DEFAULT_PAGE_SIZE);

		PagedList result = boardArticleService.getBoardArticlePagedList(paramMap);

		model.addAttribute("pagedResult"  , result);
		model.addAttribute("boardId"      , boardId);
		return model;
	}
	
	/**
	 * 게시글 상세 조회
	 * @param request
	 * @param model
	 * @param boardArticleDto
	 * @param selectedArticleId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/view/{selectedArticleId}")
	public String getBoardContent(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto, @PathVariable int selectedArticleId, HttpSession session) throws Exception{
	    return this.getBoardContent(request, model, boardArticleDto, selectedArticleId, null, session);
	}

	
    @RequestMapping(value = "/{userId}/view/{selectedArticleId}")
    public String getBoardContent(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto, @PathVariable int selectedArticleId, @PathVariable String userId, HttpSession session){
        
        BoardArticleDto     contentInfo     = null;
        BoardArticleDto     prevContentInfo = null;
        BoardArticleDto     nextContentInfo = null;
        BoardDto            boardDto        = new BoardDto();
        List<BoardDto>      boardList       = null;
        
        if(selectedArticleId > 0){
            
            boardArticleDto.setArticleId(selectedArticleId);
//            boardArticleDto.setCreateUserId(userId);
            // 글 조회
            try {
                contentInfo     = this.boardArticleService.selectBoardArticle(boardArticleDto);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            
            if(contentInfo != null){
                boardArticleDto.setBoardId(contentInfo.getBoardId());
            }
            // 이전 글 조회
            try {
                prevContentInfo = this.boardArticleService.selectPrevBoardArticle(boardArticleDto);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                log.error(e.getMessage());
                
            }
            // 다음 글 조회
            try {
                nextContentInfo = this.boardArticleService.selectNextBoardArticle(boardArticleDto);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                log.error(e.getMessage());
            }
            
            try {
                boardList       = this.boardService.getBoardList(boardDto);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                log.error(e.getMessage());
            }
        }
                
        UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
            
        model.addAttribute("contentInfo"    , contentInfo);
        model.addAttribute("prevContentInfo", prevContentInfo);
        model.addAttribute("nextContentInfo", nextContentInfo);
        
        model.addAttribute("boardId"        , contentInfo.getBoardId());
        model.addAttribute("boardList"      , boardList);
        model.addAttribute("userInfo"       , sessionInfo);
        ShareDto shareInfo = null;
        ShareDto shareDto = new ShareDto();
        shareDto.setUserId(userId);
        try {
            shareInfo = this.shareService.getShareInfo(shareDto);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        model.addAttribute("shareInfo", shareInfo);
        
        
        return "board/article/view";
    }

	/**
	 * 게시글 입력 화면 출력
	 * @param model
	 * @param boardArticleDto
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/write")
	public String writeBoard(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto, HttpSession session) throws Exception{
	    return this.writeBoard(request, model, boardArticleDto, session, null, null);
	}

	/**
	 * 게시글 입력 화면 출력
	 * @param request
	 * @param model
	 * @param boardArticleDto
	 * @param session
	 * @param userId
	 * @return
	 * @throws Exception
	 */
    @RequestMapping(value = "/{userId}/write")
    public String writeBoardAsUserId(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto, HttpSession session, @PathVariable String userId) throws Exception{
        return this.writeBoard(request, model, boardArticleDto, session, userId, null);
    }

    /**
     * @brief 게시글 입력 화면 출력
     * @param request
     * @param model
     * @param boardArticleDto
     * @param session
     * @param boardId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/write/{boardId}")
    public String writeBoardAsBoardId(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto, HttpSession session, @PathVariable String boardId) throws Exception{
        return this.writeBoard(request, model, boardArticleDto, session, null, boardId);
    }
    
	/**
	 * 게시글 입력 화면 출력
	 * @param request
	 * @param model
	 * @param boardArticleDto
	 * @param session
	 * @param userId
	 * @param boardId
	 * @return
	 * @throws Exception
	 */
    @RequestMapping(value = "/{userId}/write/{boardId}")
    public String writeBoard(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto, HttpSession session, @PathVariable String userId, @PathVariable String boardId) throws Exception{
        
        UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
        BoardDto boardDto = new BoardDto();
        if(null != sessionInfo){
            if(!StringUtils.isEmpty(boardId)){
                model.addAttribute("boardId", boardId);
            }else{
                model.addAttribute("boardId", boardArticleDto.getBoardId());
            }
            boardDto.setCreateUserId(userId);
        }else{
            return "redirect:/login?redirectPage=" + request.getRequestURI();
        }
        
        List<BoardDto> boardList = this.boardService.getBoardList(boardDto);
        model.addAttribute("boardList"  , boardList);
        model.addAttribute("userId"     , userId);
        return "board/article/write";
    }
	
	/**
	 * 게시글 입력(json타입 : 업로드 파일 없을 때)
	 * @param boardArticleDto
	 * @param bindingResult
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("serial")
	@RequestMapping(value = "/insertBoardArticle.json", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject insertBoardArticleJSON(@Valid BoardArticleDto boardArticleDto, BindingResult bindingResult, HttpSession session) throws Exception {
	
		JSONObject jsonObj = new JSONObject();
		int insertedArticleId = 0;

		UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
		
		if(null != sessionInfo){

		    int       boardId = boardArticleDto.getBoardId();
		    String    boardName = boardArticleDto.getBoardName();
		    
		    if(boardId < 0 && !StringUtils.isEmpty(boardName)){
		        // board_category 생성
		        BoardCategoryDto boardCategoryDto = new BoardCategoryDto();
		        boardCategoryDto.setBoardCategoryName("default");
		        boardCategoryDto.setCreateUserId(sessionInfo.getUserId());
		        
		        int createdCategoryId = this.boardCategoryService.insertBoardCategory(boardCategoryDto);
		        
		        // board 생성
		        BoardDto boardDto = new BoardDto();
		        boardDto.setBoardCategoryId(createdCategoryId);
		        boardDto.setBoardCategoryName(boardCategoryDto.getBoardCategoryName());
		        boardDto.setBoardName(boardName);
		        boardDto.setCreateUserId(sessionInfo.getUserId());
		        boardDto.setCreateUserName(sessionInfo.getUserNm());
		        boardDto.setBoardType("0");
		        
		        int createdBoardId = this.boardService.insertBoardInfo(boardDto);
		        
		        // 생성된 board 정보 설정
		        boardArticleDto.setBoardCategoryId(createdCategoryId);
		        boardArticleDto.setBoardId(createdBoardId);
		        
		    }
		    
			boardArticleDto.setAuthorId(sessionInfo.getUserId());
			boardArticleDto.setAuthorNm(sessionInfo.getUserNm());
			boardArticleDto.setStatus(1);
	
			insertedArticleId = this.boardArticleService.insertBoardArticle(boardArticleDto);
			if(insertedArticleId > 0){
			    List<SlideshareLinkDto> slideshareLinkDtos = boardArticleDto.getSlideshareLinkInfos();
			    if(CollectionUtils.isNotEmpty(slideshareLinkDtos)){
			        for(SlideshareLinkDto slideshareLinkObj : slideshareLinkDtos){
			            if(!StringUtils.isEmpty(slideshareLinkObj.getSlideshareLinkUrl())){
	                        slideshareLinkObj.setCreateUserId(sessionInfo.getUserId());
	                        slideshareLinkObj.setArticleId(insertedArticleId);
	                        this.boardArticleService.insertSlideshareInfo(slideshareLinkObj);
			            }
			        }
			    }
			}
			if(bindingResult.hasErrors()){
				jsonObj.put("validate", false);
			}
			// 게시글 데이터 하나씩 추가될 때마다 redis 키값에 저장된 리스트 데이터 삭제 후 데이터 재설정하는 부분 
			this.updateArticleListForRedis(boardId);
		}
		
		jsonObj.put("result", (insertedArticleId > 0) ? true : false);
		return jsonObj;
	}

	/**
	 * 게시글 데이터 하나씩 추가될 때마다 redis 키값에 저장된 리스트 데이터 삭제 후 데이터 재설정하는 부분
	 *
	 * @param boardId
	 */
	private void updateArticleListForRedis(int boardId) {
		try{
			/*
			valueOps.set("selectBoardArticle"+ boardId +"ListAll", null);

			BoardArticleDto boardArticleObj = new BoardArticleDto();
			boardArticleObj.setBoardId(boardId);

			valueOps.set("selectBoardArticle"+ boardId +"ListAll", boardArticleService.getBoardArticleList(boardArticleObj));
			*/
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * 게시글 입력(업로드 파일 있을 때)
	 * @param boardArticleDto
	 * @param bindingResult
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertBoardArticle")
	@ResponseBody
	public String insertBoardArticle(@Valid BoardArticleDto boardArticleDto, BindingResult bindingResult, HttpSession session, Model model) throws Exception {
		
		int insertedArticleId = 0;
		MultipartFile imageFile = boardArticleDto.getThumbImg();

		String imageUploadResult = StringUtils.EMPTY;
		String thumbnailSize = boardArticleDto.getThumbnailSize();
		
		int boardId = boardArticleDto.getBoardId();

        UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
        
        if(null != sessionInfo){
			String filePath = StringUtils.EMPTY;

            // if boardId가 없고, boardName이 입력되어 넘어오는 경우
            // 1. default boardCategory 를 생성
            // 2. 새로운 board를 생성
            boardArticleDto.setAuthorId(sessionInfo.getUserId());
            boardArticleDto.setAuthorNm(sessionInfo.getUserNm());
            boardArticleDto.setStatus(1);
			// Upload Image File
			imageUploadResult = this.uploadImage(boardArticleDto);
			// Validate image upload result
			boolean isValidImageUploadResult = !imageUploadResult.equals("fileSizeError") && !imageUploadResult.equals("fileExtensionError");
			if(isValidImageUploadResult){
    			filePath = imageUploadResult;
    			
    			boardArticleDto.setFilePath(filePath);
    			boardArticleDto.setOriginalFileName(imageFile.getOriginalFilename());
    			boardArticleDto.setStatus(1);
    			
    			insertedArticleId = this.boardArticleService.insertBoardArticle(boardArticleDto);
    		}
    		
    		if(insertedArticleId > 0){
				List<SlideshareLinkDto> slideshareLinkDtos = boardArticleDto.getSlideshareLinkInfos();
				if(CollectionUtils.isNotEmpty(slideshareLinkDtos)){
					for(SlideshareLinkDto slideshareLinkObj : slideshareLinkDtos){
						if (!StringUtils.isEmpty(slideshareLinkObj.getSlideshareLinkUrl())) {
							slideshareLinkObj.setCreateUserId(sessionInfo.getUserId());
							slideshareLinkObj.setArticleId(insertedArticleId);
							this.boardArticleService.insertSlideshareInfo(slideshareLinkObj);
						}
					}
				}
				// 게시글 데이터 하나씩 추가될 때마다 redis 키값에 저장된 리스트 데이터 삭제 후 데이터 재설정하는 부분
				this.updateArticleListForRedis(boardId);
    		}
        }
//		model.addAttribute("result", imageUploadResult);
		return imageUploadResult;
	}

	/**
	 * Upload Image File
	 *
	 * @param boardArticleDto
	 * @return String
	 */
	private String uploadImage(BoardArticleDto boardArticleDto) {
		String imageUploadResult = StringUtils.EMPTY;
		String thumbnailSize = boardArticleDto.getThumbnailSize();
		MultipartFile imageFile = boardArticleDto.getThumbImg();

		if(boardArticleDto != null){
			if(thumbnailSize.equals("small")){
				imageUploadResult = fileUpload.uploadFile(imageFile, THUMBNAIL_IMAGE_WIDTH_SMALL, THUMBNAIL_IMAGE_HEIGHT_SMALL);
			}else if(thumbnailSize.equals("middle")){
				imageUploadResult = fileUpload.uploadFile(imageFile, THUMBNAIL_IMAGE_WIDTH_MIDDLE, THUMBNAIL_IMAGE_HEIGHT_MIDDLE);
			}else if(thumbnailSize.equals("large")){
				imageUploadResult = fileUpload.uploadFile(imageFile, THUMBNAIL_IMAGE_WIDTH_LARGE, THUMBNAIL_IMAGE_HEIGHT_LARGE);
			}
		} else {
			imageUploadResult = fileUpload.uploadFile(imageFile, THUMBNAIL_IMAGE_WIDTH_SMALL, THUMBNAIL_IMAGE_HEIGHT_SMALL);
		}
		return imageUploadResult;
	}

	/**
	 * 게시글 수정(json타입 : 업로드 파일 없을 때)
	 * @param boardArticleDto
	 * @param bindingResult
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("serial")
	@RequestMapping(value = "/modifyBoardArticle.json", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject modifyBoardArticleJSON(@Valid BoardArticleDto boardArticleDto, BindingResult bindingResult, HttpSession session) throws Exception {
		JSONObject jsonObj = new JSONObject();
		int updateResult = 0;

		UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
		
		if(null != sessionInfo){

			boardArticleDto.setAuthorId(sessionInfo.getUserId());
			boardArticleDto.setAuthorNm(sessionInfo.getUserNm());
	
			updateResult = this.boardArticleService.updateBoardArticle(boardArticleDto);
			
			if(updateResult > 0){
				boardArticleDto.getSlideshareLinkInfos().stream().filter(slideshareLinkObj -> !StringUtils.isEmpty(slideshareLinkObj.getSlideshareLinkUrl())).forEach(slideshareLinkObj -> {
					slideshareLinkObj.setCreateUserId(sessionInfo.getUserId());
					slideshareLinkObj.setArticleId(boardArticleDto.getArticleId());
					if(slideshareLinkObj.getSlideId() > 0){
						this.boardArticleService.updateSlideshareInfo(slideshareLinkObj);
					}else{
						this.boardArticleService.insertSlideshareInfo(slideshareLinkObj);
					}
				});
            }
			
			if(bindingResult.hasErrors()){
				jsonObj.put("validate", false);
			}						
		}
		
		jsonObj.put("result", (updateResult > 0) ? true : false);
		return jsonObj;
	}	
	
	/**
	 * 게시글 수정(업로드 파일 있을 때)
	 * @param boardArticleDto
	 * @param bindingResult
	 * @param session
	 * @param model
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/{userId}/modifyBoardArticle")
	@ResponseBody
	public String modifyBoardArticle(@Valid BoardArticleDto boardArticleDto, BindingResult bindingResult, HttpSession session, Model model, @PathVariable String userId) throws Exception {
	    return this.modifyBoardArticle(boardArticleDto, bindingResult, session, model);
	}
	
	/**
	 * 게시글 수정(업로드 파일 있을 때)
	 * @param boardArticleDto
	 * @param bindingResult
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modifyBoardArticle")
	@ResponseBody
	public String modifyBoardArticle(@Valid BoardArticleDto boardArticleDto, BindingResult bindingResult, HttpSession session, Model model) throws Exception {

        UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
        String imageUploadResult = "";
        if(null != sessionInfo){
			String filePath = StringUtils.EMPTY;

            boardArticleDto.setAuthorId(sessionInfo.getUserId());
            boardArticleDto.setAuthorNm(sessionInfo.getUserNm());
            boardArticleDto.setStatus(1);
	    
    		int updateResult = 0;
    		MultipartFile imageFile = boardArticleDto.getThumbImg();

			// Upload Image File
			imageUploadResult = this.uploadImage(boardArticleDto);
			// Validate upload result
			boolean isValidUploadResult = !imageUploadResult.equals("fileSizeError") && !imageUploadResult.equals("fileExtensionError");
			if(isValidUploadResult){
    			filePath = imageUploadResult;
    			
    			boardArticleDto.setFilePath(filePath);
    			boardArticleDto.setOriginalFileName(imageFile.getOriginalFilename());
    
    			updateResult = this.boardArticleService.updateBoardArticle(boardArticleDto);
    			
    			if(updateResult > 0){
					boardArticleDto.getSlideshareLinkInfos().stream().filter(slideshareLinkObj -> !StringUtils.isEmpty(slideshareLinkObj.getSlideshareLinkUrl())).forEach(slideshareLinkObj -> {
						slideshareLinkObj.setCreateUserId(sessionInfo.getUserId());
						slideshareLinkObj.setArticleId(boardArticleDto.getArticleId());
						if(slideshareLinkObj.getSlideId() > 0){
							this.boardArticleService.updateSlideshareInfo(slideshareLinkObj);
						}else{
							this.boardArticleService.insertSlideshareInfo(slideshareLinkObj);
						}
					});
    			}
    		}
        }
//		model.addAttribute("result", imageUploadResult);
		return imageUploadResult;
	}	

	/**
	 * 게시글 수정 화면 출력
	 * @param model
	 * @param boardArticleDto
	 * @param session
	 * @param selectedArticleId
	 * @param selectedBoardId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modify/{selectedArticleId}/{selectedBoardId}")
	public String modifyBoardArticlePage(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto, HttpSession session, @PathVariable int selectedArticleId, @PathVariable int selectedBoardId) throws Exception{
	    return this.modifyBoardArticlePage(request, model, boardArticleDto, session, selectedArticleId, selectedBoardId, null);
	}
	
	/**
	 * 게시글 수정 화면 출력
	 * @param request
	 * @param model
	 * @param boardArticleDto
	 * @param session
	 * @param selectedArticleId
	 * @param selectedBoardId
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/{userId}/modify/{selectedArticleId}/{selectedBoardId}")
	public String modifyBoardArticlePage2(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto, HttpSession session, @PathVariable int selectedArticleId, @PathVariable int selectedBoardId, @PathVariable String userId) throws Exception{
	    return this.modifyBoardArticlePage(request, model, boardArticleDto, session, selectedArticleId, selectedBoardId, userId);
	}
	
	/**
	 * 게시글 수정 화면 출력
	 * @param request
	 * @param model
	 * @param boardArticleDto
	 * @param session
	 * @param selectedArticleId
	 * @param selectedBoardId
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/{userId}/modify")
    public String modifyBoardArticlePage(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto, HttpSession session, @Param int selectedArticleId, @Param int selectedBoardId, @PathVariable String userId) throws Exception{
        
        UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
        BoardDto        boardDto        = new BoardDto();
        if(null != sessionInfo){
            model.addAttribute("boardId", selectedBoardId); 
            
            BoardArticleDto articleInfo = null;
            
            if(selectedArticleId > 0){
                boardArticleDto.setArticleId(selectedArticleId);
                // 글 조회
                articleInfo = this.boardArticleService.selectBoardArticle(boardArticleDto);
            }
            
            model.addAttribute("articleInfo"    , articleInfo);     
            model.addAttribute("boardList"      , this.boardService.getBoardList(boardDto));
            model.addAttribute("userId"         , userId);
            
        }else{
            return "redirect:/login?redirectPage=" + request.getRequestURI();
        }
        
        return "board/article/write";
    }	
	
	
	/**
	 * 게시글 삭제
	 * @param model
	 * @param session
	 * @param selectedArticleId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteBoardArticle/{selectedArticleId}", method = RequestMethod.POST)
	public JSONObject deleteBoardArticleJSON(Model model, HttpSession session, @PathVariable int selectedArticleId) throws Exception{
		BoardArticleDto   boardArticleDto = new BoardArticleDto();
		JSONObject        jsonObj         = new JSONObject();

		int               deleteResult    = 0;
		
		if(selectedArticleId > 0){
			boardArticleDto.setArticleId(selectedArticleId);
			// 글 삭제 - 논리적 삭제
			deleteResult = boardArticleService.deleteBoardArticle(boardArticleDto);
		}
			
		jsonObj.put("result"              , (deleteResult > 0) ? true : false);
		jsonObj.put("selectedArticleId"   , selectedArticleId);
		return jsonObj;
	}
	
	@RequestMapping(value="/{userId}/profile")
	public String goProfile(@PathVariable String userId, Model model) throws Exception{
	    ShareDto shareDto  = new ShareDto();
	    ShareDto shareInfo = null;
	        
	    if(!StringUtils.isEmpty(userId)){
	        shareDto.setUserId(userId);         
	        shareInfo = this.shareService.getShareInfo(shareDto);
	    }
	        
	    model.addAttribute("shareInfo", shareInfo);
	    return "board/article/profile";
	}

    @RequestMapping(value="/info")
    public String getShareInfo(Model model, HttpSession session){
        this.shareService.setShareInfo(model, session);
        return "common/ajaxShareInfo";
    }    


    @RequestMapping(value="/test")
	public String testReact() {
    	return "board/article/testReact";
	}
}
