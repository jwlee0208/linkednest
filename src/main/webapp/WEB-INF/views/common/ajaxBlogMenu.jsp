<%@ page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ page import="net.linkednest.user.dto.UserDto"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.min.css">
<%
	UserDto userInfo = (UserDto)request.getSession().getAttribute("userInfo");
%>
<c:set var="userInfo" value="<%=userInfo%>"/>
<c:set var="navbarType" value='navbar-inverse'/>

<c:if test="${shareInfo ne null && userId ne null}">
	<c:if test="${shareInfo.shareType eq 1}">
		<c:set var="navbarType" value='navbar-default'/>
	</c:if>
	<c:if test="${shareInfo.shareType eq 2}">
		<c:set var="navbarType" value='navbar-inverse'/>
	</c:if>
	<c:if test="${shareInfo.shareType eq 3}">
		<c:set var="navbarType" value='navbar-red'/>
	</c:if>
	<c:if test="${shareInfo.shareType eq 4}">
		<c:set var="navbarType" value='navbar-green'/>
	</c:if>
	<c:if test="${shareInfo.shareType eq 5}">
		<c:set var="navbarType" value='navbar-yellow'/>
	</c:if>		
</c:if>
<nav class="navbar ${navbarType}" role="navigation">
	<input type="hidden" id="menuId" name="menuId" value="${param.menuId}"/>
	<input type="hidden" id="userId" name="userId" value="${userId}"/>
	
    <div class="container-fluid">
    	<div class="navbar-header">
			<!-- mobile menu list button -->    	
		    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-collapse-blog-menu-list" aria-expanded="false" aria-controls="nav-collapse-blog-menu-list">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>	    
	<c:set var="url" value=""/>
	<c:choose>
		<c:when test="${userId ne '' && userId ne null}"><c:set var="url" value='/share/${userId}'/></c:when>
		<c:otherwise><c:set var="url" value='/share/main'/></c:otherwise>
	</c:choose>		    
    		<a class="navbar-brand" href="${url}" style="font-weight: bold;">
    		<c:choose>
    			<c:when test="${shareInfo ne null && userId ne null}">${shareInfo.shareName}</c:when>
    			<c:otherwise><tag:message code="common.share"/></c:otherwise>
    		</c:choose>    		
    		</a>
    	</div>
		<div class="navbar-collapse collapse" id="nav-collapse-blog-menu-list">
			<ul class="nav navbar-nav">
    		<c:choose>
    			<c:when test="${shareInfo ne null && userId ne null}">
    			<li><a href="/share/main"><tag:message code="text.home"/></a></li>
				<li <c:if test="${param.menuId eq 5}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goInfo();"><tag:message code="text.profile"/></a></li>    			
<%-- 				<li <c:if test="${param.menuId eq 5}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goInfo();">Profile</a></li> --%>
		          	<c:if test="${!empty boardCategoryList}">
		          		<c:forEach var="boardCategoryInfo" items="${boardCategoryList}">
 				<li class="dropdown">
		          <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">${boardCategoryInfo.boardCategoryName}<span class="caret"></span></a>
		          <c:if test="${!empty boardCategoryInfo.boardList}">
		          <ul class="dropdown-menu" role="menu">
		          		<c:forEach var="boardInfo" items="${boardCategoryInfo.boardList}">
			          		<c:if test="${boardCategoryInfo.boardCategoryId eq boardInfo.boardCategoryId}">
					<li <c:if test="${param.menuId eq 1}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goList(${boardInfo.boardId});">${boardInfo.boardName}</a></li>
							</c:if>
						</c:forEach>
		          </ul>
		          </c:if>
		        </li>
						</c:forEach>
		          	</c:if>	  
		          	<c:if test="${null ne userId}">
		        <li>
		        	<a href="/share/bookmark/${userId}/list" target="_blank">bookmark</a>
		        </li>  	
		          	</c:if>
		          	<c:if test="${null ne userInfo}">		          	
		        <li>
		        	<a href="#" onclick="javascript:goConfig();"><tag:message code="common.config"/></a>
		        </li>   	
		          	</c:if>
    			</c:when>
    			<c:otherwise>
				<li><a href="javascript:;" onclick="javascript:goShareHome('${userInfo.userId}');" ><tag:message code="common.myshare"/></a></li>    			
    			</c:otherwise>
    		</c:choose>    		

	        
			</ul>
		<c:choose>
			<c:when test="${null ne userInfo}">
		<ul class="nav navbar-nav navbar-right">
        	<li class="dropdown">
          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><tag:message code="menu.hi"/>, "${userInfo.userNm}" <span class="caret"></span></a>
          		<ul class="dropdown-menu">
          			<li><a href="/share/${userInfo.userId}" ><tag:message code="common.myshare"/></a></li>
		            <li><a href="#" onclick="javascript:goConfig();"><tag:message code="common.config"/></a></li>
		            <li role="separator" class="divider"></li>
		            <li><a href="#" onclick="javascript:logout();"><tag:message code="logout"/></a></li>		            
          		</ul>
        	</li>
      	</ul>			
			</c:when>
			<c:otherwise>
				<form class="navbar-form navbar-right">
					<a onclick="javascript:goRegist(6);" 	class="btn btn-primary" ><tag:message code="signup"/></a>&nbsp;
					<a onclick="javascript:goLogin(7);" 	class="btn btn-default" style="float:right;"><tag:message code="signin"/></a>&nbsp;
				</form>
			</c:otherwise>				
		</c:choose>	
		</div>
	</div>
</nav>	