<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css"/>
<input type="hidden" id="buildType" value="${buildType}"/>
<style>
.blog-footer {
  padding: 40px 0;
  color: #999;
  text-align: center;
  background-color: #f9f9f9;
  border-top: 1px solid #e5e5e5;
}
.blog-footer p:last-child {
  margin-bottom: 0;
}
</style>
<!-- google analytics -->
<script>
if($("#buildType").val()=='prod'){
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	ga('create', 'UA-65838621-1', 'auto');
	ga('send', 'pageview');
}
</script>
<!-- naver analytics -->
<%--<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
	if(!wcs_add) var wcs_add = {};
	wcs_add["wa"] = "47918035f92e80";
	wcs_do();
</script>--%>
<footer class="footer">
<c:choose>
	  <c:when test="${userInfo ne '' && userInfo ne null}">	
	  <p><a href="https://www.facebook.com/${userInfo.fbUserId}" target="_blank" class="btn btn-primary">Facebook</a>
	  &nbsp;&nbsp;&nbsp;<a target="_blank" class="btn btn-primary" href="/share/${userInfo.userId}/profile">profile</a>
	  &nbsp;&nbsp;&nbsp;<a target="_blank" class="btn btn-primary" href="/share/${userInfo.userId}">${userInfo.userId}'s Share</a></p>
	  </c:when>
	  <c:otherwise>
	  <p><a href="https://www.facebook.com/jwlee0524" target="_blank" class="btn btn-primary">Facebook</a>
	  &nbsp;&nbsp;&nbsp;<a target="_blank" class="btn btn-primary" href="/aboutUs">contact</a>
	  &nbsp;&nbsp;&nbsp;<a target="_blank" class="btn btn-primary" href="/share/main">Share</a></p>
	  </c:otherwise>
</c:choose>
	  <p>Copyrightⓒ2014 All right reserved by LinkedNest</p>
      <p>|&nbsp;<a href="/common/privateRule" class="btn btn_link" target="_blank"><tag:message code='text.privatepolicy'/></a>&nbsp;|&nbsp;<a href="/common/useRule" class="btn btn_link" target="_blank"><tag:message code='text.termsofuse'/></a>&nbsp;|</p>
      <p><a href="#"><tag:message code='text.backtotop'/></a></p>
</footer>