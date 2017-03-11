package net.linkednest.profile.dto;

import org.apache.ibatis.type.Alias;

@Alias("profile.profileTeamDto")
public class ProfileTeamDto extends ProfileDto{
	private int 	profileTeamId;
	private int		leagueId;
	private String  city;
	private String 	establishedDate;
	private String  createDate;
	private String  createUserId;
	
	public int getProfileTeamId() {
		return profileTeamId;
	}
	public void setProfileTeamId(int profileTeamId) {
		this.profileTeamId = profileTeamId;
	}
	public int getLeagueId() {
		return leagueId;
	}
	public void setLeagueId(int leagueId) {
		this.leagueId = leagueId;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getEstablishedDate() {
		return establishedDate;
	}
	public void setEstablishedDate(String establishedDate) {
		this.establishedDate = establishedDate;
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
	@Override
	public String toString() {
		return "ProfileTeamDto [profileTeamId=" + profileTeamId + ", leagueId=" + leagueId + ", city=" + city
				+ ", establishedDate=" + establishedDate + ", createDate=" + createDate + ", createUserId="
				+ createUserId + "]";
	}
	
}
