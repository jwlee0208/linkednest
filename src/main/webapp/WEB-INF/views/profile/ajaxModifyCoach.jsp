<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag"%>
<input type="hidden" id="catId1" name="catId1" value="01010300" />
<input type="hidden" id="catId2" name="catId2" value="01010301" />
<h3><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;<tag:message code="text.personalinfo"/></h3>
<hr/>

<div class="row">
    <div class="col-sm-6">
        <c:if test="${profileInfo.profileImgPath ne '' && profileInfo.profileImgPath ne null}">
            <div class="thumbImg unset">
                <img src="http://jwlee0208.cdn3.cafe24.com/${profileInfo.profileImgPath}" class="img-fluid rounded mx-auto d-block"/>
                <input type="hidden" id="profileImgPath" 			name="profileImgPath" 		value="${profileInfo.profileImgPath}" />
                <hr/>
                <input type="button" class="btn btn-outline-danger btn-block" value="이미지 삭제" onclick="javascript:delThumbImage('set');">
            </div>
        </c:if>
        <div class="thumbImg set">
            <img onerror="this.src='${pageContext.request.contextPath}/img/no_image.png'" class="img-fluid rounded mx-auto d-block"/>
            <input type="file" class="form-control" id="profileImg" name="profileImg" placeholder="upload your profile image" />
        </div>
    </div>
    <div class="col-sm-6">
        <div class="form-group row">
            <label for="name" class="col-sm-5 col-form-label"><tag:message code="text.player.name"/></label>
            <div class="col-sm-7">
                <p class="form-control-static"><input type="text" class="form-control" id="name" name="name" placeholder="write your name" value="${profileInfo.name}"/></p>
            </div>
        </div>
        <div class="form-group row">
            <label for="height" class="col-sm-5 col-form-label"><tag:message code="text.height"/></label>
            <div class="col-sm-7">
                <p class="form-control-static">
                    <input type="number" class="form-control" id="height" name="profilePlayerDto.height" value="${profileInfo.profilePlayerDto.height}"/>
                </p>
            </div>
        </div>
        <div class="form-group row">
            <label for="weight" class="col-sm-5 col-form-label"><tag:message code="text.weight"/></label>
            <div class="col-sm-7">
                <p class="form-control-static">
                    <input type="number" class="form-control" id="weight" name="profilePlayerDto.weight" value="${profileInfo.profilePlayerDto.weight}"/>
                </p>
            </div>
        </div>

        <div class="form-group row">
            <label for="birthDate" class="col-sm-5 col-form-label"><tag:message code="text.dateofbirth"/></label>
            <div class="col-sm-7">
                <p class="form-control-static">
                    <input type="date" class="form-control" id="birthDate" name="profilePlayerDto.birthDate" value="${fn:substring(profileInfo.profilePlayerDto.birthDate,0,10)}"/>
                </p>
            </div>
        </div>

        <div class="form-group row">
            <label for="birthPlace" class="col-sm-5 col-form-label"><tag:message code="text.birthplace"/></label>
            <div class="col-sm-7">
                <p class="form-control-static"><input type="text" class="form-control" id="birthPlace" name="profilePlayerDto.birthPlace" value="${profileInfo.profilePlayerDto.birthPlace}"/></p>
            </div>
        </div>

        <div class="form-group row">
            <label for="education" class="col-sm-5 col-form-label"><tag:message code="text.education"/></label>
            <div class="col-sm-7">
                <p class="form-control-static"><textarea class="form-control" id="education" name="profilePlayerDto.education">${profileInfo.profilePlayerDto.education}</textarea></p>
            </div>
        </div>
        <div class="form-group row">
            <label for="hobbies" class="col-sm-5 col-form-label"><tag:message code="text.hobbies"/></label>
            <div class="col-sm-7">
                <p class="form-control-static"><input type="text" class="form-control" id="hobbies" name="profilePlayerDto.hobbies" value="${profileInfo.profilePlayerDto.hobbies}"/></p>
            </div>
        </div>
        <div class="form-group row">
            <label for="favoriteFood" class="col-sm-5 col-form-label"><tag:message code="text.favoritefood"/></label>
            <div class="col-sm-7">
                <p class="form-control-static"><input type="text" class="form-control" id="favoriteFood" name="profilePlayerDto.favoriteFood" value="${profileInfo.profilePlayerDto.favoriteFood}"/></p>
            </div>
        </div>
        <div class="form-group row">
            <label for="nationalitySearch" class="col-sm-5 col-form-label"><tag:message code="text.nationality"/></label>
            <div class="col-sm-7">
                <p class="form-control-static"><input type="text" class="form-control" id="nationalitySearch" value="<tag:message code='code.country.${profileInfo.profilePlayerDto.nationality}'/>"/></p>
                <input type="hidden" class="form-control" id="nationality" name="profilePlayerDto.nationality"  value="${profileInfo.profilePlayerDto.nationality}"/>
            </div>
        </div>
        <div class="form-group row">
            <label for="languageSearch" class="col-sm-5 col-form-label"><tag:message code="text.language"/></label>
            <div class="col-sm-7">
                <p class="form-control-static"><input type="text" class="form-control" id="languageSearch" value="<tag:message code='code.language.${profileInfo.profilePlayerDto.language}'/>"/></p>
                <input type="hidden" class="form-control" id="language" name="profilePlayerDto.language" value="${profileInfo.profilePlayerDto.language}"/>
            </div>
        </div>
    </div>
