$(document).on("ready", function(){
	$("#cancelToCreate").on("click", function(){	
		if(confirm('작성을 취소하시겠습니까?')){
			goBoardCategoryList();
		}
	});
});

function goBoardCategoryList(){
	location.href =  "/config/board/categoryList";
} 

function goBoardCategoryCreate(){
	// 썸네일 파일 업로드 안할 때 저장
	$.ajax({
		url : '/config/board/insertBoardCategoryAction.json',
		type : 'post',
		data : $("#writeFrm").serialize(),
		dataType : 'json',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(data){
			if(data.result){
				goBoardCategoryList();
			}else{
				alert(data.validate);
			}
		},
		error : function(xhr, textStatus, thrownError){
//			console.log("error : " + xhr.status + ", " + textStatus + ", " + thrownError);
			return;
		}
	});
}

function goBoardCategoryModify(){
	// 썸네일 파일 업로드 안할 때 저장
	$.ajax({
		url : '/config/board/modifyBoardCategoryAction.json',
		type : 'post',
		data : $('#writeFrm').serialize(),
		dataType : 'json',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(data){
			if(data.result){
				goBoardCategoryList();
			}else{
				alert(data.validate);
			}
		},
		error : function(xhr, textStatus, thrownError){
//			console.log("error : " + xhr.status + ", " + textStatus + ", " + thrownError);
			return;
		}
	});
}