<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:choose>
	<c:when test="${!empty slideList}">	
		<c:set var="slideListSize" value="${fn:length(slideList)}"/>
		<c:forEach var="slideInfo" items="${slideList}" varStatus="index">
				<div class="alert alert-success" role="alert">${slideInfo.title}<input type="button" class="btn btn-link pull-right" value="Show/Hide" id="${slideInfo.id}" name="toggleSlideBtn"></div>
			<div class="embed-responsive embed-responsive-16by9" id="slide_${slideInfo.id}">	
			<c:out value="${slideInfo.embed}" escapeXml="false"/>
			</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<script>
			hideDiv('slide');
		</script>
	</c:otherwise>
</c:choose>
<script>
	$(function(){
		$("input[name=toggleSlideBtn]").click(function(){
 			$("#slide_" + $(this).attr("id")).toggle('slow', function(){ 

 	 		});
		});
	});
</script>