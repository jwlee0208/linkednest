<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

                <h4><tag:message code='text.recenttryoutinfo'/>&nbsp;[Baseball]&nbsp;<small><a href="/share/jwlee/list/15" style="float:right" class="btn btn-outline-info"><tag:message code='button.more'/></a></small></h4>
                <hr/>
<!--            <div class="row" style="padding-left: 10px; padding-right: 10px;"> -->
                        <div class="boardDiv li_1_board" style="padding-top : 10px;">
                                <div class="table-responsive">
                                        <table class="table table-striped">
                                                <colgroup><col width="15%"/><col width="85%"/></colgroup>
                                        <c:choose>
                                                <c:when test="${null ne recentTryoutList && recentTryoutList.size() > 0}">
                                                        <c:forEach var="article" items="${recentTryoutList}">
                                                <tr>
                                                        <td>${fn:substring(article.createDate, 0, 10)}</td>
                                                        <td><span><a href="/share/view/${article.articleId}" target="_blank">${article.title }</a></span></td>
                                                </tr>
                                                        </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                <tr><td colspan="2">There is no article.</td></tr>
                                                </c:otherwise>
                                        </c:choose>
                                        </table>
                                </div>
                        </div>
<!--            </div>   -->
