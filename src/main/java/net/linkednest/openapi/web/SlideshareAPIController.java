package net.linkednest.openapi.web;

import java.util.List;

import javax.annotation.Resource;

import net.linkednest.openapi.dto.SearchCommonAPIDto;
import net.linkednest.openapi.service.impl.SlideshareAPIServiceImpl;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.slideshare.api.domain.Slideshow;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/api/slideshare")
public class SlideshareAPIController {
    @Autowired
    private SlideshareAPIServiceImpl slideshareAPIService;
    /**
     * get slideshare's list
     *
     * @param searchCommonAPIDto
     * @param model
     * @return
     */
    @RequestMapping(value = "/slideList")
    public String getSlideList(SearchCommonAPIDto searchCommonAPIDto, Model model){
        String              keyword         = searchCommonAPIDto.getKeyword();
        List<Slideshow>     slideList       = null;
        if(!StringUtils.isEmpty(keyword)){
            slideList       = this.slideshareAPIService.searchSlideshowList(keyword);
        }
        model.addAttribute("slideList", slideList);
        return "api/slideshare/ajaxSlideList";
    }
}
