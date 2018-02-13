package net.linkednest.openapi.service.impl;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import net.linkednest.openapi.service.YoutubeAPIService;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestInitializer;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.SearchListResponse;
import com.google.api.services.youtube.model.SearchResult;



@Service
public class YoutubeAPIServiceImpl implements YoutubeAPIService{

    @Value("${google.api.key}")
    private String apiKey;
    
    /** Global instance of the HTTP transport. */
    private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();

    /** Global instance of the JSON factory. */
    private static final JsonFactory JSON_FACTORY = new JacksonFactory();
    
    /** Global instance of the max number of videos we want returned. */
    private static final long NUMBER_OF_VIDEOS_RETURNED = 5;    
    
    /**
     * @brief Youtube 키워드 검색
     * @param keyword
     * @return
     */
    @Override
    public List<SearchResult> searchStreamList(String keyword){
        YouTube youtube = new YouTube.Builder(HTTP_TRANSPORT, JSON_FACTORY, new HttpRequestInitializer() {
            public void initialize(HttpRequest request) throws IOException {}})
          .setApplicationName("LinkedNest's Share")
          .build();
        
        YouTube.Search.List search = null;
        List<SearchResult>  searchResultList = null;
        
        if(!StringUtils.isEmpty(keyword)){
            try {
                // setting search params
                // ref.] https://developers.google.com/youtube/v3/docs/search/list?hl=ko
                search = youtube.search().list("id,snippet");
                search.setKey(apiKey);
                search.setQ(keyword);
                search.setType("video");
                search.setVideoType("any");
                search.setOrder("viewCount");
                search.setSafeSearch("moderate");
                search.setFields("items(id/kind,id/videoId,snippet/title,snippet/thumbnails/default/url)");
                search.setMaxResults(NUMBER_OF_VIDEOS_RETURNED);
                //search.setRegionCode("KR");
                //search.setRelevanceLanguage("KR");
                //search.setQ(URLEncoder.encode(keyword, "UTF-8"));
                
                SearchListResponse searchResponse = search.execute();

                searchResultList = searchResponse.getItems();

            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }            
        }
        
        return searchResultList;

    }
}
