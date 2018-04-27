<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container_fluid" style="min-height: 500px;">
	<div class="panel panel-default" style="margin-top: 100px;">
		<div class="panel-heading">
			<h3 class="panel-title">Forgot Password</h3>
		</div>
		<div class="panel-body" style="min-height: 200px;vertical-align: middle;margin-top:70px;">
			<p>E-mail</p>
			<input type="email" class="form-control" id="email" name="email"/>
		</div>
		<div class="panel-footer">
			<a href="javascript:;" class="btn btn-default right" id="resetPw">submit</a>
		</div>
	</div>
</div>
<script>
$(function(){
	$("#resetPw").click(function(){
		var email = $("#email").val();
		if(email != null && email != ''){
			$.ajax({
				url 		: '/user/sendForgotPwMail',
				data 		: {email : $("#email").val()},
				dataType 	: 'json',
				type		: 'post',
				success		: function(data){
					alert(data.message);
					return false;
				} 
			});

		}
	});
});
</script>