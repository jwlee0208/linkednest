<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>

	<div class="card"></div>
	<input type="hidden" id="prevPage" name="prevPage" value="${prevPage}"/>
	
	<form id="actionFrm" name="actionFrm" method="post" class="form-horizontal" role="form">
		<h1 id="btn-groups" class="page-header">Bookmark&nbsp;&nbsp;<small>Add</small></h1>
		<input type="hidden" id="userId" name="userId" value="${userInfo.userId}"/>
		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">북마크 이름</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="bookmarkName" name="bookmarkName" style="ime-mode: active"/><span id="bookmarkNameErr" class="errorMsg" style="display: none;"></span>
			</div>
		</div>
		
		<div class="form-group">
			<label for="passwd" class="col-sm-2 control-label">북마크 URL</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="bookmarkUrl" name="bookmarkUrl"/><span id="bookmarkUrlErr" class="errorMsg" style="display: none;"></span>
			</div>
		</div>

		<div class="form-group">
			<label for="passwd" class="col-sm-2 control-label">북마크 설명</label>
			<div class="col-sm-10">
				<textarea class="form-control" id="bookmarkDescription" name="bookmarkDescription" style="height:200px;"></textarea><span id="bookmarkDescriptionErr" class="errorMsg" style="display: none;"></span>
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
				<input type="button" class="btn btn-primary pull-right" value="북마크 추가" id="addBookmarkBtn">
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

		$("#homeBtn").on("click", function(){
			history.go(-1);
		});

		$("#cancelBtn").on("click", function(){
			history.go(0);
		});
		
		$("#addBookmarkBtn").on("click", function(){
			var isValid = true; //$("form").valid();

			if(isValid){
				$.ajax({
					url 	 : '/share/bookmark/jwlee0208/add',
					data 	 : $("#actionFrm").serialize(),
					dataType : 'json',
					method 	 : 'post',
					success  : function(data){

						// ajax loading...
						loading();

						var status = data.status;
						var result = data.result;
						
						if(status == 'ADD_BOOKMARK_0000'){
							location.replace('/share/bookmark/' + $("#userId").val() + '/list');	//$("#prevPage").val();
						}else if(status == 'ADD_BOOKMARK_0001'){
							
							var length = result.length;
							if(result != null && length > 0){

								for(var i = 0 ; i < length ; i++){
									$("#" + result[i].field+"Err").html(result[i].defaultMessage);
									$("#" + result[i].field+"Err").show();
								}
							}
						}else{
							alert(result);
							return false;
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