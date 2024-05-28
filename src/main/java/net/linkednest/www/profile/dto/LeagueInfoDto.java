package net.linkednest.www.profile.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("profile.leagueInfoDto")
public class LeagueInfoDto {
	private int leagueId;
	private MultipartFile	leagueImg;
	private String leagueImgPath;
	private String leagueType;
	private String leagueName;
	private String leagueDivision;
	private String introduce;
	private String commissioner;
	private String leagueWebsiteUrl;
	private int joinedTeamCnt;
	private String area;
	private String country;
	private String establishedDate;
	private String createDate;
	private String createUserId;
	private String catId;
	
	List<ProfileDto> teamList;
	
	public int getLeagueId() {
		return leagueId;
	}
	public void setLeagueId(int leagueId) {
		this.leagueId = leagueId;
	}
	
	public MultipartFile getLeagueImg() {
		return leagueImg;
	}
	public void setLeagueImg(MultipartFile leagueImg) {
		this.leagueImg = leagueImg;
	}
	public String getLeagueImgPath() {
		return leagueImgPath;
	}
	public void setLeagueImgPath(String leagueImgPath) {
		this.leagueImgPath = leagueImgPath;
	}
	public String getLeagueType() {
		return leagueType;
	}
	public void setLeagueType(String leagueType) {
		this.leagueType = leagueType;
	}
	public String getLeagueName() {
		return leagueName;
	}
	public void setLeagueName(String leagueName) {
		this.leagueName = leagueName;
	}
	public String getLeagueDivision() {
		return leagueDivision;
	}
	public void setLeagueDivision(String leagueDivision) {
		this.leagueDivision = leagueDivision;
	}
	public String getCommissioner() {
		return commissioner;
	}
	public void setCommissioner(String commissioner) {
		this.commissioner = commissioner;
	}
	public String getLeagueWebsiteUrl() {
		return leagueWebsiteUrl;
	}
	public void setLeagueWebsiteUrl(String leagueWebsiteUrl) {
		this.leagueWebsiteUrl = leagueWebsiteUrl;
	}
	public int getJoinedTeamCnt() {
		return joinedTeamCnt;
	}
	public void setJoinedTeamCnt(int joinedTeamCnt) {
		this.joinedTeamCnt = joinedTeamCnt;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
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
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public List<ProfileDto> getTeamList() {
		return teamList;
	}
	public void setTeamList(List<ProfileDto> teamList) {
		this.teamList = teamList;
	}
	public String getCatId() {
		return catId;
	}
	public void setCatId(String catId) {
		this.catId = catId;
	}
	@Override
	public String toString() {
		return "LeagueInfoDto [leagueId=" + leagueId + ", leagueImg=" + leagueImg + ", leagueImgPath=" + leagueImgPath
				+ ", leagueType=" + leagueType + ", leagueName=" + leagueName + ", leagueDivision=" + leagueDivision
				+ ", introduce=" + introduce + ", commissioner=" + commissioner + ", leagueWebsiteUrl="
				+ leagueWebsiteUrl + ", joinedTeamCnt=" + joinedTeamCnt + ", area=" + area + ", country=" + country
				+ ", establishedDate=" + establishedDate + ", createDate=" + createDate + ", createUserId="
				+ createUserId + ", catId=" + catId + ", teamList=" + teamList + "]";
	}
}
