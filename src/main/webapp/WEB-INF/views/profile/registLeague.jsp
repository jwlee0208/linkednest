<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1 id="btn-groups" class="page-header">Registration</h1>
	<form id="actionFrm" name="actionFrm" method="post" class="form-horizontal" role="form"  enctype="multipart/form-data">
		<h3>League Information</h3>
		<hr/>
		<div class="input-group">
			<span class="input-group-addon">League Logo Image</span>
			<input type="file" class="form-control" id="leagueImg" name="leagueImg" placeholder="upload league's logo image"/>
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">League Name</span>
			<input type="text" class="form-control" id="leagueName" name="leagueName" placeholder="write your name"/>
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">League Type</span>
			<select id="leagueType" name="leagueType" class="form-control">
				<option value="">::: select league type :::</option>
				<option value="pro"><tag:message code="code.leaguetype.pro"/></option>
				<option value="semipro"><tag:message code="code.leaguetype.semipro"/></option>
				<option value="independence"><tag:message code="code.leaguetype.independence"/></option>
			</select>
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">League Division</span>
			<select id="leagueDivision" name="leagueDivision" class="form-control">
				<option value="">::: select league Division :::</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
			</select>
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">Introduce</span>
			<textarea class="form-control tinymce" id="introduce" name="introduce"></textarea>
		</div>

		<div class="input-group">
			<span class="input-group-addon">Commissioner Name</span>
			<input type="text" class="form-control" id="commissioner" name="commissioner" placeholder="write league's commissioner name"/>
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">Official League's Website Url</span>
			<input type="url" class="form-control" id="leagueWebsiteUrl" name="leagueWebsiteUrl" placeholder="write league's official website url"/>
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">Joined Team Count</span>
			<input type="number" class="form-control" id="joinedTeamCnt" name="joinedTeamCnt" placeholder="write league's joined team count"/>
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">Established Date</span>
			<input type="date" class="form-control" id="establishedDate" name="establishedDate" placeholder="write established date"/>
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">Area(Continent)</span>
			<!-- ref.] 대륙별 코드 : http://mindgear.tistory.com/173 -->
			<select id="area" name="area" class="form-control">
				<option value="">::: select continent :::</option>
				<option value="eu"><tag:message code="code.area.eu"/></option>
				<option value="as"><tag:message code="code.area.as"/></option>
				<option value="af"><tag:message code="code.area.af"/></option>
				<option value="na"><tag:message code="code.area.na"/></option>
				<option value="sa"><tag:message code="code.area.sa"/></option>
				<option value="sp"><tag:message code="code.area.sp"/></option>
			</select>
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">Country</span>
			<select id="country" name="country" class="form-control">
				<option value="">::: select continent :::</option>
				<option value="KR"><tag:message code="code.country.KR"/></option>
				<option value="US"><tag:message code="code.country.US"/></option>
				<option value="CA"><tag:message code="code.country.CA"/></option>
				<option value="TW"><tag:message code="code.country.TW"/></option>
				<option value="JP"><tag:message code="code.country.JP"/></option>
				<option value="PR"><tag:message code="code.country.PR"/></option>
				<option value="DO"><tag:message code="code.country.DO"/></option>
				<option value="MX"><tag:message code="code.country.MX"/></option>
				<option value="AU"><tag:message code="code.country.AU"/></option>
				<option value="IT"><tag:message code="code.country.IT"/></option>
				<option value="CZ"><tag:message code="code.country.CZ"/></option>
				<option value="FR"><tag:message code="code.country.FR"/></option>
				<option value="DE"><tag:message code="code.country.DE"/></option>
				<option value="NL"><tag:message code="code.country.NL"/></option>
				<option value="AT"><tag:message code="code.country.AT"/></option>
			</select>
			<%--<input type="text" class="form-control" id="countrySearch" name="countrySearch" placeholder="write counrty"/>
			<input type="hidden" class="form-control ui-autocomplete-input" id="country" name="country" />--%>
		</div>
	</form>
	<br/>
	<div class="btn-group btn-group-justified">
		<div class="btn-group">
			<input type="button" class="btn btn-default" id="saveBtn" value="save" data-loading-text="Processing..."/>
		</div>
	</div>
	<br/>
</div>
</body>
<!-- editor -->
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/common-editor.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/board/article/common.js"></script>
<script>
    //ajax error check
    $(document).ajaxError(function(event, request){
            if(request.status==500)
                alert("등록에 실패하였습니다. \n업로드할 파일을 확인하세요.(파일 최대용량: 20MB)");
            return;
        }
    );

    //파일전송 후 콜백 함수
    function FileuploadCallback(data, state){

        if (data=="error"){
            alert("파일전송중 에러 발생!!");
            return false;
        } else if (data == "fileSizeError") {
            alert("파일용량은 20MB 이하 이어야 합니다.");
            return false;
        } else if (data == "fileExtensionError") {
            alert("이미지 파일을 업로드 하셔야 합니다.\n(업로드 가능한 확장자: jpg, jpeg, gif, png, bmp)");
            return false;
        } else if (data == "fileWidthHeightError") {
            alert("업로드 가능한 이미지 사이즈는 314 * 166 입니다.");
            return false;
        }
        alert("정상적으로 등록 되었습니다.");
        // 정상 등록 후 목록 화면으로 이동.
// 	   location.href = "/profile/list/1/01010100";

    }

    $(function(){
        $("#saveBtn").click(function(){

            var leagueImg = $.trim($("#leagueImg").val());

            var introduce = tinyMCE.get('introduce').getContent();
            $("#introduce").val(introduce);

            if(leagueImg.length == 0){
                $.ajax({
                    url 		: '/profile/registLeagueAction',
                    data 		: $("#actionFrm").serialize(),
                    dataType 	: 'json',
                    method 		: 'post',
                    success 	: function(data){
                        if(data.code == 'success'){
                            alert('등록되었습니다.');
                            return false;
                        }else{
                            alert('등록이 실패했습니다.');
                            return false;
                        }
                    }
                });
            }else{
                // 썸네일 파일 업로드 할 때 저장
                var frm = $("#actionFrm");
                frm.attr("action", '/profile/registLeagueAction');
                frm.attr("method", "post");
                frm.ajaxForm(FileuploadCallback);
                frm.submit();
            }
        });

    });
	/*var countries = '${pageContext.request.contextPath}/json/countries.json';
	 $( "#countrySearch" ).autocomplete({
	 source: countries,
	 focus: function( event, ui ) {
	 $( "#countrySearch" ).val( ui.item.name );
	 return false;
	 },
	 select: function( event, ui ) {
	 $( "#countrySearch" ).val( ui.item.name );
	 $( "#country" ).val( ui.item.code );
	 return false;
	 }
	 })
	 .data( "ui-autocomplete" )._renderItem = function( ul, item ) {
	 return $( "<li>" )
	 .append( "<a>" + item.name + "</a>" )
	 .appendTo( ul );
	 };*/
</script>
<style>
	.ui-autocomplete .highlight {
		font-weight : bold;
		color : red;
		text-decoration: underline;
	}
	.table-responsive .table.table-hover tr td {vertical-align : middle; }
	.position {
		float: right;
		font-size: 18px;
		margin-top: -5px;
		margin-right: -5px;
	}
</style>
</html>