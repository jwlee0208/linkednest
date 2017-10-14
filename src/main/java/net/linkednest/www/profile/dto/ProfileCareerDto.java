package net.linkednest.www.profile.dto;

import org.apache.ibatis.type.Alias;

@Alias("profile.profileCareerDto")
public class ProfileCareerDto {
	private int careerId;
	private int profileId;
	private String careerTitle;
	private String careerDescription;
	private String startDate;
	private String endDate;
	private String careerStatus;
	private int	   careerSeq;
	private String createDate;
	private String createUserId;
	private String modifyDate;
	private String modifyUserId;
	public int getCareerId() {
		return careerId;
	}
	public void setCareerId(int careerId) {
		this.careerId = careerId;
	}
	public int getProfileId() {
		return profileId;
	}
	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}
	public String getCareerTitle() {
		return careerTitle;
	}
	public void setCareerTitle(String careerTitle) {
		this.careerTitle = careerTitle;
	}
	public String getCareerDescription() {
		return careerDescription;
	}
	public void setCareerDescription(String careerDescription) {
		this.careerDescription = careerDescription;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getCareerStatus() {
		return careerStatus;
	}
	public void setCareerStatus(String careerStatus) {
		this.careerStatus = careerStatus;
	}
	public int getCareerSeq() {
		return careerSeq;
	}
	public void setCareerSeq(int careerSeq) {
		this.careerSeq = careerSeq;
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
		return "ProfileCareerDto [careerId=" + careerId + ", profileId=" + profileId + ", careerTitle=" + careerTitle
				+ ", careerDescription=" + careerDescription + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", careerStatus=" + careerStatus + ", careerSeq=" + careerSeq + ", createDate=" + createDate
				+ ", createUserId=" + createUserId + ", modifyDate=" + modifyDate + ", modifyUserId=" + modifyUserId
				+ "]";
	}
	
}
