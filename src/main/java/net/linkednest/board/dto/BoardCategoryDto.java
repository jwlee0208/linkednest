package net.linkednest.board.dto;

import org.apache.ibatis.type.Alias;

@Alias("board.boardCategoryDto")
public class BoardCategoryDto {
    private int     boardCategoryId;
    private String  boardCategoryName;
    private String  createUserId;
    private String  createDate;
    
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
    public String getCreateUserId() {
        return createUserId;
    }
    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }
    public String getCreateDate() {
        return createDate;
    }
    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
    
    @Override
    public String toString() {
        return "BoardCategoryDto [boardCategoryId=" + boardCategoryId
                + ", boardCategoryName=" + boardCategoryName
                + ", createUserId=" + createUserId + ", createDate="
                + createDate + "]";
    }
    
}
