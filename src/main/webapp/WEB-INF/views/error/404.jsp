<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-validate.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>

<!-- bootstrap -->
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-theme.min.css">
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="page-header">
			  <h1>404 Page Not Found</h1>
			  
			</div>
		</div>
		<h1 style="text-align:center;"><small>페이지를 찾을 수 없습니다.</small></h1>
		<div class="well well-lg">
			<h4>하지만</h4>
			<br/>
			<h4><a href="javascript:history.go(-1);">이전으로 돌아가거나</a></h4>
			<br/>
			<h4><a href="/">처음부터 다시 시작</a>할 수 있습니다.</h4>
			<br/>
			<h4>무엇을 선택하든 실패는 아닐 것입니다.</h4>
		</div>
	</div>
</body>
</html>