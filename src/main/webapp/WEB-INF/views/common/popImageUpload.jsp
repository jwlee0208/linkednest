<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fileupload.css"/>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>

<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-theme.min.css">
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>



<!-- design -->
<div id="image_upload" data-provides="fileinput">
	<form id="imageForm" method="post" enctype="multipart/form-data"> <!-- action="popImgUpload" -->
	<input type="hidden" name="folderId" id="folderId" value="" />
	<input type="hidden" name="job" id="job" value="" />
	<!-- body -->
	<div class="panel panel-default">
		<div class="panel-heading"><h4 class="panel-title">이미지 등록</h4></div>
		<div class="panel-body" style="min-height: 300px;">
			<div id="imageUploadList">
					<img src="${pageContext.request.contextPath}/img/no_image.png" alt="" class="img-thumbnail"/>
			</div>		
		</div>
		<div class="panel-footer">
			<table>
				<colgroup><col width="90%"/><col width="10%"/></colgroup>
				<tr>
					<td>
						<!-- 파일명 출력 -->
						<input type="file" name="imageFile" id="imageFile" class="form-control" accept="image/*"/>					
					</td>
					<td>
						<input type="button" class="btn btn-default" name="uploadBtn" id="uploadBtn" value="파일 업로드" onclick="fileUpload()"/>					
					</td>
				</tr>
				<tr>
					<td colspan="2"><p class="help-block">최대 20M까지 등록할 수 있습니다.</p>	</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- button -->	
	<div id="btn_footerList" class="btn-group btn-group-justified" style="display:none;">
		<div class="btn-group">
			<input type="button" class="btn btn-default" value="삭제"/>
		</div>
		<div class="btn-group">
			<input type="button" class="btn btn-default" value="사용"/>
		</div>
		<div class="btn-group">
			<input type="button" class="btn btn-default" onclick="window.close()" value="닫기"/>
		</div>								
	</div>
	</form>
</div>


<!-- design -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/fileUpload/image.js"></script>