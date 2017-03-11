<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag" %>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/common-editor.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/board/article/write.js"></script>

<div>
	<form id="writeFrm" name="writeFrm" method="post" role="form" enctype="multipart/form-data">
	
	<input type="hidden" id="authorId" 	name="authorId" 	value="${sessionInfo.userId}"/>
	<input type="hidden" id="authorNm" 	name="authorNm" 	value="${sessionInfo.userNm}"/>
	<input type="hidden" id="articleId" name="articleId" 	value="${(articleInfo eq null) ? 0 : articleInfo.articleId}"/>
	<input type="hidden" id="userId"	name="userId"		value="${userId}" />
	<div class="wrap">
	<h1 id="btn-groups" class="page-header">Write Content</h1>
	
	<ol class="breadcrumb">
	  <li><a href="#" onclick="javascript:goHome();"><tag:message code='text.home'/></a></li>
	  <li><a href="#" onclick="javascript:goList();"><tag:message code='text.board'/></a></li>
	  <li>
	  	<a href="javascript:;"> 
<c:if test="${!empty boardList}">
	<c:forEach var="boardInfo" items="${boardList}">
		<c:if test="${boardId eq boardInfo.boardId}">${boardInfo.boardName}</c:if>										
	</c:forEach>
</c:if>
		</a>		  
	  </li>
	  <li class="active">글 작성</li>
	</ol>
		<div class="writeArea list-group-item" role="main">
			<table class="table table-condensed">
				<colgroup><col width="15%"/><col width="85%"/></colgroup>
				<tbody>
					<tr>
						<th><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;<span class="glyphicon-class"><tag:message code='text.board'/></span></th>
						<td>
							<div class="form-group">
						<c:choose>
							<c:when test="${fn:length(boardList) > 0}">
								<select class="form-control" id="boardId" name="boardId">								
							<c:choose>
								<c:when test="${articleInfo ne null && articleInfo ne ''}">
									
								<c:if test="${!empty boardList}">
									<c:forEach var="boardInfo" items="${boardList}">
									<option <c:if test='${articleInfo.boardId eq boardInfo.boardId}'>selected</c:if> value="${boardInfo.boardId}">${boardInfo.boardName}</option>
									</c:forEach>
								</c:if>
								
								</c:when>
								<c:otherwise>
								<c:if test="${!empty boardList}">
									<c:forEach var="boardInfo" items="${boardList}">
									<option <c:if test='${boardId eq boardInfo.boardId}'>selected</c:if> value="${boardInfo.boardId}">${boardInfo.boardName}</option>
									</c:forEach>
								</c:if>								
								</c:otherwise>
							</c:choose>								
								</select>								
							</c:when>
							<c:otherwise>
								<input type="hidden" id="boardId" name="boardId" value="-1"/>
								<input type="text" class="form-control" id="boardName" name="boardName" placeholder="Please, Insert Board's Title What You Want."/>
							</c:otherwise>						
						</c:choose>	
							</div>
						</td>
					</tr>
					<tr>
						<th><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;<span class="glyphicon-class"><tag:message code='text.title'/></span></th>
						<td><div class="form-group"><input type="text" class="form-control" id="title" name="title" value='<c:out value="${articleInfo.title}"/>'/></div></td>
					</tr>
					<tr>
						<th><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;<span class="glyphicon-class"><tag:message code='text.content'/></span></th>
						<td><div class="form-group"><textarea class="form-control tinymce" id="content" name="content"><c:out value="${articleInfo.content}"/></textarea></div></td>				
					</tr>					
					<tr>
						<th><span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>&nbsp;<span class="glyphicon-class">SlideShare</span></th>
						<td>
							<div class="form-group">
						<c:choose>	
							<c:when test="${articleInfo.slideshareLinkInfos ne null}">
								<c:forEach var="slideshareLinkInfo" items="${articleInfo.slideshareLinkInfos}" varStatus="index">
								<input type="hidden" class="form-control" id="slideId_${index.count-1}" name="slideshareLinkInfos[${index.count-1}].slideId" value='<c:out value="${slideshareLinkInfo.slideId}"/>'/>
								<input type="text" class="form-control" id="slideshareLinkUrl_${index.count-1}" name="slideshareLinkInfos[${index.count-1}].slideshareLinkUrl" value='<c:out value="${slideshareLinkInfo.slideshareLinkUrl}"/>'/>
								</c:forEach>								
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" id="slideshareLinkUrl" name="slideshareLinkInfos[0].slideshareLinkUrl" />
							</c:otherwise>
						</c:choose>		
							</div>
						</td>				
					</tr>					
					<tr>
						<td><span class="glyphicon glyphicon-picture" aria-hidden="true"></span>&nbsp;<span class="glyphicon-class"><tag:message code='text.thumbnail'/></span></td>
						<td>
							<div class="form-group">
	
					<c:choose>
						<c:when test="${articleInfo ne '' && articleInfo ne null}">
							<c:if test="${articleInfo.filePath ne null && articleInfo.filePath ne ''}">	
	
								<div class="thumbImg unset">
									<ul class="media-list">					
										<li class="media">
											<a class="pull-left" href="javascript:;">
												
													<img data-src="holder.js/64x64" src="http://jwlee0208.cdn3.cafe24.com/${articleInfo.filePath}" 
														 alt="" class="media-object" onerror="this.src='${pageContext.request.contextPath}/img/no_image.png'"  
														 onclick="javascript:goView('${articleInfo.articleId}');" 
														 data-toggle="modal" data-target="#myModal" 
														 width="64px" height="64px"/>
												
												
												<input type="hidden" id="filePath" 			name="filePath" 		value="${articleInfo.filePath }"/>
												<input type="hidden" id="originalFileName" 	name="originalFileName" value="${articleInfo.originalFileName }"/>
											</a>
											 <div class="media-body" onclick="javascript:goView('${articleInfo.articleId}');">
											 	<p>파일명 : ${articleInfo.originalFileName}</p>
											 	
											 </div>
											 <input type="button" class="btn btn-default" value="삭제" onclick="javascript:delThumbImage('set');"/>
										</li>							
									</ul>	
								</div>										
							</c:if>
							<div class="thumbImg set">
								<div class="row">
									<div class="col-md-4"><input type="file" id="thumbImg" name="thumbImg" accept="image/*"></div>
									<div class="col-md-8">썸네일 사이즈 설정 : 
										<div class="radio">
										  <label>
										    <input type="radio" name="thumbnailSize" id="thumbnailSizeSmall" value="small" checked>
										    64X64
										  </label>
										</div>
										<div class="radio">
										  <label>
										    <input type="radio" name="thumbnailSize" id="thumbnailSizeMiddle" value="middle">
										    256X256
										  </label>
										</div>
										<div class="radio">
										  <label>
										    <input type="radio" name="thumbnailSize" id="optionsRadiosLarge" value="large">
										    400X400
										  </label>
										</div>									
									
									</div>
								</div>
							</div>				
						</c:when>
						<c:otherwise>
								<div class="row">
									<div class="col-md-4"><input type="file" id="thumbImg" name="thumbImg"></div>
									<div class="col-md-8">썸네일 사이즈 설정 : 
										<div class="radio">
										  <label>
										    <input type="radio" name="thumbnailSize" id="thumbnailSizeSmall" value="small" checked>
										    64X64
										  </label>
										</div>
										<div class="radio">
										  <label>
										    <input type="radio" name="thumbnailSize" id="thumbnailSizeMiddle" value="middle">
										    256X256
										  </label>
										</div>
										<div class="radio">
										  <label>
										    <input type="radio" name="thumbnailSize" id="optionsRadiosLarge" value="large">
										    400X400
										  </label>
										</div>									
									
									</div>
								</div>
						</c:otherwise>
					</c:choose>
						