</div>
<br/>
<br/>
<h3><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>&nbsp;&nbsp;<tag:message code="text.contact"/></h3>
<hr/>
<div class="form-group row">
    <label for="email" class="col-sm-2 col-form-label"><tag:message code="text.email"/></label>
    <div class="col-sm-10">
        <p class="form-control-static"><input type="email" class="form-control" id="email" name="profileContactInfoDto.email" placeholder="write your e-mail" value="${profileInfo.profileContactInfoDto.email}"/></p>
    </div>
</div>
<div class="form-group row">
    <label for="phoneNo" class="col-sm-2 col-form-label">Phone No.</label>
    <div class="col-sm-10">
        <p class="form-control-static"><input type="tel" class="form-control" id="phoneNo" name="profileContactInfoDto.phoneNo" placeholder="write your phone No." value="${profileInfo.profileContactInfoDto.phoneNo}"/></p>
    </div>
</div>
<div class="form-group row">
    <label for="cellPhoneNo" class="col-sm-2 col-form-label">Cell Phone No.</label>
    <div class="col-sm-10">
        <p class="form-control-static"><input type="tel" class="form-control" id="cellPhoneNo" name="profileContactInfoDto.cellPhoneNo" placeholder="write your cell phone No." value="${profileInfo.profileContactInfoDto.cellPhoneNo}"/></p>
    </div>
</div>
<div class="form-group row">
    <label for="websiteUrl" class="col-sm-2 col-form-label"><tag:message code="text.website"/></label>
    <div class="col-sm-10">
        <p class="form-control-static"><input type="url" class="form-control" id="websiteUrl" name="profileContactInfoDto.websiteUrl" placeholder="write your website url" aria-describedby="basic-addon3" value="${profileInfo.profileContactInfoDto.websiteUrl}"/></p>
    </div>
</div>

<div class="form-group row">
    <label for="facebookUrl" class="col-sm-2 col-form-label"><tag:message code="text.facebook.id"/></label>
    <div class="col-sm-10">
        <p class="form-control-static"><input type="text" class="form-control" id="facebookUrl" name="profileContactInfoDto.faceebookUrl" placeholder="write your facebook id" value="${profileInfo.profileContactInfoDto.facebookUrl}"/></p>
    </div>
</div>
<div class="form-group row">
    <label for="twitterUrl" class="col-sm-2 col-form-label"><tag:message code="text.twitter.id"/></label>
    <div class="col-sm-10">
        <p class="form-control-static"><input type="text" class="form-control" id="twitterUrl" name="profileContactInfoDto.twitterUrl" placeholder="write your twitter id" value="${profileInfo.profileContactInfoDto.twitterUrl}"/></p>
    </div>
</div>
<div class="form-group row">
    <label for="instagramUrl" class="col-sm-2 col-form-label"><tag:message code="text.instagram.id"/></label>
    <div class="col-sm-10">
        <p class="form-control-static"><input type="text" class="form-control" id="instagramUrl" name="profileContactInfoDto.instagramUrl" placeholder="write your instagram id" value="${profileInfo.profileContactInfoDto.instagramUrl}"/></p>
    </div>
