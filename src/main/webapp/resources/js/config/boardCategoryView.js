$(document).on("ready", function(){
	$("#goToList").on("click", function(){
		goBoardCategoryList();
	});
	
	$("#previous").on("click", function(){
		var prevBoardId = $("#prevBoardCategoryId").val();
		goBoardCategoryView(prevBoardId);
	});
	$("#next").on("click", function(){
		var nextBoardId = $("#nextBoardCategoryId").val();
		goBoardCategoryView(nextBoardId);
	});
	
	$("#goToModify").on("click", function(){
		var frm = $("#viewFrm");
		frm.attr("action", "/config/board/modifyCategory");
		frm.attr("method", "get");
		frm.submit();		
	});
	
});

//게시글 조회
function goBoardCategoryView(boardCategoryId){
	
	$("#selectedBoardCategoryId").val(boardCategoryId);
	
	var frm = $("#viewFrm");
	frm.attr("action", "/config/board/viewCategory");
	frm.attr("method", "get");
	frm.submit();
}

function goBoardCategoryList(){	
	location.href = "/config/board/categoryList";
}

function goBoardCategoryModify(boardCategoryId){
	
	$("#selectedBoardCategoryId").val(boardCategoryId);
	
	var frm = $("#viewFrm");
	frm.attr("action", "/config/board/modifyBoardCategory");
	frm.attr("method", "post");
	frm.submit();		
}