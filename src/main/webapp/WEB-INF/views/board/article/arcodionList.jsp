<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag" %>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/common/paging.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/board/article/articleList.js"></script>
<link 	rel="stylesheet" 		href="${pageContext.request.contextPath}/css/pagination.css">

	<div class="blog-header">
	  <h1><tag:message code='text.board'/>&nbsp;&nbsp;<small><tag:message code='text.all'/></small></h1>
	</div>	
	
	<ol class="breadcrumb">
	  <li><a href="javascript:;"><tag:message code='text.home'/></a></li>
	  <li><a href="javascript:;"><tag:message code='text.board'/></a></li>
	  <li class="secondBranch active"><tag:message code='text.all'/></li>
	</ol>		
	
	<form id="boardFrm" name="boardFrm" method="post">
	
	<!-- 리스트에서 선택된 게시글 아이디 -->
	<!-- 	<input type="hidden" id="selectedArticleId" name="selectedArticleId" /> -->
	<input type="hidden" id="boardId" name="boardId" value="0"/>

	<!-- 검색 영역 -->	
	<div class="form-group" role="search">
		<div class="">
			<input type="hidden" 	id="searchCondition" name="searchCondition" value="titleNcontent" 	/>
			<input type="text" 		id="searchText" 	 name="searchText" 		class="form-control" placeholder="<tag:message code='text.request.insert.search.keyword'/>" value="${boardArticleDto.searchText}" />		
		</div>
	</div>
	
	<c:set var="list" value="${boardList}" />	
	<div id="listDiv" role="main">
		<!-- paging에 필요한 파라미터 -->
		<input type="hidden" id="pageNo" 		name="pageNo" 		value="${pagedResult.pageNo}" /> 
		<input type="hidden" id="totalListCnt" 	name="totalListCnt" value="${pagedResult.totalListCnt}" /> 
		<input type="hidden" id="totalPageCnt" 	name="totalPageCnt" value="${pagedResult.totalPageCnt}" /> 
		<input type="hidden" id="startPageNo" 	name="startPageNo" 	value="${pagedResult.startPageNo}" /> 
		<input type="hidden" id="pageSize" 		name="pageSize" 	value="${pagedResult.pageSize}" />
		<input type="hidden" id="type" 			name="type" 		value="type" />
		
		<div class="panel-group" id="accordion" style="min-height: 300px;">
				<c:choose>
					<c:when test="${null ne pagedResult.list && pagedResult.list.size() > 0}">
						<c:forEach var="contentInfo" items="${pagedResult.list}" varStatus="index">
			<div class="panel panel-default">
				<div class="panel-heading" style=" background: white;">
					<h4 class="panel-title" style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse${index.count}"><c:out value="${contentInfo.title}"/> </a>
					</h4>
				</div>
				<div id="collapse${index.count}" class="collapse in">
					<div class="panel-body" style="padding-left: 15px; white-space:normal; white-break:break-word;">
						<div class="row">
							<div class="btn btn-link" style="float:left; color:#999;" onclick="javascript:goMyShare('${contentInfo.shareInfo.userId}');">
								<fmt:parseDate var="parsedCreateDate" value="${fn:replace(fn:substring(contentInfo.createDate, 0, 10), '-', '')}" pattern="yyyyMMdd" />
								<span class="glyphicon glyphicon-calendar"></span>&nbsp;Posted on <fmt:formatDate value="${parsedCreateDate}" pattern="MMM dd.yyyy" /> by <a href="javascript:;">${contentInfo.authorNm}</a>
							</div>
							<div class="btn btn-link" style="float:right; color:#999;">
								<a href="/share/${contentInfo.shareInfo.userId}/view/${contentInfo.articleId}" target="_blank">상세보기</a>
							</div>
						</div>		
