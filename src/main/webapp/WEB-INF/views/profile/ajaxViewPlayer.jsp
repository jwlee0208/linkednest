<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>
<div style="padding-top:20px;"></div>
<div class="form-group row">
	<div class="col-sm-12">
		<img src="http://jwlee0208.cdn3.cafe24.com/${profileInfo.profileImgPath}" class="img-fluid rounded mx-auto d-block"/>
	</div>
<!-- 	<div class="col-sm-7">
 --><!-- 		<ul class="nav flex-column nav-pills" id="profileTab">
			<li class="nav-item">
				<a class="flex-sm-fill nav-link active" data-toggle="pill" href="#playerInfo">Player Information</a>
			</li>
			<li class="nav-item">
				<a class="flex-sm-fill nav-link" data-toggle="pill" href="#playerAttribute">Player Attribute</a>
			</li>
			<li class="nav-item">
				<a class="flex-sm-fill nav-link" data-toggle="pill" href="#career">Career</a>
			</li>
			<li class="nav-item">
				<a class="flex-sm-fill nav-link" data-toggle="pill" href="#streamList">Play Streamming</a>
			</li>
			<li class="nav-item">
				<a class="flex-sm-fill nav-link" data-toggle="pill" href="#statistic">Statistics</a>
			</li>
			<li class="nav-item">
				<a class="flex-sm-fill nav-link" data-toggle="pill" href="#introduce">Introduce</a>
			</li>
			<li class="nav-item">
				<a class="flex-sm-fill nav-link" data-toggle="pill" href="#contact">Contact</a>
			</li>
		</ul>
 -->	
 <!-- </div> -->
</div>
<ul class="nav nav-tabs flex-column flex-sm-row" id="profileTab" role="tablist">
  <li class="nav-item">
    <a class="flex-sm-fill text-sm-center nav-link active" data-toggle="pill" href="#playerInfo">Player Information</a>
  </li>
  <li class="nav-item">
    <a class="flex-sm-fill text-sm-center nav-link" data-toggle="pill" href="#playerAttribute">Player Attribute</a>
  </li>
  <li class="nav-item">
    <a class="flex-sm-fill text-sm-center nav-link" data-toggle="pill" href="#career">Career</a>
  </li>
  <li class="nav-item">
    <a class="flex-sm-fill text-sm-center nav-link" data-toggle="pill" href="#streamList">Play Streamming</a>
  </li>
  <li class="nav-item">
    <a class="flex-sm-fill text-sm-center nav-link" data-toggle="pill" href="#statistic">Statistics</a>
  </li>
  <li class="nav-item">
    <a class="flex-sm-fill text-sm-center nav-link" data-toggle="pill" href="#introduce">Introduce</a>
  </li>
  <li class="nav-item">
    <a class="flex-sm-fill text-sm-center nav-link" data-toggle="pill" href="#contact">Contact</a>
  </li>
