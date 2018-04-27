<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag"%>
<input type="hidden" id="catId1" name="catId1" value="01010300" />
<input type="hidden" id="catId2" name="catId2" value="01010301" />
<h3>Team Information</h3>
<hr />
<%--
<div class="form-group row">
	<label class="col-2 col-form-label" for="profileImg">Profile Image</label>
	<div class="col-10">
		<input type="file" class="form-control" id="profileImg" name="profileImg" placeholder="upload your profile image" />
	</div>
</div>
<br />
--%>
<div class="form-group row">
	<label class="col-2 col-form-label">Name</label>
	<div class="col-10">
		<input type="text" class="form-control" id="name" name="name" placeholder="write your name" />
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label">Introduce</label>
	<div class="col-10">
		<textarea class="form-control tinymce" id="introduce" name="introduce"></textarea>
	</div>
</div>
<br />
<c:set var="profileAttrList" value="${profileAttrList}"/>
<c:if test="${!empty profileAttrList}">
	<c:set var="rowCnt" value="${0}" />
	<c:forEach var="profileAttrInfo" items="${profileAttrList}">
		<div class="row">
			<h4><tag:message code='text.${profileAttrInfo.profileAttrName}'/></h4>
			<c:set var="profileAttrElemList" value="${profileAttrInfo.profileAttrElementList}" />
			<c:if test="${!empty profileAttrElemList}">
				<c:forEach var="profileAttrElemInfo" items="${profileAttrElemList}" varStatus="index">
					<div class="col-lg-2">
						<div class="form-group row">
							<input type="hidden" name="profileAttrElementMapList[${rowCnt}].profileAttrId" value="${profileAttrInfo.profileAttrId}" />
							<input type="hidden" name="profileAttrElementMapList[${rowCnt}].profileAttrName" value="${profileAttrInfo.profileAttrName}" />
							<input type="hidden" class="form-control" aria-label="Text input with checkbox" name="profileAttrElementMapList[${rowCnt}].profileAttrElementMapName" value="${profileAttrElemInfo.profileAttrElementName}">
							<label class="col-2 col-form-label">
								<input type="checkbox" name="profileAttrElementMapList[${rowCnt}].profileAttrElementId" aria-label="Checkbox for following text input" value="${profileAttrElemInfo.profileAttrElementId}">${profileAttrElemInfo.profileAttrElementName}
							</label>
						</div>
					</div>
					<c:set var="rowCnt" value="${rowCnt+1}" />
				</c:forEach>
			</c:if>
		</div>
	</c:forEach>
</c:if>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label">League</label>
	<div class="col-10">
		<select class="form-control" id="leagueId"
				name="profileTeamDto.leagueId">
			<c:set var="leagueInfoList" value="${leagueInfoList}"/>
			<c:if test="${!empty leagueInfoList}">
				<c:forEach var="leagueInfo" items="${leagueInfoList}">
					<option value="${leagueInfo.leagueId}">[${leagueInfo.area}]${leagueInfo.leagueName}</option>
				</c:forEach>
			</c:if>
		</select>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label">City</label>
	<div class="col-10">
		<input type="text" class="form-control" id="city" name="profileTeamDto.city" />
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label">Established Date</label>
	<div class="col-10">
		<input type="date" class="form-control" id="establishedDate" name="profileTeamDto.establishedDate" />
	</div>
</div>
<br />
<h3>Contact Info.</h3>
<hr />
<div class="form-group row">
	<label class="col-2 col-form-label">Email</label>
	<div class="col-10">
		<input type="email" class="form-control" id="email" name="profileContactInfoDto.email" placeholder="write your e-mail" />
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label">Phone No.</label>
	<div class="col-10">
		<input type="tel" class="form-control" id="phoneNo" name="profileContactInfoDto.phoneNo" placeholder="write your phone No." />
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label">cellPhoneNo</label>
	<div class="col-10">
		<input type="tel" class="form-control" id="cellPhoneNo" name="profileContactInfoDto.cellPhoneNo" placeholder="write your cell phone No." />
	</div>
</div>
<br />
<div class="form-group row">
	<span class="form-group row-addon" id="basic-addon3">http://</span>
	<div class="col-10">
		<input type="url" class="form-control" id="websiteUrl" name="profileContactInfoDto.websiteUrl" placeholder="write your website url" aria-describedby="basic-addon3" />
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label">facebook</label>
	<div class="col-10">
		<input type="text" class="form-control" id="facebookUrl" name="profileContactInfoDto.faceebookUrl" placeholder="write your facebook id" />
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label">twitter</label>
	<div class="col-10">
		<input type="text" class="form-control" id="twitterUrl" name="profileContactInfoDto.twitterUrl" placeholder="write your twitter id" />
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label">instagram</label>
	<div class="col-10"><input type="text" class="form-control" id="instagramUrl" name="profileContactInfoDto.instagramUrl" placeholder="write your instagram id" /></div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label">Address</label>
	<div class="col-10"><input type="text" class="form-control" id="address" name="profileContactInfoDto.address" placeholder="write your address" /></div>
</div>
<br />