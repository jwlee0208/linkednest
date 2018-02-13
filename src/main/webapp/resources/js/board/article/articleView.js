var frm = $("#viewFrm");

$(function(){
	/**
	 * 게시글 목록으로 이동
	 */
	$("#goToList").on("click", function(){
		goList($("#viewFrm #boardId").val());
	});
	/**
	 * 이전 글 조회
	 */
	$("#previous").on("click", function(){
		var prevArticleId = $("#prevArticleId").val();
		goView(prevArticleId);
	});
	/**
	 * 다음 글 조회
	 */
	$("#next").on("click", function(){
		var nextArticleId = $("#nextArticleId").val();
		goView(nextArticleId);
	});
	/**
	 * 게시글 수정
	 */
	$("#goToModify").on("click", function(){
		var userId 	= $("#viewFrm #userId").val();
		
		var url = "/share/";
		if(userId != null && userId != ''){
			url += userId +"/";
		}
		url += "modify/";
//		else{
//			url += "/board/article/modify/";
//		}
		url += $("#selectedArticleId").val() +"/" + $("#viewFrm #boardId").val();
		location.href = url;
	});
	/**
	 * 게시글 삭제
	 */
	$("#goToDelete").on("click", function(){
		var userId 	= $("#userId").val();
		var url = "/share";
		if(userId != null && userId != ''){
			url += "/deleteBoardArticle/";
		}
//		else{
//			url += "/board/article/deleteBoardArticle/";
//		}
		
		var result = confirm('진짜 삭제하시겠습니까?');
		if(result){
			$.ajax({
				url 		: url + $("#selectedArticleId").val(),
				type 		: 'post',
				dataType 	: 'json',
				success 	: function(data){
					if(data.result){
						goList($("#viewFrm #boardId").val());
					}else{
						alert('삭제되지 않았습니다.');
					}
				},
				error : function(xhr, textStatus, thrownError){
					/*console.log("error : " + xhr.status + ", " + textStatus + ", " + thrownError);*/
				}
			});			
		}
	});	
});

//게시글 조회
function goView(articleId){
	var userId 	= $("#userId").val();
	var url = "/share/";
	if(userId != null && userId != ''){
		url += userId + "/";
	}
//	else{
//		url += "/board/article/view/";
//	}	
	url += "view/";
	location.href = url + articleId;	
}