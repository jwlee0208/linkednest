package net.linkednest.www.board.dao;

import java.util.List;
import java.util.Map;

import net.linkednest.www.board.dto.BoardCategoryDto;
import net.linkednest.www.board.dto.BoardCategoryPortalDto;
import net.linkednest.www.board.dto.BoardDto;
import net.linkednest.www.common.util.SearchCondition;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository("BoardDao")
public class BoardDao extends SqlSessionDaoSupport{
	/**
	 * 게시판 목록 조회
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
    public List<BoardDto> getBoardList(BoardDto boardDto) throws Exception{
        return getSqlSession().selectList("sql.board.selectBoardListAll", boardDto);
    }

    
    public List<BoardDto> getBoardList(Map<String, Object> param) throws Exception{
		
	       SearchCondition searchCondition = new SearchCondition();
	       searchCondition.setStartRow((Integer)param.get("startRow"));
	       searchCondition.setEndRow((Integer)param.get("endRow"));
	                          
	       searchCondition.setSearchCondition((String)param.get("searchCondition"));
	       searchCondition.setSearchText((String)param.get("searchText"));
	       searchCondition.setStartDate((String)param.get("startDate"));
	       searchCondition.setEndDate((String)param.get("endDate"));
	       searchCondition.setCreateUserId((String)param.get("createUserId"));
		
		return getSqlSession().selectList("sql.board.selectBoardList", param);
	}
	
	public int selectListCnt(Map<String, Object> param) throws Exception {
	       SearchCondition searchCondition = new SearchCondition();
	        
	       searchCondition.setSearchCondition((String)param.get("searchCondition"));
	       searchCondition.setSearchText((String)param.get("searchText"));
	       searchCondition.setStartDate((String)param.get("startDate"));
	       searchCondition.setEndDate((String)param.get("endDate"));
	       searchCondition.setCreateUserId((String)param.get("createUserId"));
	       
	       int result = getSqlSession().selectOne("sql.board.selectListCount", searchCondition);                
	       return result;
	} 

	/**
	 * 게시판 정보 조회
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public BoardDto getBoardInfo(BoardDto boardDto) throws Exception{
		return getSqlSession().selectOne("sql.board.selectBoardList", boardDto);
	}
	/**
	 * 게시판 추가
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public int insertBoardInfo(BoardDto boardDto) throws Exception{
		int insertResult = getSqlSession().insert("sql.board.insertBoardInfo", boardDto);
        int boardId = 0;
        if(insertResult > 0){
            boardId = boardDto.getBoardId();
        }
        return boardId;

	}
	/**
	 * 게시판 정보 수정
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public int updateBoardInfo(BoardDto boardDto) throws Exception{
		return getSqlSession().update("sql.board.updateBoardInfo", boardDto);
	}

	/**
	 * 게시글 조회
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public BoardDto selectBoardInfo(BoardDto boardDto) throws Exception{
		return getSqlSession().selectOne("sql.board.selectBoardInfo", boardDto);
	}
	/**
	 * 이전 글 조회
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public BoardDto selectPrevBoardInfo(BoardDto boardDto) throws Exception{
		return getSqlSession().selectOne("sql.board.selectPrevBoardInfo", boardDto);
	}
	/**
	 * 다음 글 조회
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public BoardDto selectNextBoardInfo(BoardDto boardDto) throws Exception{
		return getSqlSession().selectOne("sql.board.selectNextBoardInfo", boardDto);
	}
	/**
	 * 게시판 추가
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public int modifyBoardInfo(BoardDto boardDto) throws Exception{
		return getSqlSession().update("sql.board.updateBoardInfo", boardDto);
	}
	/**
	 * 게시판 카테고리 조회
	 * @return
	 * @throws Exception
	 */
	public List<BoardCategoryDto> selectBoardCategoryList(BoardCategoryDto boardCategoryDto) throws Exception{
	    return getSqlSession().selectList("sql.board.selectBoardCategoryList", boardCategoryDto);
	}
	/**
	 * 게시판 카테고리 & 게시판 목록 조회
	 * @return
	 * @throws Exception
	 */
	public List<BoardCategoryPortalDto> selectBoardCategoryAndBoardList(BoardCategoryPortalDto boardCategoryPortalDto) throws Exception{
	    return getSqlSession().selectList("sql.board.selectBoardCategoryAndBoardList", boardCategoryPortalDto);
	}
    /**
     * 게시판 카테고리 & 게시판 정보 조회
     * @return
     * @throws Exception
     */
    public BoardDto selectBoardCategoryAndBoardInfo(BoardDto boardDto) throws Exception{
        return getSqlSession().selectOne("sql.board.selectBoardCategoryAndBoardInfo", boardDto);
    }
}
