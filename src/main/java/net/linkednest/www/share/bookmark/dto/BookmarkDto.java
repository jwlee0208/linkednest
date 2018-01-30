package net.linkednest.www.share.bookmark.dto;

import org.apache.ibatis.type.Alias;

@Alias("bookmark.bookmarkDto")
public class BookmarkDto {
    private int    webBookmarkId;
    private String userId;
    private String bookmarkUrl;
    private String bookmarkName;
    private String bookmarkDescription;
    private String createDate;
    private String modifyDate;
    
    public int getWebBookmarkId() {
        return webBookmarkId;
    }
    public void setWebBookmarkId(int webBookmarkId) {
        this.webBookmarkId = webBookmarkId;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getBookmarkUrl() {
        return bookmarkUrl;
    }
    public void setBookmarkUrl(String bookmarkUrl) {
        this.bookmarkUrl = bookmarkUrl;
    }
    public String getBookmarkName() {
        return bookmarkName;
    }
    public void setBookmarkName(String bookmarkName) {
        this.bookmarkName = bookmarkName;
    }
    public String getBookmarkDescription() {
        return bookmarkDescription;
    }
    public void setBookmarkDescription(String bookmarkDescription) {
        this.bookmarkDescription = bookmarkDescription;
    }
    public String getCreateDate() {
        return createDate;
    }
    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
    public String getModifyDate() {
        return modifyDate;
    }
    public void setModifyDate(String modifyDate) {
        this.modifyDate = modifyDate;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("BookmarkDto{");
        sb.append("webBookmarkId=").append(webBookmarkId);
        sb.append(", userId='").append(userId).append('\'');
        sb.append(", bookmarkUrl='").append(bookmarkUrl).append('\'');
        sb.append(", bookmarkName='").append(bookmarkName).append('\'');
        sb.append(", bookmarkDescription='").append(bookmarkDescription).append('\'');
        sb.append(", createDate='").append(createDate).append('\'');
        sb.append(", modifyDate='").append(modifyDate).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
