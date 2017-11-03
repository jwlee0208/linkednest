package net.linkednest.share.board.web;

import javax.annotation.Resource;

import net.linkednest.share.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.linkednest.share.board.service.BoardServiceImpl;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	public static final int DEFAULT_PAGE_NO    = 1;
	public static final int DEFAULT_PAGE_SIZE  = 10;

	@Autowired
	private BoardService boardService;
	
	
}
