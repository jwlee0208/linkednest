// TinyMCE 사용을 위한 설정 정의
tinyMCE.init({
	 selector				 : ".tinymce",	//"textarea",
//	 skin					 : 'lightgray',
	 theme					 : 'modern',
     plugins				 : [
             "advlist autolink link lists charmap print preview hr pagebreak spellchecker",
             "searchreplace wordcount codemirror insertdatetime media nonbreaking",
             "table contextmenu directionality textcolor paste textcolor image"
     ],
//     toolbar1				 : "newdocument | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | fontselect fontsizeselect | cut copy paste | bullist numlist | link unlink | inserttime | table | hr | charmap | image media | youTube imagepop | code | imagepop2",
//     toolbar2				 : "youTube imagepop ", 
     toolbar1				 : "bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | fontselect fontsizeselect | link unlink" ,
     toolbar2				 : "hr | charmap | bullist numlist outdent indent | image media imagepop | code | imagepop2",
     menubar				 : true,
     resize 				 : true,
     height 				 : 300,
     toolbar_items_size		 : 'small',
     theme_advanced_path	 : false,
     theme_advanced_buttons1 : "code",
     entity_encoding 		 : "raw",
     remove_script_host 	 : false,
     convert_urls 			 : false,
     theme_advanced_fonts 	 : "굴림=굴림;굴림체=굴림체;궁서=궁서;궁서체=궁서체;돋움=돋움;돋움체=돋움체;바탕=바탕;바탕체=바탕체;Arial=Arial; Comic Sans MS='Comic Sans MS';Courier New='Courier New';Tahoma=Tahoma;Times New Roman='Times New Roman';Verdana=Verdana",
     statusbar 				 : false,
     extended_valid_elements : "iframe[src|width|height|name|align]",
     image_advtab			 : true,	//이미지 삽입시 고급설정 가능 하도록.
     forced_root_block 		 : false,	//IE에서 한글입력 문제 해결을 위해
//     style_formats			 : [
//             {title: 'Bold text'	, inline: 'b'},
//             {title: 'Red text'		, inline: 'span', styles: {color: '#ff0000'}},
//             {title: 'Red header'	, block: 'h1'	, styles: {color: '#ff0000'}},
//             {title: 'Example 1'	, inline: 'span', classes: 'example1'},
//             {title: 'Example 2'	, inline: 'span', classes: 'example2'},
//             {title: 'Table styles'},
//             {title: 'Table row 1'	, selector: 'tr', classes: 'tablerow1'}
//     ],
     
     templates				 : [
             {title: 'Test template 1', content: 'Test 1'},
             {title: 'Test template 2', content: 'Test 2'}
     ],
     language				 : "ko_KR", // 사용할 언어는 한국어로 지정
   
     // Replace values for the template plugin
     template_replace_values : {
    	 username 	: "Some User",
    	 staffid 	: "991234"
     },
     codemirror				 : {
	    indentOnInit: true, // Whether or not to indent code on init.
	    path: 'codemirror-4.8', // Path to CodeMirror distribution
	    config: {           // CodeMirror config object
	       //mode: 'application/x-httpd-php',
	       mode				: "htmlmixed",
	       lineNumbers		: true,
	       lineWrapping 	: true,
	       smartIndent 		: true,
	       firstLineNumber 	: 1,
	       enterMode 		: "flat",
	       autofocus 		: true,
	       foldGutter		: true,
	       gutters			: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"],
	       extraKeys		: {"Ctrl-Q": function(cm){ cm.foldCode(cm.getCursor()); }},
	       //killLine : true
	    },
	    jsFiles				 : [// Additional JS files to load
	       'mode/clike/clike.js',
	       'mode/php/php.js'
	    ],
	    cssFiles			 : [
	               'theme/neat.css',
	               'theme/elegant.css'
	    ]
	  },   
	   /*
	   에디터 파일업로드 이미지및 스크립트 설정 
	   위에서 설명한 에디터 아이콘명 추가. 사용할 아이콘명 아이콘 이미지 경로 클릭시 호출된 함수를 작성한다.
	   */
	   setup 				 : function(tinyMCE) {
	         tinyMCE.addButton('imagepop', {
	            title 	: 'Image Upload', 
	            image 	:  '/img/editor_icon_file.png',
	            onclick : function() {
	               cmdImgUploadPop();
	            }
	         });
	         
	         tinyMCE.addButton('imagepop2', {
		            title 	: 'Image Selector', 
		            image 	:  '/img/editor_icon_file.png',
		            onclick : function() {
		               cmdImgSelectorPop();
		            }
		     });
	   },
	   init_instance_callback : function() { 
		  contentsMakeEditorInit();
	   }
});
// 컨텐츠 수정 화면에서 에디터 사용하는 경우 에디터 초기화 하지 않도록 한다.
function contentsMakeEditorInit(){
	 if($("#editType").val() == ''){
		  tinyMCE.activeEditor.setContent('');
	 }
}
//이미지 버튼 클릭시 팝업 실제 파일업로드를 구성하여 링크할 경로를 작성한다( 아이콘클릭시 이 함수가 호출됨)
function cmdImgUploadPop(){
 var win = window.open("popImageUpload/editorImg",
       "editor_win",
       "toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=700,height=500,left=50,top=50"
  );
 win.focus();  
}

