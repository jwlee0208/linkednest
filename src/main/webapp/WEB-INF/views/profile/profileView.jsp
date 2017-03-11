<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-validate.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>

<script type="text/javascript"	src="${pageContext.request.contextPath}/js/holder.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>

<style type="text/css">
	.form-group .col-sm-10 {vertical-align : middle;}
</style>
<div class="container">
	<form id="viewFrm" name="viewFrm" method="post" class="form-horizontal" role="form">
		<input type="hidden" id="profileId" 	name="profileId" value="${profileInfo.profileId}"/>
		<div style="display:none;"><h2>${profileInfo.title}&nbsp;<small>Profile</small></h2></div>
		
<c:choose>
	<c:when test="${profileInfo.profileType eq 1}">

	<div style="padding-top:20px;"></div>	
	<h3><span class="glyphicon glyphicon-user" aria-hidden="true"></span>#&nbsp;&nbsp;<tag:message code="text.personalinfo"/></h3>
	<hr/>

	<div class="form-group row">
		<div class="col-sm-5">
			<img src="http://jwlee0208.cdn3.cafe24.com/${profileInfo.profileImgPath}" class="img-fluid rounded mx-auto d-block"/>
		</div>	
		<div class="col-sm-7">
	  	<div class="form-group row">
	    	<label for="" class="col-sm-4 col-form-label"><tag:message code="text.player.name"/></label>
		    <div class="col-sm-8">
		    	<p class="form-control-static">${profileInfo.name}</p>
			</div>
		</div>
		  <div class="form-group row">
		    <label for="" class="col-sm-4 col-form-label"><tag:message code="text.height"/> / <tag:message code="text.weight"/></label>
		    <div class="col-sm-8">
		      <p class="form-control-static">${profileInfo.profilePlayerDto.height}&nbsp;cm (${profileInfo.profilePlayerDto.heightAsFeet} feet) / ${profileInfo.profilePlayerDto.weight}&nbsp;kg (${profileInfo.profilePlayerDto.weightAsFound} found)</p>
		    </div>
		  </div>

		  <div class="form-group row">
		    <label for="" class="col-sm-4 col-form-label"><tag:message code="text.dateofbirth"/></label>
		    <div class="col-sm-8">
		      <p class="form-control-static">${fn:substring(profileInfo.profilePlayerDto.birthDate,0,10)}</p>
		    </div>
		  </div>

		  <div class="form-group row">
		    <label for="" class="col-sm-4 col-form-label"><tag:message code="text.birthplace"/></label>
		    <div class="col-sm-8">
		      <p class="form-control-static">${profileInfo.profilePlayerDto.birthPlace}</p>
		    </div>
		  </div>	
			<div class="form-group row">
			    <label for="" class="col-sm-4 col-form-label"><tag:message code="text.education"/></label>
			    <div class="col-sm-8">
			    	<p class="form-control-static">${profileInfo.profilePlayerDto.education}</p>
				</div>
			</div>	
			<div class="form-group row">
			    <label for="" class="col-sm-4 col-form-label"><tag:message code="text.hobbies"/></label>
			    <div class="col-sm-8">
			    	<p class="form-control-static">${profileInfo.profilePlayerDto.hobbies}</p>
				</div>
			</div>					
			<div class="form-group row">
			    <label for="" class="col-sm-4 col-form-label"><tag:message code="text.favoritefood"/></label>
			    <div class="col-sm-8">
				    <p class="form-control-static">${profileInfo.profilePlayerDto.favoriteFood}</p>	    
			    </div>
			</div>	
			<div class="form-group row">
			    <label for="" class="col-sm-4 col-form-label"><tag:message code="text.nationality"/></label>
				<div class="col-sm-8">
				    <p class="form-control-static">
				    <c:if test="${profileInfo.profilePlayerDto.nationality ne null && profileInfo.profilePlayerDto.nationality ne ''}">
				    <tag:message code="code.country.${profileInfo.profilePlayerDto.nationality}"/>
				    </c:if>
				    </p>
				</div>    
			</div>	
			<div class="form-group row">
			    <label for="" class="col-sm-4 col-form-label"><tag:message code="text.language"/></label>
			    <div class="col-sm-8">
				    <p class="form-control-static">
				    	<c:if test="${profileInfo.profilePlayerDto.language ne null && profileInfo.profilePlayerDto.language ne ''}">
				    	<tag:message code="code.language.${profileInfo.profilePlayerDto.language}"/>	
				    	</c:if>
				    </p>
				</div>
			</div>		

		</div>
		
	</div>	
	
		<h3><span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span>#&nbsp;&nbsp;<tag:message code="text.playerattr"/></h3>
		<hr/>
		<c:set var="profileAttrList" value="${profileInfo.profileAttrList}"/>
		<c:if test="${!empty profileAttrList}">
			<c:forEach var="profileAttrInfo" items="${profileAttrList}">
		<div class="form-group row">
	    	<label for="" class="col-sm-2 col-form-label"><tag:message code="text.${profileAttrInfo.profileAttrName}"/></label>
	    	<c:if test="${!empty profileAttrInfo.profileAttrElementMapList}">
		    <div class="col-sm-10">
	    		<c:forEach var="profileAttrElemInfo" items="${profileAttrInfo.profileAttrElementMapList}">
	    		<p class="form-control-static"><tag:message code="attr.${profileAttrInfo.profileAttrName}.${profileAttrElemInfo.profileAttrElementName}"/></p>
	    		</c:forEach>
	    	</div>	
	    	</c:if>	
		</div>
			</c:forEach>	
			
		</c:if>
		<div class="form-group row">
			<label for="" class="col-sm-2 col-form-label">Main <tag:message code="text.position"/></label>
			<div class="col-sm-10">
					<span class="btn btn-danger">
					<c:if test="${profileInfo.catId2 eq '01010101'}"><tag:message code="attr.position.p"/></c:if>
					<c:if test="${profileInfo.catId2 eq '01010102'}"><tag:message code="attr.position.cc"/></c:if>
					<c:if test="${profileInfo.catId2 eq '01010103'}"><tag:message code="attr.position.1b"/></c:if>
					<c:if test="${profileInfo.catId2 eq '01010104'}"><tag:message code="attr.position.2b"/></c:if>
					<c:if test="${profileInfo.catId2 eq '01010105'}"><tag:message code="attr.position.3b"/></c:if>
					<c:if test="${profileInfo.catId2 eq '01010106'}"><tag:message code="attr.position.ss"/></c:if>
					<c:if test="${profileInfo.catId2 eq '01010107'}"><tag:message code="attr.position.lf"/></c:if>
					<c:if test="${profileInfo.catId2 eq '01010108'}"><tag:message code="attr.position.cf"/></c:if>
					<c:if test="${profileInfo.catId2 eq '01010109'}"><tag:message code="attr.position.rf"/></c:if>
					<c:if test="${profileInfo.catId2 eq '01010110'}"><tag:message code="attr.position.dh"/></c:if>
					</span>
			</div>
		</div>
		<h3><span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span>#&nbsp;&nbsp;<tag:message code="text.career"/></h3>
		<hr/>
		<c:set var="profileCareerList" value="${profileInfo.profileCareerList}"/>
		<c:if test="${!empty profileCareerList}">
		
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
		<c:set var="profileStreamList" value="${profileInfo.profileStreamList}"/>
		<c:if test="${!empty profileStreamList}">
		<h3><span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span>#&nbsp;&nbsp;<tag:message code="text.playstream"/></h3>
		<hr/>
		<c:forEach var="profileStreamInfo" items="${profileStreamList}">
		<h3><small>${profileStreamInfo.streamTitle}</small></h3>	
		<div class="embed-responsive embed-responsive-16by9">${profileStreamInfo.streamUrl}</div>
		</c:forEach>
		</c:if>

		<c:set var="profileStatPitcherList" value="${profileInfo.profileStatPitcherList}"/>
		<c:set var="profileStatHitterList" value="${profileInfo.profileStatHitterList}"/>
		<c:set var="profileStatFielderList" value="${profileInfo.profileStatFielderList}"/>

	<c:if test="${!empty profileStatPitcherList || !empty profileStatHitterList || !empty profileStatFielderList}">			
		<h3><span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span>#&nbsp;<tag:message code="text.stats"/></h3>
		<hr/>	
				
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
	</c:if>										  
	</c:when>
	<c:when test="${profileInfo.profileType eq 2}">
	<h3><span class="glyphicon glyphicon-user" aria-hidden="true"></span>#&nbsp;&nbsp;<tag:message code="text.personalinfo"/></h3>
	<hr/>

	<div class="form-group row">
		<div class="col-sm-6">
			<img src="http://jwlee0208.cdn3.cafe24.com/${profileInfo.profileImgPath}" class="img-fluid rounded mx-auto d-block"/>
		</div>	
		<div class="col-sm-6">
	  	<div class="form-group row">
	    	<label for="" class="col-sm-5 col-form-label"><tag:message code="text.player.name"/></label>
		    <div class="col-sm-7">
		    	<p class="form-control-static">${profileInfo.name}</p>
			</div>
		</div>
		  <div class="form-group row">
		    <label for="" class="col-sm-5 col-form-label"><tag:message code="text.height"/> / <tag:message code="text.weight"/></label>
		    <div class="col-sm-7">
		      <p class="form-control-static">${profileInfo.profilePlayerDto.height}&nbsp;cm (${profileInfo.profilePlayerDto.heightAsFeet} feet) / ${profileInfo.profilePlayerDto.weight}&nbsp;kg (${profileInfo.profilePlayerDto.weightAsFound} found)</p>
		    </div>
		  </div>

		  <div class="form-group row">
		    <label for="" class="col-sm-5 col-form-label"><tag:message code="text.dateofbirth"/></label>
		    <div class="col-sm-7">
		      <p class="form-control-static">${fn:substring(profileInfo.profilePlayerDto.birthDate,0,10)}</p>
		    </div>
		  </div>

		  <div class="form-group row">
		    <label for="" class="col-sm-5 col-form-label"><tag:message code="text.birthplace"/></label>
		    <div class="col-sm-7">
		      <p class="form-control-static">${profileInfo.profilePlayerDto.birthPlace}</p>
		    </div>
		  </div>	
			<div class="form-group row">
			    <label for="" class="col-sm-5 col-form-label"><tag:message code="text.education"/></label>
			    <div class="col-sm-7">
			    	<p class="form-control-static">${profileInfo.profilePlayerDto.education}</p>
				</div>
			</div>	
			<div class="form-group row">
			    <label for="" class="col-sm-5 col-form-label"><tag:message code="text.hobbies"/></label>
			    <div class="col-sm-7">
			    	<p class="form-control-static">${profileInfo.profilePlayerDto.hobbies}</p>
				</div>
			</div>					
			<div class="form-group row">
			    <label for="" class="col-sm-5 col-form-label"><tag:message code="text.favoritefood"/></label>
			    <div class="col-sm-7">
				    <p class="form-control-static">${profileInfo.profilePlayerDto.favoriteFood}</p>	    
			    </div>
			</div>	
			<div class="form-group row">
			    <label for="" class="col-sm-5 col-form-label"><tag:message code="text.nationality"/></label>
				<div class="col-sm-7">
				    <p class="form-control-static">
				    <c:if test="${profileInfo.profilePlayerDto.nationality ne null && profileInfo.profilePlayerDto.nationality ne ''}">
				    <tag:message code="code.country.${profileInfo.profilePlayerDto.nationality}"/>
				    </c:if>
				    </p>
				</div>    
			</div>	
			<div class="form-group row">
			    <label for="" class="col-sm-5 col-form-label"><tag:message code="text.language"/></label>
			    <div class="col-sm-7">
				    <p class="form-control-static">
				    	<c:if test="${profileInfo.profilePlayerDto.language ne null && profileInfo.profilePlayerDto.language ne ''}">
				    	<tag:message code="code.language.${profileInfo.profilePlayerDto.language}"/>	
				    	</c:if>
				    </p>
				</div>
			</div>		

		</div>
		
	</div>	
		<h3><span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span>#&nbsp;&nbsp;<tag:message code="text.career"/></h3>
		<hr/>
		<c:set var="profileCareerList" value="${profileInfo.profileCareerList}"/>
		<c:if test="${!empty profileCareerList}">
		
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
		<c:set var="profileStreamList" value="${profileInfo.profileStreamList}"/>
		<c:if test="${!empty profileStreamList}">
		<h3><span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span>#&nbsp;&nbsp;<tag:message code="text.playstream"/></h3>
		<hr/>
		<c:forEach var="profileStreamInfo" items="${profileStreamList}">
		<h3><small>${profileStreamInfo.streamTitle}</small></h3>	
		<div class="embed-responsive embed-responsive-16by9">${profileStreamInfo.streamUrl}</div>
		</c:forEach>
		</c:if>
	
	</c:when>
	<c:when test="${profileInfo.profileType eq 3}">
		<h3>#&nbsp;&nbsp;Team Information</h3>
		<hr/>
	  	<div class="form-group row">
	  		<div class="col-sm-6">
				<img src="http://jwlee0208.cdn3.cafe24.com/${profileInfo.profileImgPath}" class="img-fluid rounded mx-auto d-block"/>
			</div>	
			<div class="col-sm-6">
		    	<div class="form-group row">
			    	<label for="" class="col-sm-5 col-form-label"><tag:message code="text.team.name"/></label>
				    <div class="col-sm-7">
				    	<p class="form-control-static">${profileInfo.name}</p>
					</div>
				</div>
			  	<div class="form-group row">
			    	<label for="" class="col-sm-5 col-form-label"><tag:message code="text.team.franchise"/></label>
				    <div class="col-sm-7">
				    	<p class="form-control-static">${profileInfo.profileTeamDto.city}</p>
					</div>
				</div>	
			  	<div class="form-group row">
			    	<label for="" class="col-sm-5 col-form-label"><tag:message code="text.team.eastablish.date"/></label>
				    <div class="col-sm-7">
				    	<p class="form-control-static">${profileInfo.profileTeamDto.establishedDate}</p>
					</div>
				</div>

			</div>
	  		
		</div>
		<h3>#&nbsp;&nbsp;League Information</h3>
		<hr/>
	  	<div class="form-group row">
	    	<label for="" class="col-sm-5 col-form-label"><tag:message code="text.continent"/></label>
		    <div class="col-sm-7">
		    	<p class="form-control-static"><tag:message code="code.area.${profileInfo.leagueInfoDto.area}"/></p>
			</div>
		</div>		
	  	<div class="form-group row">
	    	<label for="" class="col-sm-5 col-form-label"><tag:message code="text.countries"/></label>
		    <div class="col-sm-7">
		    	<p class="form-control-static"><tag:message code="code.country.${profileInfo.leagueInfoDto.country}"/></p>
			</div>
		</div>				
	  	<div class="form-group row">
	    	<label for="" class="col-sm-5 col-form-label"><tag:message code="text.league.name"/></label>
		    <div class="col-sm-7">
		    	<p class="form-control-static">${profileInfo.leagueInfoDto.leagueName}</p>
			</div>
		</div>
	  	<div class="form-group row">
	    	<label for="" class="col-sm-5 col-form-label"><tag:message code="text.league.level"/></label>
		    <div class="col-sm-7">
		    	<p class="form-control-static"><tag:message code="code.leaguetype.${profileInfo.leagueInfoDto.leagueType}"/></p>
			</div>
		</div>
	  	<div class="form-group row">
	    	<label for="" class="col-sm-5 col-form-label"><tag:message code="text.league.division"/></label>
		    <div class="col-sm-7">
		    	<p class="form-control-static">${profileInfo.leagueInfoDto.leagueDivision}</p>
			</div>
		</div>		
					
	</c:when>
