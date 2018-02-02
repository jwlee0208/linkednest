<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag"%>
<h3>Personal Information</h3>
<hr />
<%--
<div class="form-group row">
	<label class="col-2 col-form-label" for="profileImg">Profile Image</label>
	<div class="col-10">
		<input type="file" class="form-control" id="profileImg" name="profileImg" placeholder="upload your profile image"/>
	</div>
</div>
--%>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="name">Name</label>
	<div class="col-10">
		<input type="text" class="form-control" id="name" name="name" placeholder="write your name" />
		<span name="nameErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="catId2">Main Position</label>
	<div class="col-10">
		<input type="hidden" id="catId1" name="catId1" value="01010100" />
		<select id="catId2" name="catId2" class="form-control">
			<option value="">::: select your main position :::</option>
			<option value="01010101">Pitcher</option>
			<option value="01010102">Catcher</option>
			<option value="01010103">First Base</option>
			<option value="01010104">Second Base</option>
			<option value="01010105">Third Base</option>
			<option value="01010106">Short Stop</option>
			<option value="01010107">Left Fielder</option>
			<option value="01010108">Center Fielder</option>
			<option value="01010109">Right Fielder</option>
			<option value="01010110">DH</option>
		</select>
		<span name="catId2Err" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="height">Height (cm)</label>
	<div class="col-4">
		<input type="text" class="form-control" id="height" name="profilePlayerDto.height" aria-describedby="heightHelpInline" value="0"/>
		<small id="heightHelpInline" class="text-muted">Allow digit and '.'</small>
		<span name="heightErr" class="errorMsg" style="display: none;"></span>
	</div>
	<label class="col-2 col-form-label" for="weight">Weight (kg)</label>
	<div class="col-4">
		<input type="text" class="form-control" id="weight" name="profilePlayerDto.weight" aria-describedby="weightHelpInline" value="0"/>
		<small id="weightHelpInline" class="text-muted">Allow digit and '.'</small>
		<span name="weightErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="birthDate">Date Of Birth</label>
	<div class="col-10">
		<input type="date" class="form-control" id="birthDate" name="profilePlayerDto.birthDate" aria-describedby="birthDateHelpInline"/>
		<small id="birthDateHelpInline" class="text-muted">YYYY-MM-DD</small>
		<span name="profilePlayerDto_birthDateErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="birthPlace">Birth Place</label>
	<div class="col-10">
		<input type="text" class="form-control" id="birthPlace" name="profilePlayerDto.birthPlace" />
		<span name="profilePlayerDto_birthPlaceErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="education">Education</label>
	<div class="col-10">
		<textarea class="form-control" id="education" name="profilePlayerDto.education"></textarea>
		<span name="profilePlayerDto_educationErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="hobbies">Hobbies</label>
	<div class="col-10">
		<input type="text" class="form-control" id="hobbies" name="profilePlayerDto.hobbies" />
		<span name="profilePlayerDto_hobbiesErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="favoriteFood">Favorite Foods</label>
	<div class="col-10">
		<input type="text" class="form-control" id="favoriteFood" name="profilePlayerDto.favoriteFood" />
		<span name="profilePlayerDto_favoriteFoodErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label for="language" class="col-sm-2 control-label"><tag:message code="common.language"/></label>
	<div class="col-sm-4">
		<select class="form-control" id="language" name="profilePlayerDto.language">
			<option value=""><tag:message code="select.language"/></option>
			<c:if test="${!empty languageList}">
				<c:forEach var="langInfo" items="${languageList}">
					<option value="${langInfo.codeValue}">${langInfo.codeName}</option>
				</c:forEach>
			</c:if>
		</select>
		<span name="profilePlayerDto_languageErr" class="errorMsg" style="display: none;"></span>
	</div>

	<label for="nationality" class="col-sm-2 control-label"><tag:message code="common.nationality"/></label>
	<div class="col-sm-4">
		<select class="form-control" id="nationality" name="profilePlayerDto.nationality">
			<option value=""><tag:message code="select.nationality"/></option>
			<c:if test="${!empty nationList}">
				<c:forEach var="nationInfo" items="${nationList}">
					<option value="${nationInfo.codeValue}">${nationInfo.codeName}</option>
				</c:forEach>
			</c:if>
		</select>
		<span name="profilePlayerDto_nationalityErr" class="errorMsg" style="display: none;"></span>
	</div>
	<%--<label class="col-2 col-form-label" for="languageSearch" >Language</label>
	<div class="col-4">
		<input type="text" class="form-control" id="languageSearch" />
		<input type="hidden" class="form-control" id="language" name="profilePlayerDto.language" />
	</div>--%>

	<%--<label class="col-2 col-form-label" for="nationalitySearch" >Nationality</label>
	<div class="col-4">
		<input type="text" class="form-control" id="nationalitySearch" />
		<input type="hidden" class="form-control" id="nationality" name="profilePlayerDto.nationality" />
	</div>--%>
