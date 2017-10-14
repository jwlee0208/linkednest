package net.linkednest.www.common.dto;

import org.apache.ibatis.type.Alias;

@Alias("common.shareDto")
public class ShareDto {
    
    private int     shareId;
    private String  shareName;
    private String  shareType;
    private String  introduce;
    private String  userId;
    private String  createDate;
    
    public int getShareId() {
        return shareId;
    }
    public void setShareId(int shareId) {
        this.shareId = shareId;
    }
    public String getShareName() {
        return shareName;
    }
    public void setShareName(String shareName) {
        this.shareName = shareName;
    }
    public String getShareType() {
        return shareType;
    }
    public void setShareType(String shareType) {
        this.shareType = shareType;
    }
    public String getIntroduce() {
        return introduce;
    }
    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getCreateDate() {
        return createDate;
    }
    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
    
    @Override
    public String toString() {
        return "ShareDto [shareId=" + shareId + ", shareName=" + shareName
                + ", shareType=" + shareType + ", introduce=" + introduce
                + ", userId=" + userId + ", createDate=" + createDate + "]";
    }
    
}
