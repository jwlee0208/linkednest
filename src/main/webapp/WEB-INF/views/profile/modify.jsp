<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>::: LinkedNest.net >> Modifying Player's Profile</title>
</head>
<body>
<div class="container">
	<h1 id="btn-groups" class="page-header">Modifying&nbsp;&nbsp;<small>Profile</small></h1>
	<form id="uploadFrm" name="uploadFrm" method="post" class="form-horizontal was-validated" role="form" enctype="multipart/form-data">
		<c:if test="${profileInfo.profileImgPath ne '' && profileInfo.profileImgPath ne null}">
			<div class="thumbImg unset">
				<img src="http://jwlee0208.cdn3.cafe24.com/${profileInfo.profileImgPath}" class="img-fluid rounded mx-auto d-block"/>
				<hr/>
				<input type="button" class="btn btn-outline-danger btn-block" value="이미지 삭제" onclick="javascript:delThumbImage('set');">
			</div>
		</c:if>
		<div class="thumbImg set">
			<img onerror="this.src='${pageContext.request.contextPath}/img/no_image.png'" class="img-fluid rounded mx-auto d-block"/>
			<input type="file" class="form-control" id="profileImg" name="profileImg" placeholder="upload your profile image" />
		</div>
	</form>
	<form id="actionFrm" name="actionFrm" method="post" class="form-horizontal" role="form"  enctype="multipart/form-data">
		<input type="hidden" id="profileType" 	name="profileType" 	value="${profileType}"/>
		<input type="hidden" id="categoryId" 	name="categoryId" 	value="${categoryId}"/>
		<input type="hidden" id="profileId" 	name="profileId" 	value="${profileInfo.profileId}"/>
		<input type="hidden" id="profileImgPath" 			name="profileImgPath" 		value="${profileInfo.profileImgPath}" />
		<c:set var="param" value="${profileAttrList}"/>
		<c:set var="profileInfo" value="${profileInfo}"/>
		<c:choose>
			<c:when test="${profileType eq 1}"><%@include file="/WEB-INF/views/profile/ajaxModifyPlayer.jsp"%></c:when>
			<c:when test="${profileInfo.profileType eq 2}"><%@include file="/WEB-INF/views/profile/ajaxModifyCoach.jsp"%></c:when>
			<c:when test="${profileInfo.profileType eq 3}"><%@include file="/WEB-INF/views/profile/ajaxModifyTeam.jsp"%></c:when>
		</c:choose>
		<h3><span class="glyphicon glyphicon-comment" aria-hidden="true"></span>&nbsp;&nbsp;<tag:message code="text.introduce"/></h3>
		<hr/>
		<div class="form-group row">
			<div class="col-sm-12">
				<p class="form-control-static">
					<textarea class="form-control tinymce" id="introduce" name="introduce"><c:out value="${profileInfo.introduce}" escapeXml="false"/></textarea>
					<span id="introduceErr" class="errorMsg" style="display: none;"></span>
				</p>

			</div>
		</div>
	</form>
	<div class="form-group row">
		<input type="button" class="btn btn-primary btn-block" id="saveBtn" value="save" data-loading-text="Processing..."/>
	</div>
	<br/>
</div>
<div class="loader"></div>
</body>
<!-- editor -->
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/common-editor.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/board/article/common.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/profile/modify.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/profile/autocomplete.js"></script>
<script>
    $().ready(function() {
        var className = ($(".thumbImg").hasClass("unset")) ? "unset" : "set";
        toggleThumbImage(className);
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