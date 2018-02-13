<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag"%>
<h3><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;<tag:message code="text.personalinfo"/></h3>
<hr/>
<div class="row">
    <div class="col-sm-6">
        <div class="form-group row">
            <label for="" class="col-sm-5 col-form-label"><tag:message code="text.player.name"/></label>
            <div class="col-sm-7">
                <p class="form-control-static"><input type="text" class="form-control" id="name" name="name" placeholder="write your name" value="${profileInfo.name}"/></p>
                <span name="nameErr" class="errorMsg" style="display: none;"></span>
            </div>
        </div>
        <div class="form-group row">
            <label for="" class="col-sm-5 col-form-label"><tag:message code="text.height"/></label>
            <div class="col-sm-7">
                <p class="form-control-static">
                    <input type="number" class="form-control" id="height" name="profilePlayerDto.height" value="${profileInfo.profilePlayerDto.height}"/>
                    <small id="heightHelpInline" class="text-muted">Allow digit and '.'</small>
                    <span name="profilePlayerDto_heightErr" class="errorMsg" style="display: none;"></span>
                </p>
            </div>
        </div>
        <div class="form-group row">
            <label for="" class="col-sm-5 col-form-label"><tag:message code="text.weight"/></label>
            <div class="col-sm-7">
                <p class="form-control-static">
                    <input type="number" class="form-control" id="weight" name="profilePlayerDto.weight" value="${profileInfo.profilePlayerDto.weight}"/>
                    <small id="weightHelpInline" class="text-muted">Allow digit and '.'</small>
                    <span name="profilePlayerDto_weightErr" class="errorMsg" style="display: none;"></span>
                </p>
            </div>
        </div>

        <div class="form-group row">
            <label for="" class="col-sm-5 col-form-label"><tag:message code="text.dateofbirth"/></label>
            <div class="col-sm-7">
                <p class="form-control-static">
                    <input type="date" class="form-control" id="birthDate" name="profilePlayerDto.birthDate" value="${fn:substring(profileInfo.profilePlayerDto.birthDate,0,10)}"/>
                    <small id="birthDateHelpInline" class="text-muted">YYYY-MM-DD</small>
                    <span name="profilePlayerDto_birthDateErr" class="errorMsg" style="display: none;"></span>
                </p>
            </div>
        </div>

        <div class="form-group row">
            <label for="" class="col-sm-5 col-form-label"><tag:message code="text.birthplace"/></label>
            <div class="col-sm-7">
                <p class="form-control-static">
                    <input type="text" class="form-control" id="birthPlace" name="profilePlayerDto.birthPlace" value="${profileInfo.profilePlayerDto.birthPlace}"/>
                    <span name="profilePlayerDto_birthPlaceErr" class="errorMsg" style="display: none;"></span>
                </p>
            </div>
        </div>

        <div class="form-group row">
            <label for="" class="col-sm-5 col-form-label"><tag:message code="text.education"/></label>
            <div class="col-sm-7">
                <p class="form-control-static">
                    <textarea class="form-control" id="education" name="profilePlayerDto.education">${profileInfo.profilePlayerDto.education}</textarea>
                    <span name="profilePlayerDto_educationErr" class="errorMsg" style="display: none;"></span>
                </p>
            </div>
        </div>
        <%--<div class="form-group row">
            <label for="" class="col-sm-5 col-form-label"><tag:message code="text.hobbies"/></label>
            <div class="col-sm-7">
                <p class="form-control-static"><input type="text" class="form-control" id="hobbies" name="profilePlayerDto.hobbies" value="${profileInfo.profilePlayerDto.hobbies}"/></p>
            </div>
        </div>
        <div class="form-group row">
            <label for="" class="col-sm-5 col-form-label"><tag:message code="text.favoritefood"/></label>
            <div class="col-sm-7">
                <p class="form-control-static"><input type="text" class="form-control" id="favoriteFood" name="profilePlayerDto.favoriteFood" value="${profileInfo.profilePlayerDto.favoriteFood}"/></p>
            </div>
        </div>--%>
        <div class="form-group row">
            <label for="" class="col-sm-5 col-form-label"><tag:message code="text.nationality"/></label>
            <div class="col-sm-7">
                <p class="form-control-static"><input type="text" class="form-control" id="nationalitySearch" value="<tag:message code='code.country.${profileInfo.profilePlayerDto.nationality}'/>"/></p>
                <input type="hidden" class="form-control" id="nationality" name="profilePlayerDto.nationality"  value="${profileInfo.profilePlayerDto.nationality}"/>
                <span name="profilePlayerDto_nationalityErr" class="errorMsg" style="display: none;"></span>
            </div>
        </div>
        <div class="form-group row">
            <label for="" class="col-sm-5 col-form-label"><tag:message code="text.language"/></label>
            <div class="col-sm-7">
                <p class="form-control-static"><input type="text" class="form-control" id="languageSearch" value="<tag:message code='code.language.${profileInfo.profilePlayerDto.language}'/>"/></p>
                <input type="hidden" class="form-control" id="language" name="profilePlayerDto.language" value="${profileInfo.profilePlayerDto.language}"/>
                <span name="profilePlayerDto_languageErr" class="errorMsg" style="display: none;"></span>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-5 col-form-label">Main Position</label>
            <div class="col-7">
                <input type="hidden" id="catId1" name="catId1" value="${profileInfo.catId1}"/>
                <select id="catId2" name="catId2" class="form-control">
                    <option value="">::: select your main position :::</option>
                    <option <c:if test="${profileInfo.catId2 eq '01010101'}">selected</c:if> value="01010101">Pitcher</option>
                    <option <c:if test="${profileInfo.catId2 eq '01010102'}">selected</c:if> value="01010102">Catcher</option>
                    <option <c:if test="${profileInfo.catId2 eq '01010103'}">selected</c:if> value="01010103">First Base</option>
                    <option <c:if test="${profileInfo.catId2 eq '01010104'}">selected</c:if> value="01010104">Second Base</option>
                    <option <c:if test="${profileInfo.catId2 eq '01010105'}">selected</c:if> value="01010105">Third Base</option>
                    <option <c:if test="${profileInfo.catId2 eq '01010106'}">selected</c:if> value="01010106">Short Stop</option>
                    <option <c:if test="${profileInfo.catId2 eq '01010107'}">selected</c:if> value="01010107">Left Fielder</option>
                    <option <c:if test="${profileInfo.catId2 eq '01010108'}">selected</c:if> value="01010108">Center Fielder</option>
                    <option <c:if test="${profileInfo.catId2 eq '01010109'}">selected</c:if> value="01010109">Right Fielder</option>
                    <option <c:if test="${profileInfo.catId2 eq '01010110'}">selected</c:if> value="01010110">DH</option>
                </select>
                <span name="catId2Err" class="errorMsg" style="display: none;"></span>
            </div>
        </div>

    </div>
