<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"	%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"	%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" 	content="IE=Edge" />
<meta name="viewport" 				content="width=device-width, initial-scale=1">
<meta name="title" 					content="Player List"/>
<meta name="author" 				content="Lee Jinwon"/>
<meta name="description" 			content="Checkout Future's MVP"/>
<meta name="robots" 				content="index,follow" /> 
<meta name="keywords" 				content="blog, baseball, link, player, profile"/>

<script type="text/javascript"	src="${pageContext.request.contextPath}/js/holder.js"></script>

<link 	rel="stylesheet" 		href="${pageContext.request.contextPath}/css/pagination.css">
<link 	rel="stylesheet" 		href="${pageContext.request.contextPath}/css/profileList.css">
<form id="listFrm" name="listFrm" method="post">
	<div class="container">
	
		<h1 id="btn-groups" class="page-header">League List</h1>
		<div class="form-group">
	
			<div class="form-group row" role="search">
				<input type="hidden" 	id="searchCondition" 	name="searchCondition" value="name"/>
				<input type="hidden" 	id="searchText" 		name="searchText" />
				<input type="text" 		id="searchTextStr" 		name="searchTextStr" class="form-control ui-autocomplete-input" placeholder="<tag:message code='text.request.insert.search.keyword'/>"/>
			</div>
			
			<!-- list area -->
			<div id="listDiv" role="main">
				<div class="row">
<c:choose>
	<c:when test="${!empty leagueList}">
		<c:forEach var="leagueInfo" items="${leagueList}" varStatus="index">
				<div class="col-sm-4">
					<div class="card">
						<c:choose>
							<c:when test="${leagueInfo.leagueImgPath ne null && leagueInfo.leagueImgPath ne ''}">
						<img src="http://jwlee0208.cdn3.cafe24.com/${leagueInfo.leagueImgPath}" 
							 data-src="holder.js/250x200" alt="image" class="card-img-top img-fluid mx-auto d-block" 
							 onerror="this.src='http://jwlee0208.cdn3.cafe24.com/img/no_image.png'"  
							 onclick="javascript:goDetailLeague('${leagueInfo.leagueId}');"  
							 style="cursor:pointer; "/>
							</c:when>
							<c:otherwise>
						<img src="http://jwlee0208.cdn3.cafe24.com/img/no_image.png" 
							 data-src="holder.js/250x200" alt="image" class="card-img-top img-fluid mx-auto d-block"
							 onclick="javascript:goDetailLeague('${leagueInfo.leagueId}');" 
							 style="cursor:pointer; "/>
							</c:otherwise>
						</c:choose>	
						<div class="card-block" style="cursor:pointer;">				
							<p class="card-text">
							<img src="${pageContext.request.contextPath}/img/country/${fn:toLowerCase(leagueInfo.country)}.png" width="30px" height="20px"/>&nbsp;<tag:message code="code.country.${fn:toUpperCase(leagueInfo.country)}"/>
							<br/><br/>
							<span class="btn btn-outline-info btn-sm">
							<tag:message code="code.area.${leagueInfo.area}"/>
							</span>
							<span class="btn btn-outline-primary btn-sm">
							<tag:message code="code.leaguetype.${leagueInfo.leagueType}"/>
							</span>
							</p>
							<h3 class="card-title"><span onclick="javascript:goDetailLeague('${leagueInfo.leagueId}');">${leagueInfo.leagueName}</span>
							</h3>
						</div>
						<div class="card-footer">
							<span class="btn btn-outline-danger btn-block" 		role="button" onclick="javascript:goDetailLeague('${leagueInfo.leagueId}');" >See Detail</span>
						</div>
					</div>		
					<br/>
				</div>	
		</c:forEach>
	</c:when>
	<c:otherwise>
		nothing
	</c:otherwise>	
</c:choose>		
				</div>
			</div>
			<!-- // list area -->
		<c:if test="${isLogon}">
			<div class="btn-group btn-group-justified" style="padding-bottom: 20px;">
				
					<input type="button" class="btn btn-default pull-right" value="새로운 리그 등록" name="goToRegistLeague" />
				
			</div>		
		</c:if>
		</div>	
	</div>
	<!-- modal popup area -->
	<c:import url="/common/modalPopup"/>
	<!-- // modal popup area -->	
</form>
<script>
$(document).on("ready", function() {
	$("input[name='goToRegistLeague']").on("click", function() {
		location.href = "/profile/registLeague";
	});

	$( "#searchText" ).keypress(function( event ) {
		  if ( event.which == 13 ) {
			  event.preventDefault();
			  goLeagueSearch();
		  }			  
	});		
});

function goLeagueSearch(){
	
}

function isEmpty(val){
    return (val == '' || val == null || val == 'undefined') ? true : false;
}

function goDetailLeague(leagueId){
	location.href = '/profile/leagueView/' + leagueId;
// 	$.ajax({
// 		url : '/profile/leagueView/' + leagueId,
// 		data : '',
// 		dataType : 'html',
// 		success : function(data){
// 			$('.modal-title').html(($(data).find("h2").html()));
// 			$('.modal-body').html(data);
// 		}
// 	});
}

// modal 창 조회후 close시 html 초기화 : css issue
function initModalHtml(){
	$('.modal-body').html('');
}

</script>
