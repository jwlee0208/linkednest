package net.linkednest.www.home.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

<<<<<<< HEAD:src/main/java/net/linkednest/www/home/web/HomeController.java
import net.linkednest.profile.ProfileConstants;
import net.linkednest.profile.service.ProfileService;
import net.linkednest.share.board.dto.BoardArticleDto;
import net.linkednest.share.board.service.BoardArticleRedisService;
import net.linkednest.share.board.service.BoardArticleService;
import net.linkednest.share.board.service.BoardArticleServiceImpl;
import net.linkednest.profile.service.ProfileServiceImpl;
=======
import net.linkednest.www.board.dto.BoardArticleDto;
import net.linkednest.www.board.service.BoardArticleServiceImpl;
import net.linkednest.www.profile.service.ProfileServiceImpl;
>>>>>>> 3acc487a5ec59c3fd34001e63e768877320b663a:src/main/java/net/linkednest/www/home/web/HomeController.java
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

<<<<<<< HEAD:src/main/java/net/linkednest/www/home/web/HomeController.java
import net.linkednest.share.board.service.BoardArticleRedisServiceImpl;
import net.linkednest.profile.dto.ProfileDto;
=======
import net.linkednest.www.board.service.BoardArticleRedisServiceImpl;
import net.linkednest.www.profile.dto.ProfileDto;
>>>>>>> 3acc487a5ec59c3fd34001e63e768877320b663a:src/main/java/net/linkednest/www/home/web/HomeController.java


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
//	@Autowired
//	private RedisTemplate<String, List<BoardArticleDto>> redisTemplate;
	// spring-data-redis 사용.
//	@Resource(name="redisTemplate")
//	private ValueOperations<String, List<BoardArticleDto>> valueOps;
	
	
	@RequestMapping(value="/home")
	public String goHome(Model model, HttpSession session) throws Exception{
		// recent player list
		this.getRecentPlayerList(model);
		// recent team list
		this.getRecentTeamList(model);
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
	private void getRecentPlayerList(Model model) throws Exception {
		ProfileDto profilePlayerDto = new ProfileDto();
		profilePlayerDto.setCatId1("01010100");
		profilePlayerDto.setProfileType(ProfileConstants.PROFILE_TYPE_PLAYER.getCode());
		List<ProfileDto> profilePlayerList = this.profileService.getProfileInfos(profilePlayerDto);
		model.addAttribute("recentPlayerProfileList", profilePlayerList);
	}

	/**
	 * Recent Team List
	 *
	 * @param model
	 * @throws Exception
	 */
	private void getRecentTeamList(Model model) throws Exception {
		ProfileDto profileTeamDto = new ProfileDto();
		profileTeamDto.setCatId1("01010300");
		profileTeamDto.setProfileType(ProfileConstants.PROFILE_TYPE_TEAM.getCode());
		List<ProfileDto> profileTeamList = this.profileService.getProfileInfos(profileTeamDto);
		model.addAttribute("recentTeamProfileList", profileTeamList);
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