</div>

<h3><span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span>&nbsp;&nbsp;<tag:message code="text.playerattr"/></h3>
<hr/>
<c:set var="attrElemList" value="${attrElementList}"/>

<c:if test="${!empty attrElemList}">
    <div style="padding:0 15px 0 15px;">
    <c:set var="rowCnt" value="${0}"/>
    <c:set var="profileAttrList" value="${profileInfo.profileAttrList}"/>

    <c:forEach var="attrElemInfo" items="${attrElemList}">
        <div class="row">
            <label for="" class="col-2 col-form-label"><tag:message code="text.${attrElemInfo.profileAttrName}"/></label>
            <c:set var="profileAttrElemList" value="${attrElemInfo.profileAttrElementList}"/>

            <div class="col-10">
                <div class="form-group row">
                    <c:if test="${!empty profileAttrElemList}">
                        <c:forEach var="profileAttrElemInfo" items="${profileAttrElemList}" varStatus="index">
                            <label class="form-check-label" for="profileAttrElementMapList[${rowCnt}].profileAttrElementId">
                                <c:set var="checked" value=""/>
                                <input type="hidden" id="" name="profileAttrElementMapList[${rowCnt}].profileAttrId" value="${attrElemInfo.profileAttrId}"/>
                                <input type="hidden" id="" name="profileAttrElementMapList[${rowCnt}].profileAttrName" value="${attrElemInfo.profileAttrName}"/>
                                <input type="hidden" id="" name="profileAttrElementMapList[${rowCnt}].profileAttrElementName" value="${profileAttrElemInfo.profileAttrElementName}"/>
                                <c:if test="${!empty profileAttrList}">
                                    <c:forEach var="profileAttrInfo" items="${profileAttrList}">
                                        <c:set var="profileAttrElemList" value="${profileAttrInfo.profileAttrElementMapList}"/>
                                        <c:if test="${!empty profileAttrElemList}">
                                            <c:forEach var="profileAttrElemMapInfo" items="${profileAttrElemList}" varStatus="index">
                                                <c:if test="${profileAttrElemMapInfo.profileAttrElementId eq profileAttrElemInfo.profileAttrElementId}">
                                                    <c:set var="checked" value="checked"/>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                                <input type="checkbox" id="" name="profileAttrElementMapList[${rowCnt}].profileAttrElementId" aria-label="Checkbox for following text input" ${checked} value="${profileAttrElemInfo.profileAttrElementId}">
                                <tag:message code="attr.${attrElemInfo.profileAttrName}.${profileAttrElemInfo.profileAttrElementName}"/>
                                <input type="hidden" class="form-control" aria-label="Text input with checkbox" name="profileAttrElementMapList[${rowCnt}].profileAttrElementMapName" value="<tag:message code="attr.${attrElemInfo.profileAttrName}.${profileAttrElemInfo.profileAttrElementName}"/>">
                                <input type="hidden" name="profileAttrElementMapList[${rowCnt}].profileId" value="${profileInfo.profileId}"/>
                            </label>
                            <c:set var="rowCnt" value="${rowCnt+1}"/>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
    </c:forEach>
    </div>
