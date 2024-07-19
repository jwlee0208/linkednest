<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"      prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"               prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags"    prefix="tag" %>
        <jsp:useBean id="now" class="java.util.Date"/>
        <c:set var="nowTime">
                <fmt:formatDate value="${now}" pattern="yyyyMMddHHmmss"/>
        </c:set>
        <div class="jumbotron jumbotron-fluid">
                <div class="container">
                        <h1 class="display-3" style="color:#efefef;">Find &nbsp;|&nbsp; Join &nbsp;|&nbsp; Play</h1>
<!-- 
                        <p class="lead" style="color:#efefef;">Why Don't You Try To Find Your Team Or Player?</p>
 -->                        
                        <p class="lead" style="color:#efefef;"><strong>"<tag:message code='sub.text4'/>"</strong> - 'Yogi' Lawrence Peter Berra</p>
 						<p class="lead" style="color:#efefef;">Connecting good clubs with good players,</p>
						<p class="lead" style="color:#efefef;">And bringing joy to both clubs and players now and in the future.</p>
						<p class="lead" style="color:#efefef;">That's the mission LinkedNest aspires to fulfill.</p>
<!-- 
                        <input type="button" class="btn btn-primary btn-lg registProfile" value="Regist Your Profile"/>
 -->
                </div>
        </div>
        <form id="mainFrm" name="mainFrm" method="post"></form>
        <div class="container" role="main">
				<%@include file="/WEB-INF/views/profile/home/ajaxRecentBaseballPlayerList.jsp" %>
				<%@include file="/WEB-INF/views/profile/home/ajaxRecentFootballPlayerList.jsp" %>
				<%@include file="/WEB-INF/views/profile/home/ajaxRecentBaseballTeamList.jsp" %>
				<%@include file="/WEB-INF/views/profile/home/ajaxRecentFootballTeamList.jsp" %>
<!-- // 2016.06.14 이후 작업 -->
				<%@include file="/WEB-INF/views/profile/home/ajaxRecentBaseballTryoutList.jsp" %>
        </div>

        <!-- Modal -->
        <c:import url="/common/modalPopup"/>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" onclick="javascript:initModalHtml();"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
              </div>
              <div class="modal-body" style="height : 500px; overflow-y:scroll; "></div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:initModalHtml();">Close</button>
              </div>
            </div>
          </div>
        </div>
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
                        url : '/share/view/' + articleId,
                        data : {selectedArticleId : articleId},
                        dataType : 'html',
                        success : function(data){
                                $('.modal-title').html(($(data).find(".panel-title").html()));
                                $('.modal-body').html(($(data).find(".panel-body").html()));
                        }
                });
        }

        var jumboHeight = $('.jumbotron').outerHeight();
        function parallax(){
            var scrolled = $(window).scrollTop();
            $('.bg').css('height', (jumboHeight-scrolled) + 'px');
        }

        $(window).scroll(function(e){
            parallax();
        });
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/circle.css?${nowTime}"/>
<script type="text/javascript"  src="${pageContext.request.contextPath}/js/profile/profileView.js?${nowTime}"></script>
<style>
        .jumbotron {
                background: #000 url("../img/home/img06.jpg") center center;
                background-size: cover;
                overflow: hidden;
        }
        iframe {width : 250px; height : 200px; align:center;}
</style>
