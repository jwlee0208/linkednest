<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/board/article/articleList.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/holder.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
</head>
<body>
<c:if test="${boardInfo.boardId eq 15}">
	<%@ include file="/WEB-INF/views/common/registPlayer.jsp"%>	
</c:if>	
	<div class="page-header">
	  <h1><tag:message code='text.board'/>&nbsp;&nbsp;<small>${boardInfo.boardName}</small></h1>
	</div>	
	
	<ol class="breadcrumb">
	  <li><a href="#" onclick="javascript:goHome();"><tag:message code='text.home'/></a></li>
	  <li><a>${boardInfo.boardCategoryName} <tag:message code='text.board'/></a></li>
	  <li class="secondBranch active">${boardInfo.boardName}</li>
	</ol>		
		
	<form id="boardFrm" name="boardFrm" method="post">
	
	<!-- 리스트에서 선택된 게시글 아이디 -->
	<input type="hidden" id="selectedArticleId" name="selectedArticleId" />
	<input type="hidden" id="boardId" 			name="boardId" 				value="${boardId}"/>
	
	<!-- 검색 영역 -->	
	<div class="form-group" role="search">		
		<div>
			<input type="hidden" 	id="searchCondition" name="searchCondition" value="titleNcontent" />
			<input type="text" 		id="searchText" 	 name="searchText" 		class="form-control" placeholder="<tag:message code='text.request.insert.search.keyword'/>" value="${boardArticleDto.searchText}"/>
		</div>						
	</div>	
	
	<c:set var="list" value="${boardList}" />
	<div class="" id="listDiv" role="main">
		<!-- paging에 필요한 파라미터 -->
		<input type="hidden" id="pageNo" 		name="pageNo" 		value="${pagedResult.pageNo}" /> 
		<input type="hidden" id="totalListCnt" 	name="totalListCnt" value="${pagedResult.totalListCnt}" /> 
		<input type="hidden" id="totalPageCnt" 	name="totalPageCnt" value="${pagedResult.totalPageCnt}" /> 
		<input type="hidden" id="startPageNo" 	name="startPageNo" 	value="${pagedResult.startPageNo}" /> 
		<input type="hidden" id="pageSize" 		name="pageSize" 	value="${pagedResult.pageSize}" />
		<input type="hidden" id="type" 		name="type" 	value="blog" />
<c:choose>
	<c:when test="${null ne pagedResult.list && pagedResult.list.size() > 0}">
		<c:forEach var="content" items="${pagedResult.list}" varStatus="index">
		<c:if test="${index.count % 2 eq 1}">
		<div class="row">	
		</c:if>		
			<div class="col-sm-6">
				<div class="thumbnail">
			<c:choose>
				<c:when test="${content.filePath ne null && content.filePath ne ''}"><img data-src="holder.js/250x250?auto=yes&theme=social" src="http://jwlee0208.cdn3.cafe24.com/${content.filePath}" alt="" class="img-rounded" onerror="this.src='${pageContext.request.contextPath}/img/no_image.png'"  onclick="javascript:goArticleView('${content.articleId}', 'popup');" data-toggle="modal" data-target="#myModal" style="max-width: 400px; max-height: 450px;"/></c:when>
				<c:otherwise><img data-src="holder.js/250x250?auto=yes&theme=social" src="${pageContext.request.contextPath}/img/no_image.png" 	 alt="" class="img-rounded" onclick="javascript:goArticleView('${content.articleId}', 'popup');" data-toggle="modal" data-target="#myModal" style="max-width: 400px; max-height: 450px;"/></c:otherwise>
			</c:choose>					
					
					<div class="caption">
						<h3 style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"><span onclick="javascript:goArticleView('${content.articleId}');" data-toggle="modal" data-target="#myModal"><c:out value="${content.title}"/></span></h3>
						<p class="content_${index.count}" style="text-overflow:ellipsis; overflow:hidden;">
							<c:if test="${content.content eq null || content.content eq ''}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
							<c:if test="${content.content ne null && content.content ne ''}">
								<span onclick="javascript:goArticleView('${content.articleId}', 'noPopup');" style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${fn:substring(content.contentText, 0, 250)}...</span>
							</c:if>
						</p>
						<p><span class="btn btn-link btn-block" role="button" onclick="javascript:goArticleView('${content.articleId}');"><tag:message code='button.detailview'/></span></p>
					</div>

				</div>	
			</div>
		<c:if test="${index.count % 2 eq 0 || index.count eq pagedResult.list.size()}">
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

				<input type="submit" class="btn btn-default pull-right" value="<tag:message code="common.write"/>" name="goToWrite" />
			</div>
		</div>	

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body" style="height : 500px; overflow-y:scroll; word-wrap:break-word; "></div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
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
	
function goArticleView(articleId, type){
	
	if(type == 'popup'){
		$.ajax({
			url : '/share/view/' + articleId, //'/board/article/view/' + articleId,
			data : {selectedArticleId : articleId},
			dataType : 'html',
			success : function(data){
				$('.modal-title').html(($(data).find(".panel-title").html()));
				$('.modal-body').html(($(data).find(".panel-body").html()));
			}
		});		
	}else{
		goView(articleId);		
	}
}	
</script>
</html>