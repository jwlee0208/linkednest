<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag" %>    
<script>
$(document).on("ready", function() {

	$("#loginForm").validate({
		rules : {
			userId : {required : true},
			passwd : {required : true}
		},
		messages : {
			userId : {required : '아이디를 입력해 주세요.'},
			passwd : {required : '패스워드를 입력해 주세요.'}
		}	
	});

	$( "input" ).keypress(function( event ) {
		  if ( event.which == 13 ) {
			  event.preventDefault();
			  loginAction();
		  }
	});

	
	$("#userId").focus();
// 	$("input:blank").css("background-color", "#efefef");					
});




$(function(){
	$("input[name=signinSubmit]").on("click", function(){
		loginAction();
	});
	
	$(".alert.alert-danger").hide();
});

function loginAction(){
	var isvalid = $("#loginForm").valid();

	if(isvalid){
		$.ajax({
			url : "/loginProcess.json",
			data : $("#loginForm").serialize(),
			dataType : "json",
			method : "post",
			success : function(data){
	
				var code = data.resultCode;
				if(code == 'LOGIN_0000'){
					location.href = $("#prevPage").val();
						//"/home";
				}else{
					$(".alert.alert-danger").text(data.resultMsg);
					$(".alert.alert-danger").fadeIn(2000, function(){
						
					});
					
					$(".alert.alert-danger").fadeOut(2000, function(){						
						
					});
// 					$(".alert.alert-danger").text('');
					$("#passwd").focus();
					return;
				}
			},
			error : function(data){
	console.log('error');
			}
		});
	}
}
</script>
<div class="container">

	<div class="loginWrap">
	    <div class="loginArea">
		<form class="form-signin" id="loginForm" name="loginForm" method="post" role="form">
			
			<input type="hidden" id="prevPage" name="prevPage" value="${prevPage}"/>
			
			<h2 class="form-signin-heading"><tag:message code="signin"/></h2>
		
			<div class="form-group">
				<label for="userId" class="sr-only"><tag:message code="userid"/></label>
				<input type="text" class="form-control" id="userId" name="userId" placeholder="Input your user ID" required autofocus/>
			</div>
			<div class="form-group">
				<label for="passwd" class="sr-only"><tag:message code="passwd"/></label>
					<input type="password" class="form-control" id="passwd" name="passwd" placeholder="Input your password"/>
			</div>
			<div class="alert alert-danger"></div>
			
			<input type="button" class="btn btn-primary btn-lg btn-block" name="signinSubmit" value="<tag:message code="signin"/>">
			
			<div class="btn-group btn-group-justified" style="text-align: center; padding-top:20px;" role="group">
				<div title="Sign up" class="btn btn-default"><a href="/user/regist" ><tag:message code="signup"/></a></div>
				<div title="Go to home" class="btn btn-default"><a href="/share/main" ><tag:message code="common.home"/></a></div>
				<div title="Forgot password" class="btn btn-default"><a href="/user/forgotPassword" ><tag:message code="common.forgotpassword"/></a></div>
			</div>
			
		</form>
		</div>
	</div>	
</div>
