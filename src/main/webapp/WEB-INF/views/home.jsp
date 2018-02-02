<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag" %>

	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1 class="display-3" style="color:#efefef;">Find &nbsp;|&nbsp; Join &nbsp;|&nbsp; Play</h1>
			<p class="lead" style="color:#efefef;">Why Don't You Try To Find Your Team Or Player?</p>
			<p class="lead" style="color:#efefef;"><strong>"<tag:message code='sub.text4'/>"</strong> - 'Yogi' Lawrence Peter Berra</p>
			<input type="button" class="btn btn-primary btn-lg registProfile" value="Regist Your Profile"/>		
		</div>
	</div>
	<form id="mainFrm" name="mainFrm" method="post"></form>	
	<div class="container" role="main">
		<h4><tag:message code='text.recentregistplayers'/>&nbsp;&nbsp;<small><a href="/profile/list/1/01010100"><tag:message code='button.more'/></a></small></h4>
		<hr/>
		<div class="row">
		<c:choose>
			<c:when test="${!empty recentPlayerProfileList}">
				<c:forEach var="recentPlayerProfileInfo" items="${recentPlayerProfileList}" varStatus="index">
				<div class="col-sm-4">
					<div class="card">
							<c:choose>
								<c:when test="${recentPlayerProfileInfo.profileImgPath ne null && recentPlayerProfileInfo.profileImgPath ne ''}">
							<img src="http://jwlee0208.cdn3.cafe24.com/${recentPlayerProfileInfo.profileImgPath}" 
								 data-src="holder.js/250x200" alt="image" class="card-img-top img-fluid mx-auto d-block" 
								 onerror="this.src='http://jwlee0208.cdn3.cafe24.com/img/no_image.png'"  
								 onclick="javascript:goProfileView('${recentPlayerProfileInfo.profileId}', '${recentPlayerProfileInfo.profileType}');" 
								 style="cursor:pointer;"/>
								</c:when>
								<c:otherwise>
							<img src="http://jwlee0208.cdn3.cafe24.com/img/no_image.png" 
								 data-src="holder.js/250x200" alt="image" class="card-img-top img-fluid mx-auto d-block"
								 onclick="javascript:goProfileView('${recentPlayerProfileInfo.profileId}', '${recentPlayerProfileInfo.profileType}');" 
								 style="cursor:pointer; width:auto;"/>
								</c:otherwise>
							</c:choose>	
							<div class="card-block" style="cursor:pointer;">
							
								<p class="card-text">
									<c:choose>
										<c:when test="${recentPlayerProfileInfo.profileType eq 1}">
											<c:set var="playerInfo" value="${recentPlayerProfileInfo.profilePlayerDto}"/>
											<img src="${pageContext.request.contextPath}/img/country/${fn:toLowerCase(playerInfo.nationality)}.png" width="30px" height="20px"/>&nbsp;
											<span class="btn btn-outline-primary btn-sm"><tag:message code="code.country.${fn:toUpperCase(playerInfo.nationality)}"/></span>
											<span class="btn btn-outline-info btn-sm">
											<c:if test="${recentPlayerProfileInfo.catId2 eq '01010101'}"><tag:message code="attr.position.p"/></c:if>
											<c:if test="${recentPlayerProfileInfo.catId2 eq '01010102'}"><tag:message code="attr.position.cc"/></c:if>
											<c:if test="${recentPlayerProfileInfo.catId2 eq '01010103'}"><tag:message code="attr.position.1b"/></c:if>
											<c:if test="${recentPlayerProfileInfo.catId2 eq '01010104'}"><tag:message code="attr.position.2b"/></c:if>
											<c:if test="${recentPlayerProfileInfo.catId2 eq '01010105'}"><tag:message code="attr.position.3b"/></c:if>
											<c:if test="${recentPlayerProfileInfo.catId2 eq '01010106'}"><tag:message code="attr.position.ss"/></c:if>
											<c:if test="${recentPlayerProfileInfo.catId2 eq '01010107'}"><tag:message code="attr.position.lf"/></c:if>
											<c:if test="${recentPlayerProfileInfo.catId2 eq '01010108'}"><tag:message code="attr.position.cf"/></c:if>
											<c:if test="${recentPlayerProfileInfo.catId2 eq '01010109'}"><tag:message code="attr.position.rf"/></c:if>
											<c:if test="${recentPlayerProfileInfo.catId2 eq '01010110'}"><tag:message code="attr.position.dh"/></c:if>
											</span>
										</c:when>
										<c:when test="${recentPlayerProfileInfo.profileType eq 2}">
											<c:set var="playerInfo" value="${recentPlayerProfileInfo.profilePlayerDto}"/>
											<img src="${pageContext.request.contextPath}/img/country/${fn:toLowerCase(playerInfo.nationality)}.png" width="30px" height="20px"/>&nbsp;
											<span class="btn btn-outline-primary btn-sm"><tag:message code="code.country.${fn:toUpperCase(playerInfo.nationality)}"/></span>									
										</c:when>
										<c:when test="${recentPlayerProfileInfo.profileType eq 3}">
											<c:set var="teamInfo" value="${recentPlayerProfileInfo.profileTeamDto}"/>
											<c:set var="leagueInfo" value="${recentPlayerProfileInfo.leagueInfoDto}"/>
											<img src="${pageContext.request.contextPath}/img/country/${fn:toLowerCase(leagueInfo.country)}.png" data-src="holder.js/30x20" width="30px" height="20px"/>&nbsp;
											<span class="btn btn-outline-primary btn-sm"><tag:message code="code.country.${fn:toUpperCase(leagueInfo.country)}"/></span>
											<span class="btn btn-outline-info btn-sm">${teamInfo.city}</span>	
											<div>
											<span class="btn btn-outline-success btn-sm"><tag:message code="code.leaguetype.${leagueInfo.leagueType}"/></span>
											<span class="btn btn-outline-info btn-sm">Division ${leagueInfo.leagueDivision}</span>		
											</div>							
										</c:when>
									</c:choose>
								</p>	
									<br/>							
							
								<h3 class="card-title"><span onclick="javascript:goProfileView('${recentPlayerProfileInfo.profileId}', '${recentPlayerProfileInfo.profileType}');">${recentPlayerProfileInfo.name}</span></h3>
								<p class="content_${index.count} card-text"></p>
								<p>
									
								</p>
							</div>
							<div class="card-footer">
								<span class="btn btn-outline-danger btn-block" 		role="button" onclick="javascript:goProfileView('${recentPlayerProfileInfo.profileId}', '${recentPlayerProfileInfo.profileType}');"><tag:message code='button.watchme'/></span>					
							</div>
					</div>
					<br/>
				</div>	
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div style="padding-left : 20px; min-height : 70px; vertical-align: middle;">
					<p><tag:message code='text.noregistplayer'/></p>
				</div>
			</c:otherwise>	
		</c:choose>
		</div>		
		
		<h4>Recent Registered Team List&nbsp;&nbsp;<small><a href="/profile/list/3/01010300"><tag:message code='button.more'/></a></small></h4>
		<hr/>
		<div class="row">
		<c:choose>
			<c:when test="${!empty recentTeamProfileList}">
				<c:forEach var="recentTeamProfileInfo" items="${recentTeamProfileList}" varStatus="index">
				<div class="col-sm-4">
					<div class="card">
							<c:choose>
								<c:when test="${recentTeamProfileInfo.profileImgPath ne null && recentTeamProfileInfo.profileImgPath ne ''}">
							<img src="http://jwlee0208.cdn3.cafe24.com/${recentTeamProfileInfo.profileImgPath}" 
								 data-src="holder.js/250x200" alt="image" class="card-img-top img-fluid mx-auto d-block" 
								 onerror="this.src='http://jwlee0208.cdn3.cafe24.com/img/no_image.png'"  
								 onclick="javascript:goProfileView('${recentTeamProfileInfo.profileId}', '${recentTeamProfileInfo.profileType}');"  
								 style="cursor:pointer;"/>
								</c:when>
								<c:otherwise>
							<img src="http://jwlee0208.cdn3.cafe24.com/img/no_image.png" 
								 data-src="holder.js/250x200" alt="image" class="card-img-top img-fluid mx-auto d-block"
								 onclick="javascript:goProfileView('${recentTeamProfileInfo.profileId}', '${recentTeamProfileInfo.profileType}');" 
								 style="cursor:pointer;"/>
								</c:otherwise>
							</c:choose>	
							<div class="card-block" style="cursor:pointer;">
								<p class="card-text">
									<c:choose>
										<c:when test="${recentTeamProfileInfo.profileType eq 1}">
											<c:set var="playerInfo" value="${recentTeamProfileInfo.profilePlayerDto}"/>
											<img src="${pageContext.request.contextPath}/img/country/${fn:toLowerCase(playerInfo.nationality)}.png" width="30px" height="20px"/>&nbsp;
											<span class="btn btn-outline-primary btn-sm"><tag:message code="code.country.${fn:toUpperCase(playerInfo.nationality)}"/></span>
											<span class="btn btn-outline-info btn-sm">
											<c:if test="${recentTeamProfileInfo.catId2 eq '01010101'}"><tag:message code="attr.position.p"/></c:if>
											<c:if test="${recentTeamProfileInfo.catId2 eq '01010102'}"><tag:message code="attr.position.cc"/></c:if>
											<c:if test="${recentTeamProfileInfo.catId2 eq '01010103'}"><tag:message code="attr.position.1b"/></c:if>
											<c:if test="${recentTeamProfileInfo.catId2 eq '01010104'}"><tag:message code="attr.position.2b"/></c:if>
											<c:if test="${recentTeamProfileInfo.catId2 eq '01010105'}"><tag:message code="attr.position.3b"/></c:if>
											<c:if test="${recentTeamProfileInfo.catId2 eq '01010106'}"><tag:message code="attr.position.ss"/></c:if>
											<c:if test="${recentTeamProfileInfo.catId2 eq '01010107'}"><tag:message code="attr.position.lf"/></c:if>
											<c:if test="${recentTeamProfileInfo.catId2 eq '01010108'}"><tag:message code="attr.position.cf"/></c:if>
											<c:if test="${recentTeamProfileInfo.catId2 eq '01010109'}"><tag:message code="attr.position.rf"/></c:if>
											<c:if test="${recentTeamProfileInfo.catId2 eq '01010110'}"><tag:message code="attr.position.dh"/></c:if>
											</span>
										</c:when>
										<c:when test="${recentTeamProfileInfo.profileType eq 2}">
											<c:set var="playerInfo" value="${recentTeamProfileInfo.profilePlayerDto}"/>
											<img src="${pageContext.request.contextPath}/img/country/${fn:toLowerCase(playerInfo.nationality)}.png" width="30px" height="20px"/>&nbsp;
											<span class="btn btn-outline-primary btn-sm"><tag:message code="code.country.${fn:toUpperCase(playerInfo.nationality)}"/></span>									
										</c:when>
										<c:when test="${recentTeamProfileInfo.profileType eq 3}">
											<c:set var="teamInfo" value="${recentTeamProfileInfo.profileTeamDto}"/>
											<c:set var="leagueInfo" value="${recentTeamProfileInfo.leagueInfoDto}"/>
											<img src="${pageContext.request.contextPath}/img/country/${fn:toLowerCase(leagueInfo.country)}.png" data-src="holder.js/30x20" width="30px" height="20px"/>&nbsp;
											<span class="btn btn-outline-primary btn-sm"><tag:message code="code.country.${fn:toUpperCase(leagueInfo.country)}"/></span>
											<span class="btn btn-outline-info btn-sm">${teamInfo.city}</span>	
											<div>
											<span class="btn btn-outline-success btn-sm"><tag:message code="code.leaguetype.${leagueInfo.leagueType}"/></span>
											<span class="btn btn-outline-info btn-sm">Division ${leagueInfo.leagueDivision}</span>		
											</div>							
										</c:when>
									</c:choose>
								</p>	
									<br/>

							
								<h3 class="card-title"><span onclick="javascript:goProfileView('${recentTeamProfileInfo.profileId}', '${recentTeamProfileInfo.profileType}');">${recentTeamProfileInfo.name}</span></h3>
								<div class="btn-group btn-group-lg btn-group-justified">
