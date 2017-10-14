<%@ page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ page import="net.linkednest.www.user.dto.UserDto"%>
<%
	UserDto userInfo = (UserDto)request.getSession().getAttribute("userInfo");
%>
<c:set var="userInfo" value="<%=userInfo%>"/>
<c:import url="/common/menu/default" />