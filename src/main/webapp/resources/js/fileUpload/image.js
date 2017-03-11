//ajax error check
$(document).ajaxError(function(event, request){
   if(request.status==500)
      alert("파일 업로드를 실패하였습니다. \n업로드할 파일을 확인하세요.(파일 최대용량: 20MB)");
   	  return;
   }
);

//파일전송 후 콜백 함수
function FileuploadCallback(data, state){
	
//	console.log('data : ' + data + ", state : " + state);
	
   if (data=="error"){
      alert("파일전송중 에러 발생!!");
      return false;
   } else if (data == "fileSizeError") {
	  alert("파일용량은 20MB 이하 이어야 합니다.");
	  return false;
   } else if (data == "fileExtensionError") {
	   alert("이미지 파일을 업로드 하셔야 합니다.\n(업로드 가능한 확장자: jpg, jpeg, gif, png, bmp)");
	   return false;
   }
   
   alert("업로드 되었습니다.");
   var dataList = "<div id=\"imageUpload\">";
   var hostname = "jwlee0208.cdn3.cafe24.com";	//location.host;

   dataList += "<img src='http://" + hostname + data + "' alt='' class=\"img-thumbnail\"/>";
   dataList += "</div>";
   $('#imageUploadList').empty();
   $('#imageUploadList').append(dataList);

   var btn_footerList = ""; // "<footer class=\"footer btn_bx border0\">";
   btn_footerList += "<div class=\"btn-group\"><button type=\"button\" class=\"btn  btn-default btn-lg\" onclick='deleteImg(\"" + data + "\")'>삭제</button></div>";
   btn_footerList += "<div class=\"btn-group\"><button type=\"button\" class=\"btn  btn-default btn-lg\" onclick='imgSelect(\"" + data + "\")'>사용</button></div>";
   btn_footerList += "<div class=\"btn-group\"><button type=\"button\" class=\"btn  btn-default btn-lg\" onclick='window.close()'>닫기</button></div>";
//   btn_footerList += "</footer>";
   
   $('#btn_footerList').empty();
   $('#btn_footerList').append(btn_footerList);
   $('#btn_footerList').show();
}

$(function(){
   //비동기 파일 전송
   var frm=$('#imageForm'); 
   frm.ajaxForm(FileuploadCallback); 
   frm.submit(function(){
	   return false;
   }); 
});

// 파일업로드 이벤트
function fileUpload(){
	var imageFile = $.trim($("#imageFile").val());
   if(!imageFile){
      alert("파일을 선택하세요.");
      $("#imageFile").focus();
      return;
   }
 
   //파일전송
   var frm = $('#imageForm'); 
   frm.attr("action","imageuploadaction");
   frm.submit(); 
}

function imgSelect(fileName, filePath) {
	opener.editorImgUploadComplete(fileName);
}

function deleteImg(fileName) {
	$.ajax({
		type:'POST',
		dataType:'html',
		data : {
			"fileName":fileName
		},
		url:'imagedeleteaction',
		success:function(data) {
			if (data == "success") {
				alert('이미지가 삭제되었습니다.');
				//var dataList = ""; 
				$('#imageUploadList').empty();	
				$("#imageFile").val('');
				$('#btn_footerList').empty();
				/*
				for (var i=0; i < data.fileList.length; i++) {
					dataList += "<li id=\"imageUpload\">";
					dataList += "<img src='" + getContextPath() + data.fileList[i] + "' alt='' />";
					dataList += "<a href='#' class='btn2' onclick='imgSelect(\"" + data.fileList[i] + "\")'>사용</a> ";
					dataList += "<a href='#' class='btn2' onclick='deleteImg(\"" + data.fileList[i] + "\")'>삭제</a>";
					dataList += "</li>";
				}						
				$('#imageUploadList').append(dataList);
				*/
			}
		},
		error:function() {
		  alert("이미지 삭제에 실패하였습니다.");
		  return false;
		}
	});
	return false;
}

function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}