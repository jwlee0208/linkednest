package net.linkednest.www.board.dto;

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
        final StringBuffer sb = new StringBuffer("SlideshareLinkDto{");
        sb.append("slideId=").append(slideId);
        sb.append(", articleId=").append(articleId);
        sb.append(", slideshareLinkUrl='").append(slideshareLinkUrl).append('\'');
        sb.append(", createUserId='").append(createUserId).append('\'');
        sb.append(", createDate='").append(createDate).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
