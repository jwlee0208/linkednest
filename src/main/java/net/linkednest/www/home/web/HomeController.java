package net.linkednest.www.home.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.linkednest.www.board.dto.BoardArticleDto;
import net.linkednest.www.board.service.BoardArticleServiceImpl;
import net.linkednest.www.profile.service.ProfileServiceImpl;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.linkednest.www.board.service.BoardArticleRedisServiceImpl;
import net.linkednest.www.profile.dto.ProfileDto;


@Controller
@RequestMapping(value="/")
public class HomeController {
	
	private static final Log logger = LogFactory.getLog(HomeController.class);
	
	@Resource(name = "BoardArticleServiceImpl")
	private BoardArticleServiceImpl boardArticleService;

	@Resource(name = "BoardArticleRedisServiceImpl")
	private BoardArticleRedisServiceImpl   boardArticleRedisService;	

	@Resource(name = "profileService")
	private ProfileServiceImpl profileService;
	
	// spring-data-redis 사용.
//	@Autowired
//	private RedisTemplate<String, List<BoardArticleDto>> redisTemplate;
	// spring-data-redis 사용.
//	@Resource(name="redisTemplate")
//	private ValueOperations<String, List<BoardArticleDto>> valueOps;
	
	
	@RequestMapping(value="/home")
	public String goHome(Model model, HttpSession session) throws Exception{
		// recent player list 
		ProfileDto profilePlayerDto = new ProfileDto();
		profilePlayerDto.setCatId1("01010100");
		profilePlayerDto.setProfileType("1");
		List<ProfileDto> profilePlayerList = this.profileService.getProfileInfos(profilePlayerDto);
		model.addAttribute("recentPlayerProfileList", profilePlayerList);
		// recent team list
		ProfileDto profileTeamDto = new ProfileDto();
		profileTeamDto.setCatId1("01010300");
		profileTeamDto.setProfileType("3");
		List<ProfileDto> profileTeamList = this.profileService.getProfileInfos(profileTeamDto);
		model.addAttribute("recentTeamProfileList", profileTeamList);
		// recent tryout list
	    BoardArticleDto boardDto01 = new BoardArticleDto();
	    boardDto01.setBoardId(15);
	    List<BoardArticleDto> recentTryoutList = this.boardArticleService.selectBoardArticleFive(boardDto01);
	    model.addAttribute("recentTryoutList"  , recentTryoutList);
		
	    return "home";
	}	
	
	@RequestMapping(value="/aboutUs")
	public String goAboutUs() throws Exception{
		return "/info/aboutUs";
	}
	
	@RequestMapping(value="/sitemap")
	public String goSitemap() throws Exception{
	    return "/info/sitemap";
	}
	    
}