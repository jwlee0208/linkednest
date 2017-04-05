<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>


	<div class="form-group row">
		<div class="col-sm-6">
			<img src="http://jwlee0208.cdn3.cafe24.com/${profileInfo.profileImgPath}" class="img-fluid rounded mx-auto d-block"/>
		</div>	
		<div class="col-sm-6"></div>	
	</div>	
	<%--<div class="row">--%>
		<ul class="nav nav-pills flex-column flex-sm-row" id="profileTab">
		  <li class="nav-item">
		    <a class="flex-sm-fill text-sm-center nav-link active" data-toggle="pill" href="#coachInfo">Coach Information</a>
		  </li>
		  <li class="nav-item">
		    <a class="flex-sm-fill text-sm-center nav-link" data-toggle="pill" href="#career">Career</a>
		  </li>
		  <li class="nav-item">
		    <a class="flex-sm-fill text-sm-center nav-link" data-toggle="pill" href="#streamList">Streamming</a>
		  </li>
		  <li class="nav-item">
		    <a class="flex-sm-fill text-sm-center nav-link" data-toggle="pill" href="#introduce">Introduce</a>
		  </li>
		  <li class="nav-item">
		    <a class="flex-sm-fill text-sm-center nav-link" data-toggle="pill" href="#contact">Contact</a>
		  </li>
		</ul>	
	<%--</div>--%>
	<br/>
	<div class="tab-content">
	<div id="coachInfo" class="tab-pane active" role="tabpanel">
		<h3><span class="glyphicon glyphicon-user" aria-hidden="true"></span>#&nbsp;&nbsp;Coach Information</h3>

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
			<div class="form-group row">
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
			</div>	
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
	
	</div> 
	<div id="career" class="tab-pane" role="tabpanel">
	
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
	</div>
	<div id="streamList" class="tab-pane active" role="tabpanel">	
		<c:set var="profileStreamList" value="${profileInfo.profileStreamList}"/>
		<c:if test="${!empty profileStreamList}">
		<h3><span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span>#&nbsp;&nbsp;<tag:message code="text.playstream"/></h3>
		<hr/>
		<c:forEach var="profileStreamInfo" items="${profileStreamList}">
		<h3><small>${profileStreamInfo.streamTitle}</small></h3>	
		<div class="embed-responsive embed-responsive-16by9">${profileStreamInfo.streamUrl}</div>
		</c:forEach>
		</c:if>
	</div>	