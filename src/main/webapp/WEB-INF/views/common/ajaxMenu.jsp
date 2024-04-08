<%@page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ page import="net.linkednest.www.user.dto.UserDto"%>
<%
	UserDto userInfo = (UserDto) request.getSession().getAttribute("userInfo");
%>
<c:set var="userInfo" value="<%=userInfo%>" />
<nav class="navbar navbar-toggleable-md navbar-inverse bg-primary navbar-expand-lg navbar-light" role="navigation" style="background-color: #e3f2fd;">
	<input type="hidden" id="menuId" name="menuId" value="${param.menuId}" />
	<!-- 	<div class="container-fluid"> -->

	<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#nav-collapse-player-menu-list" aria-controls="nav-collapse-player-menu-list" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<!-- mobile menu list button -->
	<!-- 		<div class="navbar-header"> -->

	<a class="navbar-brand" href="javascript:;" onclick="javascript:goHome();"><span style="color: white; font-size: 25px; font-weight: bold;font-family:monospace;">L</span>inked<span style="color: white; font-size: 25px; font-weight: bold;font-family:monospace;">N</span>est - <span style="color: white; font-size: 15px;font-family:monospace;">Looking For Chances</span></a>
	<!-- 		</div> -->
	<div class="collapse navbar-collapse" id="nav-collapse-player-menu-list">
		<ul class="nav navbar-nav  mr-auto">
			<li class="nav-item"><a class="nav-link" href="javascript:;" onclick="javascript:goHome();" style="color: white;">Home</a></li>
 			<li class="nav-item dropdown" style="color: white;">
		        <a class="nav-link dropdown-toggle" href="javascript:;" id="navbarDropdownBb" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white;">
		          Baseball
		        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdownBb">
					<a class="dropdown-item" href="javascript:;" onclick="javascript:goProfileList(1, '01010100');" ><span><tag:message code="text.playerlist"/></span></a>
					<a class="dropdown-item" href="javascript:;" onclick="javascript:goProfileList(2, '01010200');"><span><tag:message code="text.coachlist"/></span></a>
					<a class="dropdown-item" href="javascript:;" onclick="javascript:goProfileList(3, '01010300');"><span><tag:message code="text.teamlist"/></span></a>
			        <div class="dropdown-divider"></div>
				    <a class="dropdown-item" href="/profile/leagueList"><span style=""><tag:message code="text.leaguelist"/></span></a>
		        </div>
		    </li>			
 			<li class="nav-item dropdown" style="color: white;">
		        <a class="nav-link dropdown-toggle" href="javascript:;" id="navbarDropdownFb" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white;">
		          Football
		        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdownFb">
					<a class="dropdown-item" href="javascript:;" onclick="javascript:goProfileList(1, '01020100');" ><span><tag:message code="text.playerlist"/></span></a>
					<a class="dropdown-item" href="javascript:;" onclick="javascript:goProfileList(2, '01020200');"><span><tag:message code="text.coachlist"/></span></a>
					<a class="dropdown-item" href="javascript:;" onclick="javascript:goProfileList(3, '01020300');"><span><tag:message code="text.teamlist"/></span></a>
			        <div class="dropdown-divider"></div>
				    <a class="dropdown-item" href="/profile/leagueList"><span style=""><tag:message code="text.leaguelist"/></span></a>
		        </div>
		    </li>			



<%-- 			<li class="nav-item"><a class="nav-link" href="javascript:;" onclick="javascript:goProfileList(1, '01010100');" style="color: white; "><span><tag:message code="text.playerlist"/></span></a></li>
			<li class="nav-item"><a class="nav-link" href="javascript:;" onclick="javascript:goProfileList(2, '01010200');" style="color: white; "><span><tag:message code="text.coachlist"/></span></a></li>
			<li class="nav-item"><a class="nav-link" href="javascript:;" onclick="javascript:goProfileList(3, '01010300');" style="color: white; "><span><tag:message code="text.teamlist"/></span></a></li>
			<li class="nav-item"><a class="nav-link" href="/profile/leagueList"><span style="color: white; "><tag:message code="text.leaguelist"/></span></a></li> --%>
		</ul>
		<c:if test="${null ne userInfo}">
			<ul class="nav navbar-nav navbar-right float-right">
				<li class="dropdown nav-item">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" id="dropdown_menu" role="button" aria-haspopup="true" aria-expanded="false"><tag:message code="menu.hi"/>, "${userInfo.userNm}"</a>
					<div class="dropdown-menu" aria-labelledby="dropdown_menu">
						<a class="dropdown-item" href="/share/${userInfo.userId}" style="font-weight: bold;"><tag:message code="common.myshare"/></a>
						<a class="dropdown-item" href="#" onclick="javascript:goConfig();" style="font-weight: bold;"><tag:message code="common.config"/></a>
						<a role="separator" class="divider"></a>
						<a class="dropdown-item" href="#" onclick="javascript:logout();" style="font-weight: bold;"><tag:message code="logout"/></a>
					</div>
				</li>
			</ul>
		</c:if>
		<form class="navbar-form navbar-right" role="search">
			<c:if test="${null eq userInfo}">
				<a onclick="javascript:goRegist(6);" class="btn btn-outline-secondary" style="color: white; "><tag:message code="signup" /></a>
				<a onclick="javascript:goLogin(7);" class="btn btn-outline-success" style="color: white; "><tag:message code="signin" /></a>
			</c:if>
		</form>
	</div>
	<!-- 	</div> -->
</nav>
