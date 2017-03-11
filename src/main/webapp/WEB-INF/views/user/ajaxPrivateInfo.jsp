<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag" %>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0); 
%>   
<c:choose>
	<c:when test="${userInfo ne null}">
	<dl class="dl-horizontal">
		<dt><tag:message code="common.username"/></dt><dd>  ${userInfo.userNm}</dd>
		<dt><tag:message code="common.userid"/></dt><dd>${userInfo.userId}</dd>
		<dt><tag:message code="common.email"/></dt><dd>${userInfo.email}</dd>
		<dt><tag:message code="common.cellphone"/></dt><dd>${userInfo.phoneNo}</dd>
		<dt><tag:message code="common.nationality"/></dt><dd>${userInfo.nationality}</dd>
		<dt><tag:message code="common.language"/></dt><dd>${userInfo.language}</dd>
		<dt><tag:message code="common.joindate"/></dt><dd>${fn:substring(userInfo.joinDate, 0, 10)}</dd>
	</dl>		
	</c:when>
</c:choose>	
	