<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/config/boardView.js"></script>
</head>
<body>
	<form id="viewFrm" name="viewForm" method="post">
		<input type="hidden" id="selectedBoardId" 	name="selectedBoardId"/>
		<input type="hidden" id="boardId" 			name="boardId" 			value="${boardInfo.boardId}"/>
		<input type="hidden" id="prevBoardId" 		name="prevBoardId" 		value="${prevBoardInfo.boardId}"/>
		<input type="hidden" id="nextBoardId" 		name="nextBoardId" 		value="${nextBoardInfo.boardId}"/>
	
		<h1 id="btn-groups" class="page-header">BOARD INFO&nbsp;&nbsp;<small>${boardInfo.boardName}</small></h1>
		
		<ol class="breadcrumb">
		  <li><a>Admin</a></li>
		  <li><a>Board List</a></li>
		  <li class="active">Board Info</li>
		</ol>		


		<div class="list-group-item">
			<table class="table table-condensed">
				<colgroup><col width="10%"/><col width="90%"/></colgroup>
				<tbody>
					<tr>
						<th><div class="form-group">게시판 이름</div></th>
						<td><div class="form-group">${boardInfo.boardName }</div></td>
					</tr>

					<tr>
						<th><div class="form-group">카테고리</div></th>
						<td>
							<div class="form-group">
								<c:if test="${boardInfo.boardType eq 0}">기본 게시판</c:if>
								<c:if test="${boardInfo.boardType eq 1}">이미지 게시판</c:if>
								<c:if test="${boardInfo.boardType eq 2}">썸네일 게시판</c:if>
							</div>
						</td>
					</tr>
					<tr>
						<th><div class="form-group">생성일</div></th>
						<td><div class="form-group">${fn:substring(boardInfo.createDate, 0, 10)}</div></td>				
					</tr>
					<tr>
						<th><div class="form-group">수정일</div></th>
						<td><div class="form-group"><c:choose><c:when test="${boardInfo.modifyDate ne null}">${fn:substring(boardInfo.modifyDate, 0, 10)}</c:when><c:otherwise>-</c:otherwise></c:choose></div></td>				
					</tr>
					<tr>
						<th><div class="form-group">생성자</div></th>
						<td><div class="form-group">${boardInfo.createUserName}(${boardInfo.createUserId})</div></td>				
					</tr>
					<tr>
						<th><div class="form-group">수정자</div></th>
						<td><div class="form-group"><c:choose><c:when test="${boardInfo.modifyUserId ne null}">${boardInfo.modifyUserName}(${boardInfo.modifyUserId})</c:when><c:otherwise>-</c:otherwise></c:choose></div></td>				
					</tr>

				</tbody>
			</table>
		</div>			


		<div class="btn-group btn-group-justified" style="padding-top : 20px; padding-bottom : 20px;">
			<div class="btn-group">
				<input type="button" class="btn btn-default" id="goToList" value="목록"/>
			</div>
			<c:if test="${prevBoardInfo.boardId ne null}">
			<div class="btn-group">
				<input type="button" class="btn btn-default" id="previous" value="Previous"/>			
			</div>
			</c:if>
			<c:if test="${nextBoardInfo.boardId ne null}">
			<div class="btn-group">
				<input type="button" class="btn btn-default" id="next" value="Next"/>		
			</div>
			</c:if>
			<div class="btn-group">
				<input type="button" class="btn btn-default pull-right" id="goToModify" value="수정" onclick="javascript: goBoardModify('${boardInfo.boardId}');"/>
			</div>			
		</div>


	</form>
</body>
</html>