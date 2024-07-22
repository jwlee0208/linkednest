<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<h4>
	<tag:message code='text.recentregistplayers' />
	&nbsp;[Baseball]&nbsp;<small><a href="/profile/list/1/01010100"
		style="float: right" class="btn btn-outline-info"><tag:message
				code='button.more' /></a></small>
</h4>
<hr />
<div class="row">
	<c:choose>
		<c:when test="${!empty recentPlayerProfileListBaseball}">
			<c:forEach var="recentBaseballPlayerProfileInfo"
				items="${recentPlayerProfileListBaseball}" varStatus="index">
				<c:if test="${index.count <= 3}">
					<div class="col-sm-4">
						<div class="card">
							<c:choose>
								<c:when test="${recentBaseballPlayerProfileInfo.profileImgPath ne null && recentBaseballPlayerProfileInfo.profileImgPath ne ''}">
									<img
										src="http://jwlee0208.cdn3.cafe24.com/${recentBaseballPlayerProfileInfo.profileImgPath}"
										data-src="holder.js/250x200" alt="image"
										class="card-img-top img-fluid mx-auto d-block"
										onerror="this.src='http://jwlee0208.cdn3.cafe24.com/img/no_image.png'"
										onclick="javascript:goProfileView('${recentBaseballPlayerProfileInfo.profileId}', '${recentBaseballPlayerProfileInfo.profileType}');"
										style="cursor: pointer;" />
								</c:when>
								<c:otherwise>
									<img src="http://jwlee0208.cdn3.cafe24.com/img/no_image.png"
										data-src="holder.js/250x200" alt="image"
										class="card-img-top img-fluid mx-auto d-block"
										onclick="javascript:goProfileView('${recentBaseballPlayerProfileInfo.profileId}', '${recentBaseballPlayerProfileInfo.profileType}');"
										style="cursor: pointer; width: auto;" />
								</c:otherwise>
							</c:choose>
							<div class="card-block" style="cursor: pointer;">
								<h5 class="card-title" style="text-align: center;">
									<span onclick="javascript:goProfileView('${recentBaseballPlayerProfileInfo.profileId}', '${recentBaseballPlayerProfileInfo.profileType}');">${recentBaseballPlayerProfileInfo.name}</span>
								</h5>
								<p class="card-text" style="text-align: center;">
									<c:choose>
										<c:when
											test="${recentBaseballPlayerProfileInfo.profileType eq 1}">
											<c:set var="playerInfo"	value="${recentBaseballPlayerProfileInfo.profilePlayerDto}" />
											<img
												src="${pageContext.request.contextPath}/img/country/${fn:toLowerCase(playerInfo.nationality)}.png"
												width="30px" height="20px"
												style="filter: drop-shadow(5px 5px 5px #000);" />&nbsp;
												<span class="btn btn-outline-primary btn-sm"><tag:message code="code.country.${fn:toUpperCase(playerInfo.nationality)}" /></span>
												<span class="btn btn-outline-info btn-sm"> 
													<c:if test="${recentBaseballPlayerProfileInfo.catId2 eq '01010101'}">
														<tag:message code="attr.position.p" />
													</c:if>
													<c:if test="${recentBaseballPlayerProfileInfo.catId2 eq '01010102'}">
														<tag:message code="attr.position.cc" />
													</c:if> 
													<c:if test="${recentBaseballPlayerProfileInfo.catId2 eq '01010103'}">
														<tag:message code="attr.position.1b" />
													</c:if> 
													<c:if test="${recentBaseballPlayerProfileInfo.catId2 eq '01010104'}">
														<tag:message code="attr.position.2b" />
													</c:if> 
													<c:if test="${recentBaseballPlayerProfileInfo.catId2 eq '01010105'}">
														<tag:message code="attr.position.3b" />
													</c:if> 
													<c:if test="${recentBaseballPlayerProfileInfo.catId2 eq '01010106'}">
														<tag:message code="attr.position.ss" />
													</c:if> 
													<c:if test="${recentBaseballPlayerProfileInfo.catId2 eq '01010107'}">
														<tag:message code="attr.position.lf" />
													</c:if> 
													<c:if test="${recentBaseballPlayerProfileInfo.catId2 eq '01010108'}">
														<tag:message code="attr.position.cf" />
													</c:if> 
													<c:if test="${recentBaseballPlayerProfileInfo.catId2 eq '01010109'}">
														<tag:message code="attr.position.rf" />
													</c:if> 
													<c:if test="${recentBaseballPlayerProfileInfo.catId2 eq '01010110'}">
														<tag:message code="attr.position.dh" />
													</c:if>
												</span>
										</c:when>
										<c:when
											test="${recentBaseballPlayerProfileInfo.profileType eq 2}">
											<c:set var="playerInfo"	value="${recentBaseballPlayerProfileInfo.profilePlayerDto}" />
											<img
												src="${pageContext.request.contextPath}/img/country/${fn:toLowerCase(playerInfo.nationality)}.png"
												width="30px" height="20px"
												style="filter: drop-shadow(5px 5px 5px #000);" />&nbsp;
                                                <span class="btn btn-outline-primary btn-sm"><tag:message code="code.country.${fn:toUpperCase(playerInfo.nationality)}" /></span>
										</c:when>
										<c:when
											test="${recentBaseballPlayerProfileInfo.profileType eq 3}">
											<c:set var="teamInfo" 	value="${recentBaseballPlayerProfileInfo.profileTeamDto}" />
											<c:set var="leagueInfo" value="${recentBaseballPlayerProfileInfo.leagueInfoDto}" />
											<img
												src="${pageContext.request.contextPath}/img/country/${fn:toLowerCase(leagueInfo.country)}.png"
												data-src="holder.js/30x20" width="30px" height="20px"
												style="filter: drop-shadow(5px 5px 5px #000);" />&nbsp;
                                                <span class="btn btn-outline-primary btn-sm"><tag:message code="code.country.${fn:toUpperCase(leagueInfo.country)}" /></span>
												<span class="btn btn-outline-info btn-sm">${teamInfo.city}</span>
											<div>
												<span class="btn btn-outline-success btn-sm"><tag:message code="code.leaguetype.${leagueInfo.leagueType}" /></span> 
												<span class="btn btn-outline-info btn-sm">Division ${leagueInfo.leagueDivision}</span>
											</div>
										</c:when>
									</c:choose>
								</p>
							</div>
							<div class="card-footer" style="margin-top: 10px;">
								<span class="btn btn-outline-danger btn-block" role="button"
										onclick="javascript:goProfileView('${recentBaseballPlayerProfileInfo.profileId}', '${recentBaseballPlayerProfileInfo.profileType}');">
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
			<div
				style="padding-left: 20px; min-height: 70px; vertical-align: middle;">
				<p>
					<tag:message code='text.noregistplayer' />
				</p>
			</div>
		</c:otherwise>
	</c:choose>
</div>