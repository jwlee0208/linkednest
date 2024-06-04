<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:if test="${pageInfo.totalPage > 0}">
<div class="form-control row" style="margin:0px 10px 0px 0px; border: 0px;" id="pageDiv">
	<%--<nav aria-label="Page navigation example" id="pageDiv">--%>
		<ul class="pagination justify-content-center">
	        <c:if test="${pageInfo.totalPage != 1}">
	            <c:if test="${pageInfo.startPage > 1}">
	         <li class="page-item"><a class="page-link" href="javascript:${pageInfo.scriptName}('${pageInfo.previousScalePage}', '${pageInfo.paramString}')" class="num prev"><c:out value="<<"/></a></li>
	            </c:if>
	        </c:if>
	        <c:forEach items="${pageInfo.pages}" var="page" varStatus="status">
	            <c:if test="${pageInfo.currentPage != page}">
	         <li class="page-item"><a class="page-link" href="javascript:${pageInfo.scriptName}('${page}', '${pageInfo.paramString}')" class="num">${page}</a></li>
	            </c:if>
	            <c:if test="${pageInfo.currentPage == page}">
	         <li class="page-item"><a class="page-link" href="javascript://"><strong class="num">${page}</strong></a></li>
	            </c:if>
	        </c:forEach>
	        <c:if test="${pageInfo.nextScalePage <= pageInfo.totalPage}">
	        <li class="page-item"><a class="page-link" href="javascript:${pageInfo.scriptName}('${pageInfo.nextScalePage}', '${pageInfo.paramString}')" class="num next"><c:out value=">>"/></a></li>
	        </c:if>
	    </ul>	
	<%--</nav>--%>
</div>
</c:if>