</c:if>
    <br/>
    <h3><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>&nbsp;&nbsp;<tag:message code="text.contact"/></h3>
    <hr/>
    <div class="form-group row">
        <label for="email" class="col-sm-2 col-form-label"><tag:message code="text.email"/></label>
        <div class="col-sm-10">
            <p class="form-control-static">
                <input type="email" class="form-control" id="email" name="profileContactInfoDto.email" placeholder="write your e-mail" value="${profileInfo.profileContactInfoDto.decryptedEmail}"/>
                <span name="profileContactInfoDto_emailErr" class="errorMsg" style="display: none;"></span>
            </p>
        </div>
    </div>
    <div class="form-group row">
        <label for="phoneNo" class="col-sm-2 col-form-label">Phone No.</label>
        <div class="col-sm-10">
            <p class="form-control-static">
                <input type="tel" class="form-control" id="phoneNo" name="profileContactInfoDto.phoneNo" placeholder="write your phone No." value="${profileInfo.profileContactInfoDto.decryptedPhoneNo}"/>
                <span name="profileContactInfoDto_phoneNoErr" class="errorMsg" style="display: none;"></span>
            </p>
        </div>
    </div>
    <%--<div class="form-group row">
    <label for="cellPhoneNo" class="col-sm-2 col-form-label">Cell Phone No.</label>
    <div class="col-sm-10">
    <p class="form-control-static"><input type="tel" class="form-control" id="cellPhoneNo" name="profileContactInfoDto.cellPhoneNo" placeholder="write your cell phone No." value="${profileInfo.profileContactInfoDto.decryptedCellPhoneNo}"/></p>
    </div>
    </div>--%>
    <%--<div class="form-group row">
    <label for="websiteUrl" class="col-sm-2 col-form-label"><tag:message code="text.website"/></label>
    <div class="col-sm-10">
    <p class="form-control-static"><input type="url" class="form-control" id="websiteUrl" name="profileContactInfoDto.websiteUrl" placeholder="write your website url" aria-describedby="basic-addon3" value="${profileInfo.profileContactInfoDto.decryptedWebsiteUrl}"/></p>
    </div>
    </div>--%>
    <div class="form-group row">
        <label for="facebookUrl" class="col-sm-2 col-form-label"><tag:message code="text.facebook.id"/></label>
        <div class="col-sm-10">
            <p class="form-control-static">
                <input type="text" class="form-control" id="facebookUrl" name="profileContactInfoDto.faceebookUrl" placeholder="write your facebook id" value="${profileInfo.profileContactInfoDto.decryptedFacebookUrl}"/>
                <span name="profileContactInfoDto_faceebookUrlErr" class="errorMsg" style="display: none;"></span>
            </p>
        </div>
    </div>
    <div class="form-group row">
        <label for="twitterUrl" class="col-sm-2 col-form-label"><tag:message code="text.twitter.id"/></label>
        <div class="col-sm-10">
            <p class="form-control-static">
                <input type="text" class="form-control" id="twitterUrl" name="profileContactInfoDto.twitterUrl" placeholder="write your twitter id" value="${profileInfo.profileContactInfoDto.decryptedTwitterUrl}"/>
                <span name="profileContactInfoDto_twitterUrlErr" class="errorMsg" style="display: none;"></span>
            </p>
        </div>
    </div>
    <div class="form-group row">
        <label for="instagramUrl" class="col-sm-2 col-form-label"><tag:message code="text.instagram.id"/></label>
        <div class="col-sm-10">
            <p class="form-control-static">
                <input type="text" class="form-control" id="instagramUrl" name="profileContactInfoDto.instagramUrl" placeholder="write your instagram id" value="${profileInfo.profileContactInfoDto.decryptedInstagramUrl}"/>
                <span name="profileContactInfoDto_instagramUrlErr" class="errorMsg" style="display: none;"></span>
            </p>
        </div>
    </div>
    <%--<div class="form-group row">
    <label for="address" class="col-sm-2 col-form-label"><tag:message code="text.address"/></label>
    <div class="col-sm-10">
    <p class="form-control-static"><input type="text" class="form-control" id="address" name="profileContactInfoDto.address" placeholder="write your address" value="${profileInfo.profileContactInfoDto.address}"/></p>
    </div>
    </div>--%>
    <h3><span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span>&nbsp;&nbsp;<tag:message code="text.career"/></h3>
    <hr/>
    <div class="form-group row">
        <label class="col-1 col-form-label" for="careerTitle">Title</label>
        <div class="col-2">
            <input type="text" class="form-control" id="careerTitle" name="careerTitle" />
        </div>
        <label class="col-2 col-form-label" for="careerDescription">Description</label>
        <div class="col-3">
            <textarea class="form-control" id="careerDescription" name="careerDescription"></textarea>
        </div>
        <label class="col-2 col-form-label" for="careerStatus">Career Status</label>
        <div class="col-2">
            <select class="form-control" id="careerStatus" name="careerStatus">
                <option value="-1">::: status :::</option>
                <option value="0">not playing</option>
                <option value="1">playing</option>
            </select>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-3 col-form-label" for="careerStartDate">StartDate</label>
        <div class="col-3">
            <input type="date" class="form-control" id="careerStartDate" name="careerStartDate" />
        </div>
        <label class="col-3 col-form-label" for="careerEndDate">End Date</label>
        <div class="col-3">
            <input type="date" class="form-control" id="careerEndDate" name="careerEndDate" />
        </div>
    </div>
    <div class="form-group row">
        <input type="button" class="btn btn-outline-primary addCareerBtn btn-block" value="Add Career(+)" />
    </div>
    <table class="table tableCareer">
        <thead class="">
        <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Status</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
    <c:set var="profileCareerList" value="${profileInfo.profileCareerList}"/>
    <c:if test="${!empty profileCareerList}">
        <c:forEach var="profileCareerInfo" items="${profileCareerList}" varStatus="index">
            <tr id="career_tr_${index.count-1}" class="career_tr">
                <th class="row"><p class="form-control-static">
                    <input type="text" class="form-control" id="careerTitle${index.count-1}" name="profileCareerList[${index.count-1}].careerTitle" value="${profileCareerInfo.careerTitle}"/></p>
                    <input type="hidden" class="form-control" name="profileCareerList[${index.count-1}].profileId" value="${profileInfo.profileId}"/>
                    <input type="hidden" class="form-control" name="profileCareerList[${index.count-1}].careerId" value="${profileCareerInfo.careerId}"/>
                </th>
                <td><p class="form-control-static"><textarea class="form-control" id="careerDescription${index.count-1}" name="profileCareerList[${index.count-1}].careerDescription" row="5" col="20">${profileCareerInfo.careerDescription}</textarea></p></td>
                <td><p class="form-control-static"><input type="date" class="form-control" id="careerStartDate${index.count-1}" name="profileCareerList[${index.count-1}].startDate" value="${profileCareerInfo.startDate}"/></p></td>
                <td><p class="form-control-static"><input type="date" class="form-control" id="careerEndDate${index.count-1}" name="profileCareerList[${index.count-1}].endDate" value="${profileCareerInfo.endDate}"/></p></td>
                <td>${profileCareerInfo.careerStatus}<p class="form-control-static">
                    <select class="form-control" id="careerStatus${index.count-1}" name="profileCareerList[0].careerStatus">
                        <option <c:if test="${profileCareerInfo.careerStatus eq -1}">selected</c:if> value="-1">::: status :::</option>
                        <option <c:if test="${profileCareerInfo.careerStatus eq 0}">selected</c:if>value="0">not playing</option>
                        <option <c:if test="${profileCareerInfo.careerStatus eq 1}">selected</c:if>value="1">playing</option>
                    </select>
                </p></td>
                <td><input type="hidden" class="form-control" id="careerSeq${index.count-1}" name="profileCareerList[${index.count-1}].careerSeq" value="${index.count-1}"><input type="button" 		class="btn btn-default removeCareerBtn" value="-"/><input type="hidden" class="form-control" id="careerSeq" name="profileCareerList[${index.count-1}].careerSeq" value="${index.count-1}"></td>
            </tr>
        </c:forEach>
    </c:if>
        </tbody>
    </table>
    <h3><span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span>&nbsp;&nbsp;<tag:message code="text.playstream"/>&nbsp;&nbsp;<input type="button" class="btn btn-default addStreamBtn" value="+"/></h3>
    <hr/>
    <div class="form-group row">
        <div class="col-10">
            <input type="text" id="searchYoutubeKeyword" name="searchYoutubeKeyword" class="form-control" placeholder="Search Your Youtube Streams" />
        </div>
        <div class="col-2">
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#searchMyYoutubeList" id="searchMyYoutube">Search My Youtube</button>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-1 col-form-label" for="youtubeTitle">Title</label>
        <div class="col-4">
            <input type="text" class="form-control" id="youtubeTitle" name="youtubeTitle" />
            <!-- 			    	<input type="text" class="form-control" id="streamTitle_0" name="profileStreamList[0].streamTitle"/>   -->
        </div>
        <label class="col-1 col-form-label" for="youtubeUrl">URL</label>
        <div class="col-4">
            <input type="text" class="form-control" id="youtubeUrl" name="youtubeUrl" />
            <!-- 		    		<input type="text" class="form-control" id="streamUrl_0" name="profileStreamList[0].streamUrl"/> -->
        </div>
        <div class="col-2">
            <input type="button" class="btn btn-default addStreamBtn btn-block" value="+" />
        </div>
    </div>
    <div id="streamList"></div>
    <!-- Modal -->
    <div class="modal fade" id="searchMyYoutubeList" tabindex="-1"
         role="dialog" aria-labelledby="searchMyYoutubeList"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Youtube List</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="youtubeListDiv"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <br />
    <c:set var="profileStreamList" value="${profileInfo.profileStreamList}"/>
    <c:if test="${!empty profileStreamList}">
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

    <c:set var="profileStatPitcherList" value="${profileInfo.profileStatPitcherList}"/>
    <c:set var="profileStatHitterList" value="${profileInfo.profileStatHitterList}"/>
    <c:set var="profileStatFielderList" value="${profileInfo.profileStatFielderList}"/>
    <h3><span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span>&nbsp;<tag:message code="text.stats"/></h3>
    <hr/>
    <!-- new  -->
    <h3>
        <small>Pitching Stat</small>
    </h3>
    <div class="form-group row">
        <label class="col-1 col-form-label">Team Name</label>
        <div class="col-2">
            <input type="text" class="form-control" id="pTeamName_pitch_stat" name="pitch_stat_pTeamName" />
        </div>
        <label class="col-1 col-form-label">Year</label>
        <div class="col-2">
            <input type="month" class="form-control" id="pStatYear_pitch_stat" name="pitch_stat_pStatYear"/>
        </div>
        <label class="col-1 col-form-label">INN</label>
        <div class="col-2">
            <input type="number" class="form-control" id="inn_pitch_stat" name="pitch_stat_inn" value="0.0" />
        </div>
        <label class="col-1 col-form-label">W</label>
        <div class="col-2">
            <input type="number" class="form-control" id="w_pitch_stat" name="pitch_stat_w" value="0" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-1 col-form-label">L</label>
        <div class="col-2">
            <input type="number" class="form-control" id="l_pitch_stat" name="pitch_stat_l" value="0" />
        </div>
        <label class="col-1 col-form-label">ERA</label>
        <div class="col-2">
            <input type="number" class="form-control" id="era_pitch_stat" name="pitch_stat_era" value="0.0" />
        </div>
        <label class="col-1 col-form-label">G</label>
        <div class="col-2">
            <input type="number" class="form-control" id="g_pitch_stat" name="pitch_stat_g" value="0" />
        </div>
        <label class="col-1 col-form-label">GS</label>
        <div class="col-2">
            <input type="number" class="form-control" id="gs_pitch_stat" name="pitch_stat_gs" value="0" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-1 col-form-label">SV</label>
        <div class="col-2">
            <input type="number" class="form-control" id="sv_pitch_stat" name="pitch_stat_sv" value="0" />
        </div>
        <label class="col-1 col-form-label">SVO</label>
        <div class="col-2">
            <input type="number" class="form-control" id="svo_pitch_stat" name="pitch_stat_svo" value="0" />
        </div>
        <label class="col-1 col-form-label">IP</label>
        <div class="col-2">
            <input type="number" class="form-control" id="ip_pitch_stat" name="pitch_stat_ip" value="0.0" />
        </div>
        <label class="col-1 col-form-label">H</label>
        <div class="col-2">
            <input type="number" class="form-control" id="h_pitch_stat" name="pitch_stat_h" value="0" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-1 col-form-label">R</label>
        <div class="col-2">
            <input type="number" class="form-control" id="r_pitch_stat" name="pitch_stat_r" value="0" />
        </div>
        <label class="col-1 col-form-label">ER</label>
        <div class="col-2">
            <input type="number" class="form-control" id="er_pitch_stat" name="pitch_stat_er" value="0" />
        </div>
        <label class="col-1 col-form-label">HR</label>
        <div class="col-2">
            <input type="number" class="form-control" id="hr_pitch_stat" name="pitch_stat_hr" value="0" />
        </div>
        <label class="col-1 col-form-label">BB</label>
        <div class="col-2">
            <input type="number" class="form-control" id="bb_pitch_stat" name="pitch_stat_bb" value="0" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-1 col-form-label">SO</label>
        <div class="col-2">
            <input type="number" class="form-control" id="so_pitch_stat" name="pitch_stat_so" value="0" />
        </div>
        <label class="col-1 col-form-label">AVG</label>
        <div class="col-2">
            <input type="number" class="form-control" id="avg_pitch_stat" name="pitch_stat_avg" value="0.0" />
        </div>
        <label class="col-1 col-form-label">WHIP</label>
        <div class="col-2">
            <input type="number" class="form-control" id="whip_pitch_stat" name="pitch_stat_whip" value="0.0" />
        </div>
        <label class="col-1 col-form-label">K</label>
        <div class="col-2">
            <input type="number" class="form-control" id="k_pitch_stat" name="pitch_stat_k" value="0" />
        </div>
    </div>
    <div class="form-group row">
        <input type="button" class="btn btn-outline-primary addPitcherBtn btn-block" value="Add Pitching Stat(+)" />
    </div>
    <table class="table tablePitcherStat">
        <thead class="">
        <tr>
            <th>Team</th>
            <th>Year</th>
            <th>INN</th>
            <th>W</th>
            <th>L</th>
            <th>ERA</th>
            <th>G</th>
            <th>GS</th>
            <th>SV</th>
            <th>SVO</th>
            <th>IP</th>
            <th>H</th>
            <th>R</th>
            <th>ER</th>
            <th>HR</th>
            <th>BB</th>
            <th>SO</th>
            <th>AVG</th>
            <th>WHIP</th>
            <th>K</th>
            <th>DEL</th>
        </tr>
        </thead>
        <tbody>
    <c:if test="${!empty profileStatPitcherList}">
        <c:forEach var="profileStatPitcherInfo" items="${profileStatPitcherList}" varStatus="index">
            <tr id="pitcher_tr_${index.count-1}" class="pitcher_tr">
                <td>
                    <input type="hidden" class="form-control" id="pTeamName_${index.count-1}" name="profileStatPitcherList[${index.count-1}].pTeamName" value="${profileStatPitcherInfo.pTeamName}"/>${profileStatPitcherInfo.pTeamName}
                    <input type="hidden" class="form-control" name="profileStatPitcherList[${index.count-1}].profileId" value="${profileInfo.profileId}"/>
                    <input type="hidden" class="form-control" name="profileStatPitcherList[${index.count-1}].statPitcherId" value="${profileStatPitcherInfo.statPitcherId}"/>
                </td>
                <td><input type="hidden" 		class="form-control" id="pStatYear_${index.count-1}" name="profileStatPitcherList[${index.count-1}].pStatYear" value="${profileStatPitcherInfo.pStatYear}"/>${profileStatPitcherInfo.pStatYear}</td>
                <td><input type="hidden" 		class="form-control" id="inn_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].inn" value="${profileStatPitcherInfo.inn}"/>${profileStatPitcherInfo.inn}</td>
                <td><input type="hidden" 		class="form-control" id="w_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].w" value="${profileStatPitcherInfo.w}"/>${profileStatPitcherInfo.w}</td>
                <td><input type="hidden" 		class="form-control" id="l_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].l" value="${profileStatPitcherInfo.l}"/>${profileStatPitcherInfo.l}</td>
                <td><input type="hidden" 		class="form-control" id="era_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].era" value="${profileStatPitcherInfo.era}"/>${profileStatPitcherInfo.era}</td>
                <td><input type="hidden" 		class="form-control" id="g_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].g" value="${profileStatPitcherInfo.g}"/>${profileStatPitcherInfo.g}</td>
                <td><input type="hidden" 		class="form-control" id="gs_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].gs" value="${profileStatPitcherInfo.gs}"/>${profileStatPitcherInfo.gs}</td>
                <td><input type="hidden" 		class="form-control" id="sv_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].sv" value="${profileStatPitcherInfo.sv}"/>${profileStatPitcherInfo.sv}</td>
                <td><input type="hidden"		class="form-control" id="svo_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].svo" value="${profileStatPitcherInfo.svo}"/>${profileStatPitcherInfo.svo}</td>
                <td><input type="hidden" 		class="form-control" id="ip_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].ip" value="${profileStatPitcherInfo.ip}"/>${profileStatPitcherInfo.ip}</td>
                <td><input type="hidden" 		class="form-control" id="h_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].h" value="${profileStatPitcherInfo.h}"/>${profileStatPitcherInfo.h}</td>
                <td><input type="hidden" 		class="form-control" id="r_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].r" value="${profileStatPitcherInfo.r}"/>${profileStatPitcherInfo.r}</td>
                <td><input type="hidden" 		class="form-control" id="er_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].er" value="${profileStatPitcherInfo.er}"/>${profileStatPitcherInfo.er}</td>
                <td><input type="hidden" 		class="form-control" id="hr_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].hr" value="${profileStatPitcherInfo.hr}"/>${profileStatPitcherInfo.hr}</td>
                <td><input type="hidden" 		class="form-control" id="bb_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].bb" value="${profileStatPitcherInfo.bb}"/>${profileStatPitcherInfo.bb}</td>
                <td><input type="hidden" 		class="form-control" id="so_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].so" value="${profileStatPitcherInfo.so}"/>${profileStatPitcherInfo.so}</td>
                <td><input type="hidden" 		class="form-control" id="avg_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].avg" value="${profileStatPitcherInfo.avg}"/>${profileStatPitcherInfo.avg}</td>
                <td><input type="hidden" 		class="form-control" id="whip_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].whip" value="${profileStatPitcherInfo.whip}"/>${profileStatPitcherInfo.whip}</td>
                <td><input type="hidden" 		class="form-control" id="k_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].k" value="${profileStatPitcherInfo.k}"/>${profileStatPitcherInfo.k}</td>
                <td><input type="button" 		class="btn btn-default removePitcherBtn" value="-"/></td>
            </tr>
        </c:forEach>
    </c:if>
        </tbody>
    </table>
    <br />
    <h3>
        <small>Hitting Stat</small>
    </h3>
    <div class="form-group row">
        <label class="col-1 col-form-label">Team Name</label>
        <div class="col-2">
            <input type="text" class="form-control" id="hTeamName_hit_stat" name="hit_stat_hTeamName" />
        </div>
        <label class="col-1 col-form-label">Year</label>
        <div class="col-2">
            <input type="month" class="form-control" id="hStatYear_hit_stat" name="hit_stat_hStatYear" />
        </div>
        <label class="col-1 col-form-label">G</label>
        <div class="col-2">
            <input type="number" class="form-control" id="g_hit_stat" name="hit_stat_g" value="0" />
        </div>
        <label class="col-1 col-form-label">AB</label>
        <div class="col-2">
            <input type="number" class="form-control" id="ab_hit_stat" name="hit_stat_ab" value="0" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-1 col-form-label">R</label>
        <div class="col-2">
            <input type="number" class="form-control" id="r_hit_stat" name="hit_stat_r" value="0" />
        </div>
        <label class="col-1 col-form-label">H</label>
        <div class="col-2">
            <input type="number" class="form-control" id="h_hit_stat" name="hit_stat_h" value="0" />
        </div>
        <label class="col-1 col-form-label">2B</label>
        <div class="col-2">
            <input type="number" class="form-control" id="twoB_hit_stat" name="hit_stat_twoB" value="0" />
        </div>
        <label class="col-1 col-form-label">3B</label>
        <div class="col-2">
            <input type="number" class="form-control" id="threeB_hit_stat" name="hit_stat_threeB" value="0" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-1 col-form-label">HR</label>
        <div class="col-2">
            <input type="number" class="form-control" id="hr_hit_stat" name="hit_stat_hr" value="0" />
        </div>
        <label class="col-1 col-form-label">RBI</label>
        <div class="col-2">
            <input type="number" class="form-control" id="rbi_hit_stat" name="hit_stat_rbi" value="0" />
        </div>
        <label class="col-1 col-form-label">BB</label>
        <div class="col-2">
            <input type="number" class="form-control" id="bb_hit_stat" name="hit_stat_bb" value="0" />
        </div>
        <label class="col-1 col-form-label">SO</label>
        <div class="col-2">
            <input type="number" class="form-control" id="so_hit_stat" name="hit_stat_so" value="0" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-1 col-form-label">SB</label>
        <div class="col-2">
            <input type="number" class="form-control" id="sb_hit_stat" name="hit_stat_sb" value="0" />
        </div>
        <label class="col-1 col-form-label">CS</label>
        <div class="col-2">
            <input type="number" class="form-control" id="cs_hit_stat" name="hit_stat_cs" value="0" />
        </div>
        <label class="col-1 col-form-label">AVG</label>
        <div class="col-2">
            <input type="number" class="form-control" id="avg_hit_stat" name="hit_stat_avg" value="0.0" />
        </div>
        <label class="col-1 col-form-label">OBP</label>
        <div class="col-2">
            <input type="number" class="form-control" id="obp_hit_stat" name="hit_stat_obp" value="0.0" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-1 col-form-label">SLG</label>
        <div class="col-2">
            <input type="number" class="form-control" id="slg_hit_stat" name="hit_stat_slg" value="0.0" />
        </div>
        <label class="col-1 col-form-label">OPS</label>
        <div class="col-2">
            <input type="number" class="form-control" id="ops_hit_stat" name="hit_stat_ops" value="0.0" />
        </div>
        <div class="col-6"></div>
    </div>
    <div class="form-group row">
        <input type="button" class="btn btn-outline-primary addHitterBtn btn-block" value="Add Hitting Stat(+)" />
    </div>
    <table class="table tableHitterStat">
        <thead class="">
        <tr>
            <th>Team</th>
            <th>Year</th>
            <th>G</th>
            <th>AB</th>
            <th>R</th>
            <th>H</th>
            <th>2B</th>
            <th>3B</th>
            <th>HR</th>
            <th>RBI</th>
            <th>BB</th>
            <th>SO</th>
            <th>SB</th>
            <th>CS</th>
            <th>AVG</th>
            <th>OBP</th>
            <th>SLG</th>
            <th>OPS</th>
            <th>Add</th>
        </tr>
        </thead>
        <tbody>
    <c:if test="${!empty profileStatHitterList}">
        <c:forEach var="profileStatHitterInfo" items="${profileStatHitterList}" varStatus="index">
            <tr id="hitter_tr_${index.count-1}" class="hitter_tr">
                <td>
                    <input type="hidden" 			class="form-control" id="hTeamName" 		name="profileStatHitterList[${index.count-1}].hTeamName" value="${profileStatHitterInfo.hTeamName}"/>${profileStatHitterInfo.hTeamName}
                    <input type="hidden" class="form-control" name="profileStatHitterList[${index.count-1}].profileId" value="${profileInfo.profileId}"/>
                    <input type="hidden" class="form-control" name="profileStatFielderList[${index.count-1}].statHitterId" value="${profileStatHitterInfo.statHitterId}"/>
                </td>
                <td><input type="hidden" 		class="form-control" id="hStatYear" 		name="profileStatHitterList[${index.count-1}].hStatYear" value="${profileStatHitterInfo.hStatYear}"/>${profileStatHitterInfo.hStatYear}</td>
                <td><input type="hidden" 		class="form-control" id="g" 		name="profileStatHitterList[${index.count-1}].g" value="${profileStatHitterInfo.g}"/>${profileStatHitterInfo.g}</td>
                <td><input type="hidden" 		class="form-control" id="ab" 		name="profileStatHitterList[${index.count-1}].ab" value="${profileStatHitterInfo.ab}"/>${profileStatHitterInfo.ab}</td>
                <td><input type="hidden" 		class="form-control" id="r" 		name="profileStatHitterList[${index.count-1}].r" value="${profileStatHitterInfo.r}"/>${profileStatHitterInfo.r}</td>
                <td><input type="hidden" 		class="form-control" id="h" 		name="profileStatHitterList[${index.count-1}].h" value="${profileStatHitterInfo.h}"/>${profileStatHitterInfo.h}</td>
                <td><input type="hidden" 		class="form-control" id="twoB" 		name="profileStatHitterList[${index.count-1}].twoB" value="${profileStatHitterInfo.twoB}"/>${profileStatHitterInfo.twoB}</td>
                <td><input type="hidden" 		class="form-control" id="threeB" 		name="profileStatHitterList[${index.count-1}].threeB" value="${profileStatHitterInfo.threeB}"/>${profileStatHitterInfo.threeB}</td>
                <td><input type="hidden" 		class="form-control" id="hr" 		name="profileStatHitterList[${index.count-1}].hr" value="${profileStatHitterInfo.hr}"/>${profileStatHitterInfo.hr}</td>
                <td><input type="hidden" 		class="form-control" id="rbi" 		name="profileStatHitterList[${index.count-1}].rbi" value="${profileStatHitterInfo.rbi}"/>${profileStatHitterInfo.rbi}</td>
                <td><input type="hidden" 		class="form-control" id="bb" 		name="profileStatHitterList[${index.count-1}].bb" value="${profileStatHitterInfo.bb}"/>${profileStatHitterInfo.bb}</td>
                <td><input type="hidden" 		class="form-control" id="so" 		name="profileStatHitterList[${index.count-1}].so" value="${profileStatHitterInfo.so}"/>${profileStatHitterInfo.so}</td>
                <td><input type="hidden" 		class="form-control" id="sb" 		name="profileStatHitterList[${index.count-1}].sb" value="${profileStatHitterInfo.sb}"/>${profileStatHitterInfo.sb}</td>
                <td><input type="hidden" 		class="form-control" id="cs" 		name="profileStatHitterList[${index.count-1}].cs" value="${profileStatHitterInfo.cs}"/>${profileStatHitterInfo.cs}</td>
                <td><input type="hidden" 		class="form-control" id="avg" 		name="profileStatHitterList[${index.count-1}].avg" value="${profileStatHitterInfo.avg}"/>${profileStatHitterInfo.avg}</td>
                <td><input type="hidden" 		class="form-control" id="obp" 		name="profileStatHitterList[${index.count-1}].obp" value="${profileStatHitterInfo.obp}"/>${profileStatHitterInfo.obp}</td>
                <td><input type="hidden" 		class="form-control" id="slg" 		name="profileStatHitterList[${index.count-1}].slg" value="${profileStatHitterInfo.slg}"/>${profileStatHitterInfo.slg}</td>
                <td><input type="hidden" 		class="form-control" id="ops" 		name="profileStatHitterList[${index.count-1}].ops" value="${profileStatHitterInfo.ops}"/>${profileStatHitterInfo.ops}</td>
                <td><input type="button" 		class="btn btn-default removeHitterBtn" value="-"/></td>
            </tr>
        </c:forEach>
    </c:if>
        </tbody>
    </table>
    <br/>
    <h3>
        <small>Fielding Stat</small>
    </h3>
    <div class="form-group row">
        <label class="col-1 col-form-label">Team Name</label>
        <div class="col-2"><input type="text" class="form-control" id="fTeamName_field_stat" name="field_stat_fTeamName" /></div>
        <label class="col-1 col-form-label">Year</label>
        <div class="col-2"><input type="month" class="form-control" id="fStatYear_field_stat" name="field_stat_fStatYear"/></div>
        <label class="col-1 col-form-label">POS</label>
        <div class="col-2">
            <select id="pos_field_stat" name="field_stat_pos" class="form-control">
                <option value="">::: select position :::</option>
                <option value="P">Pitcher</option>
                <option value="C">Catcher</option>
                <option value="1B">1st Base</option>
                <option value="2B">2nd Base</option>
                <option value="3B">3rd Base</option>
                <option value="SS">Short Stop</option>
                <option value="LF">Left Fielder</option>
                <option value="CF">Center Fielder</option>
                <option value="RF">Right Fielder</option>
                <option value="DH">DH</option>
            </select>
        </div>
        <label class="col-1 col-form-label">G</label>
        <div class="col-2"><input type="number" class="form-control" id="g_field_stat" name="field_stat_g" value="0" /></div>
    </div>
    <div class="form-group row">
        <label class="col-1 col-form-label">GS</label>
        <div class="col-2"><input type="number" class="form-control" id="gs_field_stat" name="field_stat_gs" value="0" /></div>
        <label class="col-1 col-form-label">INN</label>
        <div class="col-2"><input type="number" class="form-control" id="inn_field_stat" name="field_stat_inn" value="0.0" /></div>
        <label class="col-1 col-form-label">TC</label>
        <div class="col-2"><input type="number" class="form-control" id="tc_field_stat" name="field_stat_tc" value="0" /></div>
        <label class="col-1 col-form-label">PO</label>
        <div class="col-2"><input type="number" class="form-control" id="po_field_stat" name="field_stat_po" value="0" /></div>
    </div>
    <div class="form-group row">
        <label class="col-1 col-form-label">A</label>
        <div class="col-2"><input type="number" class="form-control" id="a_field_stat" name="field_stat_a" value="0" /></div>
        <label class="col-1 col-form-label">E</label>
        <div class="col-2"><input type="number" class="form-control" id="e_field_stat" name="field_stat_e" value="0" /></div>
        <label class="col-1 col-form-label">DP</label>
        <div class="col-2"><input type="number" class="form-control" id="dp_field_stat" name="field_stat_dp" value="0" /></div>
        <label class="col-1 col-form-label">SB</label>
        <div class="col-2"><input type="number" class="form-control" id="sb_field_stat" name="field_stat_sb" value="0" /></div>
    </div>
    <div class="form-group row">
        <label class="col-1 col-form-label">CS</label>
        <div class="col-2"><input type="number" class="form-control" id="cs_field_stat" name="field_stat_cs" value="0" /></div>
        <label class="col-1 col-form-label">SBPCT</label>
        <div class="col-2"><input type="number" class="form-control" id="sbpct_field_stat" name="field_stat_sbpct" value="0" /></div>
        <label class="col-1 col-form-label">PB</label>
        <div class="col-2"><input type="number" class="form-control" id="pb_field_stat" name="field_stat_pb" value="0" /></div>
        <label class="col-1 col-form-label">cWP</label>
        <div class="col-2"><input type="number" class="form-control" id="cwp_field_stat" name="field_stat_cwp" value="0" /></div>
    </div>
    <div class="form-group row">
        <label class="col-1 col-form-label">FPCT</label>
        <div class="col-2"><input type="number" class="form-control" id="fpct_field_stat" name="field_stat_fpct" value="0.0" /></div>
        <label class="col-1 col-form-label">RF</label>
        <div class="col-2"><input type="number" class="form-control" id="rf_field_stat" name="field_stat_rf" value="0.0" /></div>
        <div class="col-6"></div>
    </div>
    <div class="form-group row">
        <input type="button" class="btn btn-outline-primary addFielderBtn btn-block" value="Add Fielding Stat(+)" />
    </div>
    <table class="table tableFielderStat">
        <thead class="">
        <tr>
            <th>Team</th><th>Year</th><th>Position</th><th>G</th><th>GS</th><th>INN</th><th>TC</th><th>PO</th><th>A</th><th>E</th><th>DP</th>
            <th>SB</th><th>CS</th><th>SBPCT</th><th>PB</th><th>C_WP</th><th>FPCT</th><th>PRF</th><th>Add</th>
        </tr>
        </thead>
        <tbody>
    <c:if test="${!empty profileStatFielderList}">
        <c:forEach var="profileStatFielderInfo" items="${profileStatFielderList}" varStatus="index">
            <tr id="fielder_tr_${index.count-1}" class="fielder_tr">
                <th>
                    <input type="hidden" 		class="form-control" id="fTeamName" 		name="profileStatFielderList[${index.count-1}].fTeamName" value="${profileStatFielderInfo.fTeamName}"/>${profileStatFielderInfo.fTeamName}
                    <input type="hidden" class="form-control" name="profileStatFielderList[${index.count-1}].profileId" value="${profileInfo.profileId}"/>
                    <input type="hidden" class="form-control" name="profileStatFielderList[${index.count-1}].statFielderId" value="${profileStatFielderInfo.statFielderId}"/>
                </th>
                <td><input type="hidden" 		class="form-control" id="fStatYear" 		name="profileStatFielderList[${index.count-1}].fStatYear" value="${profileStatFielderInfo.fStatYear}"/>${profileStatFielderInfo.fStatYear}</td>
                <td><input type="hidden" 		class="form-control" id="pos" 		name="profileStatFielderList[${index.count-1}].pos" value="${profileStatFielderInfo.pos}"/>${profileStatFielderInfo.pos}</td>
                <td><input type="hidden" 		class="form-control" id="g" 		name="profileStatFielderList[${index.count-1}].g" value="${profileStatFielderInfo.g}"/>${profileStatFielderInfo.g}</td>
                <td><input type="hidden" 		class="form-control" id="gs" 		name="profileStatFielderList[${index.count-1}].gs" value="${profileStatFielderInfo.gs}"/>${profileStatFielderInfo.gs}</td>
                <td><input type="hidden" 		class="form-control" id="inn" 		name="profileStatFielderList[${index.count-1}].inn" value="${profileStatFielderInfo.inn}"/>${profileStatFielderInfo.inn}</td>
                <td><input type="hidden" 		class="form-control" id="tc" 		name="profileStatFielderList[${index.count-1}].tc" value="${profileStatFielderInfo.tc}"/>${profileStatFielderInfo.tc}</td>
                <td><input type="hidden" 		class="form-control" id="po" 		name="profileStatFielderList[${index.count-1}].po" value="${profileStatFielderInfo.po}"/>${profileStatFielderInfo.po}</td>
                <td><input type="hidden" 		class="form-control" id="a" 		name="profileStatFielderList[${index.count-1}].a" value="${profileStatFielderInfo.a}"/>${profileStatFielderInfo.a}</td>
                <td><input type="hidden" 		class="form-control" id="e" 		name="profileStatFielderList[${index.count-1}].e" value="${profileStatFielderInfo.e}"/>${profileStatFielderInfo.e}</td>
                <td><input type="hidden" 		class="form-control" id="dp" 		name="profileStatFielderList[${index.count-1}].dp" value="${profileStatFielderInfo.dp}"/>${profileStatFielderInfo.dp}</td>
                <td><input type="hidden" 		class="form-control" id="sb" 		name="profileStatFielderList[${index.count-1}].sb" value="${profileStatFielderInfo.sb}"/>${profileStatFielderInfo.sb}</td>
                <td><input type="hidden" 		class="form-control" id="cs" 		name="profileStatFielderList[${index.count-1}].cs" value="${profileStatFielderInfo.cs}"/>${profileStatFielderInfo.cs}</td>
                <td><input type="hidden" 		class="form-control" id="sbpct" 		name="profileStatFielderList[${index.count-1}].sbpct" value="${profileStatFielderInfo.sbpct}"/>${profileStatFielderInfo.sbpct}</td>
                <td><input type="hidden" 		class="form-control" id="pb" 		name="profileStatFielderList[${index.count-1}].pb" value="${profileStatFielderInfo.pb}"/>${profileStatFielderInfo.pb}</td>
                <td><input type="hidden" 		class="form-control" id="cWp" 		name="profileStatFielderList[${index.count-1}].cWp" value="${profileStatFielderInfo.cWp}"/>${profileStatFielderInfo.cWp}</td>
                <td><input type="hidden" 		class="form-control" id="fpct" 		name="profileStatFielderList[${index.count-1}].fpct" value="${profileStatFielderInfo.fpct}"/>${profileStatFielderInfo.fpct}</td>
                <td><input type="hidden" 		class="form-control" id="rf" 		name="profileStatFielderList[${index.count-1}].rf" value="${profileStatFielderInfo.rf}"/>${profileStatFielderInfo.rf}</td>
                <td><input type="button" 		class="btn btn-default removeFielderBtn" value="-"/></td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
    </table>
    <!-- //new  -->