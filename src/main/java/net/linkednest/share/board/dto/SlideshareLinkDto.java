package net.linkednest.share.board.dto;

import org.apache.ibatis.type.Alias;

@Alias("board.slideshareLinkDto")
public class SlideshareLinkDto {
    private int     slideId     = 0;
    private int     articleId   = 0;
    private String  slideshareLinkUrl;
    private String  createUserId;
    private String  createDate;
    
    public int getSlideId() {
        return slideId;
    }
    public void setSlideId(int slideId) {
        this.slideId = slideId;
    }
    public int getArticleId() {
        return articleId;
    }
    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }
    public String getSlideshareLinkUrl() {
        return slideshareLinkUrl;
    }
    public void setSlideshareLinkUrl(String slideshareLinkUrl) {
        this.slideshareLinkUrl = slideshareLinkUrl;
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
        return "SlideshareLinkDto [slideId=" + slideId + ", articleId="
                + articleId + ", slideshareLinkUrl=" + slideshareLinkUrl
                + ", createUserId=" + createUserId + ", createDate="
                + createDate + "]";
    }
    
}
