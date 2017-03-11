	$(document).on("ready", function() {
		$("input[name='goToRegist']").on("click", function() {
			location.href = "/player/write";
		});
		
		setChildCategory();
		
		loadPlayerList();
		
	});
	
	function loadPlayerList(){
		var searchText = $("#searchTextStr").val();
		var encodedText = Base64.encode(searchText);
		$("#searchText").val(encodedText);
		
		var frm = $("#listFrm").serialize();
		$("#listDiv").load("/player/ajaxPlayerList", frm, function(data){
//			alert(data);
		});	
	}

	/**
	 * Grid optional search 
	 * 검색을 필드로 구현할 시 필드 data를 Array Object 로 처리
	 */
	var postArray = function (obj){
	    var paramArray = {};
	    jQuery.each(obj, function(i, obj){
	        if(obj.name != undefined && obj.name !=""){
	            if(obj.type=="checkbox"){
	                if(obj.checked){
	                    if(paramArray[obj.name]==undefined){
	                        paramArray[obj.name] = obj.value;
	                    }else{
	                        paramArray[obj.name] = paramArray[obj.name] + "," + obj.value;
	                    }
	                }else{
	                    paramArray[obj.name] = "";
	                }
	            }else{
	                paramArray[obj.name] = obj.value;
	            }
	        }
	     });
	    return paramArray;
	};

	$(function() {

	    var availableTags = [
	      "ActionScript",
	      "AppleScript",
	      "Asp",
	      "BASIC",
	      "C",
	      "C++",
	      "Clojure",
	      "COBOL",
	      "ColdFusion",
	      "Erlang",
	      "Fortran",
	      "Groovy",
	      "Haskell",
	      "Java",
	      "JavaScript",
	      "Lisp",
	      "Perl",
	      "PHP",
	      "Python",
	      "Ruby",
	      "Scala",
	      "Scheme"
	    ];

	    $( "#searchTextStr" ).autocomplete({
			source : function(request, response){
				$("#searchText").val($("#searchTextStr").val());
				$.ajax({
					url 		: '/player/autoComplete.json',
					data 		: $("#listFrm").serialize(),
					dataType 	: 'json',
					method 		: 'post',
					success 	: function (data) {
						var searchResult = data.searchResult;
						response(searchResult);
					}
				});
			}
	    }).data("ui-autocomplete")._renderItem = function(ul, item) {
			var $a = $("<a></a>").text(item.label);
			highlightText(this.term, $a);
			return $("<li></li>").append($a).appendTo(ul);
		};

		$("#searchTextStr").keypress(function( event ) {
			  if ( event.which == 13 ) {
				  event.preventDefault();
				  loadPlayerList();
			  }			  
		});		

		$("input[name='goToRegist']").on("click", function() {	
			location.href = "/player/write";
		});
		
	});
	  
	  
	// autoComplete highlight 
	// REf.] http://salman-w.blogspot.kr/2013/12/jquery-ui-autocomplete-examples.html?m=1#example-2
	function highlightText(text, $node) {
		var searchText = $.trim(text).toLowerCase(), currentNode = $node.get(0).firstChild, matchIndex, newTextNode, newSpanNode;
		while ((matchIndex = currentNode.data.toLowerCase().indexOf(searchText)) >= 0) {
			newTextNode = currentNode.splitText(matchIndex);
			currentNode = newTextNode.splitText(searchText.length);
			newSpanNode = document.createElement("span");
			newSpanNode.className = "highlight";
			currentNode.parentNode.insertBefore(newSpanNode, currentNode);
			newSpanNode.appendChild(newTextNode);
		}
	}

	function goDetail(userId){
		
		var frm = $("#listFrm");
		frm.attr("action", "/player/playerDetailView/" + userId);
		frm.attr("method", "post");
		frm.submit();
	}

	//리스트 페이징을 위한 메서드
	function ajaxPagination(page){
	    var newPage = isEmpty(page) ? "1" : page;
	    $("input[name=page]").val(newPage);

	    loadPlayerList();
	}    

	function isEmpty(val){
		var result = false;
		
		if(val == 'undefined' || val == null || val ==''){
			result = true;
		}
		return result;
	}


	var Base64 = {

		    _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",


		    encode: function(input) {
		        var output = "";
		        var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
		        var i = 0;

		        input = Base64._utf8_encode(input);

		        while (i < input.length) {

		            chr1 = input.charCodeAt(i++);
		            chr2 = input.charCodeAt(i++);
		            chr3 = input.charCodeAt(i++);

		            enc1 = chr1 >> 2;
		            enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
		            enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
		            enc4 = chr3 & 63;

		            if (isNaN(chr2)) {
		                enc3 = enc4 = 64;
		            } else if (isNaN(chr3)) {
		                enc4 = 64;
		            }

		            output = output + this._keyStr.charAt(enc1) + this._keyStr.charAt(enc2) + this._keyStr.charAt(enc3) + this._keyStr.charAt(enc4);

		        }

		        return output;
		    },


		    decode: function(input) {
		        var output = "";
		        var chr1, chr2, chr3;
		        var enc1, enc2, enc3, enc4;
		        var i = 0;

		        input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");

		        while (i < input.length) {

		            enc1 = this._keyStr.indexOf(input.charAt(i++));
		            enc2 = this._keyStr.indexOf(input.charAt(i++));
		            enc3 = this._keyStr.indexOf(input.charAt(i++));
		            enc4 = this._keyStr.indexOf(input.charAt(i++));

		            chr1 = (enc1 << 2) | (enc2 >> 4);
		            chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
		            chr3 = ((enc3 & 3) << 6) | enc4;

		            output = output + String.fromCharCode(chr1);

		            if (enc3 != 64) {
		                output = output + String.fromCharCode(chr2);
		            }
		            if (enc4 != 64) {
		                output = output + String.fromCharCode(chr3);
		            }

		        }

		        output = Base64._utf8_decode(output);

		        return output;

		    },

		    _utf8_encode: function(string) {
		        string = string.replace(/\r\n/g, "\n");
		        var utftext = "";

		        for (var n = 0; n < string.length; n++) {

		            var c = string.charCodeAt(n);

		            if (c < 128) {
		                utftext += String.fromCharCode(c);
		            }
		            else if ((c > 127) && (c < 2048)) {
		                utftext += String.fromCharCode((c >> 6) | 192);
		                utftext += String.fromCharCode((c & 63) | 128);
		            }
		            else {
		                utftext += String.fromCharCode((c >> 12) | 224);
		                utftext += String.fromCharCode(((c >> 6) & 63) | 128);
		                utftext += String.fromCharCode((c & 63) | 128);
		            }

		        }

		        return utftext;
		    },

		    _utf8_decode: function(utftext) {
		        var string = "";
		        var i = 0;
		        var c = c1 = c2 = 0;

		        while (i < utftext.length) {

		            c = utftext.charCodeAt(i);

		            if (c < 128) {
		                string += String.fromCharCode(c);
		                i++;
		            }
		            else if ((c > 191) && (c < 224)) {
		                c2 = utftext.charCodeAt(i + 1);
		                string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
		                i += 2;
		            }
		            else {
		                c2 = utftext.charCodeAt(i + 1);
		                c3 = utftext.charCodeAt(i + 2);
		                string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
		                i += 3;
		            }

		        }

		        return string;
		    }

		}