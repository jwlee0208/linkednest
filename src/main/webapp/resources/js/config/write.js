$(document).on("ready", function(){
	$("#cancelToWrite").on("click", function(){	
		if(confirm('작성을 취소하시겠습니까?')){
			location.href = "/config/main";
		}
	});	
});

$(function(){
	   
	   $("#saveToWrite").on("click",function(){
		   var url = '/config/priv/insertShareProfileAction';
		   ajaxCall(url);
		});	   
	   
	   $("#saveToModify").on("click",function(){
		   var url = '/config/priv/modifyShareProfileAction';
		   ajaxCall(url);
		});	   	   
	   
});

function ajaxCall(callUrl){
	// 에디터 입력 내용 hidden tag에 setting
	var introduce = tinyMCE.get('introduce').getContent();
	$("#introduce").val(introduce);
	
	// 썸네일 파일 업로드 안할 때 저장
	$.ajax({
		url 		: callUrl,
		type 		: 'post',
		data 		: $("#writeFrm").serialize(),
		dataType 	: 'json',
		contentType	: "application/x-www-form-urlencoded; charset=UTF-8",
		beforeSend 	: function(){
			$(".pull-right").attr("id","loading");
			$(".pull-right").val("Processing..."); 				
		},
		success 	: function(data){

			if(data.code == 'ok'){
				location.href = "/config/main";
			}else{
				alert(data.message);
				return false;
			}
		},
		error : function(xhr, textStatus, thrownError){
//			console.log("error : " + xhr.status + ", " + textStatus + ", " + thrownError);
		}
	});
}