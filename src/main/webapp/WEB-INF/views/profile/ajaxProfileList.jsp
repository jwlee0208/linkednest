<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://jwlee0208.cafe24.com/taglib/custom" 	prefix="custom" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 			prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 	prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 			prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" 		prefix="tag"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/circle.css"/>
<style>
	iframe {width : 250px; height : 200px; align:center;}
</style>
<!-- profile list area -->
<div class="row">
<c:choose>
	<c:when test="${empty profileList}">
		<div class="table-responsive" style="text-align: center; height: 100%;">
			<p class="text-warning">N/A</p>
		</div>	
	</c:when>
	<c:otherwise>
			<c:forEach var="list" items="${profileList}" varStatus="index">
			<div class="col-sm-4">
				<div class="card">
						<c:choose>
							<c:when test="${list.profileImgPath ne null && list.profileImgPath ne ''}">
						<img src="http://jwlee0208.cdn3.cafe24.com/${list.profileImgPath}" 
							 data-src="holder.js/250x200" alt="image" class="card-img-top img-fluid mx-auto d-block" 
							 onerror="this.src='http://jwlee0208.cdn3.cafe24.com/img/no_image.png'"  
							 onclick="javascript:goProfileView('${list.profileId}', '${list.profileType}');"  
							 style="cursor:pointer;"/>
							</c:when>
							<c:otherwise>
						<img src="http://jwlee0208.cdn3.cafe24.com/img/no_image.png" 
							 data-src="holder.js/250x200" alt="image" class="card-img-top img-fluid mx-auto d-block"
							 onclick="javascript:goProfileView('${list.profileId}', '${list.profileType}');" 
							 style="cursor:pointer;"/>
							</c:otherwise>
						</c:choose>					
						<div class="card-block ml-1 mt-1" style="cursor:pointer;">
							<p class="card-text">
								<c:choose>
									<c:when test="${list.profileType eq 1}">
										<c:set var="playerInfo" value="${list.profilePlayerDto}"/>
										<img src="${pageContext.request.contextPath}/img/country/${fn:toLowerCase(playerInfo.nationality)}.png" width="30px" height="20px"/>&nbsp;
										<span class="btn btn-outline-primary btn-sm"><tag:message code="code.country.${fn:toUpperCase(playerInfo.nationality)}"/></span>
										<span class="btn btn-outline-info btn-sm">
										<c:if test="${list.catId2 eq '01010101'}"><tag:message code="attr.position.p"/></c:if>
										<c:if test="${list.catId2 eq '01010102'}"><tag:message code="attr.position.cc"/></c:if>
										<c:if test="${list.catId2 eq '01010103'}"><tag:message code="attr.position.1b"/></c:if>
										<c:if test="${list.catId2 eq '01010104'}"><tag:message code="attr.position.2b"/></c:if>
										<c:if test="${list.catId2 eq '01010105'}"><tag:message code="attr.position.3b"/></c:if>
										<c:if test="${list.catId2 eq '01010106'}"><tag:message code="attr.position.ss"/></c:if>
										<c:if test="${list.catId2 eq '01010107'}"><tag:message code="attr.position.lf"/></c:if>
										<c:if test="${list.catId2 eq '01010108'}"><tag:message code="attr.position.cf"/></c:if>
										<c:if test="${list.catId2 eq '01010109'}"><tag:message code="attr.position.rf"/></c:if>
										<c:if test="${list.catId2 eq '01010110'}"><tag:message code="attr.position.dh"/></c:if>
										</span>
									</c:when>
									<c:when test="${list.profileType eq 2}">
										<c:set var="playerInfo" value="${list.profilePlayerDto}"/>
										<img src="${pageContext.request.contextPath}/img/country/${fn:toLowerCase(playerInfo.nationality)}.png" width="30px" height="20px"/>&nbsp;
										<span class="btn btn-outline-primary btn-sm"><tag:message code="code.country.${fn:toUpperCase(playerInfo.nationality)}"/></span>									
									</c:when>
									<c:when test="${list.profileType eq 3}">
										<c:set var="teamInfo" value="${list.profileTeamDto}"/>
										<c:set var="leagueInfo" value="${list.leagueInfoDto}"/>
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
							<h3 class="card-title">	
								<span onclick="javascript:goProfileView('${list.profileId}', '${list.profileType}');">${list.name}</span>
							</h3>
							<div class="btn-group btn-group-lg btn-group-justified">
								<c:forEach var="attrInfo" items="${list.profileAttrList}">
									<c:if test="${!empty attrInfo}">
									<c:forEach var="attrElemInfo" items="${attrInfo.profileAttrElementMapList}">
								<div class="btn btn-default">${attrElemInfo.profileAttrElementMapName}</div>
									</c:forEach>
									</c:if>
								</c:forEach>				
							</div>
							<p class="content_${index.count}">
							</p>
						</div>	
						<div class="card-footer">
						<span class="btn btn-outline-primary btn-lg btn-block" role="button" aria-pressed="true" onclick="javascript:goProfileView('${list.profileId}', '${list.profileType}');"><tag:message code='button.detailview'/></span>
						</div>
				</div>
				<br/>
			</div>
			</c:forEach>
	</c:otherwise>
</c:choose>
</div>
<!-- // profile list area -->
<!-- 리스트 페이징 영역 -->
<c:choose>
	<c:when test="${pageHolder.totalRows > 0}">
    <custom:paginationAjax name="pageHolder" scriptName="ajaxPagination"/>
    </c:when>
    <c:otherwise>
    <div style="padding: 52px 0 27px;"></div>
    </c:otherwise>
</c:choose>
<!-- // 리스트 페이징 영역 -->
