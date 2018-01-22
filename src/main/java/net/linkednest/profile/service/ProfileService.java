package net.linkednest.profile.service;

import net.linkednest.www.profile.dto.LeagueInfoDto;
import net.linkednest.www.profile.dto.ProfileAttrDto;
import net.linkednest.www.profile.dto.ProfileDto;
import net.linkednest.www.profile.dto.SearchProfileDto;

import java.util.List;

public interface ProfileService {
	public List<ProfileDto> getProfileInfos(ProfileDto profileInfo);
	public ProfileDto 		getProfileInfo(ProfileDto profileInfo);
	public List<ProfileDto> getSearchedProfileList(SearchProfileDto searchProfileDto);
	public int 				getSearchedProfileListCnt(SearchProfileDto searchProfileDto);
	public int 				addLeagueInfo(LeagueInfoDto leagueInfoDto);
	public List<LeagueInfoDto> getLeagueInfoList();
	public LeagueInfoDto 	getLeagueInfo(int leagueId);
	public List<ProfileAttrDto> getProfileAttrElementList(ProfileDto profileDto);
	public int addProfileInfos(ProfileDto profileDto);
	public int updateProfileInfos(ProfileDto profileDto);
}
