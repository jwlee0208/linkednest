function editorImgUploadComplete(fileStr){
	var hostname = "jwlee0208.cdn3.cafe24.com";		//location.host;
	  
	  if( fileStr.length > 0 ){	   
	   var strImg = "<br><img src='http://" + hostname + fileStr + "' border=0>";		  
//	   var strImg = "<br><img src='http://" + hostname + getContextPath() + fileStr + "' border=0>";
	   var contents = tinyMCE.activeEditor.getDoc().body.innerHTML;	   
	   tinyMCE.activeEditor.setContent( contents + strImg);
	  }
}

function share(type, articleId, content, shareId){
	var url 	= "";
	var userId 	= shareId;
	
	if(type == 'fb'){
		url = "http://www.facebook.com/sharer/sharer.php?u=http://linkednest.net";
		
	}else if(type == 'tw'){
		url = "https://twitter.com/intent/tweet?text=" + content + "&url=http://linkednest.net";
	}
	url += "/share";
	if(userId != undefined && userId != null && userId != ''){
		url += "/"+ userId; 
	}
	url += "/view/" + articleId;
//	else{
//		url += "/board/article/view/" + articleId;
//	}
	window.open(url);
}
