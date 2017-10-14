package net.linkednest.www.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.linkednest.www.board.dto.BoardArticleDto;
import net.linkednest.common.util.PagedList;
import org.springframework.stereotype.Service;

import net.linkednest.www.board.dao.BoardArticleDao;
import net.linkednest.www.board.dao.BoardArticleRedisDao;
import net.linkednest.www.board.dto.BoardDto;
import net.linkednest.www.board.dto.SideBoardCategoryPortalDto;
import net.linkednest.www.board.dto.SlideshareLinkDto;
import net.linkednest.common.util.PagingUtil;

@Service("BoardArticleServiceImpl")
public class BoardArticleServiceImpl implements BoardArticleService{
	
	@Resource(name="BoardArticleDao")
	private BoardArticleDao boardArticleDao;

	@Resource(name="BoardArticleRedisDao")
	private BoardArticleRedisDao boardArticleRedisDao;

	
	@Override
	public List<BoardArticleDto> getBoardArticleList(BoardArticleDto boardArticleDto) throws Exception{
		return this.boardArticleDao.getBoardArticleList(boardArticleDto);
	}
	@Override
	public int selectArticleListCnt(Map<String, Object> param) throws Exception {                     
	       return boardArticleDao.selectArticleListCnt(param);      
	}    
	@Override
	public PagedList getBoardArticlePagedList(Map<String, Object> paramMap) throws Exception {
        List<?> articleList = this.getBoardArticleList(paramMap);
       
        int pageNo       = (Integer) paramMap.get("pageNo");    
        int listRowCnt   = (Integer) paramMap.get("listRowCnt");
        int totalListCnt = (Integer) paramMap.get("totalListCnt");
        int pageSize     = (Integer) paramMap.get("pageSize");
        int startRow     = (Integer) paramMap.get("startRow");                              
        int endRow       = (Integer) paramMap.get("endRow");       
 
        PagedList pagedList = new PagedList(articleList, pageNo, pageSize, totalListCnt, startRow, endRow, listRowCnt);
       
	    return pagedList;
	}   
	@Override
	public List<BoardArticleDto> getBoardArticleList(Map<String,Object> paramMap) throws Exception {                       
	       int pageNo     = (Integer) paramMap.get("pageNo");                                   
	       int listRowCnt = (Integer) paramMap.get("listRowCnt");
	       int startRow   = PagingUtil.getStartRow(pageNo, listRowCnt);                                        
	       int endRow     = PagingUtil.getEndRow(startRow, listRowCnt);
	 
	       paramMap.put("startRow", startRow);                                     
	       paramMap.put("endRow", endRow);
	       return boardArticleDao.selectBoardArticleList(paramMap);            
	} 
	
	@Override
	public PagedList getBoardArticlePagedListForJson(Map<String, Object> paramMap) throws Exception {                              
        List<?> articleList = this.getBoardArticleList(paramMap);
 
        int pageNo       = (Integer) paramMap.get("pageNo");    
        int listRowCnt   = (Integer) paramMap.get("listRowCnt");
        int totalListCnt = (Integer) paramMap.get("totalListCnt");
        int pageSize     = (Integer) paramMap.get("pageSize");
        int startRow     = (Integer) paramMap.get("startRow");                              
        int endRow       = (Integer) paramMap.get("endRow");       
 
        PagedList pagedList = new PagedList(articleList, pageNo, pageSize, totalListCnt, startRow, endRow, listRowCnt);
        
	    return pagedList;
	}   

	
	/**
	 * 게시글 입력
	 */
	@Override
	public int insertBoardArticle(BoardArticleDto boardArticleDto){
	    int articleId = 0;
        try {
            articleId = this.boardArticleDao.insertBoardArticle(boardArticleDto);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
		return articleId;
	}
	/**
	 * 게시글 수정
	 */
	@Override
	public int updateBoardArticle(BoardArticleDto boardArticleDto) throws Exception{
		return this.boardArticleDao.updateBoardArticle(boardArticleDto);
	}
	/**
	 * 게시글 삭제
	 * @param boardArticleDto
	 * @return
	 * @throws Exception
	 */
	@Override
	public int deleteBoardArticle(BoardArticleDto boardArticleDto) throws Exception{
		return this.boardArticleDao.deleteBoardArticle(boardArticleDto);
	}
	
	
	/**
	 * 게시 글 조회
	 */
	@Override
	public BoardArticleDto selectBoardArticle(BoardArticleDto boardArticleDto) throws Exception {
		
		return this.boardArticleDao.selectBoardArticle(boardArticleDto);
	}
	/**
	 * 이전 글 조회
	 */
	@Override
	public BoardArticleDto selectPrevBoardArticle(BoardArticleDto boardArticleDto) throws Exception {
		return this.boardArticleDao.selectPrevBoardArticle(boardArticleDto);
	}
	/**
	 * 다음 글 조회
	 */
	@Override
	public BoardArticleDto selectNextBoardArticle(BoardArticleDto boardArticleDto) throws Exception {
		return this.boardArticleDao.selectNextBoardArticle(boardArticleDto);
	}
	
	@Override
	public List<BoardArticleDto> selectBoardArticleFive(BoardArticleDto boardArticleDto) throws Exception {
		return this.boardArticleDao.selectBoardArticleFive(boardArticleDto);
	}
	
	/**
	 * 우측 영역 게시판 목록 조회
	 * @return
	 * @throws Exception
	 */
	public List<SideBoardCategoryPortalDto> selectSideBoardList(BoardDto boardDto) throws Exception {
	    return this.boardArticleDao.selectSideBoardList(boardDto);
	}
	
	/**
	 * @brief 슬라이드쉐어 
	 * @param slideshareLinkDto
	 * @return
	 * @throws Exception
	 */
	@Override
	public int insertSlideshareInfo(SlideshareLinkDto slideshareLinkDto){
	    int insertResult = 0;
	    try {
	        insertResult = this.boardArticleDao.insertSlideshareInfo(slideshareLinkDto);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	    return insertResult;
	}

    @Override
    public int updateSlideshareInfo(SlideshareLinkDto slideshareLinkDto){
        int updateResult = 0;
        try {
            updateResult = this.boardArticleDao.updateSlideshareInfo(slideshareLinkDto);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return updateResult;
    }

}
