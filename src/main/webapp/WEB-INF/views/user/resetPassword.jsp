<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag" %>
<div class="container_fluid" style="min-height: 500px;">
	<div class="panel panel-default" style="margin-top: 100px;">
		<div class="panel-heading">
			<h3 class="panel-title">reset password</h3>
		</div>
		<div class="panel-body" style="min-height: 200px;vertical-align: middle;margin-top:70px;">
			<form id="actionFrm" name="actionFrm" method="post">
				<input type="hidden" id="email" name="email" value="${email}"/>
				<div class="form-group">
					<label for="passwd" class="col-sm-2 control-label"><tag:message code="common.password"/></label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="passwd" name="passwd" minlength="8" maxlength="15"/><span id="passwdErr" class="errorMsg" style="display: none;"></span>
					</div>
				</div>
				<div class="form-group">
					&nbsp;
				</div>
				<div class="form-group">
					<label for="passwdChk" class="col-sm-2 control-label"><tag:message code="common.passwordchk"/></label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="passwdChk" name="passwdChk" minlength="8" maxlength="15"/><span id="passwdChkErr" class="errorMsg" style="display: none;"></span>
					</div>
				</div>
			</form>
		</div>
		<div class="panel-footer">
			<a href="javascript:;" class="btn btn-default right" id="savePw">submit</a>
		</div>
	</div>
</div>
<script>
$(function(){
	$("#savePw").click(function(){

		$.ajax({
//				url : '/user/regist.json',
			url 	 : '/user/resetPasswordAction',
			data 	 : $("#actionFrm").serialize(),
			dataType : 'json',
			method 	 : 'post',
			success  : function(data){

				// ajax loading...
				loading();

				var status = data.status;
				var result = data.result;

				if(status == 'UPDATE_PW_0000'){
					location.replace('/login');	//$("#prevPage").val();
				}else if(status == 'UPDATE_PW_0001'){
					
					var length = result.length;
					if(result != null && length > 0){

						for(var i = 0 ; i < length ; i++){
							$("#" + result[i].field+"Err").html(result[i].defaultMessage);
							$("#" + result[i].field+"Err").show();
						}
					}
				}else{
					alert(result);
					$("#userId").focus();
					return false;
				}
				
			},
			error : function(data){

			}
		});

		
// 		var email = $("#email").val();
// 		if(email != null && email != ''){
// 			$.ajax({
// 				url 		: '/user/resetPasswordAction',
// 				data 		: {email : $("#email").val()},
// 				dataType 	: 'json',
// 				type		: 'post',
// 				success		: function(data){
// 					alert(data.message);
// 					return false;
// 				} 
// 			});

// 		}
	});

	function loading(){
	    $(document).ajaxStart(function(){
	        $("#savePw").attr("id", "loading");
	        $("#savePw").val("Processing...");
	    });
	    $(document).ajaxStop(function(){
	    	$("#savePw").attr("id", "registBtn");
	        $("#savePw").attr("value", "Create an account");
	    });	
	}
		
});
</script>