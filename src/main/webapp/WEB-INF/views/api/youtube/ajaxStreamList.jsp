<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:choose>
	<c:when test="${!empty streamList}">
		<c:set var="streamListSize" value="${fn:length(streamList)}"/>
		<c:forEach var="streamInfo" items="${streamList}" varStatus="index">
		<div class="alert alert-warning" role="alert">${streamInfo.snippet.title}
	<c:choose>
		<c:when test="${type eq 'select'}">
			<input type="button" class="btn btn-link pull-right" value="Select" id="${streamInfo.id.videoId}" name="selectStreamBtn" title="${streamInfo.snippet.title}"></div>					
		</c:when>
		<c:otherwise>
			<input type="button" class="btn btn-link pull-right" value="Show/Hide" id="${streamInfo.id.videoId}" name="toggleStreamBtn"></div>		
		</c:otherwise>
	</c:choose>	
		
		<div class="embed-responsive embed-responsive-16by9" id="stream_${streamInfo.id.videoId}">
			<iframe width="420" height="315" src="https://www.youtube.com/embed/${streamInfo.id.videoId}?autoplay=0" class="embed-responsive-item"></iframe>
		</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<script>
			hideDiv('stream');
		</script>
	</c:otherwise>
</c:choose>
<script>
	$(function(){
		$("input[name=toggleStreamBtn]").click(function(){
 			$("#stream_" + $(this).attr("id")).toggle('slow', function(){ 

 	 		});
		});

		$("input[name=selectStreamBtn]").click(function(){
 			$("#youtubeTitle").val($(this).attr("title"));
	 			
 			var url = "<iframe width=\"420\" height=\"315\" src=\"http://www.youtube.com/embed/";
 			url += $(this).attr("id");
 			url += "?autoplay=0\" class=\"embed-responsive-item\"></iframe>";
 			$("#youtubeUrl").val(url);
		});

	});
</script>