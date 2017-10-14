package net.linkednest.www.board.service;

import java.util.List;

import net.linkednest.www.board.dto.BoardCategoryDto;

public interface BoardCategoryService {
    public List<BoardCategoryDto> getBoardCategoryList(BoardCategoryDto boardCategoryDto) throws Exception;
    
    public BoardCategoryDto getBoardCategoryInfo(BoardCategoryDto boardCategoryDto) throws Exception ;
    
    public BoardCategoryDto getPrevBoardCategoryInfo(BoardCategoryDto boardCategoryDto) throws Exception;
    
    public BoardCategoryDto getNextBoardCategoryInfo(BoardCategoryDto boardCategoryDto) throws Exception ;
    
    public int insertBoardCategory(BoardCategoryDto boardCategoryDto) throws Exception;
    
    public int updateBoardCategory(BoardCategoryDto boardCategoryDto) throws Exception;
    
    public int deleteBoardCategory(BoardCategoryDto boardCategoryDto) throws Exception;
    
    
}
