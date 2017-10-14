package net.linkednest.www.profile.service;

import java.util.List;

import net.linkednest.www.profile.dto.LeagueInfoDto;
import net.linkednest.www.profile.dto.ProfileDto;
import net.linkednest.www.profile.dto.SearchProfileDto;

public interface ProfileService {
	public List<ProfileDto> getProfileInfos(ProfileDto profileInfo);
	public ProfileDto 		getProfileInfo(ProfileDto profileInfo);
	public List<ProfileDto> getSearchedProfileList(SearchProfileDto searchProfileDto);
	public int 				getSearchedProfileListCnt(SearchProfileDto searchProfileDto);
	public int 				addLeagueInfo(LeagueInfoDto leagueInfoDto);
	public List<LeagueInfoDto> getLeagueInfoList();
	public LeagueInfoDto 	getLeagueInfo(int leagueId);
}
