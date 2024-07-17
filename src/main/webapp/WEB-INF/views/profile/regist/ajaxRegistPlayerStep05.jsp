<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h3>Play Streaming&nbsp;&nbsp;</h3>
<hr />
<div class="form-group row">
	<div class="col-10">
		<input type="text" id="searchYoutubeKeyword" name="searchYoutubeKeyword" class="form-control" placeholder="Search Your Youtube Streams" />
	</div>
	<div class="col-2">
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#searchMyYoutubeList" id="searchMyYoutube">Search My Youtube</button>
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label" for="youtubeTitle">Title</label>
	<div class="col-4">
		<input type="text" class="form-control" id="youtubeTitle" name="youtubeTitle" />
		<!-- 			    	<input type="text" class="form-control" id="streamTitle_0" name="profileStreamList[0].streamTitle"/>   -->
	</div>
	<label class="col-1 col-form-label" for="youtubeUrl">URL</label>
	<div class="col-4">
		<input type="text" class="form-control" id="youtubeUrl" name="youtubeUrl" />
		<!-- 		    		<input type="text" class="form-control" id="streamUrl_0" name="profileStreamList[0].streamUrl"/> -->
	</div>
	<div class="col-2">
		<input type="button" class="btn btn-default addStreamBtn  btn-block" value="+" />
	</div>
</div>
<div id="streamList"></div>
<!-- Modal -->
<div class="modal fade" id="searchMyYoutubeList" tabindex="-1"
	 role="dialog" aria-labelledby="searchMyYoutubeList"
	 aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Youtube List</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div id="youtubeListDiv"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>