<%-- 						<p style="text-align: left;"><a href="/share/${contentInfo.shareInfo.userId}/view/${contentInfo.articleId}" target="_blank">http://linkednest.net/share/${contentInfo.shareInfo.userId}/view/${contentInfo.articleId}</a></p>						 --%>
						<div style="white-space: normal; white-break: break-all;"> 
							<c:out value="${contentInfo.content}" escapeXml="false"/><br/><br/>
						</div>

						<div class="embed-responsive embed-responsive-16by9">
							<c:set var="slideshareLinkInfos" value="${contentInfo.slideshareLinkInfos}"/>
							
							<c:if test="${!empty slideshareLinkInfos}">
								<c:forEach var="slideshareLinkInfo" items="${slideshareLinkInfos}">
									<c:out value="${slideshareLinkInfo.slideshareLinkUrl}" escapeXml="false"/><br/>
								</c:forEach>
							</c:if>				
						</div>
						<div class="row">
							<div class="btn btn-link" style="float:left; color:#999;">
								<span class="glyphicon glyphicon-folder-open"></span>&nbsp;&nbsp;Posted in <a href="/share/${contentInfo.shareInfo.userId}/list/${contentInfo.boardId}">${contentInfo.boardName}</a>
							</div>	
						</div>
						
<!-- 						<div class="row"> -->
<%-- 							<div class="btn btn-link" style="float:left; color:#999;">${fn:substring(contentInfo.createDate, 0, 10)}</div> --%>
<%-- 							<div class="btn btn-link" style="float:right; color:#999;" onclick="javascript:goMyShare('${contentInfo.shareInfo.userId}');">Posted by <a href="javascript:;">${contentInfo.authorNm}</a></div>	 --%>
<!-- 						</div> -->
						
						<div class="row" style="float: left; padding-left:10px;">
							<div class="btn btn-success" title="${contentInfo.boardCategoryName} > ${contentInfo.boardName}" onclick="javascript:goMyShare('${contentInfo.shareInfo.userId}');">${contentInfo.shareInfo.shareName}</div>			
						</div>				
						<div class="row" style="float: right; padding-right:10px;">
							<div class="btn btn-primary" title="Sharing Article To Facebook"	onclick="javascript:share('fb', '${contentInfo.articleId}', '', '${contentInfo.shareInfo.userId}');" >f</div>
							<div class="btn btn-info" 	 title="Sharing Article To Twitter" 	onclick="javascript:share('tw', '${contentInfo.articleId}', '${contentInfo.title}', '${contentInfo.shareInfo.userId}');" >t</div>
						</div>
						
					</div>
				</div>
			</div>					
						</c:forEach>
					</c:when>
					<c:otherwise>
			<div style="text-align: center; min-height : 450px;"><tag:message code='text.noarticle'/></div>
					</c:otherwise>
				</c:choose>
		</div>	
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
	    <c:param value="blog"   					name="type"/>    
	</c:import>     
	
<c:if test="${isWritable}">	                                                                                                 
	<div class="btn-group btn-group-justified" style="padding-bottom: 20px;">
		<div class="btn-group">
			<input type="submit" class="btn btn-default pull-right" value="<tag:message code='common.write'/>" name="goToWrite" />
		</div>
	</div>	
</c:if>
<script type="text/javascript">
$(document).ready(function() {
	$("div img").addClass("media-object");
	$("div img").attr("width", "100%");
	$("div img").removeAttr("height");
	$("div img").off("error");
	$("div img").on("error", function(){
		$(this).attr("src", '${pageContext.request.contextPath}/img/no_image.png');
	});

	$(".panel-title").each(function(){
		if($(this).hasClass("collapsed")){
			$(this).children("a").text("∨ " + $(this).children("a").text());
		}else{
			$(this).children("a").text("∧ " + $(this).children("a").text());
		}
	});
		
	$(".panel-title").click(function(){
		if($($(this).children("a").attr("href")).height() > 0){
			$(this).children("a").text($(this).children("a").text().replace("∧ ", "∨ "));
		}else{
			$(this).children("a").text($(this).children("a").text().replace("∨ ", "∧ "));
				
		}
	});
});
</script>