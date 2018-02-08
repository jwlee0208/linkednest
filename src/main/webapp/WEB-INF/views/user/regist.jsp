<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>

<div class="container" style="min-height: 800px;">
	<div class="card"></div>
	<input type="hidden" id="prevPage" name="prevPage" value="${prevPage}"/>
	
	<form id="actionFrm" name="actionFrm" method="post" class="form-horizontal" role="form">
		<h1 id="btn-groups" class="page-header"><tag:message code="signup"/></h1>
		<h2><tag:message code="required"/></h2>
		<div class="form-group row">
			<label for="userId" class="col-sm-2 control-label"><tag:message code="common.userid"/></label>
			<div class="col-sm-10">
				<input type="text" class="form-control form-control-danger" id="userId" name="userId"/><span id="userIdErr" class="errorMsg" style="display: none;"></span>
			</div>
		</div>

		<div class="form-group row">
			<label for="userNm" class="col-sm-2 control-label"><tag:message code="common.username"/></label>
			<div class="col-sm-10">
				<input type="text" class="form-control form-control-danger" id="userNm" name="userNm" style="ime-mode: active"/><span id="userNmErr" class="errorMsg form-control-feedback" style="display: none;"></span>
			</div>
		</div>
		
		<div class="form-group row">
			<label for="passwd" class="col-sm-2 control-label"><tag:message code="common.password"/></label>
			<div class="col-sm-10">
				<input type="password" class="form-control form-control-danger" id="passwd" name="passwd" minlength="8" maxlength="15"/><span id="passwdErr" class="errorMsg form-control-feedback" style="display: none;"></span>
			</div>
		</div>

		<div class="form-group row">
			<label for="passwdChk" class="col-sm-2 control-label"><tag:message code="common.passwordchk"/></label>
			<div class="col-sm-10">
				<input type="password" class="form-control form-control-danger" id="passwdChk" name="passwdChk" minlength="8" maxlength="15"/><span id="passwdChkErr" class="errorMsg form-control-feedback" style="display: none;"></span>
			</div>
		</div>

		<div class="form-group row">
			<label for="email" class="col-sm-2 control-label"><tag:message code="common.email"/></label>
			<div class="col-sm-10">
				<input type="email" class="form-control form-control-danger" id="email" name="email"/><span id="emailErr" class="errorMsg form-control-feedback" style="display: none;"></span>
			</div>
		</div>

		<div class="form-group row">
			<label for="phoneNo" class="col-sm-2 control-label"><tag:message code="common.cellphone"/></label>
			<div class="col-sm-10">
				<input type="text" class="form-control form-control-danger" id="phoneNo" name="phoneNo"/><span id="phoneNoErr" class="errorMsg form-control-feedback" style="display: none;"></span>
			</div>
		</div>
		<h2><tag:message code="optional"/></h2>
		<div class="form-group row">
			<label for="fbUserId" class="col-sm-2 control-label">Facebook UserId</label>
			<div class="col-sm-10">
				<input type="text" class="form-control form-control-danger" id="fbUserId" name="fbUserId"/><span id="fbUserIdErr" class="errorMsg form-control-feedback" style="display: none;"></span>
			</div>
		</div>		
		<div class="form-group row">
			<label for="twUserId" class="col-sm-2 control-label">Twitter UserId</label>
			<div class="col-sm-10">
				<input type="text" class="form-control form-control-danger" id="twUserId" name="twUserId"/><span id="twUserIdErr" class="errorMsg form-control-feedback" style="display: none;"></span>
			</div>
		</div>		

		<div class="form-group row">
			<label for="nationality" class="col-sm-2 control-label"><tag:message code="common.nationality"/></label>
			<div class="col-sm-10">
				<select class="form-control form-control-danger" id="nationality" name="nationality">
					<option value=""><tag:message code="select.nationality"/></option>
			<c:if test="${!empty nationList}">		
				<c:forEach var="nationInfo" items="${nationList}">
					<option value="${nationInfo.codeValue}">${nationInfo.codeName}</option>
				</c:forEach>		
			</c:if>
				</select>			
			</div>
		</div>
		<div class="form-group row">
			<label for="language" class="col-sm-2 control-label"><tag:message code="common.language"/></label>
			<div class="col-sm-10">
				<select class="form-control form-control-danger" id="language" name="language">
					<option value=""><tag:message code="select.language"/></option>
			<c:if test="${!empty languageList}">		
				<c:forEach var="langInfo" items="${languageList}">
					<option value="${langInfo.codeValue}">${langInfo.codeName}</option>
				</c:forEach>	
			</c:if>		
				</select>			
			</div>
		</div>		
		<div class="btn-group btn-group-justified" style="padding-top : 20px; padding-bottom : 20px;">
			<div class="btn-group">
				<input type="button" class="btn btn-default" value="<tag:message code='common.home'/>" id="homeBtn">
			</div>
			<div class="btn-group">
				<input type="button" class="btn btn-default" value="<tag:message code="common.cancel"/>" id="cancelBtn">
			</div>
			<div class="btn-group">
				<input type="button" class="btn btn-primary pull-right" value="<tag:message code="common.createaccount"/>" id="registBtn">
			</div>					
		</div>
	</form>
