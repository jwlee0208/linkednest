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
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/config/boardCategoryView.js"></script>
</head>
<body>
	<form id="viewFrm" name="viewForm" method="post">
		<input type="hidden" id="selectedBoardCategoryId" 	name="selectedBoardCategoryId" value="${boardCategoryInfo.boardCategoryId}"/>
		<input type="hidden" id="boardCategoryId" 			name="boardCategoryId" 			value="${boardCategoryInfo.boardCategoryId}"/>
		<input type="hidden" id="prevBoardCategoryId" 		name="prevBoardCategoryId" 		value="${prevBoardCategoryInfo.boardCategoryId}"/>
		<input type="hidden" id="nextBoardCategoryId" 		name="nextBoardCategoryId" 		value="${nextBoardCategoryInfo.boardCategoryId}"/>
	
		<h1 id="btn-groups" class="page-header">BOARD CATEGORY INFO&nbsp;&nbsp;<small>${boardCategoryInfo.boardCategoryName}</small></h1>
		
		<ol class="breadcrumb">
		  <li><a>Admin</a></li>
		  <li><a>Board's Category List</a></li>
		  <li class="active">Board's Category Info</li>
		</ol>		


		<div class="list-group-item">
			<table class="table table-condensed">
				<colgroup><col width="10%"/><col width="90%"/></colgroup>
				<tbody>
					<tr>
						<th><div class="form-group">게시판 카테고리 이름</div></th>
						<td><div class="form-group">${boardCategoryInfo.boardCategoryName}</div></td>
					</tr>

					<tr>
						<th><div class="form-group">생성일</div></th>
						<td><div class="form-group">${fn:substring(boardCategoryInfo.createDate, 0, 10)}</div></td>				
					</tr>
					<tr>
						<th><div class="form-group">생성자</div></th>
						<td><div class="form-group">${boardCategoryInfo.createUserId}(${boardCategoryInfo.createUserId})</div></td>				
					</tr>
				</tbody>
			</table>
		</div>			


		<div class="btn-group btn-group-justified" style="padding-top : 20px; padding-bottom : 20px;">
			<div class="btn-group">
				<input type="button" class="btn btn-default" id="goToList" value="목록"/>
			</div>
			<c:if test="${prevBoardCategoryInfo.boardCategoryId ne null}">
			<div class="btn-group">
				<input type="button" class="btn btn-default" id="previous" value="Previous"/>			
			</div>
			</c:if>
			<c:if test="${nextBoardCategoryInfo.boardCategoryId ne null}">
			<div class="btn-group">
				<input type="button" class="btn btn-default" id="next" value="Next"/>		
			</div>
			</c:if>
			<div class="btn-group">
				<input type="button" class="btn btn-default pull-right" id="goToModify" value="수정" onclick="javascript: goBoardCategoryModify('${boardCategoryInfo.boardCategoryId}');"/>
			</div>			
		</div>


	</form>
</body>
</html>