package net.linkednest.www.board.dto;

import net.linkednest.common.util.SearchCondition;
import net.linkednest.www.common.dto.ShareDto;
import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.util.List;

@Alias("board.boardArticleDto")
public class BoardArticleDto extends SearchCondition {
    
	// 입력 파라미터
	private String			thumbnailSize;
	
	
	private int	   			articleId = 0;
	@NotNull @Min(0)
	private int				boardId = 0;
	@NotNull @NotEmpty
	private String 			title;
	@NotNull @NotEmpty
	private String 			content;
	private String 			authorId;
	private String 			authorNm;
	private String 			createDate;
	private MultipartFile 	thumbImg;
	private String			filePath;	
	private String			originalFileName;
	private int 			status = 0;
	private int             boardCategoryId = 0;
	private String          boardCategoryName;
	private String			boardName;
	
	private List<SlideshareLinkDto>          slideshareLinkInfos;
	
	private ShareDto shareInfo;
	
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthorId() {
		return authorId;
	}
	public void setAuthorId(String authorId) {
		this.authorId = authorId;
	}
	public String getAuthorNm() {
		return authorNm;
	}
	public void setAuthorNm(String authorNm) {
		this.authorNm = authorNm;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public MultipartFile getThumbImg() {
		return thumbImg;
	}
	public void setThumbImg(MultipartFile thumbImg) {
		this.thumbImg = thumbImg;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getContentText(){
		return content.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	}
	
	public String getThumbnailSize() {
		return thumbnailSize;
	}
	public void setThumbnailSize(String thumbnailSize) {
		this.thumbnailSize = thumbnailSize;
	}
	
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
    public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	
	public List<SlideshareLinkDto> getSlideshareLinkInfos() {
        return slideshareLinkInfos;
    }
    public void setSlideshareLinkInfos(List<SlideshareLinkDto> slideshareLinkInfos) {
        this.slideshareLinkInfos = slideshareLinkInfos;
    }
    
    public ShareDto getShareInfo() {
        return shareInfo;
    }
    public void setShareInfo(ShareDto shareInfo) {
        this.shareInfo = shareInfo;
    }

	@Override
	public String toString() {
		final StringBuffer sb = new StringBuffer("BoardArticleDto{");
		sb.append("thumbnailSize='").append(thumbnailSize).append('\'');
		sb.append(", articleId=").append(articleId);
		sb.append(", boardId=").append(boardId);
		sb.append(", title='").append(title).append('\'');
		sb.append(", content='").append(content).append('\'');
		sb.append(", authorId='").append(authorId).append('\'');
		sb.append(", authorNm='").append(authorNm).append('\'');
		sb.append(", createDate='").append(createDate).append('\'');
		sb.append(", thumbImg=").append(thumbImg);
		sb.append(", filePath='").append(filePath).append('\'');
		sb.append(", originalFileName='").append(originalFileName).append('\'');
		sb.append(", status=").append(status);
		sb.append(", boardCategoryId=").append(boardCategoryId);
		sb.append(", boardCategoryName='").append(boardCategoryName).append('\'');
		sb.append(", boardName='").append(boardName).append('\'');
		sb.append(", slideshareLinkInfos=").append(slideshareLinkInfos);
		sb.append(", shareInfo=").append(shareInfo);
		sb.append('}');
		return sb.toString();
	}
}
