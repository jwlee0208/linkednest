function goProfileList(profileType, catId){
	location.href="/profile/list/"+profileType+"/"+catId;
}

function goList(boardId){	
	var userId = $("#userId").val();
	var url = "/share"; 
	if(userId != null && userId != ''){
		url += "/" + userId;
	} 
	url += "/list/" + boardId;
	location.href = url;
}

function goHome(){
	location.href = "/home";
}

function goInfo(){
	var userId = $("#userId").val();
	var url = "/aboutUs";
	if(userId != null && userId != ''){
		url = "/share/" + userId + "/profile";
	} 

	location.href = url;
}

function goRegist(boardId){
	location.href = "/user/regist";
}

function goLogin(boardId){
	location.href = "/login";
}

function goTargetList(catId){
	location.href = "/list/" + catId;
}

function logout(){
	location.href = "/logout";
}

function goClub(menuId){
	
	baseUrl += "/" + menuId;
	location.href = baseUrl; 	
}

function goBoardConfig(){
	location.href = "/board/list/7";
}

function goConfig(){
	location.href = "/config/main";
}

$(function(){
	$("#totSearchText").keypress(function(event){
				
		if(event.which == 13){
			event.preventDefault();
			goTotSearch();
		}
	});
	
	$("#locale").on("change", function(){
		var selectedLocale = $(this).val();
		if(selectedLocale != ''){
			$.ajax({ 
				url 	 : '/ajaxChangeLocale/' + selectedLocale,
				dataType : 'json',
				type 	 : 'post',
				success  : function(data){
					if(data.code == 'ok'){
						location.reload();
					}
				},
				error 	 : function(){
					
				}
			});			
		}
	});
	
	$(".registProfile").click(function(){
		location.href = "/profile/regist/1/01010100";
	});
});

function goTotSearch(){
	var url 	= '/share';	
	var userId 	= $("#userId").val();
	
	if(userId != null && userId != ''){
		url += "/" + userId;
	}
	url += "/list";

	var frm = $("#totSearchFrm");
	frm.attr("action"	, url);
	frm.attr("method"	, "post");
	frm.submit();
}

function goShare(){
	location.href = "/share/main";
}

function goMyShare(userId){
	location.href = "/share/" + userId;
}

function goShareHome(userId){
	if(userId != null && userId != '' && userId != 'undefined'){
		goMyShare(userId);
	}else{
		if(confirm('로그인 하시겠습니까?')){
			location.href = "/login";
		}else{
			goShare();
		}
		
	}
}