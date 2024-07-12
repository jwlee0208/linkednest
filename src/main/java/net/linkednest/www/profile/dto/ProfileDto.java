package net.linkednest.www.profile.dto;


import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Alias("profile.profileDto")
public class ProfileDto {
	private int 	profileId;
	private String 	profileType;
	/*@NotEmpty(message = "not selected first category.")
	@NotNull(message = "not selected first category.")*/
	private String 	catId1;
	/*@NotEmpty(message = "not selected second category.")
	@NotNull(message = "not selected second category.")*/
	private String 	catId2;
	private String 	title;
	/*@NotEmpty(message = "Please, write your name.")
	@NotNull(message = "Please, write your name.")
	@Size(max = 50, message = "it's too long.")*/
	private String 	name;
	private MultipartFile profileImg;
	private String 	profileImgPath;
	/*@NotEmpty(message = "Please, write your introduce.")
	@NotNull(message = "Please, write your introduce.")*/
	private String 	introduce;
	private String 	createDate;
	private String  status;

	/**
	 * profile status mapping array
	 */
	private static final String[] STATUS_CODE = {"0", "1", "2", "3"};
	private static final String[] STATUS_VALUE = {"Temporary Saved", "Activation", "Disabled", "Finished"};

	/**
	 * 2nd category code mapping array
	 */
	private static final String[] CHILD_CATEGORY_CODE = {	"01010101", "01010102", "01010103", "01010104", "01010105", "01010106", "01010107", "01010108", "01010109", "01010110"
														, "01020101", "01020102", "01020103", "01020104", "01020105", "01020106", "01020107", "01020108", "01020109", "01020110", "01020111"	};
	private static final String[] CHILD_CATEGORY_VALUE = {"attr.position.p", "attr.position.cc", "attr.position.1b", "attr.position.2b", "attr.position.3b", "attr.position.ss", "attr.position.lf", "attr.position.cf", "attr.position.rf", "attr.position.dh"
														, "attr.position.gk", "attr.position.rb", "attr.position.lb", "attr.position.cb", "attr.position.cb", "attr.position.df", "attr.position.rw", "attr.position.mf", "attr.position.cf", "attr.position.ss", "attr.position.lw"};

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
	
	private List<ProfileStatFbGkDto>	profileStatFbGkList;
	// career dtolw
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
	public List<ProfileStatFbGkDto> getProfileStatFbGkList() {
		return profileStatFbGkList;
	}
	public void setProfileStatFbGkList(List<ProfileStatFbGkDto> profileStatFbGkList) {
		this.profileStatFbGkList = profileStatFbGkList;
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

	public String getStatus() {
		return StringUtils.replaceEach(status, STATUS_CODE, STATUS_VALUE);
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCatId2Val() {
		return StringUtils.replaceEach(this.catId2, CHILD_CATEGORY_CODE, CHILD_CATEGORY_VALUE);
	}

	@Override
	public String toString() {
		final StringBuffer sb = new StringBuffer("ProfileDto{");
		sb.append("profileId=").append(profileId);
		sb.append(", profileType='").append(profileType).append('\'');
		sb.append(", catId1='").append(catId1).append('\'');
		sb.append(", catId2='").append(catId2).append('\'');
		sb.append(", title='").append(title).append('\'');
		sb.append(", name='").append(name).append('\'');
		sb.append(", profileImg=").append(profileImg);
		sb.append(", profileImgPath='").append(profileImgPath).append('\'');
		sb.append(", introduce='").append(introduce).append('\'');
		sb.append(", createDate='").append(createDate).append('\'');
		sb.append(", status='").append(status).append('\'');
		sb.append(", profilePlayerDto=").append(profilePlayerDto);
		sb.append(", leagueInfoDto=").append(leagueInfoDto);
		sb.append(", profileTeamDto=").append(profileTeamDto);
		sb.append(", profileContactInfoDto=").append(profileContactInfoDto);
		sb.append(", profileStatHitterList=").append(profileStatHitterList);
		sb.append(", profileStatFielderList=").append(profileStatFielderList);
		sb.append(", profileStatPitcherList=").append(profileStatPitcherList);
		sb.append(", profileCareerList=").append(profileCareerList);
		sb.append(", profileAttrList=").append(profileAttrList);
		sb.append(", profileStreamList=").append(profileStreamList);
		sb.append(", profileAttrElementMapList=").append(profileAttrElementMapList);
		sb.append('}');
		return sb.toString();
	}
}
