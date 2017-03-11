<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body>
	<form id="imageForm" action="popImgUpload" method="post" enctype="multipart/form-data">
	<input type="hidden" name="folderId" id="folderId" value="" />
	<input type="hidden" name="job" id="job" value="" />	
	<div id="popWrap">
		<div class="list_box">
			<h1>관련 이미지 추가&#47;삭제</h1>
			<ul class="tabs">
				<li class="two selected"><a href="#">신규 이미지 추가</a></li>
				<li class="shadow"></li>
			</ul>
			<!-- 신규 이미지 추가 -->
			<div class="new_list">
				<table id="taImageUpload" class="tbl_type01" cellpadding="0" cellspacing="0" summary="" style="width:550px;">
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tbody>
						<tr>
							<th rowspan="2">파일업로드</th>
							<td>
								<p class="input_txt">
									<input type="file" name="imageFile" id="imageFile" accept="image/*"/>
									<input class="btn" type="button" name="uploadBtn" id="uploadBtn" value="파일 업로드" onclick="fileUpload()" />
								</p>
							</td>
						</tr>						
					</tbody>
				</table>
			</div>
			<h2>사용할 이미지</h2>
			<ul class="img_list" id="imageUploadList">
		
			</ul>
			<p class="btn_txt">
				<a href="##" onclick="window.close()" class="btn">닫기</a>
			</p>
		</div>
	</div>
	</form>
</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/fileUpload/image.js"></script>