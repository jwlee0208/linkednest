<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag"%>
<%-- 
<%@include file="/WEB-INF/views/profile/regist/ajaxRegistPlayerStep01.jsp"%>
<br />
<%@include file="/WEB-INF/views/profile/regist/ajaxRegistPlayerStep02.jsp"%>
<br/>
<%@include file="/WEB-INF/views/profile/regist/ajaxRegistPlayerStep03.jsp"%>
<br />
<%@include file="/WEB-INF/views/profile/regist/ajaxRegistPlayerStep04.jsp"%>
<br/>
<%@include file="/WEB-INF/views/profile/regist/ajaxRegistPlayerStep05.jsp"%>
<br />
<c:if test="${categoryId eq '01010100'}">
<%@include file="/WEB-INF/views/profile/regist/ajaxRegistPlayerStep06.jsp"%>
</c:if>
 --%>
<%@include file="/WEB-INF/views/profile/regist/ajaxRegistProfileErrorContact.jsp"%>
    <div id="stepper-form" class="card">
        <div class="card-header">
            <ul class="nav nav-pills card-header-pills nav-justified">
                <li class="nav-item">
                    <a class="nav-link active" href="#step1" data-toggle="tab">STEP 1</a>
                	<p style="color:red;">(*) Required</p>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#step2" data-toggle="tab">STEP 2</a>
                    <p style="color:red;">(*) Required</p>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#step3" data-toggle="tab">STEP 3</a>
                    <p style="color:red;">(*) Required</p>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#step4" data-toggle="tab">STEP 4</a>
                    <p>Optional</p>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#step5" data-toggle="tab">STEP 5</a>
                	<p>Optional</p>
                </li>
			<c:if test="${categoryId eq '01010100'}">                
                <li class="nav-item">
                    <a class="nav-link" href="#step6" data-toggle="tab">STEP 6</a>
                	<p>Optional</p>
                </li>
			</c:if>
            </ul>
        </div>
        <div class="card-body">
            <div class="tab-content">
                <div class="tab-pane active" id="step1">
					<%@include file="/WEB-INF/views/profile/regist/ajaxRegistPlayerStep01.jsp"%>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	                    <button class="btn btn-primary next-step">Next</button>
    				</div>
                </div>
                <div class="tab-pane" id="step2">
					<%@include file="/WEB-INF/views/profile/regist/ajaxRegistPlayerStep02.jsp"%>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
	                    <button class="btn btn-secondary prev-step">Previous</button>
	                    <button class="btn btn-primary next-step">Next</button>
					</div>
                </div>
                <div class="tab-pane" id="step3">
					<%@include file="/WEB-INF/views/profile/regist/ajaxRegistPlayerStep03.jsp"%>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	                    <button class="btn btn-secondary prev-step">Previous</button>
	                    <button class="btn btn-primary next-step">Next</button>					
					</div>
                </div>
                <div class="tab-pane" id="step4">
					<%@include file="/WEB-INF/views/profile/regist/ajaxRegistPlayerStep04.jsp"%>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
	                    <button class="btn btn-secondary prev-step">Previous</button>
	                    <button class="btn btn-primary next-step">Next</button>
					</div>
                </div>
                <div class="tab-pane" id="step5">
					<%@include file="/WEB-INF/views/profile/regist/ajaxRegistPlayerStep05.jsp"%>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
	                    <button class="btn btn-secondary prev-step">Previous</button>
<c:if test="${categoryId eq '01010100'}">
    	                <button class="btn btn-primary next-step">Next</button>
</c:if> 
					</div>                   
                </div>
<c:if test="${categoryId eq '01010100'}">
                <div class="tab-pane" id="step6">
					<%@include file="/WEB-INF/views/profile/regist/ajaxRegistPlayerStep06.jsp"%>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
	                    <button class="btn btn-secondary prev-step">Previous</button>
        			</div>
                </div>
</c:if>
            </div>
        </div>
    </div>
<%@include file="/WEB-INF/views/profile/regist/ajaxRegistProfileErrorContact.jsp"%>

<script>
    $(document).ready(function () {
        $('.next-step').click(function (e) {
        	e.preventDefault();
        	var $activeTab = $('.nav-pills .nav-link.active');
            var $nextTab = $activeTab.parent().next().find('.nav-link');            
            $nextTab.removeClass('disabled').click();
        });

        $('.prev-step').click(function (e) {
        	e.preventDefault();
        	var $activeTab = $('.nav-pills .nav-link.active');
            var $prevTab = $activeTab.parent().prev().find('.nav-link');
            $prevTab.removeClass('disabled').click();
        });
    });
</script>