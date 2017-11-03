<%@page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ page import="net.linkednest.www.user.dto.UserDto"%>
<!-- <script type="text/javascript" -->
<%-- 	src="${pageContext.request.contextPath}/js/home/home.js"></script> --%>
<%
	UserDto userInfo = (UserDto) request.getSession().getAttribute("userInfo");
%>
<c:set var="userInfo" value="<%=userInfo%>" />
<nav class="navbar navbar-toggleable-md navbar-inverse bg-primary" role="navigation" style="background-color: #e3f2fd;">
	<input type="hidden" id="menuId" name="menuId" value="${param.menuId}" />
	<!-- 	<div class="container-fluid"> -->

	<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#nav-collapse-player-menu-list" aria-controls="nav-collapse-player-menu-list" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<!-- mobile menu list button -->
	<!-- 		<div class="navbar-header"> -->

	<a class="navbar-brand" href="javascript:;"
	   onclick="javascript:goHome();"><span
			style="color: white; font-size: 25px; font-weight: bold;">L</span>inked<span
			style="color: white; font-size: 25px; font-weight: bold;">N</span>est
		- <span style="color: white; font-size: 15px;">Looking For Chances</span>
	</a>
	<!-- 		</div> -->
	<div class="collapse navbar-collapse"
		 id="nav-collapse-player-menu-list">
		<ul class="nav navbar-nav  mr-auto">
			<li class="nav-item"><a class="nav-link" href="javascript:;" onclick="javascript:goHome();">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="javascript:;" onclick="javascript:goProfileList(1, '01010100');"><tag:message code="text.playerlist"/></a></li>
			<li class="nav-item"><a class="nav-link" href="javascript:;" onclick="javascript:goProfileList(2, '01010200');"><tag:message code="text.coachlist"/></a></li>
			<li class="nav-item"><a class="nav-link" href="javascript:;" onclick="javascript:goProfileList(3, '01010300');"><tag:message code="text.teamlist"/></a></li>
			<li class="nav-item"><a class="nav-link" href="/profile/leagueList"><tag:message code="text.leaguelist"/></a></li>
		</ul>
		<c:if test="${null ne userInfo}">
			<ul class="nav navbar-nav navbar-right float-right">
				<li class="dropdown nav-item">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" id="dropdown_menu" role="button" aria-haspopup="true" aria-expanded="false"><tag:message code="menu.hi"/>, "${userInfo.userNm}"</a>
					<div class="dropdown-menu" aria-labelledby="dropdown_menu">
						<a class="dropdown-item" href="/share/${userInfo.userId}" ><tag:message code="common.myshare"/></a>
						<a class="dropdown-item" href="#" onclick="javascript:goConfig();"><tag:message code="common.config"/></a>
						<a role="separator" class="divider"></a>
						<a class="dropdown-item" href="#" onclick="javascript:logout();"><tag:message code="logout"/></a>
					</div>
				</li>
			</ul>
		</c:if>
		<form class="navbar-form navbar-right" role="search">
			<c:if test="${null eq userInfo}">
				<a onclick="javascript:goRegist(6);" class="btn btn-outline-secondary"><tag:message code="signup" /></a>
				<a onclick="javascript:goLogin(7);" class="btn btn-outline-success"><tag:message code="signin" /></a>
			</c:if>
		</form>
	</div>
	<!-- 	</div> -->
</nav>
