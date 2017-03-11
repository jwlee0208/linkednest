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
<title>::: Create Board's Category :::</title>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/config/createCategory.js"></script>

</head>
<body>
	<form id="writeFrm" name="writeFrm" method="post" role="form">
	
	<input type="hidden" id="boardCategoryId"	   		name="boardCategoryId"	   		value="${boardCategoryInfo.boardCategoryId}"/>
	<input type="hidden" id="createUserId" 		name="createUserId" 	value="${boardInfo.createUserId}"/>
	<input type="hidden" id="createUserName" 	name="createUserName" 	value="${boardInfo.createUserName }"/>
	<div class="wrap">
	<h1 id="btn-groups" class="page-header">Create Board Category</h1>
	
	<ol class="breadcrumb">
	  <li><a>Config</a></li>
	  <li><a>Board</a></li>
	  <li class="active">Board's Category Creation</li>
	</ol>
		<div class="writeArea list-group-item">
			<table class="table table-condensed">
				<colgroup><col width="10%"/><col width="90%"/></colgroup>
				<tbody>
					<tr>
						<th><div class="form-group">게시판 카테고리 이름</div></th>
						<td>
							<div class="form-group">
								<input type="text" class="form-control" id="boardCategoryName" name="boardCategoryName" value="${boardCategoryInfo.boardCategoryName}">
							</div>
						</td>
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
		<c:when test="${boardCategoryInfo ne null && boardCategoryInfo ne ''}">
				 <input type="button"  class="btn btn-default pull-right" onclick="javscript:goBoardCategoryModify();" value="저장">		
		</c:when>
		<c:otherwise>
				 <input type="button"  class="btn btn-default pull-right" onclick="javscript:goBoardCategoryCreate();" value="저장">		
		</c:otherwise>
	</c:choose>			    

		    </div> 
		</div>
		
	</div>
	</form>
</body>
</html>