package net.linkednest.www.profile.dao;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import net.linkednest.www.profile.dto.LeagueInfoDto;
import net.linkednest.www.profile.dto.ProfileAttrDto;
import net.linkednest.www.profile.dto.ProfileAttrElementMapDto;
import net.linkednest.www.profile.dto.ProfileCareerDto;
import net.linkednest.www.profile.dto.ProfileContactInfoDto;
import net.linkednest.www.profile.dto.ProfileDto;
import net.linkednest.www.profile.dto.ProfilePlayerDto;
import net.linkednest.www.profile.dto.ProfileStatFielderDto;
import net.linkednest.www.profile.dto.ProfileStatHitterDto;
import net.linkednest.www.profile.dto.ProfileStatPitcherDto;
import net.linkednest.www.profile.dto.ProfileStreamDto;
import net.linkednest.www.profile.dto.ProfileTeamDto;
import net.linkednest.www.profile.dto.SearchProfileDto;

@Repository("profileDao")
public class ProfileDao extends SqlSessionDaoSupport{
	
	/**
	 * @brief 프로파일 정보 목록 조회
	 * @param params
	 * @return List<ProfileDto>
	 */
	public List<ProfileDto> selectProfileInfos(ProfileDto params) {
		return getSqlSession().selectList("sql.profile.selectProfileInfo", params);
	}
	/**
	 * @brief 프로파일 정보 조회
	 * @param params
	 * @return ProfileDto
	 */
	public ProfileDto selectProfileInfo(ProfileDto params) {
		return getSqlSession().selectOne("sql.profile.selectProfileInfo", params);
	}	
	/**
	 * @brief 프로파일 목록 검색 조회
	 * @param params
	 * @return List<ProfileDto>
	 */
	public List<ProfileDto> selectSearchedProfileList(SearchProfileDto params) {
		return getSqlSession().selectList("sql.profile.selectSearchedProfileList", params);
	}
	/**
	 * @brief 프로파일 목록 검색 갯수 조회
	 * @param params
	 * @return int
	 */
	public int selectSearchedProfileListCnt(SearchProfileDto params){
		return getSqlSession().selectOne("sql.profile.selectSearchedProfileListCount", params);
	}
	/**
	 * @brief 프로필 검색 목록 화면에서 리스트 필터링을 위한 속성 목록 조회
	 * @param params
	 * @return List<ProfileAttrDto>
	 */
	public List<ProfileAttrDto> selectProfileAttrElementList(ProfileDto params) {
		return getSqlSession().selectList("sql.profile.selectSearchAttrElementList", params);
	}
	
	/**
	 * @brief insert profileInfo
	 * @param param
	 * @return (int)profileId
	 */
	public int insertProfileInfo(ProfileDto param){
		int insertResult = getSqlSession().insert("sql.profile.insertProfileInfo", param);
		int profileId = 0;
    	if(insertResult > 0){
    		profileId = param.getProfileId();
    	}
    	return profileId;
	}
	/**
	 * @brief update profileInfo
	 * @param param
	 * @return
	 */
	public int updateProfileInfo(ProfileDto param) {
		if (StringUtils.isNotEmpty(param.getProfileImgPath())) {
			param.setProfileImgPath(StringUtils.trim(StringUtils.replace(param.getProfileImgPath(), ",", "")));
		}
		return getSqlSession().update("sql.profile.updateProfileInfo", param);
	}

	/**
	 * @brief insert profilePlayerInfo 
	 * @param param
	 * @return int
	 */
	public int insertProfilePlayerInfo(ProfilePlayerDto param){
		return getSqlSession().insert("sql.profile.insertProfilePlayerInfo", param);
	}

	public int updateProfilePlayerInfo(ProfilePlayerDto param){
		return getSqlSession().update("sql.profile.updateProfilePlayerInfo", param);
	}	
	
	public int insertProfileContactInfo(ProfileContactInfoDto param){
		return getSqlSession().insert("sql.profile.insertProfileContactInfo", param);
	}

	public int updateProfileContactInfo(ProfileContactInfoDto param){
		return getSqlSession().update("sql.profile.insertProfileContactInfo", param);
	}

	public int insertProfileStatFielderInfo(ProfileStatFielderDto param){
		return getSqlSession().insert("sql.profile.insertProfileStatFielderInfo", param);
	}
	
	public int insertProfileStatHitterInfo(ProfileStatHitterDto param){
		return getSqlSession().insert("sql.profile.insertProfileStatHitterInfo", param);
	}
	
	public int insertProfileStatPitcherInfo(ProfileStatPitcherDto param){
		return getSqlSession().insert("sql.profile.insertProfileStatPitcherInfo", param);
	}
	
	public int insertProfileStreamInfo(ProfileStreamDto param){
		return getSqlSession().insert("sql.profile.insertProfileStreamInfo", param);
	}
	
	public int insertProfileAttrElemMapInfo(ProfileAttrElementMapDto param){
		return getSqlSession().insert("sql.profile.insertProfileAttrElemMapInfo", param);
	}
	
	public int insertProfileCareerInfo(ProfileCareerDto param){
		return getSqlSession().insert("sql.profile.insertProfileCareerInfo", param);
	}

	public int deleteProfileStatFielderInfo(int param){
		return getSqlSession().delete("sql.profile.deleteProfileStatFielderInfo", param);
	}
	
	public int deleteProfileStatHitterInfo(int param){
		return getSqlSession().delete("sql.profile.deleteProfileStatHitterInfo", param);
	}
	
	public int deleteProfileStatPitcherInfo(int param){
		ProfileStatPitcherDto profileStatPitcherDto = new ProfileStatPitcherDto();
		profileStatPitcherDto.setProfileId(param);
		return getSqlSession().delete("sql.profile.deleteProfileStatPitcherInfo", profileStatPitcherDto);
	}
	
	public int deleteProfileStreamInfo(int param){
		return getSqlSession().delete("sql.profile.deleteProfileStreamInfo", param);
	}
	
	public int deleteProfileAttrElemMapInfo(int param){
		return getSqlSession().delete("sql.profile.deleteProfileAttrElemMapInfo", param);
	}
	
	public int deleteProfileCareerInfo(int param){
		ProfileCareerDto profileCareerDto = new ProfileCareerDto();
		profileCareerDto.setProfileId(param);
		return getSqlSession().delete("sql.profile.deleteProfileCareerInfo", profileCareerDto);
	}
	
	
	public int insertLeagueInfo(LeagueInfoDto param){
		return getSqlSession().insert("sql.profile.insertLeagueInfo", param);
	}
	
	public int insertProfileTeamInfo(ProfileTeamDto param){
		return getSqlSession().insert("sql.profile.insertProfileTeamInfo", param);
	}

	public int updateProfileTeamInfo(ProfileTeamDto param){
		return getSqlSession().insert("sql.profile.updateProfileTeamInfo", param);
	}

	public List<LeagueInfoDto> selectLeagueInfoList(){
		return getSqlSession().selectList("sql.profile.selectLeagueInfoList");
	}

	public List<LeagueInfoDto> selectLeagueInfoList(LeagueInfoDto leagueInfoDto){
		return getSqlSession().selectList("sql.profile.selectLeagueInfoListByCatId", leagueInfoDto);
	}
	
	public LeagueInfoDto selectLeagueInfo(LeagueInfoDto param){
		return getSqlSession().selectOne("sql.profile.selectLeagueInfo", param);
	}
}
