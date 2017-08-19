<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-validate.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>

<script type="text/javascript"	src="${pageContext.request.contextPath}/js/holder.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>

<style type="text/css">
	.form-group .col-sm-10 {vertical-align : middle;}
</style>
<div class="container">
	<br/>
	<h1 id="btn-groups" class="page-header">Profile&nbsp;&nbsp;<small>Detail</small></h1>
	<hr/>
	<form id="viewFrm" name="viewFrm" method="post" class="form-horizontal" role="form">
		<input type="hidden" id="profileId" 	name="profileId" value="${profileInfo.profileId}"/>
		<div style="display:none;"><h2>${profileInfo.title}&nbsp;<small>Profile</small></h2></div>
		<c:choose>
			<c:when test="${profileInfo.profileType eq 1}">
				<%@include file="/WEB-INF/views/profile/ajaxViewPlayer.jsp"%>
			</c:when>
			<c:when test="${profileInfo.profileType eq 2}">
				<%@include file="/WEB-INF/views/profile/ajaxViewCoach.jsp"%>
			</c:when>
			<c:when test="${profileInfo.profileType eq 3}">
				<%@include file="/WEB-INF/views/profile/ajaxViewTeam.jsp"%>
			</c:when>
		</c:choose>

		<div id="introduce" class="tab-pane" role="tabpanel">
			<%--<h3><span class="glyphicon glyphicon-comment" aria-hidden="true"></span>#&nbsp;&nbsp;<tag:message code="text.introduce"/></h3>
			<hr/>--%>
			<div class="form-group row">
				<div class="col-sm-12">
					<p class="form-control-static"><c:out value="${profileInfo.introduce}" escapeXml="false"/></p>
				</div>
			</div>
		</div>

		<div id="contact" class="tab-pane" role="tabpanel">
			<%--<h3><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>#&nbsp;&nbsp;<tag:message code="text.contact"/></h3>
			<hr/>--%>
			<c:if test="${profileInfo.profileContactInfoDto.email ne null && profileInfo.profileContactInfoDto.email ne ''}">
				<div class="form-group row">
					<label for="" class="col-sm-3 col-form-label"><tag:message code="text.email"/></label>
					<div class="col-sm-9">
						<p class="form-control-static"><a href="mailto: ${profileInfo.profileContactInfoDto.email}">${profileInfo.profileContactInfoDto.email}</a></p>
					</div>
				</div>
			</c:if>
			<c:if test="${profileInfo.profileContactInfoDto.phoneNo ne null && profileInfo.profileContactInfoDto.phoneNo ne ''}">
				<div class="form-group row">
					<label for="" class="col-sm-3 col-form-label">Phone No.</label>
					<div class="col-sm-9">
						<p class="form-control-static"><a href="tel:${profileInfo.profileContactInfoDto.phoneNo}">${profileInfo.profileContactInfoDto.phoneNo}</a></p>
					</div>
				</div>
			</c:if>
			<c:if test="${profileInfo.profileContactInfoDto.cellPhoneNo ne null && profileInfo.profileContactInfoDto.cellPhoneNo ne ''}">
				<div class="form-group row">
					<label for="" class="col-sm-3 col-form-label">Cell Phone No.</label>
					<div class="col-sm-9">
						<p class="form-control-static"><a href="tel:${profileInfo.profileContactInfoDto.cellPhoneNo}">${profileInfo.profileContactInfoDto.cellPhoneNo}</a></p>
					</div>
				</div>
			</c:if>
			<c:if test="${profileInfo.profileContactInfoDto.websiteUrl ne null && profileInfo.profileContactInfoDto.websiteUrl ne ''}">
				<div class="form-group row">
					<label for="" class="col-sm-3 col-form-label"><tag:message code="text.website"/></label>
					<div class="col-sm-9">
						<p class="form-control-static"><a href="http://${profileInfo.profileContactInfoDto.websiteUrl}" target="_blank">${profileInfo.profileContactInfoDto.websiteUrl}</a></p>
					</div>
				</div>
			</c:if>

			<c:if test="${profileInfo.profileContactInfoDto.facebookUrl ne null && profileInfo.profileContactInfoDto.facebookUrl ne ''}">
				<div class="form-group row">
					<label for="" class="col-sm-3 col-form-label"><tag:message code="text.facebook.id"/></label>
					<div class="col-sm-9">
						<p class="form-control-static"><a href="https://www.facebook.com/${profileInfo.profileContactInfoDto.facebookUrl}">${profileInfo.profileContactInfoDto.facebookUrl}</a></p>
					</div>
				</div>
			</c:if>
			<c:if test="${profileInfo.profileContactInfoDto.twitterUrl ne null && profileInfo.profileContactInfoDto.twitterUrl ne ''}">
				<div class="form-group row">
					<label for="" class="col-sm-3 col-form-label"><tag:message code="text.twitter.id"/></label>
					<div class="col-sm-9">
						<p class="form-control-static"><a href="https://twitter.com/${profileInfo.profileContactInfoDto.twitterUrl}">${profileInfo.profileContactInfoDto.twitterUrl}</a></p>
					</div>
				</div>
			</c:if>
			<c:if test="${profileInfo.profileContactInfoDto.instagramUrl ne null && profileInfo.profileContactInfoDto.instagramUrl ne ''}">
				<div class="form-group row">
					<label for="" class="col-sm-3 col-form-label"><tag:message code="text.instagram.id"/></label>
					<div class="col-sm-9">
						<p class="form-control-static"><a href="https://instagram.com/${profileInfo.profileContactInfoDto.instagramUrl}">${profileInfo.profileContactInfoDto.instagramUrl}</a></p>
					</div>
				</div>
			</c:if>
			<c:if test="${profileInfo.profileContactInfoDto.address ne null && profileInfo.profileContactInfoDto.address ne ''}">
				<div class="form-group row">
					<label for="" class="col-sm-3 col-form-label"><tag:message code="text.address"/></label>
					<div class="col-sm-9">
						<p class="form-control-static"><a>${profileInfo.profileContactInfoDto.address}</a></p>
					</div>
				</div>
			</c:if>
		</div>
		<br/>
	</form>
</div>
</div>
<script>
    $(document).ready(function() {
        $("img").addClass("media-object");
// 	$("img").attr("width", "95%");
        $("img").attr("height", "300px");
        $("img").off("error");
        $("img").on("error", function(){
            $(this).attr("src", '${pageContext.request.contextPath}/img/no_image.png');
        });

    });

    $(function(){

        $("#deleteBtn").on("click", function(){

            if(confirm('Do you delete this information?')){
                $.ajax({
                    url : '/player/deletePlayerInfo.json',
                    data : $("#viewFrm").serialize(),
                    dataType : 'json',
                    method : 'post',
                    success : function(data){
                        console.log(data);

                        var result = data.result;
                        if(result == 'ok'){
                            location.href = "/profile/list/1";
                        }
                    }
                });
            }
        });

        $("#listBtn").on("click", function(){
            location.href = "/player/playerPortal";
        });

        $("#modifyBtn").on("click", function(){
            var frm = $("#viewFrm");
            frm.attr("action","/player/modify");
            frm.attr("method","get");
            frm.submit();
// 		location.href = "/player/modify";
        });


    });
</script>