<%-- 								<input type="file" id="thumbImg" name="thumbImg" value="${articleInfo.originalFileName }"> --%>
								
							</div></td><!--  accept="image/x-png, image/gif, image/jpeg, image/jpg" -->
					</tr>
				</tbody>
			</table>
		</div>
<!-- 		<div class="btnArea list-group-item"> -->
<!-- 			<input type="button" class="btn btn-primary pull-right" id="saveToWrite" value="저장"/> -->
<!-- 			<input type="button" class="btn" id="cancelToWrite" value="취소"/> -->
<!-- 		</div> -->
		
		<div class="btn-group btn-group-justified" style="padding-top : 20px; padding-bottom : 20px;">
			<div class="btn-group">
				<input type="button" class="btn btn-default" id="cancelToWrite" value="<tag:message code="common.cancel"/>"/>           
		    </div>
		    <div class="btn-group">
<c:choose>
	<c:when test="${articleInfo ne null && articleInfo ne ''}">
				<input type="button" class="btn btn-default pull-right" id="saveToModify" value="<tag:message code="common.save"/>"/>
	</c:when>
	<c:otherwise>
				<input type="button" class="btn btn-default pull-right" id="saveToWrite" value="<tag:message code="common.save"/>"/>	
	</c:otherwise>
</c:choose>	

		    </div> 
		</div>
		
	</div>
	</form>
</div>