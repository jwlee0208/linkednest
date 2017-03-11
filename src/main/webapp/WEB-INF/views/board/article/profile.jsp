<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

		<h1 id="btn-groups" class="page-header">Profile</h1>		
		<ol class="breadcrumb">
		  <li><a href="#" onclick="javascript:goHome();">Home</a></li>
		  <li><a>Profile</a></li>
		</ol>		
		<div class="container-fluid" style="min-height: 500px;">
		${shareInfo.introduce}
		</div>
				
		
<script>
$(document).on("ready", function(){
	
});
</script>	  	  