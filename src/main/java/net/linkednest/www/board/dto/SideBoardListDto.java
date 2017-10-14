package net.linkednest.www.board.dto;

import org.apache.ibatis.type.Alias;

@Alias("board.sideBoardListDto")
public class SideBoardListDto {

    private int         boardId;
    private int         boardArticleCnt;
    
    private BoardDto    boardInfo;
    
    public int getBoardId() {
        return boardId;
    }
    public void setBoardId(int boardId) {
        this.boardId = boardId;
    }
    public int getBoardArticleCnt() {
        return boardArticleCnt;
    }
    public void setBoardArticleCnt(int boardArticleCnt) {
        this.boardArticleCnt = boardArticleCnt;
    }
    public BoardDto getBoardInfo() {
        return boardInfo;
    }
    public void setBoardInfo(BoardDto boardInfo) {
        this.boardInfo = boardInfo;
    }
    
    @Override
    public String toString() {
        return "SideBoardListDto [boardId=" + boardId + ", boardArticleCnt="
                + boardArticleCnt + ", boardInfo=" + boardInfo + "]";
    }
    
}
