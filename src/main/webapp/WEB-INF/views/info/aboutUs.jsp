<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://apis.daum.net/maps/maps2.js?apikey=98f284673f90ce9e7af4fa2aa4776e3465dc16f3"></script>
    <script>
        $(document).ready(function() {
            goToAUTab(1);
        });

        function goToAUTab(index) {
            $(".nav-item").removeClass("active");
            $(".tab-pane").removeClass("show active");

            $("#tab" + index).addClass("show active");
            $("#tabItem" + index).addClass("active");

            let innerHtml = "";
            if (index == 1) innerHtml += "Introduction";
            else if (index == 2) innerHtml += "History";
            else if (index == 3) innerHtml += "Contact";
            else if (index == 4) innerHtml += "Location";

            $(".secondBranch").text(innerHtml);
        }
    </script>
    <style>
        .tab-content {
            padding: 20px;
        }
        .breadcrumb .active {
            color: #6c757d;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 id="btn-groups" class="page-header">About</h1>
    
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#" onclick="javascript:goHome();">Home</a></li>
        <li class="breadcrumb-item"><a>About</a></li>
        <li class="breadcrumb-item active secondBranch"></li>
    </ol>

    <ul class="nav nav-tabs nav-justified" role="tablist">
        <li class="nav-item" id="tabItem1">
            <a class="nav-link" href="#" onclick="javascript:goToAUTab(1);">Introduction</a>
        </li>
<!--         <li class="nav-item" id="tabItem2">
            <a class="nav-link" href="#" onclick="javascript:goToAUTab(2);">History</a>
        </li>
 -->
        <li class="nav-item" id="tabItem3">
            <a class="nav-link" href="#" onclick="javascript:goToAUTab(3);">Contact</a>
        </li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane fade" id="tab1">
            <div class="row text-center">
                <div class="col" style="background-color:#efefef; padding: 20px;">
                    <p class="lead">A mans heart plans his way, But the Lord directs his steps.</p>
                    <p class="lead">사람이 마음으로 자기 길을 계획할지라도 그 걸음을 인도하시는 분은 여호와이시다.</p>
                    <p class="lead">잠언 16:9(Proverbs 16:9)</p>
                </div>
            </div>
            <div class="row" style="padding: 50px;">
                <p>야구를 너무도 좋아하던 아이가 있었습니다. 무작정 야구부에 들어갔습니다.</p>
                <p> 그러나 부상과 IMF 사태로 5년만에 그만둬야 했습니다.</p>
                <br/>
                <p>고등학교에 입학한 청소년은 합창단을 하면서 음악을 사랑하게 되었습니다. 극적으로 노래를 공부할 수 있었습니다.</p>
                <p>그러나 경제적 어려움 때문에 1년만에 그만둬야 했습니다.</p>
                <br/>
                <p>컴퓨터와는 전혀 친숙하지 않은 청년은 대학에 입학해서 컴퓨터를 공부하게 되었습니다.</p>
                <p>컴퓨터 언어가 너무 어려워 프로그래머는 하지 말아야지 생각했습니다.</p>
                <p>그러나 개발자로 사회 첫발을 내디뎠습니다.</p>
                <p>내 자신이 이해가 되지 않았습니다. 왜 이 일을 택했는지.</p>
                <br/>
                <p>어느 날, TV를 통해 급작스런 팀의 해체로 인해 길을 잃고 황망한 표정으로 허공을 바라보는 독립구단의 야구선수들을 보았습니다.</p>
                <p>내가 할 수 있는 것이 무엇이 있을까 하는 생각이 들었습니다.</p>
                <p>이 공간은 그러한 사람들을, 선수들을 위해 무엇을 만들 수 있을까 라는 생각이 출발점이 되었습니다.</p>
                <br/>
                <p>여전히 고민중입니다. 어떻게 그들이 새로운 기회를 찾을 수 있도록 도울 수 있을지..</p>
                <br/>
                <p>내 의지와는 상관없는 결과를 받아들이고 있는 인생의 연속이지만 개발자가 된 것은 그 새로운 기회와 연결시킬 수 있는 </p>
                <br/>
                <p>무언가를 만들어낼 수 있는 기회가 될 수 있구나 하는 생각에 아이러니함을 느낍니다.</p>
                <br/>
                <p>누구에게라도, 단 한명에게라도 도움이 될 수 있는 웹 서비스를 만들어 나가고 싶은 것.</p>
                <br/>
                <p>그것이 개발자로 살아가고 있는, 어느 한 사람의 소망입니다.</p>
            </div>
        </div>
<!--         <div class="tab-pane fade" id="tab2">
            <div class="row" style="padding: 50px;">
                <h1>2014. <small>Jun.</small></h1>
                <p class="lead">Start To Private Web Service Project</p>
                <h1>2014. <small>May.</small></h1>
                <p class="lead">Marry</p>
                <h1>2014. <small>Mar.</small></h1>
                <p class="lead">Start To Teach Baseball In Youth Baseball Clinic(Every Saturday)</p>
                <h1>2013. <small>Nov.</small></h1>
                <p class="lead">Left To <mark>uEngineSolutions</mark> & Move To <mark>Wemakeprice.com</mark> As Web Programmer</p>
                <h1>2010. <small>Feb.</small></h1>
                <p class="lead">Start To Work As Web Programmer For <mark>uEngineSolutions</mark> Company</p>
                <h1>2009. <small>May.</small></h1>
                <p class="lead">Retire <mark>ROKA(Republic Of Korea Army)</mark></p>
                <h1>2007. <small>Apr.</small></h1>
                <p class="lead">Joins <mark>ROKA(Republic Of Korea Army)</mark></p>
                <h1>2006. <small>Feb.</small></h1>
                <p class="lead">Graduate <mark>Dongyang Technical College</mark> As Information-Communication Major</p>
                <h1>2003. <small>Mar.</small></h1>
                <p class="lead">Entering <mark>Dongyang Technical College</mark> As Information-Communication Major</p>
                <h1>2002. <small>Feb.</small></h1><br/>
                <p class="lead">Graduate High School & Fail To Enter University & Re-Start To Study</p>
                <h1>2000. <small>Mar.</small></h1><br/>
                <p class="lead">Starting Classical Vocal Music</p>
                <h1>1999. <small>Mar.</small></h1><br/>
                <p class="lead">Entering High School & Joinning Choir in School</p>
                <h1>1996. <small>Aug.</small></h1><br/>
                <p class="lead">Stopping Baseball As Player</p>
                <h1>1994. <small>Aug.</small></h1><br/>
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
		 -->
		<div class="tab-pane fade" id="tab3" style="min-height:320px;">
			<h2>Contact</h2>
			<p>E-Mail : <a href="mailto:jwlee0208@gmail.com" target="_blank">jwlee0208@gmail.com</a></p>
		</div>
		<div  class="tab-pane fade" id="tab4">
			<div class="row" style="padding: 50px;">
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
</div>		
<script>
$(document).on("ready", function(){
	goToAUTab(1);
});
</script>	  	  