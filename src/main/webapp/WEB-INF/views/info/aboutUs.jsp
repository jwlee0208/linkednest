<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript" src="http://apis.daum.net/maps/maps2.js?apikey=98f284673f90ce9e7af4fa2aa4776e3465dc16f3"></script>
<script>
	function goToAUTab(index){
		$(".li").removeClass("active");
		$(".tabDiv").hide();
		$(".li_" + index).addClass("active");
		$(".tab" + index).show();
		var innerHtml = "";
// 			"<a href=\"javascript:;\">";
		if(index == 1) 		innerHtml += "Introduction";
		else if(index == 2) innerHtml += "History";
		else if(index == 3) innerHtml += "Contact";
		else if(index == 4) innerHtml += "Location";
// 		innerHtml += "</a>";
		$(".secondBranch").html(innerHtml);
	}
</script>
<div class="container">
		<h1 id="btn-groups" class="page-header">About</h1>
		
		<ol class="breadcrumb">
		  <li><a href="#" onclick="javascript:goHome();">Home</a></li>
		  <li><a>About</a></li>
		  <li class="secondBranch active"></li>
		</ol>		

		<ul class="nav nav-tabs nav-justified" role="tablist">
			<li class="li li_1"><a href="#" onclick="javascript:goToAUTab(1);">Introduction</a></li>
			<li class="li li_2"><a href="#" onclick="javascript:goToAUTab(2);">History</a></li>
			<li class="li li_3"><a href="#" onclick="javascript:goToAUTab(3);">Contact</a></li>
<!-- 			<li class="li li_4"><a href="#" onclick="javascript:goToAUTab(4);">Location</a></li> -->
		</ul>

		<div class="tabDiv tab1" style="padding-top: 20px;">
			<div class="row" style="text-align:center; padding: 0px 50px 0px 50px;">
				<div style="background-color :#efefef; padding: 20px 0px 10px 0px;">
				<p class="lead">A mans heart plans his way, But the Lord directs his steps.</p>
				<p class="lead">사람이 마음으로 자기 길을 계획할지라도 그 걸음을 인도하시는 분은 여호와이시다.</p>
				<p class="lead">잠언 16:9(Proverbs 16:9)</p>
				</div>
			</div>
			<div class="row" style="padding: 50px 50px 50px 50px;">
				<p>야구를 너무도 좋아하던 아이가 있었습니다. 무작정 야구부에 들어갔습니다.</p> 
				<p>	그러나 5년만에 그만둬야 했습니다.</p>
				<br/>	
				<p>	고등학교에 입학한 청소년은 합창단을 하면서 음악을 사랑하게 되었습니다. 노래를 공부했습니다.</p> 
				<p>	그러나 1년만에 그만둬야 했습니다.</p>
				<br/>	
				<p>	컴퓨터와는 전혀 칙숙하지 않은 청년은 대학에 입학해서 컴퓨터를 공부하게 되었습니다.</p> 
				<p>	컴퓨터 언어가 너무 어려워 프로그래머는 하지 말아야지 생각했습니다.</p> 
				<p>	그러나 개발자로 사회 첫발을 내디뎠습니다.</p>
				<p>	내 자신이 이해가 되지 않았습니다. 왜 이 일을 택했는지.</p>
				<br/>	
				<p>	기회를 빼앗겨 황망한 표정으로 허공을 바라보는 사람들을 보았습니다.</p>
				<p>	내가 할 수 있는 것이 무엇이 있을까 하는 생각이 들었습니다.</p>
				<p>	이 공간은 그러한 사람들을 위해 무엇을 만들 수 있을까 라는 생각이 출발점이 되었습니다.</p>
				<br/>	
				<p>	여전히 고민중입니다.</p>
				<p>	어떻게 그들이 새로운 기회를 찾을 수 있도록 도울 수 있을지..</p>
				<br/>	
				<p>	내 의지와는 상관없는 결과를 받아들이고 있는 인생의 연속이지만</p>
				<p>	개발자가 된 것은 그 새로운 기회와 연결시킬 수 있는 무언가를 만들어낼 수 있는</p>
				<p>	기회가 될 수 있구나 하는 생각에 아이러니함을 느낍니다.</p>
				<br/>	
				<p>	누구에게라도, 단 한명에게라도 도움이 될 수 있는 웹 서비스를 만들어 나가고 싶은 것.</p>
				<p>	그것이 개발자로 살아가고 있는, 어느 한 사람의 소망입니다.</p>
			</div>