<%-- 									<c:if test="${!empty recentTeamProfileInfo.profileAttrList}"> --%>
<%-- 									<c:forEach var="profileAttrElemInfo" items="${recentTeamProfileInfo.profileAttrList}"> --%>
<%-- 										<c:if test="${!empty profileAttrElemInfo.profileAttrElementMapList}"> --%>
<%-- 											<c:forEach var="profileAttrElemInfo" items="${profileAttrElemInfo.profileAttrElementMapList}"> --%>
<%-- 									<div class="btn btn-default">${profileAttrElemInfo.profileAttrElementMapName}</div> --%>
<%-- 											</c:forEach> --%>
<%-- 										</c:if>	 --%>
<%-- 									</c:forEach>				 --%>
<%-- 									</c:if> --%>
								</div>
								<p class="content_${index.count}"></p>
							</div>
							<div class="card-footer">
								<span class="btn btn-outline-danger btn-block" 		role="button" onclick="javascript:goProfileView('${recentTeamProfileInfo.profileId}', '${recentTeamProfileInfo.profileType}');"><tag:message code='button.watchme'/></span>							
							</div>
					</div>		
					<br/>
				</div>						
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div style="padding-left : 20px; min-height : 70px; vertical-align: middle;">
					<p><tag:message code='text.noregistplayer'/></p>
				</div>
			</c:otherwise>	
		</c:choose>	
		</div>	
