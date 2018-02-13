<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag"%>
<h3>Team Information</h3>
<hr/>
<div class="form-group row">
    <label for="" class="col-sm-2 col-form-label"><tag:message code="text.team.name"/></label>
    <div class="col-sm-10">
        <p class="form-control-static">${profileInfo.name}</p>
    </div>
</div>
<div class="form-group row">
    <label for="" class="col-sm-2 col-form-label"><tag:message code="text.team.franchise"/></label>
    <div class="col-sm-10">
        <p class="form-control-static">${profileInfo.profileTeamDto.city}</p>
    </div>
</div>
<div class="form-group row">
    <label for="" class="col-sm-2 col-form-label"><tag:message code="text.team.eastablish.date"/></label>
    <div class="col-sm-10">
        <p class="form-control-static">${profileInfo.profileTeamDto.establishedDate}</p>
    </div>
</div>
<h3>League Information</h3>
<hr/>
<div class="form-group row">
    <label for="" class="col-sm-2 col-form-label"><tag:message code="text.continent"/></label>
    <div class="col-sm-10">
        <p class="form-control-static"><tag:message code="code.area.${profileInfo.leagueInfoDto.area}"/></p>
    </div>
</div>
<div class="form-group row">
    <label for="" class="col-sm-2 col-form-label"><tag:message code="text.countries"/></label>
    <div class="col-sm-10">
        <p class="form-control-static"><tag:message code="code.country.${profileInfo.leagueInfoDto.country}"/></p>
    </div>
</div>
<div class="form-group row">
    <label for="" class="col-sm-2 col-form-label"><tag:message code="text.league.name"/></label>
    <div class="col-sm-10">
        <p class="form-control-static">${profileInfo.leagueInfoDto.leagueName}</p>
    </div>
</div>
<div class="form-group row">
    <label for="" class="col-sm-2 col-form-label"><tag:message code="text.league.level"/></label>
    <div class="col-sm-10">
        <p class="form-control-static"><tag:message code="code.leaguetype.${profileInfo.leagueInfoDto.leagueType}"/></p>
    </div>
</div>
<div class="form-group row">
    <label for="" class="col-sm-2 col-form-label"><tag:message code="text.league.division"/></label>
    <div class="col-sm-10">
        <p class="form-control-static">${profileInfo.leagueInfoDto.leagueDivision}</p>
    </div>
</div>
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