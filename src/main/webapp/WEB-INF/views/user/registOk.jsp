<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag" %>
<div class="container">
	<div class="loginWrap" style="padding-top : 170px; padding-left : 200px; padding-right : 200px; ">
	    <div class="loginArea" style="min-height:400px;">
			<h1 id="btn-groups" class="page-header"><tag:message code="welcome.joinning"/></h1>
		
			<div class="form-group">
				<tag:message code="common.welcome"/>!!!
			</div>
			<div class="btn-group btn-group-justified">
				<div class="btn-group">
			      <input type="button" class="btn btn-primary" name="goToHome" value="<tag:message code="common.home"/>">
			    </div> 
			</div>
		</div>
	</div>	
</div>
<script>
	$(function(){
		$("input[name=goToHome]").click(function(){
			location.href = "/";
		});
	});
</script>
