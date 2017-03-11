<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%
	response.setHeader("Cache-Control", "no-store");
%>
<tiles:insertAttribute name="body"/>