<!-- 			<div class="jumbotron"> -->
<!-- 				<h1>Introduction Our Organization</h1> -->
<!-- 				<p class="btn btn-primary btn-lg" role="button">See more</p> -->
<!-- 			</div> -->
		</div>		
		<div class="tabDiv tab2" style="padding: 0 20px 0 0;">
			<div class="row" style="padding: 50px 0px 50px 20px; min-height: 200px; ">
				<h1>2014. <small>Jun. </small></h1>
				<p class="lead">Start To Private Web Service Project</p>
				<h1>2014. <small>May. </small></h1>
				<p class="lead">Marry</p>
				<h1>2014. <small>Mar. </small></h1>
				<p class="lead">Start To Teach Baseball In Youth Baseball Clinic(Every Saturday)</p>
				<h1>2013. <small>Nov. </small></h1>
				<p class="lead">Left To <mark>uEngineSolutions</mark> & Move To <mark>Wemakeprice.com</mark> As Web Programmer</p>
				<h1>2010. <small>Feb. </small></h1>
				<p class="lead">Start To Work As Web Programmer For <mark>uEngineSolutions</mark> Company</p>
				<h1>2009. <small>May. </small></h1>
				<p class="lead">Retire <mark>ROKA(Republic Of Korea Army)</mark></p>
				<h1>2007. <small>Apr. </small></h1>
				<p class="lead">Joins <mark>ROKA(Republic Of Korea Army)</mark></p>
				<h1>2006. <small>Feb. </small></h1>
				<p class="lead">Graduate <mark>Dongyang Technical College</mark> As Information-Communication Major</p>
				<h1>2003. <small>Mar. </small></h1>
				<p class="lead">Entering <mark>Dongyang Technical College</mark> As Information-Communication Major</p>
				<h1>2002. <small>Feb. </small></h1><br/>
				<p class="lead">Graduate High School & Fail To Enter University & Re-Start To Study</p>
				<h1>2000. <small>Mar. </small></h1><br/>
				<p class="lead">Starting Classical Vocal Music</p>
				<h1>1999. <small>Mar. </small></h1><br/>
				<p class="lead">Entering High School & Joinning Choir in School</p>
				<h1>1996. <small>Aug. </small></h1><br/>
				<p class="lead">Stopping Baseball As Player</p>
				<h1>1994. <small>Aug. </small></h1><br/>
				<p class="lead">Picked Up National Baseball Team</p>
				<h1>1994. <small>Mar. </small></h1><br/>
				<p class="lead">Matriculation Into Junior High School</p>
				<h1>1992. <small>Sep. </small></h1><br/>
				<p class="lead">Beginning Baseball As Player </p>
				<h1>1988. <small>Mar. </small></h1><br/>
				<p class="lead">Matriculation Into Elementary School</p>
				<h1>1983. <small>Feb. </small></h1>
				<p class="lead">Born In Seoul</p>			
			</div>
		</div>
		<div class="tabDiv tab3" style="padding-top: 20px;">
			<h2>Contact</h2>
			<p>mail address : <a href="mailto:jwlee0208@gmail.com" target="_blank">jwlee0208@gmail.com</a></p>
		</div>
		<div class="tabDiv tab4" style="padding-top: 20px;">
<!-- 			<h2>Location</h2>		 -->
			<div style="height : 400px; overflow-y:scroll; padding-bottom : 20px; ">
			  <div class="col-md-8"><div id="map"></div></div>
			  <div class="col-md-4">
			  	<h2><small>주소</small></h2>
			  	<p class="text-info">서울시 강남구 대치동 000-00</p>
			  	<h2><small>대중교통</small></h2>
			  	<p class="text-info">000-00</p>
			  </div>			
				
			</div>
		</div>
</div>		
<script>
$(document).on("ready", function(){
	goToAUTab(1);
});
</script>	  	  