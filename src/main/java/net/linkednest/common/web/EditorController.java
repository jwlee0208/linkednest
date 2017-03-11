package net.linkednest.common.web;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.linkednest.board.service.BoardArticleService;
import net.linkednest.common.util.FileUtil;
import net.linkednest.openapi.service.FlickrAPIService;
import org.scribe.model.Token;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.linkednest.board.service.BoardArticleService;
import net.linkednest.common.util.FileUpload;
import net.linkednest.common.util.FileUtil;
import net.linkednest.openapi.service.FlickrAPIService;
import com.flickr4java.flickr.photos.Photo;
import com.flickr4java.flickr.photos.PhotoList;
import com.flickr4java.flickr.photos.SearchParameters;

import net.sf.json.JSONObject;

@Controller("EditorController")
public class EditorController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(EditorController.class);
	public static final long MAX_UPLOAD_FILE_SIZE = 20480000;
	public static final String FILE_EXTENSIONS_IMAGES = "jpg, jpeg, png, gif, bmp";
	

    @Autowired 
    private ServletContext servletContext;
    
	@Autowired
	private BoardArticleService boardService;
	
	@Autowired
	private FlickrAPIService flickrService;
	
	@Resource(name="fileUpload")
	private FileUpload fileUpload;
	
	
	@RequestMapping(value = {"/{path}/popImageUpload/{cmd}", "/{path1}/{path2}/popImageUpload/{cmd}", "/{path1}/{path2}/{path3}/popImageUpload/{cmd}", "/{path1}/{path2}/{path3}/{path4}/popImageUpload/{cmd}"}, method = {RequestMethod.POST, RequestMethod.GET})
	public String imageUploadForm(HttpServletRequest request, Model model, HttpSession session, @PathVariable String cmd) throws Exception {
		return "/common/popImageUpload"; 
	}
	
	@RequestMapping(value = {"/{path}/imageuploadaction", "/{path1}/{path2}/imageuploadaction", "/{path1}/{path2}/{path3}/imageuploadaction", "/{path1}/{path2}/{path3}/{path4}/imageuploadaction", "/{path1}/{path2}/{path3}/{path4}/{path5}/imageuploadaction"}, method={RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public String imageadd(MultipartFile imageFile) throws Exception {
		
		System.out.println("imageadd");
		System.out.println("" + imageFile.getOriginalFilename());
		System.out.println("" + imageFile.getName());
		System.out.println("" + imageFile.getSize());
		System.out.println("" + imageFile.getBytes());
    	StringBuffer sb = this.fileUploadByEditor(imageFile);
    	System.out.println("image upload result : " + sb.toString());
		return sb.toString();
    }
	
	private StringBuffer fileUploadByEditor(MultipartFile imageFile) throws Exception {
		StringBuffer sb = new StringBuffer();
		try {
    		//이미지 파일 용량 체크
            long fileSize = imageFile.getSize();
            if (fileSize > MAX_UPLOAD_FILE_SIZE || fileSize <= 0) {
            	logger.info("20MB 이상의 파일은 업로드 할 수 없습니다.");
            	sb.append("fileSizeError");
            	return sb;
            } 
            
			if (imageFile != null) {
				//file size check
				if (!fileUpload.checkFileSize(MAX_UPLOAD_FILE_SIZE, imageFile)) {
					sb.append("fileSizeError");
					return sb;
				} else if (!fileUpload.checkFileExtension(FILE_EXTENSIONS_IMAGES, imageFile)) {
					sb.append("fileExtensionError");
					return sb;
				} 
				System.out.println("imageFile : " + imageFile);
				String fileRealPath = fileUpload.uploadFile(imageFile);
				
				System.out.println("fileRealPath : " + fileRealPath);
				
				//boardStory.setThumbnail1(fileRealPath);
				//sb.append(imageFile.getOriginalFilename());
				sb.append(fileRealPath);
			} 
		} catch(Exception e) {
			logger.info("[FileNoException" + e.toString());
		}
		return sb;
	}
	
	
	@RequestMapping(value = {"/{path}/imagedeleteaction", "/{path1}/{path2}/imagedeleteaction", "/{path1}/{path2}/{path3}/imagedeleteaction"}, method=RequestMethod.POST)
	@ResponseBody
    public String imagedelete(String fileName, Model model) throws Exception {
    	String realPath = servletContext.getRealPath("/resources" + fileName);
    	System.out.println("realPath : " + realPath);
    	logger.info("[realPath]" + realPath);
    	String message = "error";
    	
    	//String fileList = FileUtil.getFileList(realPath);
    	//String[] fileListStrArr = fileList.split(",");
    	
    	//for (int index=0; index < fileListStrArr.length; index++) {
    		//if (fileName.equals(fileListStrArr[index])) {
    			try {
    				//FileUtil.deleteFile(realPath + "/" + fileName);
    				FileUtil.deleteFile(realPath);
    				message = "success";
    			} catch(Exception e) {
    				logger.info("[FileCopy deleteFile Missing]", e);
    			}
    		//}
    	//}
    	//System.out.println(fileListStrArr);
    	//model.addAttribute("fileList", fileListStrArr);
    	return message;
    }
	
//	@RequestMapping(value = {"/{path}/{boardId}/popImageSelector", "/{path1}/{path2}/{boardId}/popImageSelector", "/{path1}/{path2}/{path3}/{boardId}/popImageSelector", "/{path1}/{path2}/{path3}/{path4}/{boardId}/popImageSelector"}, method = {RequestMethod.GET, RequestMethod.POST})
//    public String imageSelectorForm(HttpServletRequest request, Model model, HttpSession session, @RequestParam(value="userId", required=false) String userId, @RequestParam(value="searchKeyword", required=false) String searchKeyword, @PathVariable int boardId) throws Exception {
//	    return this.imageSelectorForm(request, model, session, userId, searchKeyword);
//	}
//
//    @RequestMapping(value = {"/{path}/{articleId}/{boardId}/popImageSelector", "/{path1}/{path2}/{articleId}/{boardId}/popImageSelector", "/{path1}/{path2}/{path3}/{articleId}/{boardId}/popImageSelector", "/{path1}/{path2}/{path3}/{path4}/{articleId}/{boardId}/popImageSelector"}, method = {RequestMethod.GET, RequestMethod.POST})
//    public String imageSelectorForm(HttpServletRequest request, Model model, HttpSession session, @RequestParam(value="userId", required=false) String userId, @RequestParam(value="searchKeyword", required=false) String searchKeyword, @PathVariable int articleId, @PathVariable int boardId) throws Exception {
//        return this.imageSelectorForm(request, model, session, userId, searchKeyword);
//    }
	
	@RequestMapping(value = {"/{path}/popImageSelector/{cmd}", "/{path1}/{path2}/popImageSelector/{cmd}", "/{path1}/{path2}/{path3}/popImageSelector/{cmd}", "/{path1}/{path2}/{path3}/{path4}/popImageSelector/{cmd}"}, method = {RequestMethod.GET, RequestMethod.POST})
    public String imageSelectorForm(HttpServletRequest request, Model model, HttpSession session, @RequestParam(value="userId", required=false) String userId, @RequestParam(value="searchKeyword", required=false) String searchKeyword) throws Exception {
    	SearchParameters params = new SearchParameters();
    	if(searchKeyword != null && searchKeyword != ""){
    		params.setText(searchKeyword);
    	}else{
    		searchKeyword = "";
    	}
    	if(userId != null && userId != ""){
    		params.setUserId(userId);
    	}else{
    		userId = "";
    	}
    	PhotoList<Photo> photoList = null;
    	
    	if((searchKeyword != null && searchKeyword != "") || (userId != null && userId != "")){
    		photoList = this.flickrService.getPhotoList(params);	
    	}
    	model.addAttribute("searchKeyword"	, searchKeyword);
    	model.addAttribute("userId"			, userId);
        model.addAttribute("photoList"		, photoList);
        System.out.println("request.getRequestURI() : " + request.getRequestURI());
        System.out.println("request.getRequestURL() : " + request.getRequestURL());
        return "/common/popFlickrImageSelector"; 
    }
	/**
	 * 단일 업로드 : Single Image File Upload
	 * @param imageFile
	 * @param tokenKey
	 * @param token
	 * @param secret
	 * @return
	 * @throws Exception
	 */
	/*
	@RequestMapping(value = {"/{path}/imageUploadActionToFlickr/{tokenKey}/{token}/{secret}", "/{path1}/{path2}/imageUploadActionToFlickr/{tokenKey}/{token}/{secret}", "/{path1}/{path2}/{path3}/imageUploadActionToFlickr/{tokenKey}/{token}/{secret}", "/{path1}/{path2}/{path3}/{path4}/imageUploadActionToFlickr/{tokenKey}/{token}/{secret}"}, method={RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public JSONObject imageaddToFlickr(MultipartFile imageFile, @PathVariable String tokenKey, @PathVariable String token, @PathVariable String secret) throws Exception {
        
        System.out.println("imageadd");
        System.out.println("" + imageFile.getOriginalFilename());
        System.out.println("" + imageFile.getName());
        System.out.println("" + imageFile.getSize());
        System.out.println("" + imageFile.getBytes());        
        
        String title = "test";
        
        return this.flickrService.uploadPhoto(imageFile, title, title, tokenKey, new Token(token, secret));
    }
	*/
	
	/**
	 * 멀티 업로드 : Multi Image Files Upload
	 * @param request
	 * @param tokenKey
	 * @param token
	 * @param secret
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = {"/{path}/imageUploadActionToFlickr/{tokenKey}/{token}/{secret}", "/{path1}/{path2}/imageUploadActionToFlickr/{tokenKey}/{token}/{secret}", "/{path1}/{path2}/{path3}/imageUploadActionToFlickr/{tokenKey}/{token}/{secret}", "/{path1}/{path2}/{path3}/{path4}/imageUploadActionToFlickr/{tokenKey}/{token}/{secret}"}, method={RequestMethod.POST, RequestMethod.GET})
    public JSONObject imageaddToFlickr(MultipartHttpServletRequest request, @PathVariable String tokenKey, @PathVariable String token, @PathVariable String secret) throws Exception {
        String title = "test";        
        return this.flickrService.uploadPhotoList(request, title, title, tokenKey, new Token(token, secret));
    }

}
