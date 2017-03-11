<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags"	prefix="tag" %>    
<style>
.list-group-item-category {
	z-index: 0;
    color: #fff;
    background-color: #efefef;
    border-color: #ddd;
}
</style>
<script>
	function goConfigMain(){
		location.href = "/config/main"
	}
</script>
		<div class="list-group">  		
    		<a href="#" class="list-group-item list-group-item-category" style="font-weight: bold;" onclick="javascript:goConfigMain();"><tag:message code="config.menu.personalsetting"/></a>
			<a href="#" class="list-group-item" onclick="javascript:configDefaultPriv();"><tag:message code="config.menu.update.myprivinfo"/></a>
			<a href="#" class="list-group-item" onclick="javascript:configProfileInfo();"><tag:message code="config.menu.update.myshareinfo"/></a>
			<a href="#" class="list-group-item" onclick="javascript:configBoardCategory();"><tag:message code="config.menu.update.myboardcategory"/></a>
			<a href="#" class="list-group-item" onclick="javascript:configBoard();"><tag:message code="config.menu.update.myboard"/></a>    			    			
        </div>  