</div>
<br />
<div class="form-group row" for="introduce" >
	<label class="col-2 col-form-label">Introduce</label>
	<div class="col-10">
		<textarea class="form-control tinymce" id="introduce" name="introduce"></textarea>
		<span id="introduceErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<h3>Player Information</h3>
<hr />
<c:set var="profileAttrList" value="${profileAttrList}"/>
<c:if test="${!empty profileAttrList}">
	<c:set var="rowCnt" value="${0}" />
	<c:forEach var="profileAttrInfo" items="${profileAttrList}">
		<div class="form-group row">
			<label class="col-2 col-form-label"><tag:message code='text.${profileAttrInfo.profileAttrName}'/></label>
			<div class="col-10">
				<div class="form-group row">
					<c:set var="profileAttrElemList" value="${profileAttrInfo.profileAttrElementList}" />
					<c:if test="${!empty profileAttrElemList}">
						<c:forEach var="profileAttrElemInfo" items="${profileAttrElemList}" varStatus="index">
					<label class="form-check-label" for="profileAttrElementMapList[${rowCnt}].profileAttrElementId">
							<input type="hidden" name="profileAttrElementMapList[${rowCnt}].profileAttrId" value="${profileAttrInfo.profileAttrId}" />
							<input type="hidden" name="profileAttrElementMapList[${rowCnt}].profileAttrName" value='<c:out value="${profileAttrInfo.profileAttrName}"/>' />
							<input type="hidden" name="profileAttrElementMapList[${rowCnt}].profileAttrElementName" value="${profileAttrElemInfo.profileAttrElementName}">
							<input type="checkbox" id="profileAttrElementMapList[${rowCnt}].profileAttrElementId" name="profileAttrElementMapList[${rowCnt}].profileAttrElementId" aria-label="Checkbox for following text input" value="${profileAttrElemInfo.profileAttrElementId}">
							<tag:message code='attr.${profileAttrInfo.profileAttrName}.${profileAttrElemInfo.profileAttrElementName}' />
							<input type="hidden" class="form-control" aria-label="Text input with checkbox"
								   name="profileAttrElementMapList[${rowCnt}].profileAttrElementMapName"
								   value="<tag:message code='attr.${profileAttrInfo.profileAttrName}.${profileAttrElemInfo.profileAttrElementName}'/>"/>
							<c:set var="rowCnt" value="${rowCnt+1}" />
					</label>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</c:forEach>
</c:if>
<br/>
<h3>Contact Info.</h3>
<hr />
<div class="form-group row">
	<label class="col-2 col-form-label" for="email">Email</label>
	<div class="col-10">
		<input type="email" class="form-control" id="email" name="profileContactInfoDto.email" placeholder="write your e-mail" />
		<span name="profileContactInfoDto_emailErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="phoneNo">Phone No.</label>
	<div class="col-10">
		<input type="tel" class="form-control" id="phoneNo" name="profileContactInfoDto.phoneNo" placeholder="write your phone No." />
		<span name="profileContactInfoDto_phoneNoErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="cellPhoneNo">cellPhoneNo</label>
	<div class="col-10">
		<input type="tel" class="form-control" id="cellPhoneNo" name="profileContactInfoDto.cellPhoneNo" placeholder="write your cell phone No." />
		<span name="profileContactInfoDto_cellPhoneNoErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="websiteUrl">website url</label>
	<div class="col-10">
		<input type="url" class="form-control" id="websiteUrl" name="profileContactInfoDto.websiteUrl" placeholder="write your website url" aria-describedby="basic-addon3" />
		<span name="profileContactInfoDto_websiteUrlErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="facebookUrl">facebook</label>
	<div class="col-10">
		<input type="text" class="form-control" id="facebookUrl" name="profileContactInfoDto.faceebookUrl" placeholder="write your facebook id" />
		<span name="profileContactInfoDto_faceebookUrlErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="twitterUrl">twitter</label>
	<div class="col-10">
		<input type="text" class="form-control" id="twitterUrl" name="profileContactInfoDto.twitterUrl" placeholder="write your twitter id" />
		<span name="profileContactInfoDto_twitterUrlErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="instagramUrl">instagram</label>
	<div class="col-10">
		<input type="text" class="form-control" id="instagramUrl" name="profileContactInfoDto.instagramUrl" placeholder="write your instagram id" />
		<span name="profileContactInfoDto_instagramUrlErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="address">Address</label>
	<div class="col-10">
		<input type="text" class="form-control" id="address" name="profileContactInfoDto.address" placeholder="write your address" />
		<span name="profileContactInfoDto_addressErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<h3>Career</h3>
