<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>
<h3>Personal Information</h3>
<hr />
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="name" style="color:red;">Name(*)</label>
	<div class="col-10">
		<input type="text" class="form-control" id="name" name="name" placeholder="write your name" />
		<span name="nameErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="catId2" style="color:red;">Main Position(*)</label>
	<div class="col-10">
<c:choose>
	<c:when test="${categoryId eq '01010100'}">
		<input type="hidden" id="catId1" name="catId1" value="01010100" />
		<select id="catId2" name="catId2" class="form-control">
			<option value="">::: Select Your Main Position :::</option>
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
	</c:when>
	<c:when test="${categoryId eq '01020100'}">
		<input type="hidden" id="catId1" name="catId1" value="01020100" />
		<select id="catId2" name="catId2" class="form-control">
			<option value="">::: Select Your Main Position :::</option>
			<option value="01020101">GK(Goalkeeper)</option>
			<option value="01020102">RB(Right Back)</option>
			<option value="01020103">LB(Left Back)</option>
			<option value="01020104">CB(Center Back)</option>
			<option value="01020106">DF(Defender)</option>
			<option value="01020107">RW(Right Wing)</option>
			<option value="01020108">MF(Mid-Filder)</option>
			<option value="01020109">CF(Center Forward)</option>
			<option value="01020110">SS(Second Striker)</option>
			<option value="01020111">LW(Left Wing)</option>
		</select>	
	</c:when>
</c:choose>	
		<span name="catId2Err" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="height" style="color:red;">Height (CM)(*)</label>
	<div class="col-4">
		<input type="text" class="form-control" id="height" name="profilePlayerDto.height" aria-describedby="heightHelpInline" value="0"/>
		<small id="heightHelpInline" class="text-muted">Allow digit and '.'</small>
		<span name="profilePlayerDto_heightErr" class="errorMsg" style="display: none;"></span>
	</div>
	<label class="col-2 col-form-label" for="weight" style="color:red;">Weight (KG)(*)</label>
	<div class="col-4">
		<input type="text" class="form-control" id="weight" name="profilePlayerDto.weight" aria-describedby="weightHelpInline" value="0"/>
		<small id="weightHelpInline" class="text-muted">Allow digit and '.'</small>
		<span name="profilePlayerDto_weightErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="birthDate" style="color:red;">Date Of Birth(*)</label>
	<div class="col-10">
		<input type="date" class="form-control" id="birthDate" name="profilePlayerDto.birthDate" aria-describedby="birthDateHelpInline"/>
		<small id="birthDateHelpInline" class="text-muted">YYYY-MM-DD</small>
		<span name="profilePlayerDto_birthDateErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="birthPlace" style="color:red;">Birth Place(*)</label>
	<div class="col-10">
		<input type="text" class="form-control" id="birthPlace" name="profilePlayerDto.birthPlace" />
		<span name="profilePlayerDto_birthPlaceErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="education" style="color:red;">Education(*)</label>
	<div class="col-10">
		<textarea class="form-control" id="education" name="profilePlayerDto.education"></textarea>
		<span name="profilePlayerDto_educationErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label for="language" class="col-sm-2 control-label" style="color:red;"><tag:message code="common.language"/>(*)</label>
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

	<label for="nationality" class="col-sm-2 control-label" style="color:red;"><tag:message code="common.nationality"/>(*)</label>
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
</div>
<br />
<div class="form-group row" for="introduce" >
	<label class="col-2 col-form-label" style="color:red;">Introduce(*)</label>
	<div class="col-10">
		<textarea class="form-control tinymce" id="introduce" name="introduce"></textarea>
		<span id="introduceErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>