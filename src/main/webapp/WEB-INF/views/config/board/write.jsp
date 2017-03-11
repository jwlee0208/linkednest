<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" 			content="width=device-width, initial-scale=1">
<meta name="robots" 			content="index,follow" /> 
<meta name="keywords" 			content="blog, baseball, link, player, profile"/>
<title>::: Create Boards :::</title>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/config/create.js"></script>

</head>
<body>
	<form id="writeFrm" name="writeFrm" method="post" role="form">
	
	<input type="hidden" id="boardId"	   		name="boardId"	   		value="${boardInfo.boardId}"/>
	<input type="hidden" id="createUserId" 		name="createUserId" 	value="${boardInfo.createUserId}"/>
	<input type="hidden" id="createUserName" 	name="createUserName" 	value="${boardInfo.createUserName }"/>
	<div class="wrap">
	<h1 id="btn-groups" class="page-header">Create Board</h1>
	
	<ol class="breadcrumb">
	  <li><a>Admin</a></li>
	  <li><a>게시판</a></li>
	  <li class="active">게시판 생성</li>
	</ol>
		<div class="writeArea list-group-item">
			<table class="table table-condensed">
				<colgroup><col width="10%"/><col width="90%"/></colgroup>
				<tbody>
					<tr>
						<th><div class="form-group">게시판 타입</div></th>
						<td>
							<div class="form-group">
								<select class="form-control" id="boardType" name="boardType">
									<option>-선택-</option>
									<option <c:if test='${boardInfo.boardType eq 0}'>selected</c:if> value="0">기본 게시판</option>
									<option <c:if test="${boardInfo.boardType eq 1}">selected</c:if> value="1">이미지 게시판</option>
									<option <c:if test="${boardInfo.boardType eq 2}">selected</c:if> value="2">썸네일 게시판</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th><div class="form-group">게시판 카테고리</div></th>
						<td>
							<div class="form-group">
								<select class="form-control" id="boardCategoryId" name="boardCategoryId">
									<option>-선택-</option>
								<c:if test="${!empty categoryList}">
									<c:forEach var="boardCategoryInfo" items="${categoryList}">
										<option <c:if test='${boardInfo.boardCategoryId eq boardCategoryInfo.boardCategoryId}'>selected</c:if> value="${boardCategoryInfo.boardCategoryId}">${boardCategoryInfo.boardCategoryName}</option>
									</c:forEach>
								</c:if>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th><div class="form-group">게시판 이름</div></th>
						<td><div class="form-group"><input type="text" class="form-control" id="boardName" name="boardName" value="${boardInfo.boardName}"/></div></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="btn-group btn-group-justified" style="padding-top : 20px; padding-bottom : 20px;">
			<div class="btn-group">
				<input type="button" class="btn btn-default" id="cancelToCreate" value="취소"/>           
		    </div>
		    <div class="btn-group">
	<c:choose>
		<c:when test="${boardInfo ne null && boardInfo ne ''}">
				 <input type="button"  class="btn btn-default pull-right" onclick="javscript:goBoardModify();" value="저장">		
		</c:when>
		<c:otherwise>
				 <input type="button"  class="btn btn-default pull-right" onclick="javscript:goBoardCreate();" value="저장">		
		</c:otherwise>
	</c:choose>			    

		    </div> 
		</div>
		
	</div>
	</form>
</body>
</html>