</ul>
<br/>
<div class="tab-content">
	<div id="playerInfo" class="tab-pane active" role="tabpanel">
		<%--<h3><span class="glyphicon glyphicon-user" aria-hidden="true"></span>#&nbsp;&nbsp;<tag:message code="text.personalinfo"/></h3>
		<hr/>	--%>
		<h3/>Player Information</h3>
		<hr/>
		<div class="form-group row">
			<label for="" class="col-sm-2 col-form-label"><tag:message code="text.player.name"/></label>
			<div class="col-sm-10">
				<p class="form-control-static">${profileInfo.name}</p>
			</div>
		</div>
		<div class="form-group row">
			<label for="" class="col-sm-2 col-form-label"><tag:message code="text.height"/> / <tag:message code="text.weight"/></label>
			<div class="col-sm-10">
				<p class="form-control-static">${profileInfo.profilePlayerDto.height}&nbsp;cm (${profileInfo.profilePlayerDto.heightAsFeet} feet) / ${profileInfo.profilePlayerDto.weight}&nbsp;kg (${profileInfo.profilePlayerDto.weightAsFound} found)</p>
			</div>
		</div>

		<div class="form-group row">
			<label for="" class="col-sm-2 col-form-label"><tag:message code="text.dateofbirth"/></label>
			<div class="col-sm-10">
				<p class="form-control-static">${fn:substring(profileInfo.profilePlayerDto.birthDate,0,10)}</p>
			</div>
		</div>

		<div class="form-group row">
			<label for="" class="col-sm-2 col-form-label"><tag:message code="text.birthplace"/></label>
			<div class="col-sm-10">
				<p class="form-control-static">${profileInfo.profilePlayerDto.birthPlace}</p>
			</div>
		</div>
		<div class="form-group row">
			<label for="" class="col-sm-2 col-form-label"><tag:message code="text.education"/></label>
			<div class="col-sm-10">
				<p class="form-control-static">${profileInfo.profilePlayerDto.education}</p>
			</div>
		</div>
		<%--<div class="form-group row">
			<label for="" class="col-sm-2 col-form-label"><tag:message code="text.hobbies"/></label>
			<div class="col-sm-10">
				<p class="form-control-static">${profileInfo.profilePlayerDto.hobbies}</p>
			</div>
		</div>
		<div class="form-group row">
			<label for="" class="col-sm-2 col-form-label"><tag:message code="text.favoritefood"/></label>
			<div class="col-sm-10">
				<p class="form-control-static">${profileInfo.profilePlayerDto.favoriteFood}</p>
			</div>
		</div>--%>
		<div class="form-group row">
			<label for="" class="col-sm-2 col-form-label"><tag:message code="text.nationality"/></label>
			<div class="col-sm-10">
				<p class="form-control-static">
					<c:if test="${profileInfo.profilePlayerDto.nationality ne null && profileInfo.profilePlayerDto.nationality ne ''}">
						<tag:message code="code.country.${profileInfo.profilePlayerDto.nationality}"/>
					</c:if>
				</p>
			</div>
		</div>
		<div class="form-group row">
			<label for="" class="col-sm-2 col-form-label"><tag:message code="text.language"/></label>
			<div class="col-sm-10">
				<p class="form-control-static">
					<c:if test="${profileInfo.profilePlayerDto.language ne null && profileInfo.profilePlayerDto.language ne ''}">
						<tag:message code="code.language.${profileInfo.profilePlayerDto.language}"/>
					</c:if>
				</p>
			</div>
		</div>
		<div class="form-group row">
			<label for="" class="col-sm-2 col-form-label">Status</label>
			<div class="col-sm-10">
				<p class="form-control-static">
					<a class="btn btn-info">${profileInfo.status}</a>
				</p>
			</div>
		</div>
	</div>
	<div id="playerAttribute" class="tab-pane" role="tabpanel">
		<h3/>Player Attributes</h3>
		<hr/>
		<%--<h3><span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span>#&nbsp;&nbsp;<tag:message code="text.playerattr"/></h3>
		<hr/>--%>
		<c:set var="profileAttrList" value="${profileInfo.profileAttrList}"/>

		<c:if test="${!empty profileAttrList}">
			<c:forEach var="profileAttrInfo" items="${profileAttrList}">
				<div class="form-group row">
					<label for="" class="col-sm-2 col-form-label"><tag:message code="text.${profileAttrInfo.profileAttrName}"/></label>
					<c:if test="${!empty profileAttrInfo.profileAttrElementMapList}">
						<div class="col-sm-10">
							<c:forEach var="profileAttrElemInfo" items="${profileAttrInfo.profileAttrElementMapList}">
								<c:choose>
									<c:when test="${profileAttrElemInfo.profileAttrElementName ne null}">
										<p class="form-control-static"><tag:message code="attr.${profileAttrInfo.profileAttrName}.${profileAttrElemInfo.profileAttrElementName}"/></p>
									</c:when>
									<c:otherwise>
										<p class="form-control-static">-</p>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</c:if>
				</div>
			</c:forEach>
		</c:if>
		<div class="form-group row">
			<label for="" class="col-sm-2 col-form-label">Main <tag:message code="text.position"/></label>
			<div class="col-sm-10">
 				<span class="btn btn-danger"><tag:message code="${profileInfo.catId2Val}"/></span>
			</div>
		</div>
	</div>
	<div id="career" class="tab-pane" role="tabpanel">
		<h3/>Career</h3>
		<hr/>	
		<c:set var="profileCareerList" value="${profileInfo.profileCareerList}"/>
		<c:if test="${!empty profileCareerList}">
			<%--<h3><span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span>#&nbsp;&nbsp;<tag:message code="text.career"/></h3>
            <hr/>--%>
			<table class="table table-bordered table-hover">
				<thead class="">
				<tr>
					<th>Title</th>
					<th>Description</th>
					<th>Start Date</th>
					<th>End Date</th>
					<!-- 						<th>Status</th> -->
					<!-- 						<th>Seq</th> -->
				</tr>
				</thead>
				<tbody>
				<c:forEach var="profileCareerInfo" items="${profileCareerList}">
					<tr>
						<th><p class="form-control-static">${profileCareerInfo.careerTitle}</p></th>
						<td><p class="form-control-static">${profileCareerInfo.careerDescription}</p></td>
						<td><p class="form-control-static">${profileCareerInfo.startDate}</p></td>
						<td><p class="form-control-static">${profileCareerInfo.endDate}</p></td>
							<%-- 		    			<td><p class="form-control-static">${profileCareerInfo.careerStatus}</p></td> --%>
							<%-- 		    			<td><p class="form-control-static">${profileCareerInfo.careerSeq}</p></td> --%>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
	<div id="streamList" class="tab-pane" role="tabpanel">
		<h3/>Play Streamming</h3>
		<hr/>	
		<c:set var="profileStreamList" value="${profileInfo.profileStreamList}"/>
		<c:if test="${!empty profileStreamList}">
			<%--<h3><span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span>#&nbsp;&nbsp;<tag:message code="text.playstream"/></h3>
            <hr/>--%>
			<c:forEach var="profileStreamInfo" items="${profileStreamList}">
				<h3><small>${profileStreamInfo.streamTitle}</small></h3>
				<div class="embed-responsive embed-responsive-16by9">${profileStreamInfo.streamUrl}</div>
			</c:forEach>
		</c:if>
	</div>
	<c:set var="profileStatPitcherList" value="${profileInfo.profileStatPitcherList}"/>
	<c:set var="profileStatHitterList" 	value="${profileInfo.profileStatHitterList}"/>
	<c:set var="profileStatFielderList" value="${profileInfo.profileStatFielderList}"/>
	<c:set var="profileStatFbGkList"	value="${profileInfo.profileStatFbGkList}"/>

	<div id="statistic" class="tab-pane" role="tabpanel">
		<h3>Statistics</h3>
		<hr/>		
		<c:if test="${!empty profileStatPitcherList || !empty profileStatHitterList || !empty profileStatFielderList || !empty profileStatFbGkList}">
			<%--<h3><span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span>#&nbsp;<tag:message code="text.stats"/></h3>
            <hr/>	--%>

			<c:if test="${!empty profileStatPitcherList}">
				<h3><small><tag:message code="text.pitching.stat"/></small></h3>

				<table class="table table-bordered table-hover">
					<thead class="">
					<tr>
						<th>Team</th>
						<th>Year</th>
						<th>INN</th>
						<th>W</th>
						<th>L</th>
						<th>ERA</th>
						<th>G</th>
						<th>GS</th>
						<th>SV</th>
						<th>SVO</th>
						<th>IP</th>
						<th>H</th>
						<th>R</th>
						<th>ER</th>
						<th>HR</th>
						<th>BB</th>
						<th>SO</th>
						<th>AVG</th>
						<th>WHIP</th>
						<th>K</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="profileStatPitcherInfo" items="${profileStatPitcherList}">
						<tr>
							<td><p class="form-control-static">${profileStatPitcherInfo.pTeamName}</p></td>
							<td><p class="form-control-static">${profileStatPitcherInfo.pStatYear}</p></td>
							<td><p class="form-control-static">${profileStatPitcherInfo.inn}</p></td>
							<td><p class="form-control-static">${profileStatPitcherInfo.w}</p></td>
							<td><p class="form-control-static">${profileStatPitcherInfo.l}</p></td>
							<td><p class="form-control-static">${profileStatPitcherInfo.era}</p></td>
							<td><p class="form-control-static">${profileStatPitcherInfo.g}</p></td>
							<td><p class="form-control-static">${profileStatPitcherInfo.gs}</p></td>
							<td><p class="form-control-static">${profileStatPitcherInfo.sv}</p></td>
							<td><p class="form-control-static">${profileStatPitcherInfo.svo}</p></td>
							<td><p class="form-control-static">${profileStatPitcherInfo.ip}</p></td>
							<td><p class="form-control-static">${profileStatPitcherInfo.h}</p></td>
							<td><p class="form-control-static">${profileStatPitcherInfo.r}</p></td>
							<td><p class="form-control-static">${profileStatPitcherInfo.er}</p></td>
							<td><p class="form-control-static">${profileStatPitcherInfo.hr}</p></td>
							<td><p class="form-control-static">${profileStatPitcherInfo.bb}</p></td>
							<td><p class="form-control-static">${profileStatPitcherInfo.so}</p></td>
							<td><p class="form-control-static">${profileStatPitcherInfo.avg}</p></td>
							<td><p class="form-control-static">${profileStatPitcherInfo.whip}</p></td>
							<td><p class="form-control-static">${profileStatPitcherInfo.k}</p></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>

			</c:if>
			<c:if test="${!empty profileStatHitterList}">
				<h3><small><tag:message code="text.hitting.stat"/></small></h3>
				<table class="table table-bordered table-hover">
					<thead class="">
					<tr>
						<th>Team</th>
						<th>Year</th>
						<th>G</th>
						<th>AB</th>
						<th>R</th>
						<th>H</th>
						<th>2B</th>
						<th>3B</th>
						<th>HR</th>
						<th>RBI</th>
						<th>BB</th>
						<th>SO</th>
						<th>SB</th>
						<th>CS</th>
						<th>AVG</th>
						<th>OBP</th>
						<th>SLG</th>
						<th>OPS</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="profileStatHitterInfo" items="${profileStatHitterList}">
						<tr>
							<td><p class="form-control-static">${profileStatHitterInfo.hTeamName}</p></td>
							<td><p class="form-control-static">${profileStatHitterInfo.hStatYear}</p></td>
							<td><p class="form-control-static">${profileStatHitterInfo.g}</p></td>
							<td><p class="form-control-static">${profileStatHitterInfo.ab}</p></td>
							<td><p class="form-control-static">${profileStatHitterInfo.r}</p></td>
							<td><p class="form-control-static">${profileStatHitterInfo.h}</p></td>
							<td><p class="form-control-static">${profileStatHitterInfo.twoB}</p></td>
							<td><p class="form-control-static">${profileStatHitterInfo.threeB}</p></td>
							<td><p class="form-control-static">${profileStatHitterInfo.hr}</p></td>
							<td><p class="form-control-static">${profileStatHitterInfo.rbi}</p></td>
							<td><p class="form-control-static">${profileStatHitterInfo.bb}</p></td>
							<td><p class="form-control-static">${profileStatHitterInfo.so}</p></td>
							<td><p class="form-control-static">${profileStatHitterInfo.sb}</p></td>
							<td><p class="form-control-static">${profileStatHitterInfo.cs}</p></td>
							<td><p class="form-control-static">${profileStatHitterInfo.avg}</p></td>
							<td><p class="form-control-static">${profileStatHitterInfo.obp}</p></td>
							<td><p class="form-control-static">${profileStatHitterInfo.slg}</p></td>
							<td><p class="form-control-static">${profileStatHitterInfo.ops}</p></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</c:if>
			<c:if test="${!empty profileStatFielderList}">
				<h3><small><tag:message code="text.fielding.stat"/></small></h3>
				<table class="table table-bordered table-hover">
					<thead class="">
					<tr>
						<th>Team</th>
						<th>Year</th>
						<th>Position</th>
						<th>G</th>
						<th>GS</th>
						<th>INN</th>
						<th>TC</th>
						<th>PO</th>
						<th>A</th>
						<th>E</th>
						<th>DP</th>
						<th>SB</th>
						<th>CS</th>
						<th>SBPCT</th>
						<th>PB</th>
						<th>C_WP</th>
						<th>FPCT</th>
						<th>PRF</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="profileStatFielderInfo" items="${profileStatFielderList}">
						<tr>
							<th><p class="form-control-static">${profileStatFielderInfo.fTeamName}</p></th>
							<td><p class="form-control-static">${profileStatFielderInfo.fStatYear}</p></td>
							<td><p class="form-control-static">${profileStatFielderInfo.pos}</p>
							<td><p class="form-control-static">${profileStatFielderInfo.g}</p>
							<td><p class="form-control-static">${profileStatFielderInfo.gs}</p>
							<td><p class="form-control-static">${profileStatFielderInfo.inn}</p>
							<td><p class="form-control-static">${profileStatFielderInfo.tc}</p>
							<td><p class="form-control-static">${profileStatFielderInfo.po}</p>
							<td><p class="form-control-static">${profileStatFielderInfo.a}</p>
							<td><p class="form-control-static">${profileStatFielderInfo.e}</p>
							<td><p class="form-control-static">${profileStatFielderInfo.dp}</p>
							<td><p class="form-control-static">${profileStatFielderInfo.sb}</p>
							<td><p class="form-control-static">${profileStatFielderInfo.cs}</p>
							<td><p class="form-control-static">${profileStatFielderInfo.sbpct}</p>
							<td><p class="form-control-static">${profileStatFielderInfo.pb}</p>
							<td><p class="form-control-static">${profileStatFielderInfo.cWp}</p>
							<td><p class="form-control-static">${profileStatFielderInfo.fpct}</p>
							<td><p class="form-control-static">${profileStatFielderInfo.rf}</p>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</c:if>
			<c:if test="${!empty profileStatFbGkList}">
				<h3><small>GK Stats</small></h3>

				<table class="table table-bordered table-hover">
					<thead class="">
					<tr>
						<th>Team</th>
						<th>Year</th>
						<th>MP</th>
						<th>Starts</th>
						<th>MIN</th>
						<th>90S</th>
						<th>GA</th>
						<th>GA90</th>
						<th>Save%</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="profileStatFbGkInfo" items="${profileStatFbGkList}">
						<tr>
							<td><p class="form-control-static">${profileStatFbGkInfo.teamName}</p></td>
							<td><p class="form-control-static">${profileStatFbGkInfo.year}</p></td>
							<td><p class="form-control-static">${profileStatFbGkInfo.mp}</p></td>
							<td><p class="form-control-static">${profileStatFbGkInfo.starts}</p></td>
							<td><p class="form-control-static">${profileStatFbGkInfo.min}</p></td>
							<td><p class="form-control-static">${profileStatFbGkInfo.ninetyS}</p></td>
							<td><p class="form-control-static">${profileStatFbGkInfo.ga}</p></td>
							<td><p class="form-control-static">${profileStatFbGkInfo.ga90}</p></td>
							<td><p class="form-control-static">${profileStatFbGkInfo.savePercent}</p></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>

			</c:if>			
		</c:if>
	</div>
