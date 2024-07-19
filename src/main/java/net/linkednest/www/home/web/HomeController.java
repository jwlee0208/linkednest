package net.linkednest.www.home.web;

import net.linkednest.www.profile.ProfileConstants;
import net.linkednest.www.board.dto.BoardArticleDto;
import net.linkednest.www.board.service.BoardArticleRedisService;
import net.linkednest.www.board.service.BoardArticleService;
import net.linkednest.www.profile.dto.ProfileDto;
import net.linkednest.www.profile.service.ProfileService;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value="/")
public class HomeController {
	
	private static final Log logger = LogFactory.getLog(HomeController.class);

	@Autowired
	private BoardArticleService boardArticleService;

	@Autowired
	private BoardArticleRedisService boardArticleRedisService;

	@Autowired
	private ProfileService profileService;
	
	// spring-data-redis 사용.
	/*@Autowired
	private RedisTemplate<String, List<BoardArticleDto>> redisTemplate;*/
	// spring-data-redis 사용.
	/*@Resource(name="redisTemplate")
	private ValueOperations<String, List<BoardArticleDto>> valueOps;*/
	
	
	@RequestMapping(value="/home")
	public String goHome(Model model, HttpSession session) throws Exception{
		// recent player list - baseball
		this.getRecentPlayerList(model,"01010100");
		// recent player list - football
		this.getRecentPlayerList(model,"01020100");
		// recent team list - baseball
		this.getRecentTeamList(model,"01010300");
		// recent team list - football
		this.getRecentTeamList(model,"01020300");		
		// recent tryout list
		this.getRecentTryoutList(model);

	    return "home";
	}

	/**
	 * Recent Player List
	 *
	 * @param model
	 * @throws Exception
	 */
	private void getRecentPlayerList(Model model, String catId1) throws Exception {
		ProfileDto profilePlayerDto = new ProfileDto();
		profilePlayerDto.setCatId1(catId1);
		profilePlayerDto.setProfileType(ProfileConstants.PROFILE_TYPE_PLAYER.getCode());
		List<ProfileDto> profilePlayerList = this.profileService.getProfileInfos(profilePlayerDto);
		model.addAttribute(String.format("%s%s", "recentPlayerProfileList", (StringUtils.equals("01010100", catId1) ? "Baseball" : "Football")), profilePlayerList);
	}

	/**
	 * Recent Team List
	 *
	 * @param model
	 * @throws Exception
	 */
	private void getRecentTeamList(Model model, String catId1) throws Exception {
		ProfileDto profileTeamDto = new ProfileDto();
		profileTeamDto.setCatId1(catId1);
		profileTeamDto.setProfileType(ProfileConstants.PROFILE_TYPE_TEAM.getCode());
		List<ProfileDto> profileTeamList = this.profileService.getProfileInfos(profileTeamDto);
		model.addAttribute(String.format("%s%s", "recentTeamProfileList", (StringUtils.equals("01010300", catId1) ? "Baseball" : "Football")), profileTeamList);
	}

	/**
	 * Recent Tryout List
	 *
	 * @param model
	 * @throws Exception
	 */
	private void getRecentTryoutList(Model model) throws Exception {
		BoardArticleDto boardDto01 = new BoardArticleDto();
		boardDto01.setBoardId(15);
		List<BoardArticleDto> recentTryoutList = this.boardArticleService.selectBoardArticleFive(boardDto01);
		model.addAttribute("recentTryoutList"  , recentTryoutList);
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
