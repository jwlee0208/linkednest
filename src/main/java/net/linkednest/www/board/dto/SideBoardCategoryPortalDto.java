package net.linkednest.www.board.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("board.sideBoardCategoryPortalDto")
public class SideBoardCategoryPortalDto {
    private int              boardCategoryId = 0;
    private String           boardCategoryName;

    private List<SideBoardListDto>  sideBoardList;

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

    public List<SideBoardListDto> getSideBoardList() {
        return sideBoardList;
    }

    public void setSideBoardList(List<SideBoardListDto> sideBoardList) {
        this.sideBoardList = sideBoardList;
    }

    @Override
    public String toString() {
        return "SideBoardCategoryPortalDto [boardCategoryId=" + boardCategoryId
                + ", boardCategoryName=" + boardCategoryName
                + ", sideBoardList=" + sideBoardList + "]";
    }
    
    
}
