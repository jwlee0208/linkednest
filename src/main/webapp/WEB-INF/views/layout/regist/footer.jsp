<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css"/>
<input type="hidden" id="buildType" value="${buildType}"/>
<!-- google analytics -->
<!-- <script>
if($("#buildType").val()=='prod'){
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	ga('create', 'UA-65838621-1', 'auto');
	ga('send', 'pageview');
}
</script>
 --><!-- naver analytics -->
<%--<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
	if(!wcs_add) var wcs_add = {};
	wcs_add["wa"] = "47918035f92e80";
	wcs_do();
</script>--%>
<!-- baidu analytics -->
<%--<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?1bd314db72ba2d5b15923340a7f3d05f";
  var s = document.getElementsByTagName("script")[0];
  s.parentNode.insertBefore(hm, s);
})();
</script>--%>
<footer class="footer">
	<div class="container">
	  <p><a href="https://www.facebook.com/jwlee0524" target="_blank" class="btn btn-primary">Facebook</a>
	  &nbsp;&nbsp;&nbsp;<a target="_blank" class="btn btn-primary" href="/aboutUs">About Us</a>&nbsp;&nbsp;&nbsp;<a target="_blank" class="btn btn-primary" href="mailto:jwlee0208@gmail.com">E-Mail</a>&nbsp;&nbsp;&nbsp;<a target="_blank" class="btn btn-primary" href="/share/jwlee">developer's blog</a></p>
	  <p>Copyrightⓒ2014 All right reserved by leejinwon</p>
      <p><a href="#"><tag:message code='text.backtotop'/></a></p>
    </div>  
</footer>