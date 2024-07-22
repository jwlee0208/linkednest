<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<h4>Recent Registered Team List&nbsp;[Football]&nbsp;
	<small><a href="/profile/list/3/01020300" style="float:right" class="btn btn-outline-info"><tag:message code='button.more'/></a></small>
</h4>
<hr/>
<div class="row">
	<c:choose>
		<c:when test="${!empty recentTeamProfileListFootball}">
			<c:forEach var="recentTeamProfileInfo"
				items="${recentTeamProfileListFootball}" varStatus="index">
				<c:if test="${index.count <= 3}">
					<div class="col-sm-4">
						<div class="card">
							<c:choose>
								<c:when test="${recentTeamProfileInfo.profileImgPath ne null && recentTeamProfileInfo.profileImgPath ne ''}">
									<img
										src="http://jwlee0208.cdn3.cafe24.com/${recentTeamProfileInfo.profileImgPath}"
										data-src="holder.js/250x200" alt="image"
										class="card-img-top img-fluid mx-auto d-block"
										onerror="this.src='http://jwlee0208.cdn3.cafe24.com/img/no_image.png'"
										onclick="javascript:goProfileView('${recentTeamProfileInfo.profileId}', '${recentTeamProfileInfo.profileType}');"
										style="cursor: pointer;" />
								</c:when>
								<c:otherwise>
									<img src="http://jwlee0208.cdn3.cafe24.com/img/no_image.png"
										data-src="holder.js/250x200" alt="image"
										class="card-img-top img-fluid mx-auto d-block"
										onclick="javascript:goProfileView('${recentTeamProfileInfo.profileId}', '${recentTeamProfileInfo.profileType}');"
										style="cursor: pointer;" />
								</c:otherwise>
							</c:choose>
							<div class="card-block" style="cursor: pointer;">
								<h5 class="card-title" style="text-align: center; margin-top: 10px;">
									<span onclick="javascript:goProfileView('${recentTeamProfileInfo.profileId}', '${recentTeamProfileInfo.profileType}');">${recentTeamProfileInfo.name}</span>
								</h5>
								<p class="card-text" style="text-align: center;">
									<c:choose>
										<c:when test="${recentTeamProfileInfo.profileType eq 1}">
											<c:set var="playerInfo" value="${recentTeamProfileInfo.profilePlayerDto}" />
											<img
												src="${pageContext.request.contextPath}/img/country/${fn:toLowerCase(playerInfo.nationality)}.png"
												width="30px" height="20px"
												style="filter: drop-shadow(5px 5px 5px #000);" />&nbsp;
                                                <span class="btn btn-outline-primary btn-sm"><tag:message code="code.country.${fn:toUpperCase(playerInfo.nationality)}" /></span>
											<span class="btn btn-outline-info btn-sm"> <tag:message code="${recentTeamProfileInfo.catId2Val }" />
											</span>
										</c:when>
										<c:when test="${recentTeamProfileInfo.profileType eq 2}">
											<c:set var="playerInfo" value="${recentTeamProfileInfo.profilePlayerDto}" />
											<img
												src="${pageContext.request.contextPath}/img/country/${fn:toLowerCase(playerInfo.nationality)}.png"
												width="30px" height="20px"
												style="filter: drop-shadow(5px 5px 5px #000);" />&nbsp;
                                                <span class="btn btn-outline-primary btn-sm"><tag:message code="code.country.${fn:toUpperCase(playerInfo.nationality)}" /></span>
										</c:when>
										<c:when test="${recentTeamProfileInfo.profileType eq 3}">
											<c:set var="teamInfo" value="${recentTeamProfileInfo.profileTeamDto}" />
											<c:set var="leagueInfo" value="${recentTeamProfileInfo.leagueInfoDto}" />
											<img
												src="${pageContext.request.contextPath}/img/country/${fn:toLowerCase(leagueInfo.country)}.png"
												data-src="holder.js/30x20" width="30px" height="20px"
												style="filter: drop-shadow(5px 5px 5px #000);" />&nbsp;
                                                <span class="btn btn-outline-primary btn-sm"><tag:message code="code.country.${fn:toUpperCase(leagueInfo.country)}" /></span>
											<span class="btn btn-outline-info btn-sm">${teamInfo.city}</span>
											<div style="text-align: center;">
												<span class="btn btn-outline-success btn-sm"><tag:message code="code.leaguetype.${leagueInfo.leagueType}" /></span> 
												<span class="btn btn-outline-info btn-sm">Division ${leagueInfo.leagueDivision}</span>
											</div>
										</c:when>
									</c:choose>
								</p>
							</div>
							<div class="card-footer" style="margin-top: 10px;">
								<span class="btn btn-outline-danger btn-block" role="button"
									onclick="javascript:goProfileView('${recentTeamProfileInfo.profileId}', '${recentTeamProfileInfo.profileType}');">
									<tag:message code='button.watchme' />
								</span>
							</div>
						</div>
						<br />
					</div>
				</c:if>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div style="padding-left: 20px; min-height: 70px; vertical-align: middle;">
				<p><tag:message code='text.noregistplayer' /></p>
			</div>
		</c:otherwise>
	</c:choose>
</div>