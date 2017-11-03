package net.linkednest.share.board.service;

import java.util.List;
import java.util.Map;

import net.linkednest.share.board.dto.BoardCategoryDto;
import net.linkednest.share.board.dto.BoardCategoryPortalDto;
import net.linkednest.share.board.dto.BoardDto;
import net.linkednest.common.util.PagedList;

public interface BoardService {

	BoardDto getBoardInfo(BoardDto boardDto) throws Exception;

	int                          insertBoardInfo(BoardDto boardDto) throws Exception;

	int                          updateBoardInfo(BoardDto boardDto) throws Exception;

	List<BoardDto>               getBoardList(BoardDto boardDto) throws Exception;
	
	List<BoardDto>               getBoardList(Map<String, Object> paramMap) throws Exception;

	PagedList getBoardPagedList(Map<String, Object> paramMap) throws Exception;

	int                          getListCnt(Map<String, Object> param) throws Exception;

	BoardDto                     selectBoardInfo(BoardDto boardDto) throws Exception;

	BoardDto                     getPrevBoardInfo(BoardDto boardDto) throws Exception;

	BoardDto                     getNextBoardInfo(BoardDto boardDto) throws Exception;

	int                          modifyBoardInfo(BoardDto boardDto) throws Exception;

    List<BoardCategoryDto>       getBoardCategoryList(BoardCategoryDto boardCategoryDto) throws Exception;

    List<BoardCategoryPortalDto> getBoardCategoryAndBoardList(BoardCategoryPortalDto boardCategoryPortalDto) throws Exception;

    BoardDto                     getBoardCategoryAndBoardInfo(BoardDto boardDto) throws Exception;

}
