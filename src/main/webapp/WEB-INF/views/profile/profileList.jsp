<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"	%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"	%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" 	content="IE=Edge" />
<meta name="viewport" 				content="width=device-width, initial-scale=1">
<meta name="title" 					content="Player List"/>
<meta name="author" 				content="Lee Jinwon"/>
<meta name="description" 			content="Checkout Future's MVP"/>
<meta name="robots" 				content="index,follow" />
<meta name="keywords" 				content="blog, baseball, link, player, profile"/>
</head>
<body>
<form id="listFrm" name="listFrm" method="post">
	<div class="container">
		<input type="hidden" id="selectedAttrElemId" 	name="selectedAttrElemId" />
		<input type="hidden" id="selectedAttrId" 		name="selectedAttrId" />
		<input type="hidden" id="selectedCatId" 		name="selectedCatId" />
		<input type="hidden" id="page"					name="page"	/>
		<input type="hidden" id="profileType"			name="profileType" 	value="${profileType}"/>
		<input type="hidden" id="catId1"				name="catId1" 		value="${categoryId}"/>
		<c:set var="type" value=""/>
		<c:choose>
			<c:when test="${profileType eq 1}"><c:set var="type" value="Player"/></c:when>
			<c:when test="${profileType eq 2}"><c:set var="type" value="Coach"/></c:when>
			<c:otherwise><c:set var="type" value="Team"/></c:otherwise>
		</c:choose>
		<div class="form-group">
			<h1 id="btn-groups" class="page-header" style="padding-left:10px;padding-top:20px;">Profile List&nbsp;&nbsp;<small>${type}</small></h1>
		</div>
		<div class="form-group">
			<!-- filter search area -->
			
			<%@include file="/WEB-INF/views/profile/ajaxSearchProfile.jsp"%>
			
			
			<!-- // filter search area -->
			<!-- list area -->
			<div id="listDiv" role="main" style="padding:0px 10px 0px 10px;"></div>
			<!-- // list area -->

			<c:if test="${isLogon}">
				<div class="row" style="padding-bottom: 20px;">
					<input type="button" class="btn btn-outline-primary btn-block" value="regist" name="goToRegistProfile" />
				</div>
			</c:if>
		</div>
	</div>
	<!-- modal popup area -->
	<c:import url="/common/modalPopup"/>
	<!-- // modal popup area -->
</form>
</body>
<script>
    $(function(){
        // for filter search
        $(".form-check-input").on("click",function(){
			loadProfileList();
		});
    });

    //리스트 페이징을 위한 메서드
    function ajaxPagination(page){
        var newPage = isEmpty(page) ? "1" : page;
        $("input[name=page]").val(newPage);
        loadProfileList();
    }

    // empty 여부 체크
    function isEmpty(val){
        return (val == '' || val == null || val == 'undefined') ? true : false;
    }
</script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/profile/profileList.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/profile/profileView.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/holder.js"></script>
<link 	rel="stylesheet" 		href="${pageContext.request.contextPath}/css/pagination.css">
<link 	rel="stylesheet" 		href="${pageContext.request.contextPath}/css/profileList.css">
</html>