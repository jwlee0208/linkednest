package net.linkednest.www.profile.dto;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("profile.profileStatDto")
public class ProfileStatDto {
	private int 	statId;
	private int 	profileId;
	private String 	statType;
	private Date 	createDate;
	private String 	createUserId;
	
	private List<ProfileStatPitcherDto> profileStatPitcherList 	= null;
	private List<ProfileStatHitterDto> 	profileStatHitterList 	= null;
	private List<ProfileStatFielderDto> profileStatFielderList 	= null;
	
	public int getStatId() {
		return statId;
	}
	public void setStatId(int statId) {
		this.statId = statId;
	}
	public int getProfileId() {
		return profileId;
	}
	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}
	public String getStatType() {
		return statType;
	}
	public void setStatType(String statType) {
		this.statType = statType;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}

	public List<ProfileStatPitcherDto> getProfileStatPitcherList() {
		return profileStatPitcherList;
	}
	public void setProfileStatPitcherList(List<ProfileStatPitcherDto> profileStatPitcherList) {
		this.profileStatPitcherList = profileStatPitcherList;
	}
	public List<ProfileStatHitterDto> getProfileStatHitterList() {
		return profileStatHitterList;
	}
	public void setProfileStatHitterList(List<ProfileStatHitterDto> profileStatHitterList) {
		this.profileStatHitterList = profileStatHitterList;
	}
	public List<ProfileStatFielderDto> getProfileStatFielderList() {
		return profileStatFielderList;
	}
	public void setProfileStatFielderList(List<ProfileStatFielderDto> profileStatFielderList) {
		this.profileStatFielderList = profileStatFielderList;
	}

	@Override
	public String toString() {
		final StringBuffer sb = new StringBuffer("ProfileStatDto{");
		sb.append("statId=").append(statId);
		sb.append(", profileId=").append(profileId);
		sb.append(", statType='").append(statType).append('\'');
		sb.append(", createDate=").append(createDate);
		sb.append(", createUserId='").append(createUserId).append('\'');
		sb.append(", profileStatPitcherList=").append(profileStatPitcherList);
		sb.append(", profileStatHitterList=").append(profileStatHitterList);
		sb.append(", profileStatFielderList=").append(profileStatFielderList);
		sb.append('}');
		return sb.toString();
	}
}
