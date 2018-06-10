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
	<div class="row">
		<div class="col">
			<h1 id="btn-groups" class="page-header">Profile&nbsp;&nbsp;<small>Detail</small></h1>
		</div>
		<div class="col">
			&nbsp;
			<%--span class="btn btn-info" style="float:right;" data-toggle="modal" data-target="#sendMailForm" id="sendProfileModalOpen">Send Profile</span>--%>
		</div>
	</div>
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
			<c:if test="${profileInfo.profileContactInfoDto.decryptedEmail ne null && profileInfo.profileContactInfoDto.decryptedEmail ne ''}">
				<div class="form-group row">
					<label for="" class="col-sm-3 col-form-label"><tag:message code="text.email"/></label>
					<div class="col-sm-9">
						<p class="form-control-static"><a href="mailto: ${profileInfo.profileContactInfoDto.decryptedEmail}">${profileInfo.profileContactInfoDto.decryptedEmail}</a></p>
					</div>
				</div>
			</c:if>
			<c:if test="${profileInfo.profileContactInfoDto.decryptedPhoneNo ne null && profileInfo.profileContactInfoDto.decryptedPhoneNo ne ''}">
				<div class="form-group row">
					<label for="" class="col-sm-3 col-form-label">Phone No.</label>
					<div class="col-sm-9">
						<p class="form-control-static"><a href="tel:${profileInfo.profileContactInfoDto.decryptedPhoneNo}">${profileInfo.profileContactInfoDto.decryptedPhoneNo}</a></p>
					</div>
				</div>
			</c:if>
			<c:if test="${profileInfo.profileContactInfoDto.decryptedCellPhoneNo ne null && profileInfo.profileContactInfoDto.decryptedCellPhoneNo ne ''}">
				<div class="form-group row">
					<label for="" class="col-sm-3 col-form-label">Cell Phone No.</label>
					<div class="col-sm-9">
						<p class="form-control-static"><a href="tel:${profileInfo.profileContactInfoDto.decryptedCellPhoneNo}">${profileInfo.profileContactInfoDto.decryptedCellPhoneNo}</a></p>
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

			<c:if test="${profileInfo.profileContactInfoDto.decryptedFacebookUrl ne null && profileInfo.profileContactInfoDto.decryptedFacebookUrl ne ''}">
				<div class="form-group row">
					<label for="" class="col-sm-3 col-form-label"><tag:message code="text.facebook.id"/></label>
					<div class="col-sm-9">
						<p class="form-control-static"><a href="https://www.facebook.com/${profileInfo.profileContactInfoDto.decryptedFacebookUrl}">${profileInfo.profileContactInfoDto.decryptedFacebookUrl}</a></p>
					</div>
				</div>
			</c:if>
			<c:if test="${profileInfo.profileContactInfoDto.decryptedTwitterUrl ne null && profileInfo.profileContactInfoDto.decryptedTwitterUrl ne ''}">
				<div class="form-group row">
					<label for="" class="col-sm-3 col-form-label"><tag:message code="text.twitter.id"/></label>
					<div class="col-sm-9">
						<p class="form-control-static"><a href="https://twitter.com/${profileInfo.profileContactInfoDto.decryptedTwitterUrl}">${profileInfo.profileContactInfoDto.decryptedTwitterUrl}</a></p>
					</div>
				</div>
			</c:if>
			<c:if test="${profileInfo.profileContactInfoDto.decryptedInstagramUrl ne null && profileInfo.profileContactInfoDto.decryptedInstagramUrl ne ''}">
				<div class="form-group row">
					<label for="" class="col-sm-3 col-form-label"><tag:message code="text.instagram.id"/></label>
					<div class="col-sm-9">
						<p class="form-control-static"><a href="https://instagram.com/${profileInfo.profileContactInfoDto.decryptedInstagramUrl}">${profileInfo.profileContactInfoDto.decryptedInstagramUrl}</a></p>
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

		<div class="row">
			<span class="btn btn-primary btn-block" id="goBack">Back</span>
		</div>
		<br/>
		<div class="modal fade" id="sendMailForm" role="dialog" aria-labelledby="sendMailFormLabel" aria-hidden="true">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="sendMailFormLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group row">
						<label class="col-2 col-form-label">mailTo</label>
						<input type="text" class="form-control" id="mailTo" name="mailTo" placeholder="수신자 메일을 입력해 주세요">
					</div>
					<div class="form-group row">
						<label class="col-2 col-form-label">message</label>
						<textarea class="form-control" id="message" name="message" placeholder="메일 내용을 입력해 주세요"></textarea>
					</div>
					<div class="form-group row">
						<label class="col-2 col-form-label">Profile Preview</label>
						<div id="profilePreviewDiv" class="container"></div>
						<input type="text" class="form-control" id="profileContent" name="profileContent"/>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal" id="sendProfileModalClose">Close</button>
					<button type="button" class="btn btn-primary" id="sendProfileMail">Send</button>
				</div>
			</div>

		</div>
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

        $("#sendProfileMail").on("click", function(){
            alert('1');
            $.ajax({
                url : '/profile/sendMail/${profileInfo.profileType}/${profileInfo.profileId}',
                data : $("#viewFrm").serialize(),
                dataType : 'json',
                method : 'post',
                success : function(data){
                    console.log(data);

                    var result = data.result;
                    if(result == 'true'){
                        location.reload();
                    }
                }
            });
        });

        $("#sendProfileModalClose").on("click", function(){
            $(this).modal('toggle');
        });

        $("#sendProfileModalOpen").on("click", function(){
            $.ajax({
                async 		: false,
                type 		: 'POST',
                dataType 	: 'html',
                url : '/profile/sendMailPopup/${profileInfo.profileType}/${profileInfo.profileId}',
                data : $("#viewFrm").serialize(),
                processData : true,
                cache 		: false,
                success : function(data){
                    var profileHtml = $(data).find(".container").html();
                    $("#profilePreviewDiv").html(profileHtml);
                    $("#profileContent").val(profileHtml);
                }
            });
        });

        $("#goBack").on("click", function(){
            var url = "/profile/list/";
            if (${profileInfo.profileType} == '1') {
                url += "1/01010100";
            } else if (${profileInfo.profileType} == '2') {
                url += "2/01010200";
            } else {
                url += "3/01010300";
            }
            location.href =  url;
        });
    });
</script>
