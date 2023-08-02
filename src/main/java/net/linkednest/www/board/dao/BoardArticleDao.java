package net.linkednest.www.board.dao;

import java.util.List;
import java.util.Map;

import net.linkednest.www.board.dto.BoardArticleDto;
import net.linkednest.www.board.dto.BoardDto;
import net.linkednest.www.board.dto.SideBoardCategoryPortalDto;
import net.linkednest.www.board.dto.SlideshareLinkDto;
import net.linkednest.common.util.SearchCondition;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository("BoardArticleDao")
public class BoardArticleDao extends SqlSessionDaoSupport{
	/**
	 * 게시판 조회
	 * @return
	 * @throws Exception
	 */
	public List<BoardArticleDto> getBoardArticleList(BoardArticleDto boardArticleDto) throws Exception{
		return getSqlSession().selectList("sql.boardArticle.selectList", boardArticleDto);
	}
    private SearchCondition setSearchConditionParams(Map<String, Object> param){
        SearchCondition searchCondition = new SearchCondition();
                                   
        searchCondition.setBoardId((int)param.get("boardId"));
        searchCondition.setSearchCondition((String)param.get("searchCondition"));
        searchCondition.setSearchText((String)param.get("searchText"));
        searchCondition.setStartDate((String)param.get("startDate"));
        searchCondition.setEndDate((String)param.get("endDate"));
        searchCondition.setCreateUserId((String)param.get("createUserId"));
        
        return searchCondition;
	}
	public List<BoardArticleDto> selectBoardArticleList(Map<String, Object> param) throws Exception {
	    SearchCondition searchCondition = this.setSearchConditionParams(param);
	    searchCondition.setStartRow((Integer)param.get("startRow"));
	    searchCondition.setEndRow((Integer)param.get("endRow"));
	    return getSqlSession().selectList("sql.boardArticle.selectBoardList", searchCondition);
	}
	public int selectArticleListCnt(Map<String, Object> param) throws Exception {
	    SearchCondition searchCondition = this.setSearchConditionParams(param);
	    return getSqlSession().selectOne("sql.boardArticle.selectListCount", searchCondition);
	}
	/**
	 * 게시글 입력
	 * @param boardArticleDto
	 * @return
	 * @throws Exception
	 */
	public int insertBoardArticle(BoardArticleDto boardArticleDto) throws Exception{
		int articleId     = 0;
	    int inputResult   = getSqlSession().insert("sql.boardArticle.insertArticleInfo", boardArticleDto);
	    if(inputResult > 0){
	        articleId = boardArticleDto.getArticleId();
	    }
		return articleId;
	}
	/**
	 * 게시글 수정
	 * @param boardArticleDto
	 * @return
	 * @throws Exception
	 */
	public int updateBoardArticle(BoardArticleDto boardArticleDto) throws Exception{		
		return getSqlSession().update("sql.boardArticle.updateArticleInfo", boardArticleDto);
	}
	/**
	 * 게시글 삭제
	 * @param boardArticleDto
	 * @return
	 * @throws Exception
	 */
	public int deleteBoardArticle(BoardArticleDto boardArticleDto) throws Exception{
		// 논리적 삭제
		return getSqlSession().update("sql.boardArticle.deleteArticleInfo", boardArticleDto);
	}
	/**
	 * 게시글 조회
	 * @param boardArticleDto
	 * @return
	 * @throws Exception
	 */
	public BoardArticleDto selectBoardArticle(BoardArticleDto boardArticleDto) throws Exception{
		return getSqlSession().selectOne("sql.boardArticle.selectBoardContent", boardArticleDto);
	}
	/**
	 * 이전 글 조회
	 * @param boardArticleDto
	 * @return
	 * @throws Exception
	 */
	public BoardArticleDto selectPrevBoardArticle(BoardArticleDto boardArticleDto) throws Exception{
		return getSqlSession().selectOne("sql.boardArticle.selectPrevBoardContent", boardArticleDto);
	}
	/**
	 * 다음 글 조회
	 * @param boardArticleDto
	 * @return
	 * @throws Exception
	 */
	public BoardArticleDto selectNextBoardArticle(BoardArticleDto boardArticleDto) throws Exception{
		return getSqlSession().selectOne("sql.boardArticle.selectNextBoardContent", boardArticleDto);
	}
	/**
	 * 다섯개의 게시글 조회
	 * <pre>
	 * 1. MethodName	: selectBoardArticleFive
	 * 2. ClassName		: BoardArticleDao
	 * 3. Comment		: 
	 * 4. 작성자			: leejinwon
	 * 5. 작성일			: 2014. 8. 28. 오후 3:39:03
	 * </pre>
	 *   @param boardArticleDto
	 *   @return
	 *   @throws Exception
	 *   @return List<BoardArticleDto>
	 */
	public List<BoardArticleDto> selectBoardArticleFive(BoardArticleDto boardArticleDto) throws Exception{
		return getSqlSession().selectList("sql.boardArticle.selectArticleFive", boardArticleDto);
				
	}
	/**
	 * @brief 우측 가장자리의 게시글 목록 조회
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public List<SideBoardCategoryPortalDto> selectSideBoardList(BoardDto boardDto) throws Exception{
	    return getSqlSession().selectList("sql.boardArticle.selectSideBoardList", boardDto);
	}
	/**
	 * @brief slideshare 공유 링크 정보 입력
	 * @param slideshareLinkDto
	 * @return
	 * @throws Exception
	 */
	public int insertSlideshareInfo(SlideshareLinkDto slideshareLinkDto) throws Exception{
	    return getSqlSession().insert("sql.boardArticle.insertSlideshareLinkInfo", slideshareLinkDto);
	}
	/**
	 * @brief slideshare 공유 링크 정보 수정
	 * @param slideshareLinkDto
	 * @return
	 * @throws Exception
	 */
    public int updateSlideshareInfo(SlideshareLinkDto slideshareLinkDto) throws Exception{
        return getSqlSession().update("sql.boardArticle.updateSlideshareLinkInfo", slideshareLinkDto);
    }	
}
