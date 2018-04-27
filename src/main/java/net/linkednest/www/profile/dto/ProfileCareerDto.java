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
		final StringBuffer sb = new StringBuffer("ProfileCareerDto{");
		sb.append("careerId=").append(careerId);
		sb.append(", profileId=").append(profileId);
		sb.append(", careerTitle='").append(careerTitle).append('\'');
		sb.append(", careerDescription='").append(careerDescription).append('\'');
		sb.append(", startDate='").append(startDate).append('\'');
		sb.append(", endDate='").append(endDate).append('\'');
		sb.append(", careerStatus='").append(careerStatus).append('\'');
		sb.append(", careerSeq=").append(careerSeq);
		sb.append(", createDate='").append(createDate).append('\'');
		sb.append(", createUserId='").append(createUserId).append('\'');
		sb.append(", modifyDate='").append(modifyDate).append('\'');
		sb.append(", modifyUserId='").append(modifyUserId).append('\'');
		sb.append('}');
		return sb.toString();
	}
}
