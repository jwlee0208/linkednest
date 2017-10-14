package net.linkednest.www.openapi.web;

import java.util.List;

import javax.annotation.Resource;

import net.linkednest.www.openapi.dto.SearchCommonAPIDto;
import net.linkednest.www.openapi.service.impl.YoutubeAPIServiceImpl;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.api.services.youtube.model.SearchResult;

@Controller
@RequestMapping(value = "/api/youtube")
public class YoutubeAPIController {

    @Resource(name = "YoutubeAPIServiceImpl")
    private YoutubeAPIServiceImpl youtubeAPIService;
    
    @RequestMapping(value = "/streamList")
    public String searchStreamList(SearchCommonAPIDto searchCommonAPIDto, Model model) throws Exception{
        
        String keyword = searchCommonAPIDto.getKeyword();
        List<SearchResult> searchResultList = null;
        
        if(!StringUtils.isEmpty(keyword)){
            searchResultList = this.youtubeAPIService.searchStreamList(keyword);
        }
        
        model.addAttribute("type", searchCommonAPIDto.getType());
        model.addAttribute("streamList", searchResultList);        
        return "api/youtube/ajaxStreamList";
    }
    
}
