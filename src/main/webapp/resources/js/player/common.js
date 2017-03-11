
	function setChildCategory(){
		var catId = $("#catId1").val();
		$("#cat2Div").load("/player/ajaxChildCategoryList", {parentCatId : catId, selectedCategoryId : -1}, function(){
			ajaxPagination(1);	
		});
	}

	function setAttrList(){
		var catId = $("#catId2").val();
		searchAttrList(catId);
	}

	function searchAttrList(catId){
		initAttrElement();
		$("#cntPerCatList").load("/player/ajaxAttrElementList", {catId : catId, searchText : $("#searchText").val()}, function(){
			ajaxPagination(1);
		});
	}
	function attrFilterList(attrId){
		$("#selectedAttrId").val(attrId);
//		goPage(1);
	} 
	
	function attrElemFilterList(){
		var attrElemIds = "";
		
		$.each($(".attrElemChkBox"), function(index, value){

			if($(this).is(":checked")){
				attrElemIds += $(this).val();
				attrElemIds += ",";	
			}	
			
		});
		if(attrElemIds != ""){
			attrElemIds += "end";
		}
		
		attrElemIds = attrElemIds.replace(/,end/g,"");

		$("#selectedAttrElemId").val(attrElemIds);
				
		goPage(1);

	}
	
	function initAttrElement(){
		// 선택된 속성 항목을 초기화
		$("#selectedAttrElemId").val('');
	}

	$(function(){
		$("#registPlayer").click(function(){
			location.href = "/profile/regist/1/01010100";	
		});			
	});