<!-- // 2016.06.14 이후 작업 --> 		
		<h4><tag:message code='text.recenttryoutinfo'/>&nbsp;&nbsp;<small><a href="/share/jwlee/list/15"><tag:message code='button.more'/></a></small></h4>
		<hr/>
<!-- 		<div class="row" style="padding-left: 10px; padding-right: 10px;"> -->
			<div class="boardDiv li_1_board" style="padding-top : 10px;">
				<div class="table-responsive">
					<table class="table table-striped">
						<colgroup><col width="15%"/><col width="85%"/></colgroup>
					<c:choose>		
						<c:when test="${null ne recentTryoutList && recentTryoutList.size() > 0}">
							<c:forEach var="article" items="${recentTryoutList}">
						<tr>
							<td>${fn:substring(article.createDate, 0, 10)}</td>
							<td><span onclick="javascript:goArticleView('${article.articleId}');" style="cursor:pointer;">${article.title }</span></td>
						</tr>	
							</c:forEach> 
						</c:when>
						<c:otherwise>
						<tr><td colspan="2">There is no article.</td></tr>
						</c:otherwise>	
					</c:choose>		
					</table>
				</div>
			</div>
<!-- 		</div>	 -->
	</div>
	
	<!-- Modal -->
	<c:import url="/common/modalPopup"/>
