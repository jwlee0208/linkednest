package net.linkednest.www.board.dto;

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
        final StringBuffer sb = new StringBuffer("BoardCategoryDto{");
        sb.append("boardCategoryId=").append(boardCategoryId);
        sb.append(", boardCategoryName='").append(boardCategoryName).append('\'');
        sb.append(", createUserId='").append(createUserId).append('\'');
        sb.append(", createDate='").append(createDate).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
