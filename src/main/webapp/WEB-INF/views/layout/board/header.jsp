<%@page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/home/home.js"></script>
<div class="container-fluid" style="background:#e7e7e7;">
	<div class="navbar-header">
		<a class="navbar-brand" style="font-weight : bold; color : #777;">Share Yours</a>	
	</div>
		<form class="navbar-form navbar-right" role="search" id="totSearchFrm" name="totSearchFrm">
			<input type="hidden" 	id="searchCondition" name="searchCondition" value="titleNcontent" 	/>
			<input type="hidden" 	id="boardId" 		 name="boardId" 		value="0" 	/>
			<input type="text" 		id="totSearchText"	 name="searchText"		class="form-control" placeholder="<tag:message code='text.request.insert.search.keyword'/>" style="background-image: none; background-position: 0% 0%; background-repeat: repeat;">
		</form>

		<form class="navbar-form navbar-right">
			<select class="form-control" id="locale" name="locale">
				<option value="">::: Language :::</option>
				<option value="kr">한국어</option>
				<option value="en">English</option>
				<option value="zh">中国</option>
				<option value="ja">日本語</option>
			</select>					
		</form>
</div>