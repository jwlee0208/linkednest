package net.linkednest.share.board.dto;

import org.apache.ibatis.type.Alias;

@Alias("board.boardDto")
public class BoardDto extends BoardCategoryDto{
	private int 	boardId;
	private int     boardCategoryId;
	private String 	boardName;
	private String 	boardType;
	private String 	createUserId;
	private String 	createUserName;
	private String 	createDate;
	private String 	modifyUserId;
	private String 	modifyUserName;
	private String 	modifyDate;
	
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public int getBoardCategoryId() {
        return boardCategoryId;
    }
    public void setBoardCategoryId(int boardCategoryId) {
        this.boardCategoryId = boardCategoryId;
    }
    public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	public String getCreateUserName() {
		return createUserName;
	}
	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getModifyUserId() {
		return modifyUserId;
	}
	public void setModifyUserId(String modifyUserId) {
		this.modifyUserId = modifyUserId;
	}
	public String getModifyUserName() {
		return modifyUserName;
	}
	public void setModifyUserName(String modifyUserName) {
		this.modifyUserName = modifyUserName;
	}
	public String getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	
    @Override
    public String toString() {
        return "BoardDto [boardId=" + boardId + ", boardCategoryId="
                + boardCategoryId + ", boardName=" + boardName + ", boardType="
                + boardType + ", createUserId=" + createUserId
                + ", createUserName=" + createUserName + ", createDate="
                + createDate + ", modifyUserId=" + modifyUserId
                + ", modifyUserName=" + modifyUserName + ", modifyDate="
                + modifyDate + "]";
    }
	
}
