package net.linkednest.www.board.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("board.boardCategoryPortalDto")
public class BoardCategoryPortalDto extends BoardCategoryDto{
    
    private int              boardCategoryId = 0;
    private String           boardCategoryName;
    
    private List<BoardDto>   boardList;
    
    
    public int getBoardCategoryId() {
        return boardCategoryId;
    }
    public void setBoardCategoryId(int boardCategoryId) {
        this.boardCategoryId = boardCategoryId;
    }
    public String getBoardCategoryName() {
        return boardCategoryName;
    }
    public void setBoardCategoryName(String boardCategoryName) {
        this.boardCategoryName = boardCategoryName;
    }
    public List<BoardDto> getBoardList() {
        return boardList;
    }
    public void setBoardList(List<BoardDto> boardList) {
        this.boardList = boardList;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("BoardCategoryPortalDto{");
        sb.append("boardCategoryId=").append(boardCategoryId);
        sb.append(", boardCategoryName='").append(boardCategoryName).append('\'');
        sb.append(", boardList=").append(boardList);
        sb.append('}');
        return sb.toString();
    }
}
