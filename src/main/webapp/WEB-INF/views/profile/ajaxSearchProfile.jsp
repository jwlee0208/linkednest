<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag"%>
<style>
	input[type="radio"]{width:30px;heignt:30px;}
	input[type="checkbox"]{width:30px;heignt:30px;}
</style>

			<div class="form-group" role="search" style="padding-left:10px; padding-right:10px;">
				<input type="hidden" 	id="searchCondition" 	name="searchCondition" value="name"/>
				<input type="hidden" 	id="searchText" 		name="searchText" />
				<input type="text" 		id="searchTextStr" 		name="searchTextStr" class="form-control ui-autocomplete-input" placeholder="<tag:message code='text.request.insert.search.keyword'/>"/>

				<div class="collapse"  id="searchDetail" style="padding-top:10px;">
					<!-- (Additional) Team Search Condition : Continent -->
			<c:if test="${profileType eq 3}">
					<div id="areaList" style="margin-top:10px;">
						<div class="form-group row">
							<div class="col-lg-2"><h4><span class="badge badge-primary"><tag:message code="text.continent"/></span></h4></div>
							<div class="col-lg-8 form-check form-check-inline">
								<label class="form-check-label" for="area1"><input type="radio" id="area1" name="area" value="as" class="attrElemRadio form-check-input"/>&nbsp;<tag:message code="code.area.as"/></label>
								<label class="form-check-label" for="area2"><input type="radio" id="area2" name="area" value="na" class="attrElemRadio form-check-input"/>&nbsp;<tag:message code="code.area.na"/></label>
								<label class="form-check-label" for="area3"><input type="radio" id="area3" name="area" value="sa" class="attrElemRadio form-check-input"/>&nbsp;<tag:message code="code.area.sa"/></label>
								<label class="form-check-label" for="area4"><input type="radio" id="area4" name="area" value="eu" class="attrElemRadio form-check-input"/>&nbsp;<tag:message code="code.area.eu"/></label>
								<label class="form-check-label" for="area5"><input type="radio" id="area5" name="area" value="af" class="attrElemRadio form-check-input"/>&nbsp;<tag:message code="code.area.af"/></label>
							</div>
						</div>
					</div>
			</c:if>
			<c:if test="${categoryId eq '01010300'}">
					<div id="countryList">
						<div class="form-group row">
							<div class="col-lg-2"><h4><span class="badge badge-primary"><tag:message code="text.countries"/></span></h4></div>
							<div class="col-lg-8 form-check form-check-inline">
								<label class="form-check-label" for="country1"><input type="radio" id="country1" name="country" value="KR" class="form-check-input attrElemRadio"/>&nbsp;<tag:message code="code.country.KR"/></label>
								<label class="form-check-label" for="country2"><input type="radio" id="country2" name="country" value="JP" class="form-check-input attrElemRadio"/>&nbsp;<tag:message code="code.country.JP"/></label>
								<label class="form-check-label" for="country3"><input type="radio" id="country3" name="country" value="AU" class="form-check-input attrElemRadio"/>&nbsp;<tag:message code="code.country.AU"/></label>
								<label class="form-check-label" for="country4"><input type="radio" id="country4" name="country" value="DE" class="form-check-input attrElemRadio"/>&nbsp;<tag:message code="code.country.DE"/></label>
								<label class="form-check-label" for="country5"><input type="radio" id="country5" name="country" value="US" class="form-check-input attrElemRadio"/>&nbsp;<tag:message code="code.country.US"/></label>
							</div>
						</div>
					</div>
			</c:if>		
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
						<div class="form-group row">
							<div class="col-lg-2"><h4><span class="badge badge-info"><tag:message code="text.${profileAttrElementInfo.profileAttrName}"/></span></h4></div>
							<div class="col-lg-8 form-check form-check-inline">
								<c:if test="${profileAttrElemListLength > 0}">
									<div class="row btn-group" style="padding-left:15px;">
										<input type="hidden" id="profileAttrList[${index.count-1}].profileAttrId${profileAttrId}" name="profileAttrList[${index.count-1}].profileAttrId" value="${profileAttrId}" />
										<c:forEach var="profileAttrElemInfo" items="${profileAttrElemList}" varStatus="childIndex">
										<label class="form-check-label" for="profileAttrList[${index.count-1}].profileAttrElementList[${childIndex.count-1}].profileAttrElementId${ProfileAttrElemInfo.profileAttrElementId}"><input type="checkbox" id="profileAttrList[${index.count-1}].profileAttrElementList[${childIndex.count-1}].profileAttrElementId${ProfileAttrElemInfo.profileAttrElementId}" name="profileAttrList[${index.count-1}].profileAttrElementList[${childIndex.count-1}].profileAttrElementId" value="${profileAttrElemInfo.profileAttrElementId}" class="form-check-input attrElemRadio"/>&nbsp;
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