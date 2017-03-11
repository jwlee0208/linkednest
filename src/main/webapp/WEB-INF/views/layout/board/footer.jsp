<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<c:choose>
	<c:when test="${userId ne null && userId ne ''}">
		<c:import url="/common/footer/${userId}" />	
	</c:when>
	<c:otherwise>
		<c:import url="/common/footer" />	
	</c:otherwise>
</c:choose>
