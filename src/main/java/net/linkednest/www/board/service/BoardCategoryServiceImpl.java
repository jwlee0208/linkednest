package net.linkednest.www.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.linkednest.www.board.dao.BoardCategoryDao;
import net.linkednest.www.board.dto.BoardCategoryDto;

@Service
public class BoardCategoryServiceImpl implements BoardCategoryService{

    @Inject
    private BoardCategoryDao boardCategoryDao;

    @Override
    public List<BoardCategoryDto> getBoardCategoryList(BoardCategoryDto boardCategoryDto) throws Exception {
        return this.boardCategoryDao.selectBoardCategoryList(boardCategoryDto);
    }

    @Override
    public BoardCategoryDto getBoardCategoryInfo(BoardCategoryDto boardCategoryDto) throws Exception {
        return this.boardCategoryDao.selectBoardCategoryInfo(boardCategoryDto);
    }

    @Override
    public int insertBoardCategory(BoardCategoryDto boardCategoryDto) throws Exception {
        return this.boardCategoryDao.insertBoardCategory(boardCategoryDto);
    }

    @Override
    public int updateBoardCategory(BoardCategoryDto boardCategoryDto) throws Exception {
        return this.boardCategoryDao.updateBoardCategory(boardCategoryDto);
    }

    @Override
    public int deleteBoardCategory(BoardCategoryDto boardCategoryDto) throws Exception {
        return this.boardCategoryDao.deleteBoardCategory(boardCategoryDto);
    }
    
    /**
     * 이전 글 조회
     */
    @Override
    public BoardCategoryDto getPrevBoardCategoryInfo(BoardCategoryDto boardCategoryDto) throws Exception {
        return this.boardCategoryDao.selectPrevBoardCategoryInfo(boardCategoryDto);
    }
    /**
     * 다음 글 조회
     */
    @Override
    public BoardCategoryDto getNextBoardCategoryInfo(BoardCategoryDto boardCategoryDto) throws Exception {
        return this.boardCategoryDao.selectNextBoardCategoryInfo(boardCategoryDto);
    }

}
