	//ajax error check
	$(document).ajaxError(function(event, request){
	   if(request.status==500)
	      alert("등록에 실패하였습니다. \n업로드할 파일을 확인하세요.(파일 최대용량: 20MB)");
	   	  return;
	   }
	);
	
	//파일전송 후 콜백 함수
	/*function FileuploadCallback(data, state){
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
	}*/

	$(function(){
		// profile registration
		$("#saveBtn").click(function(){
            var introduce = tinyMCE.get('introduce').getContent();
            $("#introduce").val(introduce);
            registProfile();
		});

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
		// career row removing
		$("body").on("click", ".removeCareerBtn", function(){
			$(this).parent().parent().get(0).remove();
		});

        /********************************************************
		 * Add row
         ********************************************************/
		// youtube stream row adding
		$(".addStreamBtn").click(function(){
			
			var title = $("#youtubeTitle").val();
			var url = $("#youtubeUrl").val().replace('"', '&quot;');
			
			if (isEmpty(title)) {
				alert('Please fill out stream title');
				return false;
			}

			if (isEmpty(url)) {
				alert('Please fill out stream url');
				return false;
			}
			
			var rowCount = $(".stream_div").size();
			if(rowCount >= 10){
				alert('you can add your stats until 10 rows.');
				return false;
			}else{

				var addStreamHtml = "";
				addStreamHtml += '<div class=\"form-group row stream_div stream_'+ rowCount +'\">';
				addStreamHtml += "<div class=\"col-10\">";
				addStreamHtml += '<h3><small>' + title + '</small></h3>';	
				addStreamHtml += '<div class=\"embed-responsive embed-responsive-16by9\" width=\"50%\">' + url + '</div>';				
				addStreamHtml += "	<input type=\"hidden\" class=\"form-control\" id=\"streamTitle_"+ rowCount +"\" name='profileStreamList["+ rowCount +"].streamTitle' value='" + title + "'/>";  
				addStreamHtml += '	<input type=\"text\" class=\"form-control\" id=\"streamUrl_' + rowCount + '\" name=\"profileStreamList[' + rowCount + "].streamUrl\" value='" + url + "'/>";
				addStreamHtml += '</div>';
				addStreamHtml += '<div class=\"col-2\">';
				addStreamHtml += '<input type=\"button\" class=\"btn btn-outline-warning deleteStream\" rowCount=\""+rowCount+"\" value=\"-\"/>';
				addStreamHtml += '</div>';
				addStreamHtml += '</div>';
				
				if(rowCount > 0) {
					$("#streamList").append(addStreamHtml);
				} else {
					$("#streamList").html(addStreamHtml);
				}
			}
			
		});			
		// career row adding
		$(".addCareerBtn").click(function(){
			
			var careerTitle = $("#careerTitle").val();
			var careerDescription = $("#careerDescription").val();
			var careerStartDate = $("#careerStartDate").val();
			var careerEndDate = $("#careerEndDate").val();
			var careerStatus = $("#careerStatus").val();
			
			// validation for career
//			validateCareer(careerTitle, careerDescription, careerStartDate, careerEndDate, careerStatus);
			if (isEmpty(careerTitle)) {
				alert('Please fill out career title');
				return false;
			}

			if (isEmpty(careerDescription)) {
				alert('Please fill out career description');
				return false;
			}

			if (isEmpty(careerStatus)) {
				alert('Please select career status');
				return false;
			}

			var rowCount = $(".career_tr").size();
			if(rowCount >= 10){
				alert('you can add your stats until 10 rows.');
				return false;
			}else{
				
				var addCareerHtml = "<tr id=\"career_tr_"+ rowCount +"\" class=\"career_tr\">";		
				addCareerHtml += "<th class=\"row\"><input type=\"hidden\" class=\"form-control\" id=\"careerTitle\" name=\"profileCareerList[" + rowCount + "].careerTitle\" value=\""+ careerTitle +"\"/>"+ careerTitle +"</th>";
				addCareerHtml += "<td><input type=\"hidden\" class=\"form-control\" id=\"careerTitle\" name=\"profileCareerList[" + rowCount + "].careerDescription\" value=\""+ careerDescription +"\">"+ careerDescription +"</textarea></td>";
				addCareerHtml += "<td><input type=\"hidden\" class=\"form-control\" id=\"careerStartDate\" name=\"profileCareerList[" + rowCount + "].startDate\"/ value=\""+ careerStartDate  +"\">"+ careerStartDate +"</td>";
				addCareerHtml += "<td><input type=\"hidden\" class=\"form-control\" id=\"careerEndDate\" name=\"profileCareerList[" + rowCount + "].endDate\"/ value=\""+ careerEndDate +"\">"+ careerEndDate +"</td>";
				addCareerHtml += "<td><input type=\"hidden\" class=\"form-control\" id=\"careerStatus\" name=\"profileCareerList[" + rowCount + "].careerStatus\" value=\""+ careerStatus +"\">" + careerStatus + "</td>";
				addCareerHtml += "<td><input type=\"hidden\" class=\"form-control\" id=\"careerSeq\" name=\"profileCareerList[0].careerSeq\" value=\""+rowCount+"\"><input type=\"button\" 		class=\"btn btn-default removeCareerBtn\" value=\"-\"/></td>";
				addCareerHtml += "</tr>";				
			
				$(".tableCareer > tbody:last").append(addCareerHtml);				
			}
		});

        function registProfile() {
            $.ajax({
                url 		: '/profile/registAction',
                data 		: $("#actionFrm").serialize(),
                dataType 	: 'json',
                method 		: 'post',
                success 	: function(data){
                    var status = data.status;
                    var result = data.result;

                    if(status == 'success'){
                    	alert('Successfully registed!!!');
                        location.href = "/profile/list/"+$("#profileType").val() + "/" + $("#categoryId").val();
                    }else if (status == 'validateErr'){
                        alert('Not Registed cause invalid information. check out invalid informations.');
                        var length = result.length;
                        if(result != null && length > 0){
                            for(var i = 0 ; i < length ; i++){
                                var fieldNm = result[i].field;
                                var message = result[i].defaultMessage;
                                console.log(i + ", " + fieldNm + ", " + message);
                                /*$("input[name="+result[i].field+"]").addClass("form-control-danger");*/
                                $("[name=" + fieldNm.replace(".", "_")+"Err]").html(message);
                                $("[name=" + fieldNm.replace(".", "_")+"Err]").parent().parent().addClass("has-danger");
                                $("[name=" + fieldNm.replace(".", "_")+"Err]").addClass("form-control-feedback");
                                $("[name=" + fieldNm.replace(".", "_")+"Err]").show();
                            }
                            // $("input[name="+result[0].field+"]").focus();
                        }
                    }
                },
                error : function(xhr, textStatus, thrownError){
                    /*console.log("error : " + xhr.status + ", " + textStatus + ", " + thrownError);*/
                }
            });
        }

		/*function registProfileWithImage() {
			// 썸네일 파일 업로드 할 때 저장
            var frm = $("#actionFrm");
            frm.attr("action", '/profile/registAction');
            frm.attr("method", "post");
            frm.ajaxForm(FileuploadCallback);
            frm.submit();
        }*/

        $(".form-control").on("click", function(e){
            $("#" + e.target.id +"Err").parent().parent().removeClass("has-danger");
            $("#" + e.target.id + "Err").hide();
            $("#" + e.target.id + "Err").html('');
        });

		// validation for career
		function validateCareer(careerTitle, careerDescription, careerStartDate, careerEndDate, careerStatus) {
			if (isEmpty(careerTitle)) {
				alert('Please fill out career title');
				return false;
			}

			if (isEmpty(careerDescription)) {
				alert('Please fill out career description');
				return false;
			}

			if (isEmpty(careerStatus)) {
				alert('Please select career status');
				return false;
			}
			return true;
		}
		
		// pitcher stat row adding
		$(".addPitcherBtn").click(function(){
			var teamName = $("#pTeamName_pitch_stat").val();
			var statYear = $("#pStatYear_pitch_stat").val();
			var inn = $("#inn_pitch_stat").val();
			var w = $("#w_pitch_stat").val();

			var l = $("#l_pitch_stat").val();
			var era = $("#era_pitch_stat").val();
			var g = $("#g_pitch_stat").val();
			var gs = $("#gs_pitch_stat").val();

			var sv = $("#sv_pitch_stat").val();
			var svo = $("#svo_pitch_stat").val();
			var ip = $("#ip_pitch_stat").val();
			var h = $("#h_pitch_stat").val();

			var r = $("#r_pitch_stat").val();
			var er = $("#er_pitch_stat").val();
			var hr = $("#hr_pitch_stat").val();
			var bb = $("#bb_pitch_stat").val();

			var so = $("#so_pitch_stat").val();
			var avg = $("#avg_pitch_stat").val();
			var whip = $("#whip_pitch_stat").val();
			var k = $("#k_pitch_stat").val();

			if (isEmpty(teamName)) {
				alert('There is no Team Name');
				return false;
			}
			
			var rowCount = $(".pitcher_tr").size();
			if(rowCount >= 10){
				alert('you can add your stats until 10 rows.');
				return false;
			}else{
				var addPitcherHtml = '<tr id=\"pitcher_tr_"+ rowCount +"\" class=\"pitcher_tr\">';
					addPitcherHtml += '<td><input type=\"hidden\" 		class=\"form-control\" id=\"pTeamName_"+ rowCount +"\" name=\"profileStatPitcherList[' + rowCount + '].pTeamName\" value=\"' + teamName +'\"/>' + teamName + '</td>';
					addPitcherHtml += '<td><input type=\"hidden\" 		class=\"form-control\" id=\"pStatYear_"+ rowCount +"\" name=\"profileStatPitcherList[' + rowCount + '].pStatYear\" value=\"' + statYear +'\"/>' + statYear + '</td>';
					addPitcherHtml += '<td><input type=\"hidden\" 		class=\"form-control\" id=\"inn_"+ rowCount +"\" 		name=\"profileStatPitcherList[' + rowCount + '].inn\" value=\"' + inn +'\"/>' + inn + '</td>';
					addPitcherHtml += '<td><input type=\"hidden\" 		class=\"form-control\" id=\"w_"+ rowCount +"\" 		name=\"profileStatPitcherList[' + rowCount + '].w\" value=\"' + w +'\"/>' + w + '</td>';
					addPitcherHtml += '<td><input type=\"hidden\" 		class=\"form-control\" id=\"l_"+ rowCount +"\" 		name=\"profileStatPitcherList[' + rowCount + '].l\" value=\"' + l +'\"/>' + l + '</td>';
					addPitcherHtml += '<td><input type=\"hidden\" 		class=\"form-control\" id=\"era_"+ rowCount +"\" 		name=\"profileStatPitcherList[' + rowCount + '].era\" value=\"' + era +'\"/>' + era + '</td>';
					addPitcherHtml += '<td><input type=\"hidden\" 		class=\"form-control\" id=\"g_"+ rowCount +"\" 		name=\"profileStatPitcherList[' + rowCount + '].g\" value=\"' + g +'\"/>' + g + '</td>';
					addPitcherHtml += '<td><input type=\"hidden\" 		class=\"form-control\" id=\"gs_"+ rowCount +"\" 		name=\"profileStatPitcherList[' + rowCount + '].gs\" value=\"' + gs +'\"/>' + gs + '</td>';
					addPitcherHtml += '<td><input type=\"hidden\" 		class=\"form-control\" id=\"sv_"+ rowCount +"\" 		name=\"profileStatPitcherList[' + rowCount + '].sv\" value=\"' + sv +'\"/>' + sv + '</td>';
					addPitcherHtml += '<td><input type=\"hidden\"		class=\"form-control\" id=\"svo_"+ rowCount +"\" 		name=\"profileStatPitcherList[' + rowCount + '].svo\" value=\"' + svo +'\"/>' + svo + '</td>';
					addPitcherHtml += '<td><input type=\"hidden\" 		class=\"form-control\" id=\"ip_"+ rowCount +"\" 		name=\"profileStatPitcherList[' + rowCount + '].ip\" value=\"' + ip +'\"/>' + ip + '</td>';
					addPitcherHtml += '<td><input type=\"hidden\" 		class=\"form-control\" id=\"h_"+ rowCount +"\" 		name=\"profileStatPitcherList[' + rowCount + '].h\" value=\"' + h +'\"/>' + h + '</td>';
					addPitcherHtml += '<td><input type=\"hidden\" 		class=\"form-control\" id=\"r_"+ rowCount +"\" 		name=\"profileStatPitcherList[' + rowCount + '].r\" value=\"' + r +'\"/>' + r + '</td>';
					addPitcherHtml += '<td><input type=\"hidden\" 		class=\"form-control\" id=\"er_"+ rowCount +"\" 		name=\"profileStatPitcherList[' + rowCount + '].er\" value=\"' + er +'\"/>' + er + '</td>';
					addPitcherHtml += '<td><input type=\"hidden\" 		class=\"form-control\" id=\"hr_"+ rowCount +"\" 		name=\"profileStatPitcherList[' + rowCount + '].hr\" value=\"' + hr +'\"/>' + hr + '</td>';
					addPitcherHtml += '<td><input type=\"hidden\" 		class=\"form-control\" id=\"bb_"+ rowCount +"\" 		name=\"profileStatPitcherList[' + rowCount + '].bb\" value=\"' + bb +'\"/>' + bb + '</td>';
					addPitcherHtml += '<td><input type=\"hidden\" 		class=\"form-control\" id=\"so_"+ rowCount +"\" 		name=\"profileStatPitcherList[' + rowCount + '].so\" value=\"' + so +'\"/>' + so + '</td>';
					addPitcherHtml += '<td><input type=\"hidden\" 		class=\"form-control\" id=\"avg_"+ rowCount +"\" 		name=\"profileStatPitcherList[' + rowCount + '].avg\" value=\"' + avg +'\"/>' + avg + '</td>';
					addPitcherHtml += '<td><input type=\"hidden\" 		class=\"form-control\" id=\"whip_"+ rowCount +"\" 		name=\"profileStatPitcherList[' + rowCount + '].whip\" value=\"' + whip +'\"/>' + whip + '</td>';
					addPitcherHtml += '<td><input type=\"hidden\" 		class=\"form-control\" id=\"k_"+ rowCount +"\" 		name=\"profileStatPitcherList[' + rowCount + '].k\" value=\"' + k +'\"/>' + k + '</td>';
					addPitcherHtml += '<td><input type=\"button\" 		class=\"btn btn-default removePitcherBtn\" value=\"-\"/></td>';
				addPitcherHtml += '</tr>';
			
				$(".tablePitcherStat > tbody:last").append(addPitcherHtml);				
			}
			
		});	
		
		// hitter stat row adding
		$(".addHitterBtn").click(function(){
			
			var teamName = $("#hTeamName_hit_stat").val();
			var statYear = $("#hStatYear_hit_stat").val();
			var g = $("#g_hit_stat").val();
			var ab = $("#ab_hit_stat").val();

			var r = $("#r_hit_stat").val();
			var h = $("#h_hit_stat").val();
			var twoB = $("#twoB_hit_stat").val();
			var threeB = $("#threeB_hit_stat").val();

			var hr = $("#hr_hit_stat").val();
			var rbi = $("#rbi_hit_stat").val();
			var bb = $("#bb_hit_stat").val();
			var so = $("#so_hit_stat").val();
			
			var sb = $("#sb_hit_stat").val();
			var cs = $("#cs_hit_stat").val();
			var avg = $("#avg_hit_stat").val();
			var obp = $("#obp_hit_stat").val();
			
			var slg = $("#slg_hit_stat").val();
			var ops = $("#ops_hit_stat").val();


			if (isEmpty(teamName)) {
				alert('There is no Team Name');
				return false;
			}			
			
			var rowCount = $(".hitter_tr").size();
			if(rowCount >= 10){
				alert('you can add your stats until 10 rows.');
				return false;
			}else{
				var addHitterHtml = "<tr id=\"hitter_tr_"+ rowCount +"\" class=\"hitter_tr\">";
				addHitterHtml += "<td><input type=\"hidden\" 			class=\"form-control\" id=\"hTeamName_"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].hTeamName\" value=\""+ teamName +"\"  />" + teamName + "</td>";
				addHitterHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"hStatYear_"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].hStatYear\" value=\""+ statYear +"\" />" + statYear + "</td>";
				addHitterHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"g"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].g\" value=\""+ g +"\" />" + g + "</td>";
				addHitterHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"ab"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].ab\" value=\""+ ab +"\" />" + ab + "</td>";
				addHitterHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"r"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].r\" value=\""+ r +"\" />" + r + "</td>";
				addHitterHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"h"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].h\" value=\""+ h +"\" />" + h + "</td>";
				addHitterHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"twoB"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].twoB\" value=\""+ twoB +"\" />" + twoB + "</td>";
				addHitterHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"threeB"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].threeB\" value=\""+ threeB +"\" />" + threeB + "</td>";
				addHitterHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"hr"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].hr\" value=\""+ hr +"\" />" + hr + "</td>";
				addHitterHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"rbi"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].rbi\" value=\""+ rbi +"\" />" + rbi + "</td>";
				addHitterHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"bb"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].bb\" value=\""+ bb +"\" />" + bb + "</td>";
				addHitterHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"so"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].so\" value=\""+ so +"\" />" + so + "</td>";
				addHitterHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"sb"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].sb\" value=\""+ sb +"\" />" + sb + "</td>";
				addHitterHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"cs"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].cs\" value=\""+ cs +"\" />" + cs + "</td>";
				addHitterHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"avg"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].avg\" value=\""+ avg +"\" />" + avg + "</td>";
				addHitterHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"obp"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].obp\" value=\""+ obp +"\" />" + obp + "</td>";
				addHitterHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"slg"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].slg\" value=\""+ slg +"\" />" + slg + "</td>";
				addHitterHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"ops"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].ops\" value=\""+ ops +"\" />" + ops + "</td>";
				addHitterHtml += "<td><input type=\"button\" 		class=\"btn btn-default removeHitterBtn\" value=\"-\"/></td>";
				addHitterHtml += "</tr>";
				$(".tableHitterStat > tbody:last").append(addHitterHtml);	
			}	
		});
		
		// fielder stat row adding
		$(".addFielderBtn").click(function(){
			
			var teamName = $("#fTeamName_field_stat").val();
			var statYear = $("#fStatYear_field_stat").val();
			var pos = $("#pos_field_stat").val();
			var g = $("#g_field_stat").val();

			var gs = $("#gs_field_stat").val();
			var inn = $("#inn_field_stat").val();
			var tc = $("#tc_field_stat").val();
			var po = $("#po_field_stat").val();

			var a = $("#a_field_stat").val();
			var e = $("#e_field_stat").val();
			var dp = $("#dp_field_stat").val();
			var sb = $("#sb_field_stat").val();
			
			var cs = $("#cs_field_stat").val();
			var sbpct = $("#sbpct_field_stat").val();

			var pb = $("#pb_field_stat").val();
			var cwp = $("#cwp_field_stat").val();
			
			var fpct = $("#fpct_field_stat").val();
			var rf = $("#rf_field_stat").val();


			if (isEmpty(teamName)) {
				alert('There is no Team Name');
				return false;
			}
			
			var rowCount = $(".fielder_tr").size();
			if(rowCount >= 10){
				alert('you can add your stats until 10 rows.');
				return false;
			}else{
				var addFielderHtml = "<tr id=\"fielder_tr_"+ rowCount +"\" class=\"fielder_tr\">";
				addFielderHtml += "<th class=\"row\"><input type=\"hidden\" 		class=\"form-control\" id=\"fTeamName\" 		name=\"profileStatFielderList[" + rowCount + "].fTeamName\" value=\""+ teamName +"\" />" + teamName + "</th>";								
				addFielderHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"fStatYear\" 		name=\"profileStatFielderList[" + rowCount + "].fStatYear\" value=\""+ statYear +"\" />" + statYear + "</td>";
				addFielderHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"pos\" 		name=\"profileStatFielderList[" + rowCount + "].pos\" value=\""+ pos +"\" />" + pos + "</td>";
				addFielderHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"g\" 		name=\"profileStatFielderList[" + rowCount + "].g\" value=\""+ g +"\" />" + g + "</td>";
				addFielderHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"gs\" 		name=\"profileStatFielderList[" + rowCount + "].gs\" value=\""+ gs +"\" />" + gs + "</td>";
				addFielderHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"inn\" 		name=\"profileStatFielderList[" + rowCount + "].inn\" value=\""+ inn +"\" />" + inn + "</td>";
				addFielderHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"tc\" 		name=\"profileStatFielderList[" + rowCount + "].tc\" value=\""+ tc +"\" />" + tc + "</td>";
				addFielderHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"po\" 		name=\"profileStatFielderList[" + rowCount + "].po\" value=\""+ po +"\" />" + po + "</td>";
				addFielderHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"a\" 		name=\"profileStatFielderList[" + rowCount + "].a\" value=\""+ a +"\" />" + a + "</td>";
				addFielderHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"e\" 		name=\"profileStatFielderList[" + rowCount + "].e\" value=\""+ e +"\" />" + e + "</td>";
				addFielderHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"dp\" 		name=\"profileStatFielderList[" + rowCount + "].dp\" value=\""+ dp +"\" />" + dp + "</td>";
				addFielderHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"sb\" 		name=\"profileStatFielderList[" + rowCount + "].sb\" value=\""+ sb +"\" />" + sb + "</td>";
				addFielderHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"cs\" 		name=\"profileStatFielderList[" + rowCount + "].cs\" value=\""+ cs +"\" />" + cs + "</td>";
				addFielderHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"sbpct\" 		name=\"profileStatFielderList[" + rowCount + "].sbpct\" value=\""+ sbpct +"\" />" + sbpct + "</td>";
				addFielderHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"pb\" 		name=\"profileStatFielderList[" + rowCount + "].pb\" value=\""+ pb +"\" />" + pb + "</td>";
				addFielderHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"cWp\" 		name=\"profileStatFielderList[" + rowCount + "].cWp\" value=\""+ cwp +"\" />" + cwp + "</td>";
				addFielderHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"fpct\" 		name=\"profileStatFielderList[" + rowCount + "].fpct\" value=\""+ fpct +"\" />" + fpct + "</td>";
				addFielderHtml += "<td><input type=\"hidden\" 		class=\"form-control\" id=\"rf\" 		name=\"profileStatFielderList[" + rowCount + "].rf\" value=\""+ rf +"\" />" + rf + "</td>";
				addFielderHtml += "<td><input type=\"button\" 		class=\"btn btn-default removeFielderBtn\" value=\"-\"/></td>";
				addFielderHtml += "</tr>";
				$(".tableFielderStat > tbody:last").append(addFielderHtml);	
			}	
			
		});	
		
		// youtube searching
		$("#searchMyYoutube").click(function(){
			if (!isEmpty($("#searchYoutubeKeyword").val())) {
				$("#youtubeListDiv").load("/api/youtube/streamList", {"keyword" : $("#searchYoutubeKeyword").val(), "type" : "select"});				
			} else {
				alert("There is no keyword.");
                $("#searchYoutubeKeyword").focus();
				return false;
			}
		});
		
		$("body").on("click", ".deleteStream", function(){
			$(this).parent().parent().get(0).remove();
		});

		$("#profileImg").bind("change", function() {
			alert('profile image upload');
            // 썸네일 파일 업로드 할 때 저장
			if (!isEmpty($(this).val())) {

                var imgData = new FormData($("#uploadFrm")[0]);
				// imgData.append("profileImg", $("#profileImg")[0].files[0]);
                $.ajax({
                    type : "POST",
                    enctype: 'multipart/form-data',
                    url : "/profile/uploadImage",
                    data : imgData,
                    processData : false,
                    contentType : false,
                    cache : false,
                    success : function (data) {
						$("#profileImgPath").val(data);
                    }, error : function (e) {
                        /*console.log(e);*/
                    }
                });

				/*var frm = $("#actionFrm");
				 frm.attr("action", '/profile/uploadImage');
				 frm.attr("method", "post");
				 frm.ajaxForm(FileuploadCallback);
				 frm.submit();*/
			}
        });
		
	});	
	
	function hideDiv(type){
		$("#"+type+"Div").hide();
	}

	var regexEmail = /([a-z0-9_\ .-]+)@([/da-z\ .-]+)\ .([a-z\ .]{2,6})/;
	var regexName =  /^[a-z0-9_-]{3,16}&/;
	var regexDecimalPoint = /^[-]?\d+(?:[.]\d+)?$/;