</c:choose>		
		
		<h3><span class="glyphicon glyphicon-comment" aria-hidden="true"></span>#&nbsp;&nbsp;<tag:message code="text.introduce"/></h3>
		<hr/>	
		<div class="form-group row">
			<div class="col-sm-12">
			<p class="form-control-static"><c:out value="${profileInfo.introduce}" escapeXml="false"/></p>
			</div>
		</div>
		
		<h3><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>#&nbsp;&nbsp;<tag:message code="text.contact"/></h3>
		<hr/>	
<c:if test="${profileInfo.profileContactInfoDto.email ne null && profileInfo.profileContactInfoDto.email ne ''}">
		<div class="form-group row">
	    	<label for="" class="col-sm-3 col-form-label"><tag:message code="text.email"/></label>
		    <div class="col-sm-9">
		    	<p class="form-control-static"><a href="mailto: ${profileInfo.profileContactInfoDto.email}">${profileInfo.profileContactInfoDto.email}</a></p>
			</div>
		</div>
</c:if>		
<c:if test="${profileInfo.profileContactInfoDto.phoneNo ne null && profileInfo.profileContactInfoDto.phoneNo ne ''}">
		<div class="form-group row">
	    	<label for="" class="col-sm-3 col-form-label">Phone No.</label>
		    <div class="col-sm-9">
		    	<p class="form-control-static"><a href="tel:${profileInfo.profileContactInfoDto.phoneNo}">${profileInfo.profileContactInfoDto.phoneNo}</a></p>
			</div>
		</div>
