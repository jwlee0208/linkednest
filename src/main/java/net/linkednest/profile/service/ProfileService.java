package net.linkednest.profile.service;

import java.util.List;

import net.linkednest.profile.dto.LeagueInfoDto;
import net.linkednest.profile.dto.ProfileAttrDto;
import net.linkednest.profile.dto.ProfileDto;
import net.linkednest.profile.dto.SearchProfileDto;

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
