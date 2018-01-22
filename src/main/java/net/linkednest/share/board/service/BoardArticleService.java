package net.linkednest.share.board.service;

import java.util.List;
import java.util.Map;

import net.linkednest.common.util.PagedList;
import net.linkednest.www.board.dto.BoardArticleDto;
import net.linkednest.www.board.dto.BoardDto;
import net.linkednest.www.board.dto.SideBoardCategoryPortalDto;
import net.linkednest.www.board.dto.SlideshareLinkDto;

public interface BoardArticleService {
	public List<BoardArticleDto>               getBoardArticleList(BoardArticleDto boardArticleDto) throws Exception;
	public int                                 selectArticleListCnt(Map<String, Object> param) throws Exception;
	public PagedList getBoardArticlePagedList(Map<String, Object> paramMap) throws Exception;
	public List<BoardArticleDto>               getBoardArticleList(Map<String,Object> paramMap) throws Exception;
	
	public PagedList                           getBoardArticlePagedListForJson(Map<String, Object> paramMap) throws Exception;
	
	public int                                 insertBoardArticle(BoardArticleDto boardArticleDto);
	public int                                 updateBoardArticle(BoardArticleDto boardArticleDto) throws Exception;
	public int                                 deleteBoardArticle(BoardArticleDto boardArticleDto) throws Exception;
	
	public BoardArticleDto                     selectBoardArticle(BoardArticleDto boardArticleDto) throws Exception;
	public BoardArticleDto                     selectPrevBoardArticle(BoardArticleDto boardArticleDto) throws Exception;
	public BoardArticleDto                     selectNextBoardArticle(BoardArticleDto boardArticleDto) throws Exception; 
	
	public List<BoardArticleDto>               selectBoardArticleFive(BoardArticleDto boardArticleDto) throws Exception;
	public List<SideBoardCategoryPortalDto>    selectSideBoardList(BoardDto boardDto) throws Exception;
    public int                                 insertSlideshareInfo(SlideshareLinkDto slideshareLinkDto);
    public int                                 updateSlideshareInfo(SlideshareLinkDto slideshareLinkDto);
}
