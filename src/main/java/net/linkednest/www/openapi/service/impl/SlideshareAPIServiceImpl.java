package net.linkednest.www.openapi.service.impl;

import java.util.List;

import net.linkednest.www.openapi.service.SlideshareAPIService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.social.slideshare.api.SlideShare;
import org.springframework.social.slideshare.api.SlideshowOperations;
import org.springframework.social.slideshare.api.domain.SearchOptions.FileFormat;
import org.springframework.social.slideshare.api.domain.SearchOptions.FileType;
import org.springframework.social.slideshare.api.domain.SearchOptions.SearchType;
import org.springframework.social.slideshare.api.domain.SearchOptions.Sort;
import org.springframework.social.slideshare.api.domain.SearchOptions.UploadDate;
import org.springframework.social.slideshare.api.domain.SearchSlideshowsResponse;
import org.springframework.social.slideshare.api.domain.Slideshow;
import org.springframework.social.slideshare.api.domain.SearchOptions.Language;
import org.springframework.social.slideshare.api.impl.SlideShareTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service("SlideshareAPIServiceImpl")
public class SlideshareAPIServiceImpl implements SlideshareAPIService {

    @Value("${slideshare.api.key}")
    private String apiKey;
    
    @Value("${slideshare.shared.secret}")
    private String sharedSecret;
    
    /**
     * @brief slideshare List 조회
     */
    @Override
    public List<Slideshow> searchSlideshowList(String searchText){
        SlideShare                  slideshare               = new SlideShareTemplate(apiKey, sharedSecret);
        SlideshowOperations         slideshowOperations      = slideshare.slideshowOperations();
        List<Slideshow>             slideshowList            = null;

        if(!StringUtils.isEmpty(searchText)){
            SearchSlideshowsResponse    searchSlideshowsResponse = slideshowOperations.searchSlideshows(searchText, 1, 5, Language.All, Sort.MOSTVIEWED, UploadDate.YEAR, SearchType.TEXT, true, FileFormat.PPT, FileType.PRESENTATIONS, false, false, false, false, false);
            
            if(searchSlideshowsResponse.getNumResults() > 0){
                slideshowList   = searchSlideshowsResponse.getSlideshows();
            }            
        }
    
        return slideshowList;
    }
}
