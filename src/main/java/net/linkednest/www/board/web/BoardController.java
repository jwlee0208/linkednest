package net.linkednest.www.board.web;

import net.linkednest.www.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	public static final int DEFAULT_PAGE_NO    = 1;
	public static final int DEFAULT_PAGE_SIZE  = 10;

	@Autowired
	private BoardService boardService;
	
	
}