<!-- 	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> -->
<!-- 	  <div class="modal-dialog modal-lg"> -->
<!-- 	    <div class="modal-content"> -->
<!-- 	      <div class="modal-header"> -->
<!-- 	        <button type="button" class="close" data-dismiss="modal" onclick="javascript:initModalHtml();"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
<!-- 	        <h4 class="modal-title" id="myModalLabel">Modal title</h4> -->
<!-- 	      </div> -->
<!-- 	      <div class="modal-body" style="height : 500px; overflow-y:scroll; "></div> -->
<!-- 	      <div class="modal-footer"> -->
<!-- 	        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:initModalHtml();">Close</button> -->
<!-- 	      </div> -->
<!-- 	    </div> -->
<!-- 	  </div> -->
<!-- 	</div> -->
<script>
	$().ready(function(){
		$("#li_1").addClass("active");
		
		$(".li_1_board").show();
		
		$("#boardTab .li").on("click", function(){
			$(".li").removeClass("active");
			$(".boardDiv").hide();
			
			$("#" + $(this).attr("id")).addClass("active");
			$("." + $(this).attr("id") + "_board").show();
		});
	});


	function goArticleView(articleId){
		$.ajax({
			url : '/share/view/' + articleId,
			data : {selectedArticleId : articleId},
			dataType : 'html',
			success : function(data){
				$('.modal-title').html(($(data).find(".panel-title").html()));
				$('.modal-body').html(($(data).find(".panel-body").html()));
			}
		});
	}

	var jumboHeight = $('.jumbotron').outerHeight();
	function parallax(){
	    var scrolled = $(window).scrollTop();
	    $('.bg').css('height', (jumboHeight-scrolled) + 'px');
	}

	$(window).scroll(function(e){
	    parallax();
	});
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/circle.css"/>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/profile/profileView.js"></script>
<style>
	.jumbotron {
		background: #000 url("../img/home/img06.jpg") center center;
		background-size: cover;
		overflow: hidden;
	}
	iframe {width : 250px; height : 200px; align:center;}
</style>


