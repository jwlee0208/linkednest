package net.linkednest.profile.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("profile.profileAttrElementDto")
public class ProfileAttrElementDto extends ProfileAttrDto{

	private int 	profileAttrElementId;
	private int 	profileAttrId;
	private String 	profileAttrElementName;
	private String 	createDate;
	private String 	createUserId;
	private String 	modifyDate;
	private String 	modifyUserId;

	private List<ProfileAttrElementMapDto> profileAttrElementMapList;	
	
	public int getProfileAttrElementId() {
		return profileAttrElementId;
	}
	public void setProfileAttrElementId(int profileAttrElementId) {
		this.profileAttrElementId = profileAttrElementId;
	}
	public int getProfileAttrId() {
		return profileAttrId;
	}
	public void setProfileAttrId(int profileAttrId) {
		this.profileAttrId = profileAttrId;
	}
	public String getProfileAttrElementName() {
		return profileAttrElementName;
	}
	public void setProfileAttrElementName(String profileAttrElementName) {
		this.profileAttrElementName = profileAttrElementName;
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
	public String getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getModifyUserId() {
		return modifyUserId;
	}
	public void setModifyUserId(String modifyUserId) {
		this.modifyUserId = modifyUserId;
	}
	public List<ProfileAttrElementMapDto> getProfileAttrElementMapList() {
		return profileAttrElementMapList;
	}
	public void setProfileAttrElementMapList(List<ProfileAttrElementMapDto> profileAttrElementMapList) {
		this.profileAttrElementMapList = profileAttrElementMapList;
	}
	
	@Override
	public String toString() {
		return "ProfileAttrElementDto [profileAttrElementId=" + profileAttrElementId + ", profileAttrId="
				+ profileAttrId + ", profileAttrElementName=" + profileAttrElementName + ", createDate=" + createDate
				+ ", createUserId=" + createUserId + ", modifyDate=" + modifyDate + ", modifyUserId=" + modifyUserId
				+ ", profileAttrElementMapList=" + profileAttrElementMapList + "]";
	}
	
}