<hr />
<div class="form-group row">
	<label class="col-1 col-form-label" for="careerTitle">Title</label>
	<div class="col-2">
		<input type="text" class="form-control" id="careerTitle" name="careerTitle" />
	</div>
	<label class="col-2 col-form-label" for="careerDescription">Description</label>
	<div class="col-3">
		<textarea class="form-control" id="careerDescription" name="careerDescription"></textarea>
	</div>
	<label class="col-2 col-form-label" for="careerStatus">Career Status</label>
	<div class="col-2">
		<select class="form-control" id="careerStatus" name="careerStatus">
			<option value="-1">::: status :::</option>
			<option value="0">not playing</option>
			<option value="1">playing</option>
		</select>
	</div>
</div>
<div class="form-group row">
	<label class="col-3 col-form-label" for="careerStartDate">StartDate</label>
	<div class="col-3">
		<input type="date" class="form-control" id="careerStartDate" name="careerStartDate" />
	</div>
	<label class="col-3 col-form-label" for="careerEndDate">End Date</label>
	<div class="col-3">
		<input type="date" class="form-control" id="careerEndDate" name="careerEndDate" />
	</div>
</div>
<div class="form-group row">
	<input type="button" class="btn btn-outline-primary addCareerBtn btn-block" value="Add Career(+)" />
</div>
<table class="table tableCareer">
	<thead class="">
	<tr>
		<th>Title</th>
		<th>Description</th>
		<th>Start Date</th>
		<th>End Date</th>
		<th>Status</th>
		<th>Delete</th>
	</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<br/>
<h3>Play Streamming&nbsp;&nbsp;</h3>
<hr />
<div class="form-group row">
	<div class="col-10">
		<input type="text" id="searchYoutubeKeyword" name="searchYoutubeKeyword" class="form-control" placeholder="Search Your Youtube Streams" />
	</div>
	<div class="col-2">
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#searchMyYoutubeList" id="searchMyYoutube">Search My Youtube</button>
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label" for="youtubeTitle">Title</label>
	<div class="col-4">
		<input type="text" class="form-control" id="youtubeTitle" name="youtubeTitle" />
		<!-- 			    	<input type="text" class="form-control" id="streamTitle_0" name="profileStreamList[0].streamTitle"/>   -->
	</div>
	<label class="col-1 col-form-label" for="youtubeUrl">URL</label>
	<div class="col-4">
		<input type="text" class="form-control" id="youtubeUrl" name="youtubeUrl" />
		<!-- 		    		<input type="text" class="form-control" id="streamUrl_0" name="profileStreamList[0].streamUrl"/> -->
	</div>
	<div class="col-2">
		<input type="button" class="btn btn-default addStreamBtn" value="+" />
	</div>
</div>
<div id="streamList"></div>
<!-- Modal -->
<div class="modal fade" id="searchMyYoutubeList" tabindex="-1"
	 role="dialog" aria-labelledby="searchMyYoutubeList"
	 aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Youtube List</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div id="youtubeListDiv"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>
<br />
<h3>Statistics</h3>
<hr />
<h3>
	<small>Pitching Stat</small>
