<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html ng-app="website">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AngularJS Animate Slider</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slideshow.css">
    <style>
		.jumbotron {background: '${pageContext.request.contextPath}/img/slideshow/img_00.jpg'}
    </style>
</head>
<body>
<body ng-controller="MainCtrl">
<div class="slider">
    <img ng-repeat="slide in slides" class="slide slide-animation nonDraggableImage"
         ng-swipe-right="nextSlide()" ng-swipe-left="prevSlide()"
         ng-hide="!isCurrentSlideIndex($index)" ng-src="{{slide.image}}">

    <a class="arrow prev" href="#" ng-click="nextSlide()"></a>
    <a class="arrow next" href="#" ng-click="prevSlide()"></a>
    <nav class="nav-slide">
        <div class="wrapper">
            <ul class="dots">
                <li class="dot" ng-repeat="slide in slides">
                    <a href="#" 
                    	ng-class="{'active':isCurrentSlideIndex($index)}"
                       	ng-click="setCurrentSlideIndex($index);">{{slide.description}}</a>
                </li>
            </ul>
        </div>
    </nav>
</div>

<div class="row" style="padding-left: 40px; padding-right: 30px; ">
	<div class="col-md-4">
		<ul class="nav nav-tabs" role="tablist" id="boardTab">
			<li id="li_1" class="li"><a>자유게시판&nbsp;&nbsp;<span class="btn btn-default" onclick="javascript:goList(1);">more+</span></a></li>
			<li id="li_2" class="li"><a>Q&A&nbsp;&nbsp;<span class="btn btn-default" onclick="javascript:goList(2);">more+</span></a></li>
		</ul>
		<div class="boardDiv li_1_board" style="display:none; padding-top : 10px;">
			<div class="table-responsive">
				<table class="table table-striped">
					<colgroup><col width="30%"/><col width="70%"/></colgroup>
			<c:choose>		
				<c:when test="${null ne articleFive01 && articleFive01.size() > 0}">
					<c:forEach var="article" items="${articleFive01}">
					<tr>
						<td>${fn:substring(article.createDate, 0, 10)}</td>
						<td><span onclick="javascript:goArticleView('${article.articleId}');" data-toggle="modal" data-target="#myModal">${article.title }</span></td>
					</tr>	
					</c:forEach> 
				</c:when>
				<c:otherwise>
					<tr><td colspan="2">데이터가 없습니다.</td></tr>
				</c:otherwise>	
			</c:choose>		
				</table>
			</div>
		</div>
		<div class="boardDiv li_2_board" style="display:none; padding-top : 10px;">
			<div class="table-responsive">
				<table class="table table-striped">
					<colgroup><col width="30%"/><col width="70%"/></colgroup>
			<c:choose>		
				<c:when test="${null ne articleFive02 && articleFive02.size() > 0}">
					<c:forEach var="article" items="${articleFive02}">
					<tr>
						<td>${fn:substring(article.createDate, 0, 10)}</td>
						<td><span onclick="javascript:goArticleView('${article.articleId}');" data-toggle="modal" data-target="#myModal" >${article.title }</span></td>
					</tr>
					</c:forEach> 
				</c:when>	
				<c:otherwise>
					<tr><td colspan="2">데이터가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose>	
				</table>		
			</div>
		</div>	
	</div>
	<div class="col-md-4">	
		<div class="embed-responsive embed-responsive-16by9">
		  	<iframe class="embed-responsive-item" width="420" height="255" src="//www.youtube.com/embed/sD8pJQ_9K4Y" frameborder="0" allowfullscreen></iframe>		
		</div>
	</div>	
	<div class="col-md-4">	
		Web Crawling Data
	</div>
</div>

<!-- <div class="row"> -->
<!-- 	<div class="col-md-4"> -->
<!-- 		<h4>자유게시판&nbsp;&nbsp;<small><span onclick="javascript:goList(1);">more+</span></small></h4> -->
<!-- 		<div class="table-responsive"> -->
<!-- 			<table class="table table-striped"> -->
<%-- 				<colgroup><col width="30%"/><col width="70%"/></colgroup> --%>
<%-- 		<c:choose>		 --%>
<%-- 			<c:when test="${null ne articleFive01 && articleFive01.size() > 0}"> --%>
<%-- 				<c:forEach var="article" items="${articleFive01}"> --%>
<!-- 				<tr> -->
<%-- 					<td>${fn:substring(article.createDate, 0, 10)}</td> --%>
<%-- 					<td><span onclick="javascript:goArticleView('${article.articleId}');" data-toggle="modal" data-target="#myModal">${article.title }</span></td> --%>
<!-- 				</tr>	 -->
<%-- 				</c:forEach>  --%>
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<!-- 				<tr><td colspan="2">데이터가 없습니다.</td></tr> -->
<%-- 			</c:otherwise>	 --%>
<%-- 		</c:choose>		 --%>
<!-- 			</table> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="col-md-4"> -->
<!-- 		<h4>문의게시판&nbsp;&nbsp;<small><span onclick="javascript:goList(2);">more+</span></small></h4> -->
<!-- 		<div class="table-responsive"> -->
<!-- 			<table class="table table-striped"> -->
<%-- 				<colgroup><col width="30%"/><col width="70%"/></colgroup> --%>
<%-- 		<c:choose>		 --%>
<%-- 			<c:when test="${null ne articleFive02 && articleFive02.size() > 0}"> --%>
<%-- 				<c:forEach var="article" items="${articleFive02}"> --%>
<!-- 				<tr> -->
<%-- 					<td>${fn:substring(article.createDate, 0, 10)}</td> --%>
<%-- 					<td><span onclick="javascript:goArticleView('${article.articleId}');" data-toggle="modal" data-target="#myModal" >${article.title }</span></td> --%>
<!-- 				</tr> -->
<%-- 				</c:forEach>  --%>
<%-- 			</c:when>	 --%>
<%-- 			<c:otherwise> --%>
<!-- 				<tr><td colspan="2">데이터가 없습니다.</td></tr> -->
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose>	 --%>
<!-- 			</table>		 -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="col-md-4"></div> -->
<!-- </div> -->

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular-animate.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular-touch.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/1.10.3/TweenMax.min.js"></script>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/angular/slide/slideshow.js"></script>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="width : 700px;">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body" style="height : 500px; overflow-y:scroll; "></div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

</body>
<script>
	$().ready(function(){
		$("#li_1").addClass("active");
		
		$(".li_1_board").show();
		
		$("#boardTab .li").on("click", function(){
			$(".li").removeClass("active");
			$(".boardDiv").hide();
			
			$("#" + $(this).attr("id")).addClass("active");
			$("." + $(this).attr("id") + "_board").show();
		});
	});


	function goArticleView(articleId){
		$.ajax({
			url : '/board/article/view/' + articleId,
			data : {selectedArticleId : articleId},
			dataType : 'html',
			success : function(data){
				$('.modal-title').html(($(data).find(".panel-title").html()));
				$('.modal-body').html(($(data).find(".panel-body").html()));
			}
		});
	}
</script>


</html>
