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
    location.href = "/profile/list/"+ $("#profileType").val() +"/" + $("#catId1").val();
}

$(function(){
    $("#saveBtn").click(function(){

        var introduce = tinyMCE.get('introduce').getContent();
        $("#introduce").val(introduce);
        var profileImg = $.trim($("#profileImg").val());

        if(profileImg.length == 0){
            modifyProfileNoneImage();
        }else{
            modifyProfileWithImage();
        }
    });

    function modifyProfileNoneImage() {
        $.ajax({
            url 		: '/profile/modifyAction',
            data 		: $("#actionFrm").serialize(),
            dataType 	: 'json',
            method 		: 'post',
            success 	: function(data){
                var result = data.result;
                var msg = data.message;

                if(result == 'success'){
                    location.href = "/profile/list/" + $("#profileType").val() + "/" +  + $("#catId1").val();
                }else{
                    alert(msg);
                    return;
                }
            },
            error : function(xhr, textStatus, thrownError){
                console.log("error : " + xhr.status + ", " + textStatus + ", " + thrownError);
            }
        });
    }

    function modifyProfileWithImage() {
        // 썸네일 파일 업로드 할 때 저장
        var frm = $("#actionFrm");
        frm.attr("action", '/profile/modifyAction');
        frm.attr("method", "post");
        frm.ajaxForm(FileuploadCallback);
        frm.submit();
    }

    /********************************************************
     * Remove row
     ********************************************************/
    // pitcher stat row removing
    $("body").on("click", ".removePitcherBtn", function(){
        $(this).parent().parent().get(0).remove();
    });
    // hitter stat row removing
    $("body").on("click", ".removeHitterBtn", function(){
        $(this).parent().parent().get(0).remove();
    });
    // fielder stat row removing
    $("body").on("click", ".removeFielderBtn", function(){
        $(this).parent().parent().get(0).remove();
    });

    /********************************************************
     * Add row
     ********************************************************/
    // youtube stream row adding
    $(".addStreamBtn").click(function(){
        var rowCount = $(".stream_div").size();
        if(rowCount >= 10){
            alert('you can add your stats until 10 rows.');
            return false;
        }else{

            var addStreamHtml = "<div class=\"row stream_div\" style=\"padding-bottom:5px;\">";
            addStreamHtml += "<div class=\"col-lg-6\">";
            addStreamHtml += "<div class=\"input-group\">";
            addStreamHtml += "	<span class=\"input-group-addon\">Title</span>";
            addStreamHtml += "	<input type=\"hidden\" class=\"form-control\" name=\"profileStreamList["+ rowCount +"].profileId\" value=\""+$("#profileId").val()+"\"/>";
            addStreamHtml += "	<input type=\"text\" class=\"form-control\" id=\"streamTitle_"+ rowCount +"\" name=\"profileStreamList["+ rowCount +"].streamTitle\"/>";
            addStreamHtml += "	</div>";
            addStreamHtml += "	</div>";
            addStreamHtml += "	<div class=\"col-lg-6\">";
            addStreamHtml += "	<div class=\"input-group\">";
            addStreamHtml += "		<span class=\"input-group-addon\">URL</span>";
            addStreamHtml += "		<input type=\"text\" class=\"form-control\" id=\"streamUrl_" + rowCount + "\" name=\"profileStreamList[" + rowCount + "].streamUrl\"/>";
            addStreamHtml += "	</div>";
            addStreamHtml += "	</div>";
            addStreamHtml += "	</div>";

            $(".stream_div:last").after(addStreamHtml);
        }

    });

    // career row adding
    $(".addCareerBtn").click(function(){
        var rowCount = $(".career_tr").size();
        if(rowCount >= 10){
            alert('you can add your stats until 10 rows.');
            return false;
        }else{

            var addCareerHtml = "<tr id=\"career_tr_"+ rowCount +"\" class=\"career_tr\">";
            addCareerHtml += "<th class=\"row\">";
            addCareerHtml += "	<input type=\"text\" class=\"form-control\" id=\"careerTitle\" name=\"profileCareerList[" + rowCount + "].careerTitle\"/>";
            addCareerHtml += "	<input type=\"hidden\" class=\"form-control\" name=\"profileCareerList["+ rowCount +"].profileId\" value=\""+$("#profileId").val()+"\"/>";
            addCareerHtml += "</th>";
            addCareerHtml += "<td><textarea class=\"form-control\" id=\"careerTitle\" name=\"profileCareerList[" + rowCount + "].careerDescription\" row=\"5\" col=\"20\"></textarea></td>";
            addCareerHtml += "<td><input type=\"month\" class=\"form-control\" id=\"careerStartDate\" name=\"profileCareerList[" + rowCount + "].startDate\"/></td>";
            addCareerHtml += "<td><input type=\"month\" class=\"form-control\" id=\"careerEndDate\" name=\"profileCareerList[" + rowCount + "].endDate\"/></td>";
            addCareerHtml += "<td>";
            addCareerHtml += "	<select class=\"form-control\" id=\"careerTitle\" name=\"profileCareerList[" + rowCount + "].careerStatus\">";
            addCareerHtml += "		<option value=\"-1\">::: status :::</option>";
            addCareerHtml += "		<option value=\"0\">not playing</option>";
            addCareerHtml += "		<option value=\"1\">playing</option>";
            addCareerHtml += "	</select>";
            addCareerHtml += "</td>";
            addCareerHtml += "<td><input type=\"number\" class=\"form-control\" id=\"careerSeq\" name=\"profileCareerList[0].careerSeq\" min=\"0\" max=\"100\"/></td>";
            addCareerHtml += "</tr>";

            $(".tableCareer > tbody:last").append(addCareerHtml);
        }
    });

    // pitcher stat row adding
    $(".addPitcherBtn").click(function(){
        var rowCount = $(".pitcher_tr").size();
        if(rowCount >= 10){
            alert('you can add your stats until 10 rows.');
            return false;
        }else{
            var addPitcherHtml = "<tr id=\"pitcher_tr_"+ rowCount +"\" class=\"pitcher_tr\">";
            addPitcherHtml += "<td>";
            addPitcherHtml += "	<input type=\"text\" 		class=\"form-control\" id=\"pTeamName_"+ rowCount +"\" name=\"profileStatPitcherList[" + rowCount + "].pTeamName\"/>"
            addPitcherHtml += "	<input type=\"hidden\" class=\"form-control\" name=\"profileStatPitcherList["+ rowCount +"].profileId\" value=\""+$("#profileId").val()+"\"/>";
            addPitcherHtml += "</td>";
            addPitcherHtml += "<td><input type=\"month\" 		class=\"form-control\" id=\"pStatYear_"+ rowCount +"\" name=\"profileStatPitcherList[" + rowCount + "].pStatYear\"/></td>";
            addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"inn_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].inn\"/></td>";
            addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"w_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].w\"/></td>";
            addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"l_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].l\"/></td>";
            addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"era_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].era\"/></td>";
            addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"g_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].g\"/></td>";
            addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"gs_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].gs\"/></td>";
            addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"sv_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].sv\"/></td>";
            addPitcherHtml += "<td><input type=\"number\"		class=\"form-control\" id=\"svo_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].svo\"/></td>";
            addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"ip_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].ip\"/></td>";
            addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"h_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].h\"/></td>";
            addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"r_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].r\"/></td>";
            addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"er_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].er\"/></td>";
            addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"hr_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].hr\"/></td>";
            addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"bb_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].bb\"/></td>";
            addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"so_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].so\"/></td>";
            addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"avg_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].avg\"/></td>";
            addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"whip_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].whip\"/></td>";
            addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"k_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].k\"/></td>";
            addPitcherHtml += "<td><input type=\"button\" 		class=\"btn btn-default removePitcherBtn\" value=\"-\"/></td>";
            addPitcherHtml += "</tr>";

            $(".tablePitcherStat > tbody:last").append(addPitcherHtml);
        }

    });
    // hitter stat row adding
    $(".addHitterBtn").click(function(){
        var rowCount = $(".hitter_tr").size();
        if(rowCount >= 10){
            alert('you can add your stats until 10 rows.');
            return false;
        }else{
            var addHitterHtml = "<tr id=\"hitter_tr_"+ rowCount +"\" class=\"hitter_tr\">";
            addHitterHtml += "<td>";
            addHitterHtml += "	<input type=\"hidden\" class=\"form-control\" name=\"profileStatHitterList["+ rowCount +"].profileId\" value=\""+$("#profileId").val()+"\"/>";
            addHitterHtml += "	<input type=\"text\" 			class=\"form-control\" id=\"hTeamName_"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].hTeamName\"/>";
            addHitterHtml += "</td>";
            addHitterHtml += "<td><input type=\"month\" 		class=\"form-control\" id=\"hStatYear_"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].hStatYear\"/></td>";
            addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"g"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].g\"/></td>";
            addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"ab"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].ab\"/></td>";
            addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"r"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].r\"/></td>";
            addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"h"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].h\"/></td>";
            addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"twoB"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].twoB\"/></td>";
            addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"threeB"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].threeB\"/></td>";
            addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"hr"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].hr\"/></td>";
            addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"rbi"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].rbi\"/></td>";
            addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"bb"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].bb\"/></td>";
            addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"so"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].so\"/></td>";
            addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"sb"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].sb\"/></td>";
            addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"cs"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].cs\"/></td>";
            addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"avg"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].avg\"/></td>";
            addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"obp"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].obp\"/></td>";
            addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"slg"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].slg\"/></td>";
            addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"ops"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].ops\"/></td>";
            addHitterHtml += "<td><input type=\"button\" 		class=\"btn btn-default removeHitterBtn\" value=\"-\"/></td>";
            addHitterHtml += "</tr>";
            $(".tableHitterStat > tbody:last").append(addHitterHtml);
        }
    });
    // fielder stat row adding
    $(".addFielderBtn").click(function(){
        var rowCount = $(".fielder_tr").size();
        if(rowCount >= 10){
            alert('you can add your stats until 10 rows.');
            return false;
        }else{
            var addFielderHtml = "<tr id=\"fielder_tr_"+ rowCount +"\" class=\"fielder_tr\">";
            addFielderHtml += "<th class=\"row\">";
            addFielderHtml += "	<input type=\"text\" 		class=\"form-control\" id=\"fTeamName\" 		name=\"profileStatFielderList[" + rowCount + "].fTeamName\"/>";
            addFielderHtml += "	<input type=\"hidden\" class=\"form-control\" name=\"profileStatFielderList["+ rowCount +"].profileId\" value=\""+$("#profileId").val()+"\"/>";
            addFielderHtml += "</th>";
            addFielderHtml += "<td><input type=\"month\" 		class=\"form-control\" id=\"fStatYear\" 		name=\"profileStatFielderList[" + rowCount + "].fStatYear\"/></td>";
            addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"pos\" 		name=\"profileStatFielderList[" + rowCount + "].pos\"/></td>";
            addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"g\" 		name=\"profileStatFielderList[" + rowCount + "].g\"/></td>";
            addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"gs\" 		name=\"profileStatFielderList[" + rowCount + "].gs\"/></td>";
            addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"inn\" 		name=\"profileStatFielderList[" + rowCount + "].inn\"/></td>";
            addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"tc\" 		name=\"profileStatFielderList[" + rowCount + "].tc\"/></td>";
            addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"po\" 		name=\"profileStatFielderList[" + rowCount + "].po\"/></td>";
            addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"a\" 		name=\"profileStatFielderList[" + rowCount + "].a\"/></td>";
            addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"e\" 		name=\"profileStatFielderList[" + rowCount + "].e\"/></td>";
            addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"dp\" 		name=\"profileStatFielderList[" + rowCount + "].dp\"/></td>";
            addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"sb\" 		name=\"profileStatFielderList[" + rowCount + "].sb\"/></td>";
            addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"cs\" 		name=\"profileStatFielderList[" + rowCount + "].cs\"/></td>";
            addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"sbpct\" 		name=\"profileStatFielderList[" + rowCount + "].sbpct\"/></td>";
            addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"pb\" 		name=\"profileStatFielderList[" + rowCount + "].pb\"/></td>";
            addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"cWp\" 		name=\"profileStatFielderList[" + rowCount + "].cWp\"/></td>";
            addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"fpct\" 		name=\"profileStatFielderList[" + rowCount + "].fpct\"/></td>";
            addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"rf\" 		name=\"profileStatFielderList[" + rowCount + "].rf\"/></td>";
            addFielderHtml += "<td><input type=\"button\" 		class=\"btn btn-default removeFielderBtn\" value=\"-\"/></td>";
            addFielderHtml += "</tr>";
            $(".tableFielderStat > tbody:last").append(addFielderHtml);
        }
    });
});

function toggleThumbImage(className){
    $(".thumbImg").hide();
    $("." + className).show();
}

function delThumbImage(){
    $(".unset").remove();
    toggleThumbImage("set");
}