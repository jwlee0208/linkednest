<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%         
    int totalPageCnt = Integer.parseInt(request.getParameter("totalPageCnt"));
    int pageNo       = Integer.parseInt(request.getParameter("pageNo"));
    int startPageNo  = Integer.parseInt(request.getParameter("startPageNo"));  
    int endPageNo    = Integer.parseInt(request.getParameter("endPageNo"));
    String type 	 = String.valueOf(request.getParameter("type"));
%> 
<c:set var="totalPageCnt"         value="<%=totalPageCnt %>"/>
<c:set var="pageNo"               value="<%=pageNo %>"/>
<c:set var="startPageNo"          value="<%=startPageNo %>"/>
<c:set var="endPageNo"            value="<%=endPageNo %>"/> 
<c:set var="type"            	  value="<%=type %>"/>
 
<c:choose>
	<c:when test="${type eq 'blog'}">
<div class="pagination pagination-centered" id="pageDiv">
	<ul>
		
 
<!-- 리스트내용이 없을때 등록버튼 위치 -->
<c:if test="${totalPageCnt eq 0}">
<!--    <span class="split"></span> -->
<!--    <span class="split"></span> -->
</c:if> 
<c:if test="${totalPageCnt > 0}">            
   <c:if test="${startPageNo ne 1}">         
      <li><a class="icon laquo"       href="javascript:void(0);" onclick="javascript:goFirst();">
<!--       처음 -->
	 	 <c:out value="<<"/>
      </a>  </li>     
      <li><a class="icon lt"          href="javascript:void(0);" onclick="javascript:goPrevious('${pageNo}','${totalPageCnt}');">
<!--       이전 -->
			<c:out value="<"/>
      </a> </li>
   </c:if>            
<!--    <span class="split"></span>    -->
   <c:forEach var="loopPageNo" begin="${startPageNo}" end="${endPageNo}">
            <c:if test='${loopPageNo eq pageNo}'><li class="active"><a href="javascript:void(0);">${loopPageNo}</a></li></c:if>
            <c:if test='${loopPageNo ne pageNo}'><li><a href="javascript:void(0);" onclick="javascript:goPage('${loopPageNo}');">${loopPageNo}</a></li></c:if>
   </c:forEach>                             
<!--    <span class="split"></span>                -->
   <c:if test="${endPageNo ne totalPageCnt}">                       
      <li><a class="icon rt"          href="javascript:void(0);" onclick="javascript:goNext('${pageNo}','${totalPageCnt}');">
<!--       다음 -->
		<c:out value=">"/>
      </a> </li> 
      <li><a class="icon raquo"       href="javascript:void(0);" onclick="javascript:goEnd();">
<!--       마지막 -->
		<c:out value=">>"/>
      </a></li>
   </c:if> 
</c:if>
	</ul>
</div>	
	</c:when>
	<c:otherwise>
<div class="form-control row">
<nav aria-label="Page navigation example" id="pageDiv">
	<ul class="pagination justify-content-center">
		
 
<!-- 리스트내용이 없을때 등록버튼 위치 -->
<c:if test="${totalPageCnt > 0}">            
   <c:if test="${startPageNo ne 1}">         
      <li class="page-item"><a class="icon laquo page-link"       href="javascript:void(0);" onclick="javascript:goFirst();">
<!--       처음 -->
	 	 <c:out value="<<"/>
      </a>  </li>     
      <li class="page-item"><a class="icon lt page-link"          href="javascript:void(0);" onclick="javascript:goPrevious('${pageNo}','${totalPageCnt}');">
<!--       이전 -->
			<c:out value="<"/>
      </a> </li>
   </c:if>            
   <c:forEach var="loopPageNo" begin="${startPageNo}" end="${endPageNo}">
            <c:if test='${loopPageNo eq pageNo}'><li class="active page-item"><a class="page-link" href="javascript:void(0);">${loopPageNo}</a></li></c:if>
            <c:if test='${loopPageNo ne pageNo}'><li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="javascript:goPage('${loopPageNo}');">${loopPageNo}</a></li></c:if>
   </c:forEach>                             
<!--    <span class="split"></span>                -->
   <c:if test="${endPageNo ne totalPageCnt}">                       
      <li class="page-item"><a class="icon rt page-link"          href="javascript:void(0);" onclick="javascript:goNext('${pageNo}','${totalPageCnt}');">
<!--       다음 -->
		<c:out value=">"/>
      </a> </li> 
      <li class="page-item"><a class="icon raquo page-link"       href="javascript:void(0);" onclick="javascript:goEnd();">
<!--       마지막 -->
		<c:out value=">>"/>
      </a></li>
   </c:if> 
</c:if>
	</ul>
</nav>	
</div>
	
	</c:otherwise>
</c:choose> 