
	function setChildCategory(){
		var catId = $("#parentCatId").val();
		$.ajax({
			url : '/player/childCategoryList.json',
			data : {parentCatId : catId},
			method : 'post',
			dateType : 'json',
			success : function(data){

				var childCatList = data.childCatList;
				var childCatListLength = childCatList.length;
				
				if(childCatListLength > 0){
					for(var i = 0 ; i < childCatListLength ; i++){
						$("#catId").append("<option value=\""+ childCatList[i].catId +"\">" + childCatList[i].categoryNameStr + "</option>");
					}
				}else{
					$("#catId option").remove();
					$("#catId").append("<option value=\"-1\">카테고리를 선택해 주세요.</option>");
				}

				$("#selectedCatId").val(catId);
				initAttrElement();
				$("#attrElemList").html('');
				ajaxPagination(1);
			}
		});	
	}

	function setAttrList(){
		var catId = $("#catId").val();
		searchAttrList(catId);
	}

	function searchAttrList(catId){
		initAttrElement();
		$.ajax({
			url 		: '/player/attrElementList.json',
			data 		: {catId : catId, searchText : $("#searchText").val()},
			method 		: 'post',
			dateType 	: 'json',
			success 	: function(data){

				if(data != null){
					var attrElementList = data.attrElementList;

					if(attrElementList != null){
						var attrElementListLength = attrElementList.length;
						var prevAttrId = 0;
						var innerHtml = "<div style=\"padding-top: 10px;padding-left: 10px;padding-bottom: 10px; background-color: #333; text-align: center; color: white; \" data-toggle=\"buttons\">Filtering Detail Information</div><div style=\"padding-top: 10px;padding-left: 10px;padding-bottom: 10px;\">";
						for(var i = 0 ; i < attrElementListLength ; i++){
							var attrId = attrElementList[i].attrId;

							if(prevAttrId == 0 || (prevAttrId != 0 && attrId > prevAttrId)){
								innerHtml += "<div id=\"" + attrId +"\" onclick=\"javascript:attrFilterList(" + attrId + ");\" style=\"font-weight:bold;\">" + attrElementList[i].attrNameStr;
								innerHtml += "<input type=\"hidden\" name=\"catAttrElemInfos["+i+"].attrId\" value="+attrId+"></div>";
							}
							
							var categoryAttrElemList = attrElementList[i].categoryAttrElemList;
							
							var categoryAttrElemListLength = categoryAttrElemList.length; 
							if(categoryAttrElemListLength > 0){
								for(var j = 0; j < categoryAttrElemListLength ; j++){
									var catAttrElemObj = categoryAttrElemList[j];
//									innerHtml += "<label class=\"checkbox-inline\"><input type=\"checkbox\" id=\"attrElem_" + catAttrElemObj.attrElemId +"\" " + " name=\"catAttrElemInfos[" + i + "].childCatAttrElemInfos[" + j + "].attrElemId\" class=\"attrElemChkBox\" value=\"" + catAttrElemObj.attrElemId + "\"/>" + catAttrElemObj.attrElemNameStr + "</label>";
									innerHtml += "<label class=\"btn btn-primary\" style=\"margin:5px 5px 5px 0px;\"><input type=\"checkbox\" id=\"attrElem_" + catAttrElemObj.attrElemId +"\" " + " name=\"catAttrElemInfos[" + i + "].childCatAttrElemInfos[" + j + "].attrElemId\" class=\"attrElemChkBox\" value=\"" + catAttrElemObj.attrElemId + "\" style=\"display:none;\"/>" + catAttrElemObj.attrElemNameStr + "</label>";
								}
							}

							prevAttrId = attrId;
						}
						innerHtml += "</div>";
						$("#attrElemList").html(innerHtml);
						// 각 체크박스에  onclick 이벤트 설정
						$(".attrElemChkBox").attr("onclick", "javascript:attrElemFilterList();");

						$("#selectedCatId").val(catId);

						ajaxPagination(1);
						
					}
				}
			}				
		});
	}
	function attrFilterList(attrId){
//		$("#selectedAttrId").val(attrId);
		ajaxPagination(1);
		
	} 
	
	function attrElemFilterList(){
		ajaxPagination(1);
	}
	
	function initAttrElement(){
		// 선택된 속성 항목을 초기화
		$("#selectedAttrElemId").val('');
	}

    function isEmpty(val){
        return (val == '' || val == null || val == 'undefined') ? true : false;
    }