function cmdImgSelectorPop(){
	 var win = window.open("popImageSelector/selectorImg",
	       "editor_win",
	       "toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=980,height=500,left=50,top=50"
	  );
	 win.focus();  
}
//파일업로드 완료후 opener.editorImgUploadComplete함수호출 되는 방식 
/*
function editorImgUploadComplete(fileStr, dir){
  if( fileStr.length > 0 ){
   fileStr = fileStr.substring(0, fileStr.length-1);
   
   getObject("editorImgArrStr").value = fileStr;

   fileArray = fileStr.split("^");

   //3개가 한묶음
   var strImg = "";
   for( var i=0; i<fileArray.length; i+=3){
    strImg += "<br><img src='<%= slssConfig.getNoticeEditorUrl() %>" + dir + "/" + fileArray[i+2] + "' border=0><br><br>";
   }
   //var contents = tinyMCE.activeEditor.getContent(); 
   //tinyMCE.get('contents').getContent();
   var contents = tinyMCE.activeEditor.getDoc().body.innerHTML; 
   tinyMCE.activeEditor.setContent( contents + strImg );
  }
 }
*/
function editorImgUploadComplete(fileStr){
	var hostname = "jwlee0208.cdn3.cafe24.com";	//location.host;
	
	if( fileStr.length > 0 ){	   
	   var strImg = "<br><img src='http://" + hostname + fileStr + "' border=0 width=100%>";
	   var contents = tinyMCE.activeEditor.getDoc().body.innerHTML;	   
	   tinyMCE.activeEditor.setContent( contents + strImg);
	}
}

function editorImgSelectorComplete(fileStr){
	if( fileStr.length > 0 ){	   
	   var strImg = "<br/><img src='" + fileStr + "' border=0 width=100%><br/>";
	   var contents = tinyMCE.activeEditor.getDoc().body.innerHTML;	   
	   tinyMCE.activeEditor.setContent( contents + strImg);
	}
}


$("#addfile").on("click",function(){
	if($('.addfile').length < 5){ //5개 이상 생성금지
		$(".filebox").append('<li><input type="file" name="addfile[]" class="form-control addfile"></li>');
	}else{
		alert('최대 5개까지 파일을 올릴수 있습니다.');
	}
});

$(".modal-close").on("click", function(){
	location.href=$(this).parent().parent().parent().parent().attr("outAction");	
});

$("input[name='time']").on("click", function(){
	if($(this).val() == "Y"){
		$("input[name='date']").attr("disabled",false).addClass("disabled").val('');
		$("select[name='hour']").attr("disabled",true);
		$("select[name='mon']").attr("disabled",true);
	}else{
		$("input[name='date']").attr("disabled",true).removeClass("disabled").focus();
		$("select[name='hour']").attr("disabled",false);
		$("select[name='mon']").attr("disabled",false);
	}	
});

function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}

//$(function() {
//	  var contextPath = getContextPath();
//		
//	  $( "#calendarDate" ).datepicker({
//	    dateFormat: 'yy-mm-dd',
//	    prevText: '이전 달',
//	    nextText: '다음 달',
//	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
//	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
//	    dayNames: ['일','월','화','수','목','금','토'],
//	    dayNamesShort: ['일','월','화','수','목','금','토'],
//	    dayNamesMin: ['일','월','화','수','목','금','토'],
//	    showMonthAfterYear: true,
//	    yearSuffix: '년',
//	    showOn: 'both',
//	    buttonImage: contextPath + '/images/icon_calendar.png',
//	    buttonImageOnly: true
//	  });
//	  
//	  $('img.ui-datepicker-trigger').css({'cursor':'pointer', 'margin-left':'5px'});  //아이콘(icon) 위치
//	  $('.ui-datepicker ').css({ "margin-left" : "141px", "margin-top": "-223px"});  //달력(calendar) 위치
//	  $('img.ui-datepicker-trigger').attr('align', 'absmiddle');
//
//	  
//});
