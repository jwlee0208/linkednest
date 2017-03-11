<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!--  
<c:choose>
	<c:when test="${!empty photoList}">
		<div class="row" style="padding:0 10px 0 10px;">
			<div class="well">
	<div id="myCarousel" class="carousel slide">
		<div class="carousel-inner" style="padding-bottom: 20px;">
			<c:set var="photoListSize" value="${fn:length(photoList)}"/>
			<c:set var="loopIdx" value="${0}"/>
			<c:forEach var="relatedPhoto" items="${photoList}" varStatus="index">
	<c:set var="loopIdx" value="${index.count}"/>
	
	<c:if test="${(loopIdx % 4) eq 1}">
	<c:choose>
		<c:when test="${loopIdx eq 1}">
			<div class="item active">		
		</c:when>
		<c:otherwise>
			<div class="item">	
		</c:otherwise>
	</c:choose>
	<div class="row">
	</c:if>
		<div class="col-xs-6 col-md-3">
		  <a href="${relatedPhoto.largeUrl}" class="thumbnail" data-flickr-embed="true" target="_blank" title="${relatedPhoto.title}">
		    <img src="${relatedPhoto.thumbnailUrl}" alt="${relatedPhoto.title}" class="img-responsive" title="${relatedPhoto.title}">
		  </a>
		</div>
		  		<c:if test="${(loopIdx % 4) eq 0 || loopIdx eq photoListSize}">
		  		</div>
		  	</div>		
		  		</c:if>		
			</c:forEach> 
		</div>
		<c:if test="${photoListSize > 4}">
		<a class="left carousel-control" href="#myCarousel" data-slide="prev"><c:out value="<"/></a>
		            <a class="right carousel-control" href="#myCarousel" data-slide="next"><c:out value=">"/></a>
		            <c:set var="indicatorCnt" value="${photoListSize/4}"/>
		            <c:if test="${photoListSize%4 > 0}">
		            	<c:set var="indicatorCnt" value="${indicatorCnt+1}"/>
		            </c:if>
			            <c:if test="${indicatorCnt > 0}">
	                <ol class="carousel-indicators" style="padding:0 0 10px 0;">
			<c:forEach var="indicator" begin="1" end="${indicatorCnt}" varStatus="index">
	                    <li data-target="#myCarousel" data-slide-to="${index.count - 1}" <c:if test="${index.count eq 1}">class="active"</c:if>></li>
			</c:forEach>            
	                </ol>                
			            </c:if>		            
		            </c:if>		
	</div>
			</div>	
		</div>
	</c:when>
	<c:otherwise>
	<script>
		hideDiv('photo');
	</script>

	</c:otherwise>
</c:choose>
-->

<c:choose>
<c:when test="${!empty photoList}">
	<div class="container-fluid">
<!-- 		<div style="padding-top:20px; paddong-bottom:20px;"> -->
<!-- 			<input type="text" class="form-control" id="searchFlicker" name="searchFlickr" placeholder="insert keyword"/> -->
<!-- 		</div> -->
	<c:forEach var="relatedPhoto" items="${photoList}" varStatus="index">
		<div class="row" style="padding:0 10px 0 10px;">
			<div class="well">
				<div class="row">
					  <a href="${relatedPhoto.largeUrl}" data-flickr-embed="true" target="_blank" title="${relatedPhoto.title}">
					    <img src="${relatedPhoto.mediumUrl}" alt="${relatedPhoto.title}" class="img-responsive" title="${relatedPhoto.title}">
					  </a>
				</div>
			</div>
		</div>
	</c:forEach>		
	</div>	
</c:when>
<c:otherwise>
	<script>
		hideDiv('photo');
	</script>

</c:otherwise>
</c:choose>
<script>
	$(function(){
		$("input[name=searchFlickr]").keypress(function(event){
			if(event.which == 13){
				event.preventDefault();				
			}
		});
	});
</script>