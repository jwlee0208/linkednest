$(document).on("ready", function(){
	$("#cancelToCreate").on("click", function(){	
		if(confirm('작성을 취소하시겠습니까?')){
			goBoardList();
		}
	});
});

$(function(){
	   
//	   $("#saveToCreate").on("click",function(){
//
//				// 썸네일 파일 업로드 안할 때 저장
//				$.ajax({
//					url : '/board/insertBoardAction.json',
//					type : 'post',
//					data : $("#writeFrm").serialize(),
//					dataType : 'json',
//					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
//					success : function(data){
//						console.log("data : " + data.result + ", data" + data);
//						if(data.result){
//							goBoardList();
//						}else{
//							alert(data.validate);
//						}
//					},
//					error : function(xhr, textStatus, thrownError){
//						console.log("error : " + xhr.status + ", " + textStatus + ", " + thrownError);
//						return;
//					}
//				});
//				
//		});	   
//	
//	   $("#saveToModify").on("click",function(){
//
//			// 썸네일 파일 업로드 안할 때 저장
//			$.ajax({
//				url : '/board/modifyBoardAction.json',
//				type : 'post',
//				data : $("#writeFrm").serialize(),
//				dataType : 'json',
//				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
//				success : function(data){
//					console.log("data : " + data.result + ", data" + data);
//					if(data.result){
//						goBoardList();
//					}else{
//						alert(data.validate);
//					}
//				},
//				error : function(xhr, textStatus, thrownError){
//					console.log("error : " + xhr.status + ", " + textStatus + ", " + thrownError);
//					return;
//				}
//			});
//			
//	});	 	
});


function goBoardList(){
	location.href =  "/config/board/list";
} 

function goBoardCreate(){
	// 썸네일 파일 업로드 안할 때 저장
	$.ajax({
		url : '/config/board/insertBoardAction.json',
		type : 'post',
		data : $("#writeFrm").serialize(),
		dataType : 'json',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
//		contentType: "application/json; charset=UTF-8",
		success : function(data){
//			console.log("data : " + data.result + ", data" + data);
			if(data.result){
				goBoardList();
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

function goBoardModify(){
	// 썸네일 파일 업로드 안할 때 저장
	$.ajax({
		url : '/config/board/modifyBoardAction.json',
		type : 'post',
		data : $('#writeFrm').serialize(),
		dataType : 'json',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(data){
//			console.log("data : " + data.result + ", data" + data);
			if(data.result){
				goBoardList();
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