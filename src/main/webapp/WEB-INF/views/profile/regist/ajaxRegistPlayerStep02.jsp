<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>
<h3>Player Information</h3>
<hr />
<c:set var="profileAttrList" value="${profileAttrList}"/>
<c:if test="${!empty profileAttrList}">
	<c:set var="rowCnt" value="${0}" />
	<c:forEach var="profileAttrInfo" items="${profileAttrList}">
		<div class="form-group row">
			<label class="col-2 col-form-label" style="color:red;"><tag:message code='text.${profileAttrInfo.profileAttrName}'/>(*)</label>
			<div class="col-10">
				<div class="form-group row">
					<c:set var="profileAttrElemList" value="${profileAttrInfo.profileAttrElementList}" />
			<c:if test="${!empty profileAttrElemList}">
				<c:forEach var="profileAttrElemInfo" items="${profileAttrElemList}" varStatus="index">
					<label class="form-check-label" for="profileAttrElementMapList[${rowCnt}].profileAttrElementId">
							<input type="hidden" 	name="profileAttrElementMapList[${rowCnt}].profileAttrId" 			value="${profileAttrInfo.profileAttrId}" />
							<input type="hidden" 	name="profileAttrElementMapList[${rowCnt}].profileAttrName" 		value='<c:out value="${profileAttrInfo.profileAttrName}"/>' />
							<input type="hidden" 	name="profileAttrElementMapList[${rowCnt}].profileAttrElementName" 	value="${profileAttrElemInfo.profileAttrElementName}">
							<input type="checkbox"  name="profileAttrElementMapList[${rowCnt}].profileAttrElementId" 	id="profileAttrElementMapList[${rowCnt}].profileAttrElementId" aria-label="Checkbox for following text input" value="${profileAttrElemInfo.profileAttrElementId}">
							<tag:message code='attr.${profileAttrInfo.profileAttrName}.${profileAttrElemInfo.profileAttrElementName}' />
							<input type="hidden" 	name="profileAttrElementMapList[${rowCnt}].profileAttrElementMapName" class="form-control" aria-label="Text input with checkbox" 
								   value="<tag:message code='attr.${profileAttrInfo.profileAttrName}.${profileAttrElemInfo.profileAttrElementName}'/>"/>
							<c:set var="rowCnt" value="${rowCnt+1}" />
					</label>
				</c:forEach>
			</c:if>
				</div>
			</div>
		</div>
	</c:forEach>
</c:if>
