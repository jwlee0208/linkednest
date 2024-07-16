<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>::: LinkedNest.net >> Registration Player's Profile</title>
</head>
<style>
	input[type="radio"]{width:30px;heignt:30px;}
	input[type="checkbox"]{width:30px;heignt:30px;}
</style>
<body>
<div class="container">
	<h1 id="btn-groups" class="page-header">Registration&nbsp;&nbsp;<small>Profile</small></h1>
	<br/>

	<form id="uploadFrm" name="uploadFrm" method="post" class="form-horizontal was-validated" role="form" enctype="multipart/form-data">
		<div class="form-group row">
			<label class="col-2 col-form-label" for="profileImg">Profile Image</label>
			<div class="col-10">
				<input type="file" class="form-control" id="profileImg" name="profileImg" placeholder="upload your profile image"/>
			</div>
		</div>
	</form>


	<form id="actionFrm" name="actionFrm" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">
		<input type="hidden" id="profileType" name="profileType" value="${profileType}" />
		<input type="hidden" id="categoryId"  name="categoryId"  value="${categoryId}" />
		<input type="hidden" id="profileImgPath" name="profileImgPath"/>
		<c:set var="param" value="${profileAttrList}"/>
		<c:choose>
			<c:when test="${profileType eq 1}"><%@include file="/WEB-INF/views/profile/ajaxRegistPlayer.jsp"%></c:when>
			<c:when test="${profileType eq 2}"><%@include file="/WEB-INF/views/profile/ajaxRegistCoach.jsp"%></c:when>
			<c:when test="${profileType eq 3}"><%@include file="/WEB-INF/views/profile/ajaxRegistTeam.jsp"%></c:when>
		</c:choose>
	</form>
	<br />
	<div class="form-group row">
		<input type="button" class="btn btn-primary btn-block" id="saveBtn" value="Save" data-loading-text="Processing..." />
	</div>
	<br/>
</div>
<div class="loader"></div>
</body>
<!-- editor -->
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/common-editor.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/board/article/common.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/profile/regist.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/profile/autocomplete.min.js"></script>
<script>
    $().ready(function() {
    	$(".loader").hide();
    });
</script>
<style>
	.fixed-height {padding: 1px;max-height: 200px;overflow: auto;}
	/*spiner*/
	.loader {
		position: absolute;
		left: 50%;
		top: 50%;
		z-index: 1;
		width: 300px;
		height: 300px;
		margin: -75px 0 0 -75px;
		border: 16px solid #f3f3f3;
		border-radius: 50%;
		border-top: 16px solid #3498db;
		width: 120px;
		height: 120px;
		-webkit-animation: spin 2s linear infinite;
		animation: spin 2s linear infinite;
		background-color: transparent;
	}

	/* Safari */
	@-webkit-keyframes spin {
		0% { -webkit-transform: rotate(0deg); }
		100% { -webkit-transform: rotate(360deg); }
	}

	@keyframes spin {
		0% { transform: rotate(0deg); }
		100% { transform: rotate(360deg); }
	}

	.errorMsg {color:red;}
</style>
<script>
    $(document).ajaxStart(function(){
        $(".loader").show();
        $("#saveBtn").hide();
    });
    $(document).ajaxComplete(function(){
        $(".loader").hide();
        $("#saveBtn").show();
    });
</script>
</html>