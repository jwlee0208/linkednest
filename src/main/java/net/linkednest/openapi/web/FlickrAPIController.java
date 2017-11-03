package net.linkednest.openapi.web;

import javax.annotation.Resource;

import net.linkednest.openapi.dto.SearchCommonAPIDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import net.linkednest.openapi.service.impl.FlickrAPIServiceImpl;
import com.flickr4java.flickr.photos.Photo;
import com.flickr4java.flickr.photos.PhotoList;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/api/flickr")
public class FlickrAPIController {

    @Autowired
    private FlickrAPIServiceImpl flickrAPIService;

    /**
     * flickr photo list
     *
     * @param searchCommonAPIDto
     * @param model
     * @return
     */
    @RequestMapping(value = "/photoList")
    public String getFlickrImageList(SearchCommonAPIDto searchCommonAPIDto, Model model){
        
        String              keyword     = searchCommonAPIDto.getKeyword();
        PhotoList<Photo>    photoList   = null;
        
        if(!StringUtils.isEmpty(keyword)){
            photoList = this.flickrAPIService.getPhotoList(keyword);
        }
        
        model.addAttribute("photoList", photoList);
        return "api/flickr/ajaxPhotoList";
    }

    /**
     * check for authentication
     *
     * @param model
     * @param authType
     * @return
     */
    @RequestMapping(value = "/checkAuth/{authType}")
    public JSONObject checkAuth(Model model, @PathVariable String authType){
        return this.flickrAPIService.checkAuth();
    }
}
