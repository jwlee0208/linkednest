package net.linkednest.board.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.linkednest.board.service.BoardServiceImpl;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	public static final int DEFAULT_PAGE_NO    = 1;
	public static final int DEFAULT_PAGE_SIZE  = 10;

	@Resource(name="BoardServiceImpl")
	private BoardServiceImpl boardService;
	
	
}
