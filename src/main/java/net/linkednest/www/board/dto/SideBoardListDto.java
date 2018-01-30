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
        final StringBuffer sb = new StringBuffer("SideBoardListDto{");
        sb.append("boardIdProfileController - [ ProfileController.getAjaxProfileList() ][ Param ] searchProfileDto : SearchProfileDto [searchCondition=name, searchText=, profileId=0, profileType=1, catId1=null, area=null, country=KR, profileAttrList=[ProfileAttrDto [profileAttrId=3, profileAttrName=null, catId=null, createDate=null, createUserId=null, profileAttrElementList=[ProfileAttrElementDto [profileAttrElementId=1, profileAttrId=0, profileAttrElementName=null, createDate=null, createUserId=null, modifyDate=null, modifyUserId=null, profileAttrElementMapList=null], ProfileAttrElementDto [profileAttrElementId=2, profileAttrId=0, profileAttrElementName=null, createDate=null, createUserId=null, modifyDate=null, modifyUserId=null, profileAttrElementMapList=null]], profileAttrElementMapList=null], ProfileAttrDto [profileAttrId=2, profileAttrName=null, catId=null, createDate=null, createUserId=null, profileAttrElementList=[ProfileAttrElementDto [profileAttrElementId=4, profileAttrId=0, profileAttrElementName=null, createDate=null, createUserId=null, modifyDate=null, modifyUserId=null, profileAttrElementMapList=null], ProfileAttrElementDto [profileAttrElementId=5, profileAttrId=0, profileAttrElementName=null, createDate=null, createUserId=null, modifyDate=null, modifyUserId=null, profileAttrElementMapList=null]], profileAttrElementMapList=null], ProfileAttrDto [profileAttrId=1, profileAttrName=null, catId=null, createDate=null, createUserId=null, profileAttrElementList=[ProfileAttrElementDto [profileAttrElementId=8, profileAttrId=0, profileAttrElementName=null, createDate=null, createUserId=null, modifyDate=null, modifyUserId=null, profileAttrElementMapList=null]], profileAttrElementMapList=null], ProfileAttrDto [profileAttrId=4, profileAttrName=null, catId=null, createDate=null, createUserId=null, profileAttrElementList=[ProfileAttrElementDto [profileAttrElementId=11, profileAttrId=0, profileAttrElementName=null, createDate=null, createUserId=null, modifyDate=null, modifyUserId=null, profileAttrElementMapList=null], ProfileAttrElementDto [profileAttrElementId=0, profileAttrId=0, profileAttrElementName=null, createDate=null, createUserId=null, modifyDate=null, modifyUserId=null, profileAttrElementMapList=null], ProfileAttrElementDto [profileAttrElementId=0, profileAttrId=0, profileAttrElementName=null, createDate=null, createUserId=null, modifyDate=null, modifyUserId=null, profileAttrElementMapList=null], ProfileAttrElementDto [profileAttrElementId=0, profileAttrId=0, profileAttrElementName=null, createDate=null, createUserId=null, modifyDate=null, modifyUserId=null, profileAttrElementMapList=null], ProfileAttrElementDto [profileAttrElementId=0, profileAttrId=0, profileAttrElementName=null, createDate=null, createUserId=null, modifyDate=null, modifyUserId=null, profileAttrElementMapList=null], ProfileAttrElementDto [profileAttrElementId=0, profileAttrId=0, profileAttrElementName=null, createDate=null, createUserId=null, modifyDate=null, modifyUserId=null, profileAttrElementMapList=null], ProfileAttrElementDto [profileAttrElementId=0, profileAttrId=0, profileAttrElementName=null, createDate=null, createUserId=null, modifyDate=null, modifyUserId=null, profileAttrElementMapList=null], ProfileAttrElementDto [profileAttrElementId=18, profileAttrId=0, profileAttrElementName=null, createDate=null, createUserId=null, modifyDate=null, modifyUserId=null, profileAttrElementMapList=null]], profileAttrElementMapList=null]]]=").append(boardId);
        sb.append(", boardArticleCnt=").append(boardArticleCnt);
        sb.append(", boardInfo=").append(boardInfo);
        sb.append('}');
        return sb.toString();
    }
}
