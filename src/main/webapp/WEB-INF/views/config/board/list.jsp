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
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/board/boardList.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">

</head>
<body>
	<div class="page-header">
 	  <h1>Configuration&nbsp;&nbsp;&nbsp;<small>Board List</small></h1>
	</div>	
	
	<ol class="breadcrumb">
	  <li><a>configuration</a></li>
	  <li><a>board</a></li>
	  <li><a>Board List</a></li>
	</ol>		
	
	<form id="boardFrm" name="boardFrm" method="post">
	
	<!-- 리스트에서 선택된 게시글 아이디 -->
	<input type="hidden" id="selectedBoardId" name="selectedBoardId" />
	
	<c:set var="list" value="${boardList}" />
	<div class="table-responsive" id="listDiv">
		<!-- paging에 필요한 파라미터 -->
		<input type="hidden" id="pageNo" 		name="pageNo" 		value="${pagedResult.pageNo}" /> 
		<input type="hidden" id="totalListCnt" 	name="totalListCnt" value="${pagedResult.totalListCnt}" /> 
		<input type="hidden" id="totalPageCnt" 	name="totalPageCnt" value="${pagedResult.totalPageCnt}" /> 
		<input type="hidden" id="startPageNo" 	name="startPageNo" 	value="${pagedResult.startPageNo}" /> 
		<input type="hidden" id="pageSize" 		name="pageSize" 	value="${pagedResult.pageSize}" />
		<input type="hidden" id="type" 			name="type"	 		value="blog" />

		<table style="width: 100%;" class="table table-hover">
			<colgroup>
				<col width="10%" />
				<col width="60%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th style="text-align : center;">게시판 아이디</th>
					<th>제목</th>
					<th style="text-align : center;">게시판 유형</th>
					<th style="text-align : center;">작성일자</th>
					<th style="text-align : center;">작성자</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${null ne pagedResult.list && pagedResult.list.size() > 0}">
						<c:forEach var="board" items="${pagedResult.list}">
							<tr>
								<td style="text-align : center;">${board.boardId}</td>	
								<td onclick="javascript:goBoardView('${board.boardId}');">${board.boardName}</td>
								<td style="text-align : center;">
									<c:if test="${board.boardType eq 0}">기본 게시판</c:if>
									<c:if test="${board.boardType eq 1}">이미지 게시판</c:if>
									<c:if test="${board.boardType eq 2}">썸네일 게시판</c:if>								
								</td>
								<td style="text-align : center;">
									${fn:substring(board.createDate, 0, 10)}
								</td>
								<td style="text-align : center;">
									${board.createUserName}&nbsp;(${board.createUserId })
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">작성된 내용이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	</form>
	<!-- paging area -->                                                
	<c:set var="totalListCnt" value="${pagedResult.totalListCnt}"/>
	<c:set var="totalPageCnt" value="${pagedResult.totalPageCnt}"/>
	                                                                                                      
	<c:import url="/common/paging">
		<c:param value="${totalPageCnt}"            name="totalPageCnt"/>
	    <c:param value="${pagedResult.pageNo}"      name="pageNo"/>
	    <c:param value="${pagedResult.startPageNo}" name="startPageNo"/>
	    <c:param value="${pagedResult.endPageNo}"   name="endPageNo"/>  
	    <c:param value="blog"   name="type"/>   
	</c:import>                                                                                                      

	<div class="btn-group btn-group-justified" style="padding-bottom: 20px;">
		<div class="btn-group">
			<input type="submit" class="btn btn-default pull-right" value="게시판 만들기" name="goToWrite" />
		</div>
	</div>	

</body>
</html>