</h3>
<div class="form-group row">
	<label class="col-1 col-form-label">Team Name</label>
	<div class="col-2">
		<input type="text" class="form-control" id="pTeamName_pitch_stat" name="pitch_stat_pTeamName" />
	</div>
	<label class="col-1 col-form-label">Year</label>
	<div class="col-2">
		<input type="month" class="form-control" id="pStatYear_pitch_stat" name="pitch_stat_pStatYear"/>
	</div>
	<label class="col-1 col-form-label">INN</label>
	<div class="col-2">
		<input type="number" class="form-control" id="inn_pitch_stat" name="pitch_stat_inn" value="0.0" />
	</div>
	<label class="col-1 col-form-label">W</label>
	<div class="col-2">
		<input type="number" class="form-control" id="w_pitch_stat" name="pitch_stat_w" value="0" />
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label">L</label>
	<div class="col-2">
		<input type="number" class="form-control" id="l_pitch_stat" name="pitch_stat_l" value="0" />
	</div>
	<label class="col-1 col-form-label">ERA</label>
	<div class="col-2">
		<input type="number" class="form-control" id="era_pitch_stat" name="pitch_stat_era" value="0.0" />
	</div>
	<label class="col-1 col-form-label">G</label>
	<div class="col-2">
		<input type="number" class="form-control" id="g_pitch_stat" name="pitch_stat_g" value="0" />
	</div>
	<label class="col-1 col-form-label">GS</label>
	<div class="col-2">
		<input type="number" class="form-control" id="gs_pitch_stat" name="pitch_stat_gs" value="0" />
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label">SV</label>
	<div class="col-2">
		<input type="number" class="form-control" id="sv_pitch_stat" name="pitch_stat_sv" value="0" />
	</div>
	<label class="col-1 col-form-label">SVO</label>
	<div class="col-2">
		<input type="number" class="form-control" id="svo_pitch_stat" name="pitch_stat_svo" value="0" />
	</div>
	<label class="col-1 col-form-label">IP</label>
	<div class="col-2">
		<input type="number" class="form-control" id="ip_pitch_stat" name="pitch_stat_ip" value="0.0" />
	</div>
	<label class="col-1 col-form-label">H</label>
	<div class="col-2">
		<input type="number" class="form-control" id="h_pitch_stat" name="pitch_stat_h" value="0" />
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label">R</label>
	<div class="col-2">
		<input type="number" class="form-control" id="r_pitch_stat" name="pitch_stat_r" value="0" />
	</div>
	<label class="col-1 col-form-label">ER</label>
	<div class="col-2">
		<input type="number" class="form-control" id="er_pitch_stat" name="pitch_stat_er" value="0" />
	</div>
	<label class="col-1 col-form-label">HR</label>
	<div class="col-2">
		<input type="number" class="form-control" id="hr_pitch_stat" name="pitch_stat_hr" value="0" />
	</div>
	<label class="col-1 col-form-label">BB</label>
	<div class="col-2">
		<input type="number" class="form-control" id="bb_pitch_stat" name="pitch_stat_bb" value="0" />
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label">SO</label>
	<div class="col-2">
		<input type="number" class="form-control" id="so_pitch_stat" name="pitch_stat_so" value="0" />
	</div>
	<label class="col-1 col-form-label">AVG</label>
	<div class="col-2">
		<input type="number" class="form-control" id="avg_pitch_stat" name="pitch_stat_avg" value="0.0" />
	</div>
	<label class="col-1 col-form-label">WHIP</label>
	<div class="col-2">
		<input type="number" class="form-control" id="whip_pitch_stat" name="pitch_stat_whip" value="0.0" />
	</div>
	<label class="col-1 col-form-label">K</label>
	<div class="col-2">
		<input type="number" class="form-control" id="k_pitch_stat" name="pitch_stat_k" value="0" />
	</div>
</div>
<div class="form-group row">
	<input type="button" class="btn btn-outline-primary addPitcherBtn" value="Add Pitching Stat(+)" />
</div>
<table class="table tablePitcherStat">
	<thead class="">
	<tr>
		<th>Team</th>
		<th>Year</th>
		<th>INN</th>
		<th>W</th>
		<th>L</th>
		<th>ERA</th>
		<th>G</th>
		<th>GS</th>
		<th>SV</th>
		<th>SVO</th>
		<th>IP</th>
		<th>H</th>
		<th>R</th>
		<th>ER</th>
		<th>HR</th>
		<th>BB</th>
		<th>SO</th>
		<th>AVG</th>
		<th>WHIP</th>
		<th>K</th>
		<th>DEL</th>
	</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<br />
<h3>
	<small>Hitting Stat</small>
