<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/config/boardCategoryList.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">

	<div class="page-header">
 	  <h1><small>Board's Category List</small></h1>
	</div>	
		
	<form id="boardFrm" name="boardFrm" method="post">
	
	
	<c:set var="list" value="${boardCategoryList}" />
	<div class="table-responsive" id="listDiv">
		<table style="width: 100%;" class="table table-hover">
			<colgroup>
				<col width="20%" />
				<col width="40%" />
				<col width="20%" />
				<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th style="text-align : center;">게시판 카테고리 아이디</th>
					<th>제목</th>
					<th>생성자 아이디</th>
					<th>생성일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${null ne list && list.size() > 0}">
						<c:forEach var="boardCat" items="${list}">
							<tr>
								<td style="text-align : center;">${boardCat.boardCategoryId}</td>	
								<td onclick="javascript:goBoardCategoryView('${boardCat.boardCategoryId}');">${boardCat.boardCategoryName}</td>
								<td>${boardCat.createUserId}</td>	
								<td>${fn:substring(boardCat.createDate, 0, 10)}</td>	
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">작성된 내용이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	</form>

	<div class="btn-group btn-group-justified" style="padding-bottom: 20px;">
		<div class="btn-group">
			<input type="submit" class="btn btn-default pull-right" value="카테고리 만들기" name="createCategory" />
		</div>
	</div>	
