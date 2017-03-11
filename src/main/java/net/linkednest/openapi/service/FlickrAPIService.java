package net.linkednest.openapi.service;

import java.util.List;

import org.scribe.model.Token;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.flickr4java.flickr.galleries.Gallery;
import com.flickr4java.flickr.photos.Photo;
import com.flickr4java.flickr.photos.PhotoList;
import com.flickr4java.flickr.photos.SearchParameters;

import net.sf.json.JSONObject;

public interface FlickrAPIService {

    public PhotoList<Photo> getPhotoList(String searchText);

    public PhotoList<Photo> getPhotoListByUserId(String userId);

    public List<Gallery>    getGalleryListByUserId(String userId);
    
    public PhotoList<Photo> getPhotoList(SearchParameters params);
    
    public JSONObject       uploadPhoto(MultipartFile attachFile, String title, String contents, String tokenKey, Token token);
    
    public JSONObject       uploadPhotoList(MultipartHttpServletRequest request, String title, String contents, String tokenKey, Token token);

    public JSONObject       checkAuth();

}