</c:if>
<c:if test="${profileInfo.profileContactInfoDto.cellPhoneNo ne null && profileInfo.profileContactInfoDto.cellPhoneNo ne ''}">
		<div class="form-group row">
	    	<label for="" class="col-sm-3 col-form-label">Cell Phone No.</label>
		    <div class="col-sm-9">
		    	<p class="form-control-static"><a href="tel:${profileInfo.profileContactInfoDto.cellPhoneNo}">${profileInfo.profileContactInfoDto.cellPhoneNo}</a></p>
			</div>
		</div>
</c:if>
<c:if test="${profileInfo.profileContactInfoDto.websiteUrl ne null && profileInfo.profileContactInfoDto.websiteUrl ne ''}">
		<div class="form-group row">
	    	<label for="" class="col-sm-3 col-form-label"><tag:message code="text.website"/></label>
		    <div class="col-sm-9">
		    	<p class="form-control-static"><a href="http://${profileInfo.profileContactInfoDto.websiteUrl}" target="_blank">${profileInfo.profileContactInfoDto.websiteUrl}</a></p>
			</div>
		</div>
</c:if>

<c:if test="${profileInfo.profileContactInfoDto.facebookUrl ne null && profileInfo.profileContactInfoDto.facebookUrl ne ''}">
		<div class="form-group row">
	    	<label for="" class="col-sm-3 col-form-label"><tag:message code="text.facebook.id"/></label>
		    <div class="col-sm-9">
		    	<p class="form-control-static"><a href="https://www.facebook.com/${profileInfo.profileContactInfoDto.facebookUrl}">${profileInfo.profileContactInfoDto.facebookUrl}</a></p>
			</div>
		</div>
