$(document).on("ready", function(){
	$("#cancelToWrite").on("click", function(){	
		if(confirm('작성을 취소하시겠습니까?')){
			goList();
		}
	});
	
	var className = ($(".thumbImg").hasClass("unset")) ? "unset" : "set";
	
	toggleThumbImage(className);
});

//ajax error check
$(document).ajaxError(function(event, request){
   if(request.status==500)
      alert("등록에 실패하였습니다. \n업로드할 파일을 확인하세요.(파일 최대용량: 20MB)");
   	  return;
   }
);

//파일전송 후 콜백 함수
function FileuploadCallback(data, state){
   if (data=="error"){
      alert("파일전송중 에러 발생!!");
      return false;
   } else if (data == "fileSizeError") {
	  alert("파일용량은 20MB 이하 이어야 합니다.");
	  return false;
   } else if (data == "fileExtensionError") {
	   alert("이미지 파일을 업로드 하셔야 합니다.\n(업로드 가능한 확장자: jpg, jpeg, gif, png, bmp)");
	   return false;
   } else if (data == "fileWidthHeightError") {
	   alert("업로드 가능한 이미지 사이즈는 314 * 166 입니다.");
	   return false;
   }
   alert("정상적으로 등록 되었습니다.");
   // 정상 등록 후 목록 화면으로 이동.
   //goList();
   goView();

}

$(function(){
	   //비동기 파일 전송
//	   var frm = $("#writeFrm");
//	   frm.ajaxForm(FileuploadCallback); 
//	   frm.submit(function(){
//		   return false;
//	   }); 
	   
	   $("#saveToWrite").on("click",function(){
			// 에디터 입력 내용 hidden tag에 setting
			var content = tinyMCE.get('content').getContent();
			$("#content").val(content);
			
			var thumbImg = $.trim($("#thumbImg").val());

			if(thumbImg.length == 0){
				// 썸네일 파일 업로드 안할 때 저장
				$.ajax({
					url 		: '/share/insertBoardArticle.json', // '/board/article/insertBoardArticle.json',
					type 		: 'post',
					data 		: $("#writeFrm").serialize(),
					dataType 	: 'json',
					contentType	: "application/x-www-form-urlencoded; charset=UTF-8",
					beforeSend 	: function(){
						$(".pull-right").attr("id","loading");
						$(".pull-right").val("Processing..."); 
				
					},
					success 	: function(data){
						if(data.result){
//							goList();
							goView();
						}else{
							alert(data.validate);
						}
					},
					error : function(xhr, textStatus, thrownError){
						console.log("error : " + xhr.status + ", " + textStatus + ", " + thrownError);
					}
				});
				
			}else{
				// 썸네일 파일 업로드 할 때 저장
				var frm = $("#writeFrm");
				frm.attr("action", '/share/insertBoardArticle'); // '/board/article/insertBoardArticle'
				frm.attr("method", "post");
				frm.ajaxForm(FileuploadCallback); 
				frm.submit();
//				frm.submit(function(e){
//					alert(e);
//					$(".pull-right").attr("id","loading");
//					$(".pull-right").val("Processing...");
//					e.preventDefault();
//				}); 
			}
		});	   
	   
	   $("#saveToModify").on("click",function(){
			// 에디터 입력 내용 hidden tag에 setting
			var content = tinyMCE.get('content').getContent();
			$("#content").val(content);
			
			var thumbImg = $.trim($("#thumbImg").val());

			if(thumbImg.length == 0){
				// 썸네일 파일 업로드 안할 때 저장
				$.ajax({
					url 		: '/share/modifyBoardArticle.json', // '/board/article/modifyBoardArticle.json',
					type 		: 'post',
					data 		: $("#writeFrm").serialize(),
					dataType 	: 'json',
					contentType	: "application/x-www-form-urlencoded; charset=UTF-8",
					beforeSend 	: function(){
						$(".pull-right").attr("id","loading");
						$(".pull-right").val("Processing..."); 
				
					},
					success 	: function(data){
//						console.log("data : " + data.result);
						if(data.result){
							goView();
						}else{
							alert(data.validate);
						}
					},
					error : function(xhr, textStatus, thrownError){
//						console.log("error : " + xhr.status + ", " + textStatus + ", " + thrownError);
					}
				});
				
			}else{
				// 썸네일 파일 업로드 할 때 저장
				var frm = $("#writeFrm");
				frm.attr("action", '/share/modifyBoardArticle');	// '/board/article/modifyBoardArticle'
				frm.attr("method", "post");
				frm.ajaxForm(FileuploadCallback); 
//				frm.beforeSubmit(function(){
//					$(".pull-right").attr("id","loading");
//					$(".pull-right").val("Processing...");
//				});
				frm.submit(); 
			}
		});	   	   
	   
});


function goList(){
	var boardId = $("#writeFrm #boardId").val();
	var url 	= "/share"; // "/board/article/list/" + boardId;
	var userId 	= $("#userId").val();
	if(userId != null && userId != ''){
		url 	+= "/" + userId;
	}
	url 	+= "/list/" + boardId;
	location.href =  url;
} 

function goView(){
	var boardId = $("#writeFrm #boardId").val();
	var articleId = $("#writeFrm #articleId").val();
	var url 	= "/share";
	var userId 	= $("#userId").val();
	if(userId != null && userId != ''){
		url 	+= "/" + userId;
	}
	if(articleId > 0){
		url 	+= "/view/" + articleId;	
	}else{
		url 	+= "/list/" + boardId; 
	}
	
	location.href =  url;
} 

function toggleThumbImage(className){
	
	$(".thumbImg").hide();
	
	$("." + className).show();
	
}

function delThumbImage(){
	$(".unset").remove();
	toggleThumbImage("set");
	
}