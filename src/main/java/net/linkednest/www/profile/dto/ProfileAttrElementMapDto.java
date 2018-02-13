package net.linkednest.www.profile.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import org.apache.ibatis.type.Alias;


@Alias("profile.profileAttrElementMapDto")
public class ProfileAttrElementMapDto extends ProfileAttrElementDto{

	private int 	profileAttrElementMapId;
	private int 	profileId;
	private int 	profileAttrId;
	private String	profileAttrName;
	private int 	profileAttrElementId;
	private String 	profileAttrElementName;
	private String 	profileAttrElementMapName;
	private String 	createDate;
	private String 	createUserId;
	private String 	modifyDate;
	private String 	modifyUserId;
	
	public int getProfileAttrElementMapId() {
		return profileAttrElementMapId;
	}
	public void setProfileAttrElementMapId(int profileAttrElementMapId) {
		this.profileAttrElementMapId = profileAttrElementMapId;
	}
	public int getProfileId() {
		return profileId;
	}
	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}
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
	public int getProfileAttrElementId() {
		return profileAttrElementId;
	}
	public void setProfileAttrElementId(int profileAttrElementId) {
		this.profileAttrElementId = profileAttrElementId;
	}	
	public String getProfileAttrElementName() {
		return profileAttrElementName;
	}
	public void setProfileAttrElementName(String profileAttrElementName) {
		this.profileAttrElementName = profileAttrElementName;
	}
	public String getProfileAttrElementMapName() {
		return profileAttrElementMapName;
	}
	public void setProfileAttrElementMapName(String profileAttrElementMapName) {
		this.profileAttrElementMapName = profileAttrElementMapName;
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

	@Override
	public String toString() {
		final StringBuffer sb = new StringBuffer("ProfileAttrElementMapDto{");
		sb.append("profileAttrElementMapId=").append(profileAttrElementMapId);
		sb.append(", profileId=").append(profileId);
		sb.append(", profileAttrId=").append(profileAttrId);
		sb.append(", profileAttrName='").append(profileAttrName).append('\'');
		sb.append(", profileAttrElementId=").append(profileAttrElementId);
		sb.append(", profileAttrElementName='").append(profileAttrElementName).append('\'');
		sb.append(", profileAttrElementMapName='").append(profileAttrElementMapName).append('\'');
		sb.append(", createDate='").append(createDate).append('\'');
		sb.append(", createUserId='").append(createUserId).append('\'');
		sb.append(", modifyDate='").append(modifyDate).append('\'');
		sb.append(", modifyUserId='").append(modifyUserId).append('\'');
		sb.append('}');
		return sb.toString();
	}
}
