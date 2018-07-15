<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<jsp:useBean id="now" class="java.util.Date"/>
<c:set var="nowTime">
<fmt:formatDate value="${now}" pattern="yyyyMMddHHmmss" var="nowTime"/>
</c:set>
    <!-- jQuery -->
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js?${nowTime}"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-validate.min.js?${nowTime}"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery.form.min.js?${nowTime}"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-ui.min.js?${nowTime}"></script>

<!-- bootstrap -->
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrapV4/css/bootstrap.min.css?${nowTime}">
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrapV4/css/bootstrap-grid.css?${nowTime}">
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrapV4/css/bootstrap-reboot.css?${nowTime}">

<script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/bootstrapV4/js/bootstrap.min.js?${nowTime}"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/bootstrapV4/js/bootstrap.bundle.min.js?${nowTime}"></script>

<script src="${pageContext.request.contextPath}/lib/tether/js/tether.min.js?${nowTime}"></script>

<link 	rel="stylesheet" 			type="text/css" href="${pageContext.request.contextPath}/css/base.css?${nowTime}"/>
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/css/jquery/jquery-ui.min.css?${nowTime}">

<!--[if (gte IE 6)&(lte IE 8)]><script type="text/javascript" src="${pageContext.request.contextPath}/js/selectivizr-min.js?${nowTime}"></script><![endif]-->

<script type="text/javascript"	src="${pageContext.request.contextPath}/js/common/common.js?${nowTime}"></script>

<!-- angular js -->
<%-- <script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/angular.min.js?${nowTime}"></script> --%>