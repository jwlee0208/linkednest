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

<script type="text/javascript"	src="${pageContext.request.contextPath}/js/profile/profileList.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/profile/profileView.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/holder.js"></script>

<link 	rel="stylesheet" 		href="${pageContext.request.contextPath}/css/pagination.css">
<link 	rel="stylesheet" 		href="${pageContext.request.contextPath}/css/profileList.css">
</head>
<body>
<form id="listFrm" name="listFrm" method="post">
	<div class="container">
	
		<input type="hidden" id="selectedAttrElemId" 	name="selectedAttrElemId" />
		<input type="hidden" id="selectedAttrId" 		name="selectedAttrId" />
		<input type="hidden" id="selectedCatId" 		name="selectedCatId" />
		<input type="hidden" id="page"					name="page"	/>
		<input type="hidden" id="profileType"			name="profileType" 	value="${profileType}"/>
		<input type="hidden" id="catagoryId"			name="catagoryId" 	value="${catagoryId}"/>
		<c:set var="type" value=""/>
		<c:choose>
			<c:when test="${profileType eq 1}">
				<c:set var="type" value="Player"/>
			</c:when>
			<c:when test="${profileType eq 2}">
				<c:set var="type" value="Coach"/>
			</c:when>
			<c:otherwise>
				<c:set var="type" value="Team"/>
			</c:otherwise>
		</c:choose>
		<h1 id="btn-groups" class="page-header">${type}&nbsp;&nbsp;<small>Profile List</small></h1>
		<div class="form-group">
	
			<div class="form-group" role="search" style="padding-left:10px; padding-right:10px;">	
				<input type="hidden" 	id="searchCondition" 	name="searchCondition" value="name"/>
				<input type="hidden" 	id="searchText" 		name="searchText" />
				<input type="text" 		id="searchTextStr" 		name="searchTextStr" class="form-control ui-autocomplete-input" placeholder="<tag:message code='text.request.insert.search.keyword'/>"/>
			
			<div class="collapse"  id="searchDetail" style="padding-top:10px;">
			<!-- (Additional) Team Search Condition : Continent -->
			<c:if test="${profileType eq 3}">
				<div id="areaList" style="margin-top:10px;">
					<div class="row">
						<div class="col-lg-2"><h4><span class="badge badge-primary"><tag:message code="text.continent"/></span></h4></div>
						<div class="col-lg-10 btn-group">
								<label class="btn btn-primary">		
									<input type="radio" id="area1" name="area" value="as" class="attrElemRadio"/>&nbsp;<tag:message code="code.area.as"/>
								</label>
								<label class="btn btn-primary">		
									<input type="radio" id="area2" name="area" value="na" class="attrElemRadio"/>&nbsp;<tag:message code="code.area.na"/>
								</label>
								<label class="btn btn-primary">		
									<input type="radio" id="area3" name="area" value="sa" class="attrElemRadio"/>&nbsp;<tag:message code="code.area.sa"/>
								</label>
								<label class="btn btn-primary">		
									<input type="radio" id="area4" name="area" value="eu" class="attrElemRadio"/>&nbsp;<tag:message code="code.area.eu"/>
								</label>
								<label class="btn btn-primary">		
									<input type="radio" id="area5" name="area" value="af" class="attrElemRadio"/>&nbsp;<tag:message code="code.area.af"/>
								</label>
						</div>
					</div>
				</div>
			</c:if>	
				<div id="countryList">
					<div class="row">
						<div class="col-lg-2"><h4><span class="badge badge-primary"><tag:message code="text.countries"/></span></h4></div>
						<div class="col-lg-10 btn-group">
								<label class="btn btn-primary">		
									<input type="radio" id="country1" name="country" value="KR" class="attrElemRadio"/>&nbsp;<tag:message code="code.country.KR"/>
								</label>
								<label class="btn btn-primary">		
									<input type="radio" id="country2" name="country" value="JP" class="attrElemRadio"/>&nbsp;<tag:message code="code.country.JP"/>
								</label>
								<label class="btn btn-primary">		
									<input type="radio" id="country3" name="country" value="AU" class="attrElemRadio"/>&nbsp;<tag:message code="code.country.AU"/>
								</label>
								<label class="btn btn-primary">		
									<input type="radio" id="country4" name="country" value="DE" class="attrElemRadio"/>&nbsp;<tag:message code="code.country.DE"/>
								</label>
								<label class="btn btn-primary">		
									<input type="radio" id="country5" name="country" value="US" class="attrElemRadio"/>&nbsp;<tag:message code="code.country.US"/>
								</label>
						</div>
					</div>
				</div>
				<!--속성 & 속성 항목들에 대한 체크박스 리스트 -->
				<div id="attrElemList">
	<c:if test="${!empty attrElementList}">
		<!-- attribute Info Settion -->
		<c:set var="prevAttrId" value="0"/>
		
		<c:set var="attrId" 			  		value=""/>
		<c:set var="categoryAttrElemList" 		value=""/>
		<c:set var="categoryAttrElemListLength" value="0"/>
		<!-- //attribute Info Settion -->
		
		<c:forEach var="profileAttrElementInfo" items="${attrElementList}" varStatus="index">
		
			<c:set var="profileAttrId" 				value="${profileAttrElementInfo.profileAttrId}"/>
			<c:set var="profileAttrElemList" 		value="${profileAttrElementInfo.profileAttrElementList}"/>
			<c:set var="profileAttrElemListLength"  value="${profileAttrElemList.size()}"/>
			<div class="row">
				<div class="col-lg-2"><h4><span class="badge badge-info"><tag:message code="text.${profileAttrElementInfo.profileAttrName}"/></span></h4></div>
				<div class="col-lg-10 btn-group">
				<c:if test="${profileAttrElemListLength > 0}">
					<div class="row btn-group" style="padding-left:15px;"> 
						<input type="hidden" id="profileAttrList[${index.count-1}].profileAttrId${profileAttrId}" name="profileAttrList[${index.count-1}].profileAttrId" value="${profileAttrId}" />
				
					<c:forEach var="profileAttrElemInfo" items="${profileAttrElemList}" varStatus="childIndex">
							<label class="btn btn-info"><input type="checkbox" id="profileAttrList[${index.count-1}].profileAttrElementList[${childIndex.count-1}].profileAttrElementId${ProfileAttrElemInfo.profileAttrElementId}" name="profileAttrList[${index.count-1}].profileAttrElementList[${childIndex.count-1}].profileAttrElementId" value="${profileAttrElemInfo.profileAttrElementId}" class="attrElemRadio"/>&nbsp;
							<tag:message code="attr.${profileAttrElementInfo.profileAttrName}.${profileAttrElemInfo.profileAttrElementName}"/>
							</label>
							<c:if test="${childIndex.count > 5}">
								<br/>
							</c:if>
					</c:forEach>
					</div>
				</c:if>	
				</div>
				<c:set var="prevAttrId" value="${attrId}"/>
			</div>	
		</c:forEach>
	</c:if>
				</div>
			</div>
			</div>
			<div class="form-group text-right">
				<input type="button" data-toggle="collapse" class="btn btn-outline-primary" style="margin-right: 10px;" data-target="#searchDetail" value="<tag:message code='text.filtersearch'/>"/>
			</div>					
			<!-- list area -->
			<div id="listDiv" role="main" style="padding:0px 10px 0px 10px;"></div>
			<!-- // list area -->
				
		<c:if test="${isLogon}">
			<div class="btn-group btn-group-justified" style="padding-bottom: 20px;">
				<div class="btn-group">
					<input type="button" class="btn btn-default pull-right" value="regist" name="goToRegistProfile" />
				</div>
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
// $("input[name=attrElemId]").each(function(){
// 	var selectedAttrElemId = this;
// 	$(".attrElemRadio").each(function(){
// 		var attrElemId = this;
// 		if($(attrElemId).val() == $(selectedAttrElemId).val()){
// 			$(attrElemId).attr("checked", true);
// 		}
// 	});
	
	$(".attrElemRadio").on("click", function(){
		loadProfileList();	
	});
// });
});
	
//리스트 페이징을 위한 메서드
function ajaxPagination(page){
    var newPage = isEmpty(page) ? "1" : page;
    $("input[name=page]").val(newPage);

    loadProfileList();
}    

function isEmpty(val){
	var result = false;
	
	if(val == '' || val == null || val == 'undefined'){
		result = true;
	}
	return result;
	
}

</script>
</html>