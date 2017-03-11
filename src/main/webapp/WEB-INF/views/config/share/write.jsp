<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::: Configuration Share Info. :::</title>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/common-editor.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/config/write.js"></script>

</head>
<body>

	<div class="page-header">
 	  <h1>Configuration&nbsp;&nbsp;&nbsp;<small>My Share Profile</small></h1>
	</div>	
	
	<ol class="breadcrumb">
	  <li><a>configuration</a></li>
	  <li><a>share</a></li>
	  <li><a>configuration Share Info.</a></li>
	</ol>		

	<form id="writeFrm" name="writeFrm" method="post" class="form-horizontal" role="form">
		<input type="hidden" id="shareId" 	name="shareId" 	value="${shareInfo.shareId}"/>
		<input type="hidden" id="userId" 	name="userId" 	value="${userInfo.userId}"/>
		<div class="form-group">
			<label for="userId" class="col-sm-2 control-label">My Share Name</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="shareName" name="shareName" value='<c:out value="${shareInfo.shareName}"/>'/><span id="shareNameErr" class="errorMsg" style="display: none;"></span>
			</div>
		</div>
	
		<div class="form-group">
			<label for="userId" class="col-sm-2 control-label">Share Menu Type<br/>(Menu Bar's Color)</label>
			<div class="col-sm-10">
				<label class="radio-inline"><input type="radio" id="shareType1" name="shareType" <c:if test="${shareInfo.shareType eq 1}">checked</c:if> value='1'/></label><span style="width : 30px; height : 20px; background-color : #efefef; padding: 3px 3px 3px 3px;">회색</span>
				<label class="radio-inline"><input type="radio" id="shareType2" name="shareType" <c:if test="${shareInfo.shareType eq 2}">checked</c:if> value='2'/></label><span style="width : 30px; height : 20px; background-color : black; padding: 3px 3px 3px 3px; color: white;">검정색</span>
				<label class="radio-inline"><input type="radio" id="shareType3" name="shareType" <c:if test="${shareInfo.shareType eq 3}">checked</c:if> value='3'/></label><span style="width : 30px; height : 20px; background-color : #e74c3c; padding: 3px 3px 3px 3px; color: white;">빨강색</span>
				<label class="radio-inline"><input type="radio" id="shareType4" name="shareType" <c:if test="${shareInfo.shareType eq 4}">checked</c:if> value='4'/></label><span style="width : 30px; height : 20px; background-color : #2ecc71; padding: 3px 3px 3px 3px; color: white;">녹색</span>
				<label class="radio-inline"><input type="radio" id="shareType5" name="shareType" <c:if test="${shareInfo.shareType eq 5}">checked</c:if> value='5'/></label><span style="width : 30px; height : 20px; background-color : yellow; padding: 3px 3px 3px 3px; color: white;">노란색</span>
<%-- 				<label class="radio-inline"><input type="radio" id="shareType3" name="shareType" <c:if test="${shareInfo.shareType eq 3}">checked</c:if> value='3'/></label><span style="width : 30px; height : 20px; background-color : #2ecc71; padding: 3px 3px 3px 3px; color: white;">녹색</span> --%>
<%-- 				<label class="radio-inline"><input type="radio" id="shareType4" name="shareType" <c:if test="${shareInfo.shareType eq 4}">checked</c:if> value='4'/></label><span style="width : 30px; height : 20px; background-color : #9b59b6; padding: 3px 3px 3px 3px; color: white;">보라색</span> --%>
<%-- 				<label class="radio-inline"><input type="radio" id="shareType5" name="shareType" <c:if test="${shareInfo.shareType eq 5}">checked</c:if> value='5'/></label><span style="width : 30px; height : 20px; background-color : #e67e22; padding: 3px 3px 3px 3px; color: white;">주황색</span> --%>
			</div>
		</div>	
	
		<div class="form-group">
			<label for="userId" class="col-sm-2 control-label">Introduce</label>
			<div class="col-sm-10">
				<textarea class="form-control tinymce" id="introduce" name="introduce"><c:out value="${shareInfo.introduce}"/></textarea>
				<span id="introduceErr" class="errorMsg" style="display: none;"></span>
			</div>
		</div>	
	
		<div class="btn-group btn-group-justified" style="padding-top : 20px; padding-bottom : 20px;">
			<div class="btn-group">
				<input type="button" class="btn btn-default" id="cancelToWrite" value="취소"/>           
		    </div>
		    <div class="btn-group">
<c:choose>
	<c:when test="${shareInfo ne null && shareInfo ne ''}">
				<input type="button" class="btn btn-default pull-right" id="saveToModify" value="저장"/>
	</c:when>
	<c:otherwise>
				<input type="button" class="btn btn-default pull-right" id="saveToWrite" value="저장"/>	
	</c:otherwise>
</c:choose>	

		    </div> 
		</div>
	
	
	</form>
</body>
</html>