</div>
<div class="form-group row">
    <label for="address" class="col-sm-2 col-form-label"><tag:message code="text.address"/></label>
    <div class="col-sm-10">
        <p class="form-control-static"><input type="text" class="form-control" id="address" name="profileContactInfoDto.address" placeholder="write your address" value="${profileInfo.profileContactInfoDto.address}"/></p>
    </div>
</div>
<h3><span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span>&nbsp;&nbsp;<tag:message code="text.career"/>&nbsp;&nbsp;<input type="button" class="btn btn-default addCareerBtn" value="+"/></h3>
<hr/>
<c:set var="profileCareerList" value="${profileInfo.profileCareerList}"/>
<c:if test="${!empty profileCareerList}">

    <table class="table tableCareer">
        <thead class="">
        <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Status</th>
            <!-- 						<th>Seq</th> -->
        </tr>
        </thead>
        <tbody>
        <c:forEach var="profileCareerInfo" items="${profileCareerList}" varStatus="index">
            <tr id="career_tr_${index.count-1}" class="career_tr">
                <th class="row"><p class="form-control-static">
                    <input type="text" class="form-control" id="careerTitle" name="profileCareerList[0].careerTitle" value="${profileCareerInfo.careerTitle}"/></p>
                    <input type="hidden" class="form-control" name="profileCareerList[0].profileId" value="${profileInfo.profileId}"/>
                    <input type="hidden" class="form-control" name="profileCareerList[0].careerId" value="${profileCareerInfo.careerId}"/>
                </th>
                <td><p class="form-control-static"><textarea class="form-control" id="careerTitle" name="profileCareerList[0].careerDescription" row="5" col="20">${profileCareerInfo.careerDescription}</textarea></p></td>
                <td><p class="form-control-static"><input type="date" class="form-control" id="careerStartDate" name="profileCareerList[0].startDate" value="${profileCareerInfo.startDate}"/></p></td>
                <td><p class="form-control-static"><input type="date" class="form-control" id="careerEndDate" name="profileCareerList[0].endDate" value="${profileCareerInfo.endDate}"/></p></td>
                <td>${profileCareerInfo.careerStatus}<p class="form-control-static">
                    <select class="form-control" id="careerTitle" name="profileCareerList[0].careerStatus">
                        <option <c:if test="${profileCareerInfo.careerStatus eq -1}">selected</c:if> value="-1">::: status :::</option>
                        <option <c:if test="${profileCareerInfo.careerStatus eq 0}">selected</c:if>value="0">not playing</option>
                        <option <c:if test="${profileCareerInfo.careerStatus eq 1}">selected</c:if>value="1">playing</option>
                    </select>
                </p></td>
                    <%-- 		    			<td><p class="form-control-static"><input type="number" class="form-control" id="careerSeq" name="profileCareerList[0].careerSeq" min="0" max="100" value="${profileCareerInfo.careerSeq}"/></p></td> --%>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
<c:set var="profileStreamList" value="${profileInfo.profileStreamList}"/>
<c:if test="${!empty profileStreamList}">
    <h3><span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span>&nbsp;&nbsp;<tag:message code="text.playstream"/>&nbsp;&nbsp;<input type="button" class="btn btn-default addStreamBtn" value="+"/></h3>
    <hr/>
    <c:forEach var="profileStreamInfo" items="${profileStreamList}" varStatus="index">
        <div class="row stream_div" style="padding-bottom:5px;">
            <div class="col-lg-6">
                <div class="input-group">
                    <span class="input-group-addon">Title</span>
                    <input type="text" class="form-control" id="streamTitle_${index.count-1}" name="profileStreamList[${index.count-1}].streamTitle" value="${profileStreamInfo.streamTitle}"/>
                    <input type="hidden" class="form-control" name="profileStreamList[${index.count-1}].profileId" value="${profileInfo.profileId}"/>
                    <input type="hidden" class="form-control" name="profileStreamList[${index.count-1}].streamId" value="${profileStreamInfo.streamId}"/>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="input-group">
                    <span class="input-group-addon">URL</span>
                    <input type="text" class="form-control" id="streamUrl_${index.count-1}" name="profileStreamList[${index.count-1}].streamUrl" value='<c:out value="${profileStreamInfo.streamUrl}" escapeXml="false"/>'/>
                </div>
            </div>
        </div>
    </c:forEach>
</c:if>