</h3>
<div class="form-group row">
	<label class="col-1 col-form-label">Team Name</label>
	<div class="col-2">
		<input type="text" class="form-control" id="hTeamName_hit_stat" name="hit_stat_hTeamName" />
	</div>
	<label class="col-1 col-form-label">Year</label>
	<div class="col-2">
		<input type="month" class="form-control" id="hStatYear_hit_stat" name="hit_stat_hStatYear" />
	</div>
	<label class="col-1 col-form-label">G</label>
	<div class="col-2">
		<input type="number" class="form-control" id="g_hit_stat" name="hit_stat_g" value="0" />
	</div>
	<label class="col-1 col-form-label">AB</label>
	<div class="col-2">
		<input type="number" class="form-control" id="ab_hit_stat" name="hit_stat_ab" value="0" />
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label">R</label>
	<div class="col-2">
		<input type="number" class="form-control" id="r_hit_stat" name="hit_stat_r" value="0" />
	</div>
	<label class="col-1 col-form-label">H</label>
	<div class="col-2">
		<input type="number" class="form-control" id="h_hit_stat" name="hit_stat_h" value="0" />
	</div>
	<label class="col-1 col-form-label">2B</label>
	<div class="col-2">
		<input type="number" class="form-control" id="twoB_hit_stat" name="hit_stat_twoB" value="0" />
	</div>
	<label class="col-1 col-form-label">3B</label>
	<div class="col-2">
		<input type="number" class="form-control" id="threeB_hit_stat" name="hit_stat_threeB" value="0" />
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label">HR</label>
	<div class="col-2">
		<input type="number" class="form-control" id="hr_hit_stat" name="hit_stat_hr" value="0" />
	</div>
	<label class="col-1 col-form-label">RBI</label>
	<div class="col-2">
		<input type="number" class="form-control" id="rbi_hit_stat" name="hit_stat_rbi" value="0" />
	</div>
	<label class="col-1 col-form-label">BB</label>
	<div class="col-2">
		<input type="number" class="form-control" id="bb_hit_stat" name="hit_stat_bb" value="0" />
	</div>
	<label class="col-1 col-form-label">SO</label>
	<div class="col-2">
		<input type="number" class="form-control" id="so_hit_stat" name="hit_stat_so" value="0" />
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label">SB</label>
	<div class="col-2">
		<input type="number" class="form-control" id="sb_hit_stat" name="hit_stat_sb" value="0" />
	</div>
	<label class="col-1 col-form-label">CS</label>
	<div class="col-2">
		<input type="number" class="form-control" id="cs_hit_stat" name="hit_stat_cs" value="0" />
	</div>
	<label class="col-1 col-form-label">AVG</label>
	<div class="col-2">
		<input type="number" class="form-control" id="avg_hit_stat" name="hit_stat_avg" value="0.0" />
	</div>

	<label class="col-1 col-form-label">OBP</label>
	<div class="col-2">
		<input type="number" class="form-control" id="obp_hit_stat" name="hit_stat_obp" value="0.0" />
	</div>

</div>
<div class="form-group row">
	<label class="col-1 col-form-label">SLG</label>
	<div class="col-2">
		<input type="number" class="form-control" id="slg_hit_stat" name="hit_stat_slg" value="0.0" />
	</div>
	<label class="col-1 col-form-label">OPS</label>
	<div class="col-2">
		<input type="number" class="form-control" id="ops_hit_stat" name="hit_stat_ops" value="0.0" />
	</div>
	<div class="col-6"></div>
</div>
<div class="form-group row">
	<input type="button" class="btn btn-outline-primary addHitterBtn" value="Add Hitting Stat(+)" />
</div>
<table class="table tableHitterStat">
	<thead class="">
	<tr>
		<th>Team</th>
		<th>Year</th>
		<th>G</th>
		<th>AB</th>
		<th>R</th>
		<th>H</th>
		<th>2B</th>
		<th>3B</th>
		<th>HR</th>
		<th>RBI</th>
		<th>BB</th>
		<th>SO</th>
		<th>SB</th>
		<th>CS</th>
		<th>AVG</th>
		<th>OBP</th>
		<th>SLG</th>
		<th>OPS</th>
		<th>Add</th>
	</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<br/>
<h3>
	<small>Fielding Stat</small>
