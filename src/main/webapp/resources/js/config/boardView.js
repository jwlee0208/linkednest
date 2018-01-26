$(document).on("ready", function(){
	$("#goToList").on("click", function(){
		goBoardList();
	});
	
	$("#previous").on("click", function(){
		var prevBoardId = $("#prevBoardId").val();
		goBoardView(prevBoardId);
	});
	$("#next").on("click", function(){
		var nextBoardId = $("#nextBoardId").val();
		goBoardView(nextBoardId);
	});
	
	$("#goToModify").on("click", function(){
		var frm = $("#viewFrm");
		frm.attr("action", "/config/board/modify");
		frm.attr("method", "get");
		frm.submit();		
	});
	
});

//게시글 조회
function goBoardView(boardId){
	
	$("#selectedBoardId").val(boardId);
	
	var frm = $("#viewFrm");
	frm.attr("action", "/config/board/view");
	frm.attr("method", "get");
	frm.submit();
}

function goBoardList(){	
	location.href = "/config/board/list/1/1";
}

function goBoardModify(boardId){
	
	$("#selectedBoardId").val(boardId);
	
	var frm = $("#viewFrm");
	frm.attr("action", "/config/board/modifyBoard");
	frm.attr("method", "post");
	frm.submit();		
}