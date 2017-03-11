<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<!-- jQuery -->
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-validate.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>

<!-- bootstrap -->
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-theme.min.css">
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>
	<input type="hidden" id="prevPage" name="prevPage" value="${prevPage}"/>
	
	<form id="actionFrm" name="actionFrm" method="post" class="form-horizontal" role="form">
		<h1 id="btn-groups" class="page-header">
<c:choose>
	<c:when test="${userInfo ne null}">
		Modification
	</c:when>		
	<c:otherwise>
		Sign up
	</c:otherwise>
</c:choose>
		</h1>
		<h2>Required</h2>
		<div class="form-group">
			<label for="userId" class="col-sm-2 control-label">Userid</label>
			<div class="col-sm-10">
<c:choose>
	<c:when test="${userInfo ne null}">
				<input type="hidden" id="userId" name="userId" value="${userInfo.userId}"/>
				<input type="text" class="form-control" value="${userInfo.userId}" <c:if test="${userInfo ne null}">readonly</c:if>/>
	</c:when>		
	<c:otherwise>
				<input type="text" class="form-control" id="userId" name="userId"/><span id="userIdErr" class="errorMsg" style="display: none;"></span>
	</c:otherwise>
</c:choose>
			</div>
		</div>

		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">Username</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="userNm" name="userNm" style="ime-mode: active" value="${userInfo.userNm}"/><span id="userNmErr" class="errorMsg" style="display: none;"></span>
			</div>
		</div>
<c:if test="${userInfo eq null}">  		
		<div class="form-group">
			<label for="passwd" class="col-sm-2 control-label">Password</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="passwd" name="passwd" minlength="8" maxlength="15"/><span id="passwdErr" class="errorMsg" style="display: none;"></span>
			</div>
		</div>

		<div class="form-group">
			<label for="passwdChk" class="col-sm-2 control-label">Confirm your password</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="passwdChk" name="passwdChk" minlength="8" maxlength="15"/><span id="passwdChkErr" class="errorMsg" style="display: none;"></span>
			</div>
		</div>
</c:if>
		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">Email Address</label>
			<div class="col-sm-10">
<c:choose>
	<c:when test="${userInfo ne null}">
				<input type="hidden" id="email" name="email" value="${userInfo.email}"/>
				<input type="text" class="form-control" value="${userInfo.email}" <c:if test="${userInfo ne null}">readonly</c:if>/>
	</c:when>		
	<c:otherwise>
				<input type="email" class="form-control" id="email" name="email" value="${userInfo.email}"/><span id="emailErr" class="errorMsg" style="display: none;"></span>
	</c:otherwise>
</c:choose>
			</div>
		</div>

		<div class="form-group">
			<label for="phoneNo" class="col-sm-2 control-label">Cellphone no.</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="phoneNo" name="phoneNo" value="${userInfo.phoneNo}"/><span id="phoneNoErr" class="errorMsg" style="display: none;"></span>
			</div>
		</div>
		<h2>Optional</h2>
		<div class="form-group">
			<label for="fbUserId" class="col-sm-2 control-label">Facebook UserId</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="fbUserId" name="fbUserId" value="${userInfo.fbUserId}"/><span id="fbUserIdErr" class="errorMsg" style="display: none;"></span>
			</div>
		</div>		
		<div class="form-group">
			<label for="twUserId" class="col-sm-2 control-label">Twitter UserId</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="twUserId" name="twUserId" value="${userInfo.twUserId}"/><span id="twUserIdErr" class="errorMsg" style="display: none;"></span>
			</div>
		</div>		
		
		<div class="form-group">
			<label for="nationallity" class="col-sm-2 control-label">Nationality</label>
			<div class="col-sm-10">
				<select class="form-control" id="nationality" name="nationality">
					<option value="">국가를 선택해주세요.</option>
			<c:if test="${!empty nationList}">		
				<c:forEach var="nationInfo" items="${nationList}">
					<option value="${fn:toLowerCase(nationInfo.codeValue)}" <c:if test="${fn:toLowerCase(nationInfo.codeValue) eq userInfo.nationality}">selected</c:if>>${nationInfo.codeName}</option>
				</c:forEach>		
			</c:if>
				</select>			
			</div>
		</div>
		
		<div class="form-group">
			
			<label for="language" class="col-sm-2 control-label">Language</label>
			<div class="col-sm-10">
				<select class="form-control" id="language" name="language">
					<option value="">언어를 선택해주세요.</option>
			<c:if test="${!empty languageList}">		
				<c:forEach var="langInfo" items="${languageList}">
					<option value="${fn:toLowerCase(langInfo.codeValue)}" <c:if test="${fn:toLowerCase(langInfo.codeValue) eq userInfo.language}">selected</c:if>>${langInfo.codeName}</option>
				</c:forEach>	
			</c:if>		
				</select>			
			</div>
		</div>		
		<div class="btn-group btn-group-justified" style="padding-top : 20px; padding-bottom : 20px;">
			<div class="btn-group">
				<input type="button" class="btn btn-default" value="Home" id="homeBtn">
			</div>
			<div class="btn-group">
				<input type="button" class="btn btn-default" value="Cancel" id="cancelBtn">
			</div>
			<div class="btn-group">
