package net.linkednest.openapi.service;

import java.util.List;

import org.springframework.social.slideshare.api.domain.Slideshow;

public interface SlideshareAPIService {
    
    public List<Slideshow> searchSlideshowList(String searchText);

}
