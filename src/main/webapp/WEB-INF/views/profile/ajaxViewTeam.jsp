<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>

<div class="form-group row">
	<div class="col-sm-6">
		<img
			src="http://jwlee0208.cdn3.cafe24.com/${profileInfo.profileImgPath}"
			class="img-fluid rounded mx-auto d-block" />
	</div>
	<div class="col-sm-6"></div>
</div>
<!-- <div class="row">
	<ul class="nav nav-pills flex-column flex-sm-row" id="profileTab">
		<li class="nav-item"><a
			class="flex-sm-fill text-sm-center nav-link active"
			data-toggle="pill" href="#teamInfo">Team Information</a></li>
		<li class="nav-item"><a
			class="flex-sm-fill text-sm-center nav-link" data-toggle="pill"
			href="#leagueInfo">League Information</a></li>
		<li class="nav-item"><a
			class="flex-sm-fill text-sm-center nav-link" data-toggle="pill"
			href="#introduce">Introduce</a></li>
		<li class="nav-item"><a
			class="flex-sm-fill text-sm-center nav-link" data-toggle="pill"
			href="#contact">Contact</a></li>
	</ul>
</div>
<br /> -->
<div class="tab-content">
	<div id="teamInfo" class="tab-pane active" role="tabpanel">
		<div class="col-sm-12">
			<ul class="nav justify-content-center nav-tabs flex-column flex-sm-row nav-pills nav-fill">
				<li class="nav-item">
					<a class="flex-sm-fill nav-link active" href="#teamInfo">Information</a>
				</li>
				<li class="nav-item">
					<a class="flex-sm-fill nav-link" href="#leagueInfo">League</a>
				</li>
				<li class="nav-item">
					<a class="flex-sm-fill nav-link" href="#introduce">Introduce</a>
				</li>
				<li class="nav-item">
					<a class="flex-sm-fill nav-link" href="#contact">Contact</a>
				</li>
			</ul>	
			<hr/>	
			<div class="form-group row">
				<label for="" class="col-sm-2 col-form-label"><tag:message
						code="text.team.name" /></label>
				<div class="col-sm-10">
					<p class="form-control-static">${profileInfo.name}</p>
				</div>
			</div>
			<div class="form-group row">
				<label for="" class="col-sm-2 col-form-label"><tag:message
						code="text.team.franchise" /></label>
				<div class="col-sm-10">
					<p class="form-control-static">${profileInfo.profileTeamDto.city}</p>
				</div>
			</div>
	<c:if test="${profileInfo.profileTeamDto.establishedDate ne '' && profileInfo.profileTeamDto.establishedDate ne null}">
			<div class="form-group row">
				<label for="" class="col-sm-2 col-form-label"><tag:message
						code="text.team.eastablish.date" /></label>
				<div class="col-sm-10">
					<p class="form-control-static">${profileInfo.profileTeamDto.establishedDate.substring(0,4)}</p>
				</div>
			</div>
	</c:if>		
		</div>
	</div>
	<div id="leagueInfo" class="tab-pane active" role="tabpanel">
		<div class="col-sm-12">
			<ul class="nav justify-content-center nav-tabs flex-column flex-sm-row nav-pills nav-fill">
				<li class="nav-item">
					<a class="flex-sm-fill nav-link" href="#teamInfo">Information</a>
				</li>
				<li class="nav-item">
					<a class="flex-sm-fill nav-link active" href="#leagueInfo">League</a>
				</li>
				<li class="nav-item">
					<a class="flex-sm-fill nav-link" href="#introduce">Introduce</a>
				</li>
				<li class="nav-item">
					<a class="flex-sm-fill nav-link" href="#contact">Contact</a>
				</li>
			</ul>	
			<hr />
			<div class="form-group row">
				<label for="" class="col-sm-3 col-form-label"><tag:message code="text.continent" /></label>
				<div class="col-sm-9">
					<p class="form-control-static">
						<tag:message code="code.area.${profileInfo.leagueInfoDto.area}" />
					</p>
				</div>
			</div>
			<div class="form-group row">
				<label for="" class="col-sm-3 col-form-label"><tag:message code="text.countries" /></label>
				<div class="col-sm-9">
					<p class="form-control-static">
						<tag:message code="code.country.${profileInfo.leagueInfoDto.country}" />
					</p>
				</div>
			</div>
			<div class="form-group row">
				<label for="" class="col-sm-3 col-form-label"><tag:message code="text.league.name" /></label>
				<div class="col-sm-9">
					<p class="form-control-static">
						<a href="/profile/league/view/${profileInfo.leagueInfoDto.catId}/${profileInfo.leagueInfoDto.leagueId}" target="_blank">${profileInfo.leagueInfoDto.leagueName}</a>
					</p>
				</div>
			</div>
			<div class="form-group row">
				<label for="" class="col-sm-3 col-form-label"><tag:message code="text.league.level" /></label>
				<div class="col-sm-9">
					<p class="form-control-static">
						<tag:message
							code="code.leaguetype.${profileInfo.leagueInfoDto.leagueType}" />
					</p>
				</div>
			</div>
			<div class="form-group row">
				<label for="" class="col-sm-3 col-form-label"><tag:message code="text.league.division" /></label>
				<div class="col-sm-9">
					<p class="form-control-static">${profileInfo.leagueInfoDto.leagueDivision}</p>
				</div>
			</div>
		</div>
	</div>