</div>
<div class="loader"></div>
<script>
$().ready(function() {
    $(".loader").hide();
	var numberRegExg = /[0-9]/gi;
	var unNumberRegExg = /[^0-9]/gi;
	var koreanRegExg 	= /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var specialCharRegExg 	= /[~!@\#$%^&*\()\-=+_']/gi;


	/*
	$("form").validate({
		rules: {
			userId: {
				required 	: true,
				minlength 	: 8,
				maxlength 	: 15
			},
			userNm: {
				required 	: true,
				minlength 	: 2,
				maxlength 	: 10
			},
			passwd: {
				required 	: true,
				minlength 	: 8,
				maxlength 	: 15
			},
			passwdChk: {
				required 	: true,
				minlength 	: 8,
				maxlength 	: 15,
				equalTo 	: "#passwd"				
			},
			email : {
				email : true
			},
			phoneNo : {
				number : true
			}
		},
		messages : {
			userId : {
				required 	: "사용자 아이디 입력은 필수 입니다.",
				minlength 	: "길이는 최소 {0}자 이상이어야 합니다.",
				maxlength 	: "길이는 최대 {0}자까지 허용합니다."
			},
			userNm : {
				required 	: "사용자 이름 입력은 필수 입니다.",
				minlength 	: "길이는 최소 {0}자 이상이어야 합니다.",
				maxlength 	: "길이는 최대 {0}자까지 허용합니다."
			},
			passwd : {
				required 	: "패스워드를 입력해 주세요.",
				minlength 	: "길이는 최소 {0}자 이상이어야 합니다.",
				maxlength 	: "길이는 최대 {0}자까지 허용합니다."
			},
			passwdChk: {
				required  	: "패스워드를 한번 더 입력해 주세요.",
				minlength 	: "길이는 최소 {0}자 이상이어야 합니다.",
				maxlength 	: "길이는 최대 {0}자까지 허용합니다.",
				equalTo 	: "위의 패스워드와 동일해야 합니다."				
			},			
			email : {
				email : "이메일 형식에 맞게 입력해 주셔야 합니다."
			},
			phoneNo : {
				number : "숫자만 입력이 가능합니다."
			} 
		}
	});
	*/
});

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
//			var isValid = $("form").valid();

//			if(isValid){
        $.ajax({
// 					url : '/user/regist.json',
            url 	 : '/user/registAction',
            data 	 : $("#actionFrm").serialize(),
            dataType : 'json',
            method 	 : 'post',
            success  : function(data){

                // ajax loading...
				/*loading();*/
                var status = data.status;
                var result = data.result;

                if(status == 'REGIST_0000'){
                    location.replace('/user/registOk');	//$("#prevPage").val();
                }else if(status == 'REGIST_0001'){
                    var length = result.length;
                    if(result != null && length > 0){
                        for(var i = 0 ; i < length ; i++){
                            console.log(i + ", " + result[i].field + ", " + result[i].defaultMessage);
                            $("#" + result[i].field+"Err").html(result[i].defaultMessage);
                            $("#" + result[i].field+"Err").parent().parent().addClass("has-danger");
                            $("#" + result[i].field+"Err").show();
                        }
                        $("input[name="+result[0].field+"]").focus();
                    }
                }else{
                    alert(result);
                    $("#userId").focus();
                }
            },
            error : function(xhr, textStatus, thrownError){

            }
        });
//			}
    });
});

$(document).ajaxStart(function(){
    $(".loader").show();
    $(".btn-group").hide();
});
$(document).ajaxComplete(function(){
    $(".loader").hide();
    $(".btn-group").show();
});


$(".form-control").on("click", function(e){
    $("#" + e.target.id +"Err").parent().parent().removeClass("has-danger");
    $("#" + e.target.id + "Err").hide();
    $("#" + e.target.id + "Err").html('');
});

function loading(){
    $(document).ajaxStart(function(){
        $(".pull-right").attr("id", "loading");
        $(".pull-right").val("Processing...");
    });
    $(document).ajaxStop(function(){
    	$(".pull-right").attr("id", "registBtn");
        $(".pull-right").attr("value", "Create an account");
    });	
}
</script>
<style>
	/*spiner*/
	.loader {
		position: absolute;
		left: 50%;
		top: 50%;
		z-index: 1;
		width: 300px;
		height: 300px;
		margin: -75px 0 0 -75px;
		border: 16px solid #f3f3f3;
		border-radius: 50%;
		border-top: 16px solid #3498db;
		width: 120px;
		height: 120px;
		-webkit-animation: spin 2s linear infinite;
		animation: spin 2s linear infinite;
		background-color: transparent;
	}

	/* Safari */
	@-webkit-keyframes spin {
		0% { -webkit-transform: rotate(0deg); }
		100% { -webkit-transform: rotate(360deg); }
	}

	@keyframes spin {
		0% { transform: rotate(0deg); }
		100% { transform: rotate(360deg); }
	}
</style>