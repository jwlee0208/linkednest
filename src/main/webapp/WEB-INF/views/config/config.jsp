<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag" %>
	<div class="row">
		<div class="panel panel-danger">
		  <div class="panel-heading">
		    <h3 class="panel-title"><tag:message code="config.menu.relateprivinfo"/><span class="glyphicon glyphicon-cog" aria-hidden="true" style="float:right; cursor:pointer;" onclick="javascript:configDefaultPriv();"></span></h3>
		  </div>
		  <div class="panel-body">
		    <c:import url="/config/priv/info" />
		  </div>
		</div>			
	</div>
	<div class="row">
		<div class="panel panel-info">
		  <div class="panel-heading">
		    <h3 class="panel-title"><tag:message code="config.menu.relateboardinfo"/><span class="glyphicon glyphicon-cog" aria-hidden="true" style="float:right; cursor:pointer;" onclick="javascript:configBoard();"></span></h3>
		  </div>
		  <div class="panel-body">
		    <c:import url="/common/sideBoardList/${userInfo.userId}" />
		  </div>
		</div>		
	</div>
	<div class="row">
		<div class="panel panel-success">
		  <div class="panel-heading">
		    <h3 class="panel-title"><tag:message code="config.menu.relateshareinfo"/><span class="glyphicon glyphicon-cog" aria-hidden="true" style="float:right; cursor:pointer;" onclick="javascript:configProfileInfo();"></span></h3>
		  </div>
		  <div class="panel-body">
		    <c:import url="/share/info" />
		  </div>
		</div>			
	</div>
