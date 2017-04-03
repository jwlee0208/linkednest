<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<!-- editor -->
	<script type="text/javascript"	src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"></script>
	<script type="text/javascript"	src="${pageContext.request.contextPath}/js/common-editor.js"></script>
	<script type="text/javascript"	src="${pageContext.request.contextPath}/js/board/article/common.js"></script>

	<script type="text/javascript"	src="${pageContext.request.contextPath}/js/profile/regist.js"></script>

	<script type="text/javascript"	src="${pageContext.request.contextPath}/js/profile/autocomplete.js"></script>

	<style>
		.fixed-height {padding: 1px;max-height: 200px;overflow: auto;}
	</style>
</head>
<body>
<div class="container">
	<h1 id="btn-groups" class="page-header">
		Registration&nbsp;&nbsp;<small>Profile</small>
	</h1>
	<br/>
	<form id="actionFrm" name="actionFrm" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">
		<input type="hidden" id="profileType" name="profileType" value="${profileType}" />
		<input type="hidden" id="categoryId"  name="categoryId"  value="${categoryId}" />
		<c:set var="param" value="${profileAttrList}"/>
		<c:choose>
			<c:when test="${profileType eq 1}">
				<%@include file="/WEB-INF/views/profile/ajaxRegistPlayer.jsp"%>
			</c:when>
			<c:when test="${profileType eq 2}">
				<%@include file="/WEB-INF/views/profile/ajaxRegistCoach.jsp"%>
			</c:when>
			<c:when test="${profileType eq 3}">
				<%@include file="/WEB-INF/views/profile/ajaxRegistTeam.jsp"%>
			</c:when>
		</c:choose>
	</form>
	<br />
	<div class="form-group row">
		<input type="button" class="btn btn-primary btn-block" id="saveBtn"
			   value="Save" data-loading-text="Processing..." />
	</div>
	<br />
</div>
</body>
<script>

</script>
</html>