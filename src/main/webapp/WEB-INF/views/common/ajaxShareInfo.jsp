<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:if test="${shareInfo ne null}">
	My Share Name is ${shareInfo.shareName}<br/>
	My Share Type is ${shareInfo.shareType}<br/>
	My Share's parent is ${shareInfo.userId}<br/>
	My Share's Birthday is ${fn:substring(shareInfo.createDate, 0, 10)}<br/>
</c:if>