<c:choose>
	<c:when test="${userInfo ne null}">
				<input type="button" class="btn btn-primary pull-right" value="Modify an account" id="modifyBtn">	
	</c:when>		
	<c:otherwise>
				<input type="button" class="btn btn-primary pull-right" value="Create an account" id="registBtn">
	</c:otherwise>
</c:choose>
			</div>					
		</div>
	</form>
<script>
$().ready(function() {
	
	var numberRegExg = /[0-9]/gi;
	var unNumberRegExg = /[^0-9]/gi;
	var koreanRegExg 	= /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var specialCharRegExg 	= /[~!@\#$%^&*\()\-=+_']/gi;

	$(function(){
		$("#phoneNo").on("keyup", function(){
			$(this).val($(this).val().replace(unNumberRegExg,""));
		});
		$("#userNm").on("keyup", function(){
			$(this).val($(this).val()
							   .replace(numberRegExg, "")
							   .replace(specialCharRegExg, ""));
		});
		$("#userId").on("keyup", function(){
			$(this).val($(this).val()
							   .replace(koreanRegExg, "")
							   .replace(specialCharRegExg, ""));
		});

		$("#homeBtn").on("click", function(){
			history.go(-1);
		});

		$("#cancelBtn").on("click", function(){
			history.go(0);
		});
		
		$("#registBtn").on("click", function(){
			var isValid = $("form").valid();

			if(isValid){
				$.ajax({
					url 		: '/user/registAction',
					data 		: $("#actionFrm").serialize(),
					dataType 	: 'json',
					method 		: 'post',
					success 	: function(data){
						var status = data.status;
						
						if(status == 'REGIST_0000'){
							location.replace('/user/registOk');
						}else{
							var result = data.result;
							console.log(result);
							var length = result.length;
							if(result != null && length > 0){

								for(var i = 0 ; i < length ; i++){
									$("#" + result[i].field+"Err").html(result[i].defaultMessage);
									$("#" + result[i].field+"Err").show();
								}
							}
						}
						
					},
					error : function(data){

					}
				});
			}
		});	

		$("#modifyBtn").on("click", function(){
			var isValid = $("form").valid();

			if(isValid){
				$.ajax({
					url 		: '/user/modifyAction',
					data 		: $("#actionFrm").serialize(),
					dataType 	: 'json',
					method 		: 'post',
					success 	: function(data){
						var status = data.status;
						
						if(status == 'REGIST_0000'){
							location.replace('/config/main');
						}else{
							var result = data.result;
							console.log(result);
							var length = result.length;
							if(result != null && length > 0){

								for(var i = 0 ; i < length ; i++){
									$("#" + result[i].field+"Err").html(result[i].defaultMessage);
									$("#" + result[i].field+"Err").show();
								}
							}
						}
						
					},
					error : function(data){

					}
				});
			}
		});				
	});

	$("input[type=text]").on("click", function(e){
		$("#" +e.target.id + "Err").hide();
		$("#" +e.target.id + "Err").html('');
	});
});
</script>