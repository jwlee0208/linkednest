	$(document).on("ready", function() {
		$( "#searchText" ).keypress(function( event ) {
			  if ( event.which == 13 ) {
				  event.preventDefault();
				  goSearch();
			  }			  
		});
	});



	// 페이지 이동
	function goPage(pageNo) {
		$("#pageNo").val(pageNo);
		
		$.ajax({
			async : false,
			type : 'POST',
			dataType : 'html',
			url : '/player/attrElemMapList',
			data : $("#listFrm").serialize(),
			processData : true,
			cache : false,
			success : function(data) {

				if (data != null && data != undefined) {
					var listDiv = $(data).find("#listDiv").html();
					var pageDiv = $(data).find("#pageDiv").html();

					$("#listDiv").html(listDiv);
					$("#pageDiv").html(pageDiv);
				}else{
					$("#listDiv").html("");
					$("#pageDiv").html("");
				}
			}
		});
	}
