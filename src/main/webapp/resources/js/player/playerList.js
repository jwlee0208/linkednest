	$(document).on("ready", function() {
		$("input[name='goToRegist']").on("click", function() {
			location.href = "/profile/regist/" + $("#profileType").val() + "/" + $("#catId1").val();
		});

		$( "#searchText" ).keypress(function( event ) {
			  if ( event.which == 13 ) {
				  event.preventDefault();
				  goSearch();
			  }			  
		});		
	});

	// 페이지 이동
	function goPage(pageNo) {
		// 검색된 카테고리 영역 비활성화
		$("#cntPerCatList").html("");
		$("#cntPerCatList").hide();
		
		$("#pageNo").val(pageNo);
		
		$.ajax({
			async : false,
			type : 'POST',
			dataType : 'html',
			url : '/player/playerList',
			data : $("#listFrm").serialize(),
			processData : true,
			cache : false,
			success : function(data) {
				if (data != null && data != undefined) {
					var listDiv = $(data).find("#listDiv").html();
					var pageDiv = $(data).find("#pageDiv").html();
					var cntPerCatList = $(data).find("#cntPerCatList").html();
//console.log($(data).find("#cntPerCatList").html());
					$("#cntPerCatList").html(cntPerCatList);
					$("#listDiv").html(listDiv);
					$("#pageDiv").html(pageDiv);
					
					$("#cntPerCatList").show();
					
				}else{
					$("#cntPerCatList").html("");
					$("#listDiv").html("");
					$("#pageDiv").html("");
				
					$("#cntPerCatList").hide();
				}
			}
		});
	}

