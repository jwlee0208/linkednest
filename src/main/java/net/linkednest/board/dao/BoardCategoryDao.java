package net.linkednest.board.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import net.linkednest.board.dto.BoardCategoryDto;

@Repository("BoardCategoryDao")
public class BoardCategoryDao extends SqlSessionDaoSupport{
    
    public List<BoardCategoryDto> selectBoardCategoryList(BoardCategoryDto boardCategoryDto) throws Exception{
        return getSqlSession().selectList("sql.boardcategory.selectBoardCategoryList", boardCategoryDto);
    }

    public BoardCategoryDto selectBoardCategoryInfo(BoardCategoryDto boardCategoryDto) throws Exception{
        return getSqlSession().selectOne("sql.boardcategory.selectBoardCategoryInfo", boardCategoryDto);
    }
    
    public BoardCategoryDto selectPrevBoardCategoryInfo(BoardCategoryDto boardCategoryDto) throws Exception{
        return getSqlSession().selectOne("sql.boardcategory.selectPrevBoardCategoryInfo", boardCategoryDto);
    }

    public BoardCategoryDto selectNextBoardCategoryInfo(BoardCategoryDto boardCategoryDto) throws Exception{
        return getSqlSession().selectOne("sql.boardcategory.selectNextBoardCategoryInfo", boardCategoryDto);
    }
    
    public int insertBoardCategory(BoardCategoryDto boardCategoryDto) throws Exception{
        
        int insertResult = getSqlSession().insert("sql.boardcategory.insertBoardCategory", boardCategoryDto);
        int boardCategoryId = 0;
        if(insertResult > 0){
            boardCategoryId = boardCategoryDto.getBoardCategoryId();
        }
        return boardCategoryId;
    }

    public int updateBoardCategory(BoardCategoryDto boardCategoryDto) throws Exception{
        return getSqlSession().update("sql.boardcategory.updateBoardCategory", boardCategoryDto);
    }

    public int deleteBoardCategory(BoardCategoryDto boardCategoryDto) throws Exception{
        return getSqlSession().delete("sql.boardcategory.deleteBoardCategory", boardCategoryDto);
    }

}
