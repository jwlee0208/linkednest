package net.linkednest.www.profile.service;

import net.linkednest.www.profile.dto.*;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface ProfileService {
	public List<ProfileDto> getProfileInfos(ProfileDto profileInfo);
	public ProfileDto 		getProfileInfo(ProfileDto profileInfo);
	public List<ProfileDto> getSearchedProfileList(SearchProfileDto searchProfileDto);
	public int 				getSearchedProfileListCnt(SearchProfileDto searchProfileDto);
	public int 				addLeagueInfo(LeagueInfoDto leagueInfoDto);
	public List<LeagueInfoDto> getLeagueInfoList();
	public LeagueInfoDto 	getLeagueInfo(int leagueId);
	public void sendMailProfile(ProfileDto profileInfo, HttpSession session, ProfileMailReq request);
	public List<ProfileAttrDto> getProfileAttrElementList(ProfileDto profileDto);
	public int addProfileInfos(ProfileDto profileDto);
	public int updateProfileInfos(ProfileDto profileDto);
}
