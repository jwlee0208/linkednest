package net.linkednest.www.profile.dto;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import org.apache.ibatis.type.Alias;

@JsonInclude(JsonInclude.Include.NON_NULL)
@Alias("profile.profileAttrDto")
public class ProfileAttrDto {
	private int 	profileAttrId;
	private String 	profileAttrName;
	private String 	catId;
	private String 	createDate;
	private String 	createUserId;
	
	private List<ProfileAttrElementDto> 	profileAttrElementList;
	private List<ProfileAttrElementMapDto> 	profileAttrElementMapList;
	
	public int getProfileAttrId() {
		return profileAttrId;
	}
	public void setProfileAttrId(int profileAttrId) {
		this.profileAttrId = profileAttrId;
	}
	public String getProfileAttrName() {
		return profileAttrName;
	}
	public void setProfileAttrName(String profileAttrName) {
		this.profileAttrName = profileAttrName;
	}
	public String getCatId() {
		return catId;
	}
	public void setCatId(String catId) {
		this.catId = catId;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	public List<ProfileAttrElementDto> getProfileAttrElementList() {
		return profileAttrElementList;
	}
	public void setProfileAttrElementList(List<ProfileAttrElementDto> profileAttrElementList) {
		this.profileAttrElementList = profileAttrElementList;
	}
	
	public List<ProfileAttrElementMapDto> getProfileAttrElementMapList() {
		return profileAttrElementMapList;
	}
	public void setProfileAttrElementMapList(List<ProfileAttrElementMapDto> profileAttrElementMapList) {
		this.profileAttrElementMapList = profileAttrElementMapList;
	}

	@Override
	public String toString() {
		final StringBuffer sb = new StringBuffer("ProfileAttrDto{");
		sb.append("profileAttrId=").append(profileAttrId);
		sb.append(", profileAttrName='").append(profileAttrName).append('\'');
		sb.append(", catId='").append(catId).append('\'');
		sb.append(", createDate='").append(createDate).append('\'');
		sb.append(", createUserId='").append(createUserId).append('\'');
		sb.append(", profileAttrElementList=").append(profileAttrElementList);
		sb.append(", profileAttrElementMapList=").append(profileAttrElementMapList);
		sb.append('}');
		return sb.toString();
	}
}
