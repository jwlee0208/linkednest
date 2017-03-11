<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/holder.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
</head>
<body>
	<div class="page-header">
	  <h1>Bookmark&nbsp;&nbsp;<small>List</small></h1>
	</div>	
	<form id="boardFrm" name="boardFrm" method="post">
		<input type="hidden" id="userId" name="userId" value="${userId}"/>
	
	<!-- 검색 영역 -->	
	<!-- 
	<div class="form-group" role="search">		
		<div>
			<input type="hidden" 	id="searchCondition" name="searchCondition" value="titleNbookmark" />
			<input type="text" 		id="searchText" 	 name="searchText" 		class="form-control" placeholder="<tag:message code='text.request.insert.search.keyword'/>" value="${boardArticleDto.searchText}"/>
		</div>						
	</div>	
	 -->
	<c:set var="list" value="${bookmarkList}" />
	<div class="" id="listDiv" role="main">

<c:choose>
	<c:when test="${null ne bookmarkList && bookmarkList.size() > 0}">
		<c:forEach var="bookmark" items="${bookmarkList}" varStatus="index">
		<c:if test="${index.count % 2 eq 1}">
		<div class="row">	
		</c:if>		
			<div class="col-sm-6">
				<div class="thumbnail">
					<div class="caption">
						<h3 style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"><span onclick="javascript:goSite('${bookmark.bookmarkUrl}');" data-toggle="modal" data-target="#myModal"><c:out value="${bookmark.bookmarkName}"/></span></h3>
						<p><a href="#;" onclick="javascript:goSite('${bookmark.bookmarkUrl}');"><c:out value="${bookmark.bookmarkUrl}"/></a></p>
						<p class="bookmark_${index.count}" style="text-overflow:ellipsis; overflow:hidden;">
							<c:if test="${bookmark.webBookmarkId < 1}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
							<c:if test="${bookmark.webBookmarkId > 0}">
								<span onclick="javascript:goSite('${bookmark.bookmarkUrl}');" style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${fn:substring(bookmark.bookmarkDescription, 0, 250)}...</span>
							</c:if>
						</p>
					</div>

				</div>	
			</div>
		<c:if test="${index.count % 2 eq 0 || index.count eq bookmarkList.size()}">
		</div>
		</c:if>	
		</c:forEach>
	</c:when>
	<c:otherwise>
			<div style="min-height: 400px;"><tag:message code='text.noarticle'/></div>					
	</c:otherwise>
</c:choose>
		</div>
	</form>
		<div class="btn-group btn-group-justified" style="padding-bottom: 20px;">
			<div class="btn-group">

				<input type="button" class="btn btn-default pull-right" value="북마크 추가하기" name="goToAddBookmark" onclick="javascript:goToAddBookmark();"/>
			</div>
		</div>
			
</body>
<script>
$().ready(function(){
	$("img").each(function(index){
		$(this).error(function(){
			$(this).attr("src", "${pageContext.request.contextPath}/img/no_image.png");
		});	
	});
});
	
function goSite(bookmarkUrl){
	window.open(bookmarkUrl, '_blank', '');
}	

function goToAddBookmark(){
	var userId = $("#userId").val();
	if(userId != '' && userId != null){
		location.href="/share/bookmark/"+userId+"/add";	
	}else{
		alert('앗!!!');
		return false;
	}
}
</script>
</html>