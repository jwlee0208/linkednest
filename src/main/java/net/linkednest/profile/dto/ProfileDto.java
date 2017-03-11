package net.linkednest.profile.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("profile.profileDto")
public class ProfileDto {
	private int 	profileId;
	private String 	profileType;
	private String 	catId1;
	private String 	catId2;
	private String 	title;
	private String 	name;
	private MultipartFile profileImg;
	private String 	profileImgPath;
	private String 	introduce;
	private String 	createDate;
	
	// player profile dto
	private ProfilePlayerDto 		profilePlayerDto;
	// league Info Dto 
	private LeagueInfoDto 			leagueInfoDto;
	// team profile dto
	private ProfileTeamDto 			profileTeamDto;
	// contact info dto
	private ProfileContactInfoDto 	profileContactInfoDto;
	// stat dto 
	private List<ProfileStatHitterDto>	profileStatHitterList;
	
	private List<ProfileStatFielderDto>	profileStatFielderList;
	
	private List<ProfileStatPitcherDto>	profileStatPitcherList;
	// career dto
	private List<ProfileCareerDto>  profileCareerList;
	// attribute & element map dto
	private List<ProfileAttrDto> 	profileAttrList;
	
	private List<ProfileStreamDto>	profileStreamList;

	// attribute & element map dto
	private List<ProfileAttrElementMapDto> 	profileAttrElementMapList;

	public int getProfileId() {
		return profileId;
	}
	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}
	public String getProfileType() {
		return profileType;
	}
	public void setProfileType(String profileType) {
		this.profileType = profileType;
	}
	public String getCatId1() {
		return catId1;
	}
	public void setCatId1(String catId1) {
		this.catId1 = catId1;
	}
	public String getCatId2() {
		return catId2;
	}
	public void setCatId2(String catId2) {
		this.catId2 = catId2;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public MultipartFile getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(MultipartFile profileImg) {
		this.profileImg = profileImg;
	}
	public String getProfileImgPath() {
		return profileImgPath;
	}
	public void setProfileImgPath(String profileImgPath) {
		this.profileImgPath = profileImgPath;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public ProfilePlayerDto getProfilePlayerDto() {
		return profilePlayerDto;
	}
	public void setProfilePlayerDto(ProfilePlayerDto profilePlayerDto) {
		this.profilePlayerDto = profilePlayerDto;
	}
	public ProfileTeamDto getProfileTeamDto() {
		return profileTeamDto;
	}
	public void setProfileTeamDto(ProfileTeamDto profileTeamDto) {
		this.profileTeamDto = profileTeamDto;
	}	
	public ProfileContactInfoDto getProfileContactInfoDto() {
		return profileContactInfoDto;
	}
	public void setProfileContactInfoDto(ProfileContactInfoDto profileContactInfoDto) {
		this.profileContactInfoDto = profileContactInfoDto;
	}

	public List<ProfileAttrDto> getProfileAttrList() {
		return profileAttrList;
	}
	public void setProfileAttrList(List<ProfileAttrDto> profileAttrList) {
		this.profileAttrList = profileAttrList;
	}
	public LeagueInfoDto getLeagueInfoDto() {
		return leagueInfoDto;
	}
	public void setLeagueInfoDto(LeagueInfoDto leagueInfoDto) {
		this.leagueInfoDto = leagueInfoDto;
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
	public List<ProfileStatPitcherDto> getProfileStatPitcherList() {
		return profileStatPitcherList;
	}
	public void setProfileStatPitcherList(List<ProfileStatPitcherDto> profileStatPitcherList) {
		this.profileStatPitcherList = profileStatPitcherList;
	}
	public List<ProfileCareerDto> getProfileCareerList() {
		return profileCareerList;
	}
	public void setProfileCareerList(List<ProfileCareerDto> profileCareerList) {
		this.profileCareerList = profileCareerList;
	}
	
	public List<ProfileStreamDto> getProfileStreamList() {
		return profileStreamList;
	}
	public void setProfileStreamList(List<ProfileStreamDto> profileStreamList) {
		this.profileStreamList = profileStreamList;
	}	
	public List<ProfileAttrElementMapDto> getProfileAttrElementMapList() {
		return profileAttrElementMapList;
	}
	public void setProfileAttrElementMapList(List<ProfileAttrElementMapDto> profileAttrElementMapList) {
		this.profileAttrElementMapList = profileAttrElementMapList;
	}
	@Override
	public String toString() {
		return "ProfileDto [profileId=" + profileId + ", profileType=" + profileType + ", catId1=" + catId1
				+ ", catId2=" + catId2 + ", title=" + title + ", name=" + name + ", profileImg=" + profileImg
				+ ", profileImgPath=" + profileImgPath + ", introduce=" + introduce + ", createDate=" + createDate
				+ ", profilePlayerDto=" + profilePlayerDto + ", leagueInfoDto=" + leagueInfoDto + ", profileTeamDto="
				+ profileTeamDto + ", profileContactInfoDto=" + profileContactInfoDto + ", profileStatHitterList="
				+ profileStatHitterList + ", profileStatFielderList=" + profileStatFielderList
				+ ", profileStatPitcherList=" + profileStatPitcherList + ", profileCareerList=" + profileCareerList
				+ ", profileAttrList=" + profileAttrList + ", profileStreamList=" + profileStreamList
				+ ", profileAttrElementMapList=" + profileAttrElementMapList + "]";
	}

}