</h3>
<div class="form-group row">
	<label class="col-1 col-form-label">Team Name</label>
	<div class="col-2">
		<input type="text" class="form-control" id="fTeamName_field_stat" name="field_stat_fTeamName" />
	</div>
	<label class="col-1 col-form-label">Year</label>
	<div class="col-2">
		<input type="month" class="form-control" id="fStatYear_field_stat" name="field_stat_fStatYear"/>
	</div>
	<label class="col-1 col-form-label">POS</label>
	<div class="col-2">
		<select id="pos_field_stat" name="field_stat_pos" class="form-control">
			<option value="">::: select position :::</option>
			<option value="P">Pitcher</option>
			<option value="C">Catcher</option>
			<option value="1B">1st Base</option>
			<option value="2B">2nd Base</option>
			<option value="3B">3rd Base</option>
			<option value="SS">Short Stop</option>
			<option value="LF">Left Fielder</option>
			<option value="CF">Center Fielder</option>
			<option value="RF">Right Fielder</option>
			<option value="DH">DH</option>
		</select>
	</div>
	<label class="col-1 col-form-label">G</label>
	<div class="col-2">
		<input type="number" class="form-control" id="g_field_stat" name="field_stat_g" value="0" />
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label">GS</label>
	<div class="col-2">
		<input type="number" class="form-control" id="gs_field_stat" name="field_stat_gs" value="0" />
	</div>
	<label class="col-1 col-form-label">INN</label>
	<div class="col-2">
		<input type="number" class="form-control" id="inn_field_stat" name="field_stat_inn" value="0.0" />
	</div>
	<label class="col-1 col-form-label">TC</label>
	<div class="col-2">
		<input type="number" class="form-control" id="tc_field_stat" name="field_stat_tc" value="0" />
	</div>
	<label class="col-1 col-form-label">PO</label>
	<div class="col-2">
		<input type="number" class="form-control" id="po_field_stat" name="field_stat_po" value="0" />
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label">A</label>
	<div class="col-2">
		<input type="number" class="form-control" id="a_field_stat" name="field_stat_a" value="0" />
	</div>
	<label class="col-1 col-form-label">E</label>
	<div class="col-2">
		<input type="number" class="form-control" id="e_field_stat" name="field_stat_e" value="0" />
	</div>

	<label class="col-1 col-form-label">DP</label>
	<div class="col-2">
		<input type="number" class="form-control" id="dp_field_stat" name="field_stat_dp" value="0" />
	</div>
	<label class="col-1 col-form-label">SB</label>
	<div class="col-2">
		<input type="number" class="form-control" id="sb_field_stat" name="field_stat_sb" value="0" />
	</div>
</div>

<div class="form-group row">
	<label class="col-1 col-form-label">CS</label>
	<div class="col-2">
		<input type="number" class="form-control" id="cs_field_stat" name="field_stat_cs" value="0" />
	</div>
	<label class="col-1 col-form-label">SBPCT</label>
	<div class="col-2">
		<input type="number" class="form-control" id="sbpct_field_stat" name="field_stat_sbpct" value="0" />
	</div>

	<label class="col-1 col-form-label">PB</label>
	<div class="col-2">
		<input type="number" class="form-control" id="pb_field_stat" name="field_stat_pb" value="0" />
	</div>
	<label class="col-1 col-form-label">cWP</label>
	<div class="col-2">
		<input type="number" class="form-control" id="cwp_field_stat" name="field_stat_cwp" value="0" />
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label">FPCT</label>
	<div class="col-2">
		<input type="number" class="form-control" id="fpct_field_stat" name="field_stat_fpct" value="0.0" />
	</div>
	<label class="col-1 col-form-label">RF</label>
	<div class="col-2">
		<input type="number" class="form-control" id="rf_field_stat" name="field_stat_rf" value="0.0" />
	</div>
	<div class="col-6">
	</div>
</div>
<div class="form-group row">
	<input type="button" class="btn btn-outline-primary addFielderBtn" value="Add Fielding Stat(+)" />
</div>

<table class="table tableFielderStat">
	<thead class="">
	<tr>
		<th>Team</th><th>Year</th><th>Position</th><th>G</th><th>GS</th><th>INN</th><th>TC</th><th>PO</th><th>A</th><th>E</th>
		<th>DP</th><th>SB</th><th>CS</th><th>SBPCT</th><th>PB</th><th>C_WP</th><th>FPCT</th><th>PRF</th><th>Add</th>
	</tr>
	</thead>
	<tbody>
	</tbody>
</table>