</c:if>
<c:if test="${profileInfo.profileContactInfoDto.twitterUrl ne null && profileInfo.profileContactInfoDto.twitterUrl ne ''}">
		<div class="form-group row">
	    	<label for="" class="col-sm-3 col-form-label"><tag:message code="text.twitter.id"/></label>
		    <div class="col-sm-9">
		    	<p class="form-control-static"><a href="https://twitter.com/${profileInfo.profileContactInfoDto.twitterUrl}">${profileInfo.profileContactInfoDto.twitterUrl}</a></p>
			</div>
		</div>
</c:if>
<c:if test="${profileInfo.profileContactInfoDto.instagramUrl ne null && profileInfo.profileContactInfoDto.instagramUrl ne ''}">
		<div class="form-group row">
	    	<label for="" class="col-sm-3 col-form-label"><tag:message code="text.instagram.id"/></label>
		    <div class="col-sm-9">
		    	<p class="form-control-static"><a href="https://instagram.com/${profileInfo.profileContactInfoDto.instagramUrl}">${profileInfo.profileContactInfoDto.instagramUrl}</a></p>
			</div>
		</div>
</c:if>
<c:if test="${profileInfo.profileContactInfoDto.address ne null && profileInfo.profileContactInfoDto.address ne ''}">
		<div class="form-group row">
	    	<label for="" class="col-sm-3 col-form-label"><tag:message code="text.address"/></label>
		    <div class="col-sm-9">
		    	<p class="form-control-static"><a>${profileInfo.profileContactInfoDto.address}</a></p>
			</div>
		</div>
</c:if>
<br/>
	</form>
</div>
<script>
$(document).ready(function() {
	$("img").addClass("media-object");
// 	$("img").attr("width", "95%");
	$("img").attr("height", "300px");
	$("img").off("error");
	$("img").on("error", function(){
		$(this).attr("src", '${pageContext.request.contextPath}/img/no_image.png');
	});
});

$(function(){

	$("#deleteBtn").on("click", function(){
		
		if(confirm('Do you delete this information?')){
			$.ajax({
				url : '/player/deletePlayerInfo.json',
				data : $("#viewFrm").serialize(),
				dataType : 'json',
				method : 'post',
				success : function(data){
					console.log(data);
					
					var result = data.result;
					if(result == 'ok'){
						location.href = "/profile/list/1";
					}
				}				
			});	
		}
	});
	
	$("#listBtn").on("click", function(){
		location.href = "/player/playerPortal";	
	});
	
	$("#modifyBtn").on("click", function(){
		var frm = $("#viewFrm");
		frm.attr("action","/player/modify");
		frm.attr("method","get");
		frm.submit();
// 		location.href = "/player/modify";
	});
});
</script>
