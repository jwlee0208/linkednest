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
    <div id="stepper-form" class="card">
        <div class="card-header">
            <ul class="nav nav-pills card-header-pills">
                <li class="nav-item">
                    <a class="nav-link active" href="#step1" data-toggle="tab">STEP 1</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#step2" data-toggle="tab">STEP 2</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#step3" data-toggle="tab">STEP 3</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#step4" data-toggle="tab">STEP 4</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#step5" data-toggle="tab">STEP 5</a>
                </li>
			<c:if test="${categoryId eq '01010100'}">                
                <li class="nav-item">
                    <a class="nav-link" href="#step6" data-toggle="tab">STEP 6</a>
                </li>
			</c:if>
            </ul>
        </div>
        <div class="card-body">
            <div class="tab-content">
                <div class="tab-pane active" id="step1">
					<%@include file="/WEB-INF/views/profile/regist/ajaxRegistPlayerStep01.jsp"%>
                    <button class="btn btn-primary next-step">Next</button>
                </div>
                <div class="tab-pane" id="step2">
					<%@include file="/WEB-INF/views/profile/regist/ajaxRegistPlayerStep02.jsp"%>
                    <button class="btn btn-secondary prev-step">Previous</button>
                    <button class="btn btn-primary next-step">Next</button>
                </div>
                <div class="tab-pane" id="step3">
					<%@include file="/WEB-INF/views/profile/regist/ajaxRegistPlayerStep03.jsp"%>
                    <button class="btn btn-secondary prev-step">Previous</button>
                    <button class="btn btn-primary next-step">Next</button>
                </div>
                <div class="tab-pane" id="step4">
					<%@include file="/WEB-INF/views/profile/regist/ajaxRegistPlayerStep04.jsp"%>
                    <button class="btn btn-secondary prev-step">Previous</button>
                    <button class="btn btn-primary next-step">Next</button>
                </div>
                <div class="tab-pane" id="step5">
					<%@include file="/WEB-INF/views/profile/regist/ajaxRegistPlayerStep05.jsp"%>
                    <button class="btn btn-secondary prev-step">Previous</button>
                    <button class="btn btn-primary next-step">Next</button>
                </div>
<c:if test="${categoryId eq '01010100'}">
                <div class="tab-pane" id="step6">
					<%@include file="/WEB-INF/views/profile/regist/ajaxRegistPlayerStep06.jsp"%>
                    <button class="btn btn-secondary prev-step">Previous</button>
                    <button class="btn btn-primary next-step">Next</button>
                </div>
</c:if>
            </div>
        </div>
    </div>

<script>
    $(document).ready(function () {
        $('.next-step').click(function () {
            var $activeTab = $('.nav-pills .nav-link.active');
            $activeTab.parent().next().find('.nav-link').removeClass('disabled').click();
        });

        $('.prev-step').click(function () {
            var $activeTab = $('.nav-pills .nav-link.active');
            $activeTab.parent().prev().find('.nav-link').removeClass('disabled').click();
        });
    });
</script>