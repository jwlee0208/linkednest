<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::: LinkedNest.net</title>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-validate.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>

<script type="text/javascript"	src="${pageContext.request.contextPath}/js/holder.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>

<style type="text/css">
	.form-group row .col-sm-10 {vertical-align : middle;}
</style>
</head>
<body>
<div class="container">
	<h1 id="btn-groups" class="page-header">League Detail</h1>
	<form id="viewFrm" name="viewFrm" method="post" class="form-horizontal" role="form">
		<input type="hidden" id="leagueId" 	name="leagueId" value="${leagueInfo.leagueId}"/>
		<div style="display:none;"><h2>${leagueInfo.leagueName}</h2></div>
		<img src="http://jwlee0208.cdn3.cafe24.com/${leagueInfo.leagueImgPath}" class="rounded mx-auto d-block"/>
		<h3>League Information</h3>
		<hr/>		
	  	<div class="form-group row">
	    	<label for="" class="col-sm-2 col-form-label">Name</label>
		    <div class="col-sm-10">
		    	<p class="form-control-static">${leagueInfo.leagueName}</p>
			</div>
		</div>
		  <div class="form-group row">
		    <label for="" class="col-sm-2 col-form-label">League Type</label>
		    <div class="col-sm-10">
		      <p class="form-control-static">${leagueInfo.leagueType}</p>
		    </div>
		  </div>

		  <div class="form-group row">
		    <label for="" class="col-sm-2 col-form-label">League Division</label>
		    <div class="col-sm-10">
		      <p class="form-control-static">${leagueInfo.leagueDivision}</p>
		    </div>
		  </div>

		  <div class="form-group row">
		    <label for="" class="col-sm-2 col-form-label">League Introduce</label>
		    <div class="col-sm-10">
		      <p class="form-control-static">${leagueInfo.introduce}</p>
		    </div>
		  </div>


		  <div class="form-group row">
		    <label for="" class="col-sm-2 col-form-label">Commissioner</label>
		    <div class="col-sm-10">
		      <p class="form-control-static">${leagueInfo.commissioner}</p>
		    </div>
		  </div>	

		  <div class="form-group row">
		    <label for="" class="col-sm-2 col-form-label">League Website</label>
		    <div class="col-sm-10">
		      <p class="form-control-static">${leagueInfo.leagueWebsiteUrl}</p>
		    </div>
		  </div>	

		  <div class="form-group row">
		    <label for="" class="col-sm-2 col-form-label">Area / Country</label>
		    <div class="col-sm-10">
		      <p class="form-control-static"><tag:message code="code.area.${leagueInfo.area}"/> / <tag:message code="code.country.${leagueInfo.country}"/></p>
		    </div>
		  </div>	

		  <div class="form-group row">
		    <label for="" class="col-sm-2 col-form-label">Established Date</label>
		    <div class="col-sm-10">
		      <p class="form-control-static">${leagueInfo.establishedDate}</p>
		    </div>
		  </div>	

		  <div class="form-group row">
		    <label for="" class="col-sm-2 col-form-label">Joined Team (Total : ${leagueInfo.joinedTeamCnt})</label>
		    <div class="col-sm-10">
		    <c:if test="${!empty leagueInfo.teamList}">
		    	<c:forEach var="teamInfo" items="${leagueInfo.teamList}">
		      <p class="form-control-static"><a href="/profile/view/${teamInfo.profileType}/${teamInfo.profileId}">${teamInfo.name}(city : ${teamInfo.profileTeamDto.city})</a></p>		    	
		    	</c:forEach>
		    </c:if>	
		    </div>
		  </div>	
	</form>
</div>

</body>
<script>
$(document).ready(function() {
	$("img").addClass("media-object");
	$("img").attr("width", "95%");
	$("img").off("error");
	$("img").on("error", function(){
		$(this).attr("src", '${pageContext.request.contextPath}/img/no_image.png');
	});
});

$(function(){

});
</script>
</html>