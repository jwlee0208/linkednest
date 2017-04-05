
					<h3>Personal Information</h3>
					<hr />
					<div class="form-group row">
						<label class="col-2 col-form-label">Profile Image</label>
						<div class="col-10">
							<input type="file" class="form-control" id="profileImg"
								name="profileImg" placeholder="upload your profile image" />
						</div>
					</div>
					<br />
					<div class="form-group row">
						<label class="col-2 col-form-label">Name</label>
						<div class="col-10">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="write your name" />
						</div>
					</div>
					<br />
					<div class="form-group row">
						<label class="col-2 col-form-label">Height (cm)</label>
						<div class="col-4">
							<input type="text" class="form-control" id="height"
								name="profilePlayerDto.height" />
						</div>
						<label class="col-2 col-form-label">Weight (kg)</label>
						<div class="col-4">
							<input type="text" class="form-control" id="weight"
								name="profilePlayerDto.weight" />
						</div>
					</div>
					<br />
					<div class="form-group row">
						<label class="col-2 col-form-label">Date Of Birth</label>
						<div class="col-10">
							<input type="date" class="form-control" id="birthDate"
								name="profilePlayerDto.birthDate" />
						</div>
					</div>
					<br />
					<div class="form-group row">
						<label class="col-2 col-form-label">Birth Place</label>
						<div class="col-10">
							<input type="text" class="form-control" id="birthPlace"
								name="profilePlayerDto.birthPlace" />
						</div>
					</div>
					<br />
					<div class="form-group row">
						<label class="col-2 col-form-label">Education</label>
						<div class="col-10">
							<textarea class="form-control" id="education"
								name="profilePlayerDto.education"></textarea>
						</div>
					</div>
					<br />
					<div class="form-group row">
						<label class="col-2 col-form-label">Hobbies</label>
						<div class="col-10">
							<input type="text" class="form-control" id="hobbies"
								name="profilePlayerDto.hobbies" />
						</div>
					</div>
					<br />
					<div class="form-group row">
						<label class="col-2 col-form-label">Favorite Foods</label>
						<div class="col-10">
							<input type="text" class="form-control" id="favoriteFood"
								name="profilePlayerDto.favoriteFood" />
						</div>
					</div>
					<br />
					<div class="form-group row">
						<label class="col-2 col-form-label">Language</label>
						<div class="col-4">
							<input type="text" class="form-control" id="languageSearch" /> <input
								type="hidden" class="form-control" id="language"
								name="profilePlayerDto.language" />
						</div>
						<label class="col-2 col-form-label">Nationality</label>
						<div class="col-4">
							<input type="text" class="form-control" id="nationalitySearch" />
							<input type="hidden" class="form-control" id="nationality"
								name="profilePlayerDto.nationality" />
						</div>
					</div>
					<br />
					<div class="form-group row">
						<label class="col-2 col-form-label">Introduce</label>
						<div class="col-10">
							<textarea class="form-control tinymce" id="introduce"
								name="introduce"></textarea>
						</div>
					</div>
					<br />
					<h3>
						Career
					</h3>
					<hr />
					<div class="form-group row">
						<label class="col-1 col-form-label">Title</label>
						<div class="col-2">
							<input type="text" class="form-control" id="careerTitle"
								name="careerTitle" />
						</div>
						<label class="col-2 col-form-label">Description</label>
						<div class="col-3">
							<textarea class="form-control"
								id="careerDescription" name="careerDescription"></textarea>
						</div>
						<label class="col-2 col-form-label">Career Status</label>
						<div class="col-2">
							<select class="form-control" id="careerStatus" name="careerStatus">
								<option value="-1">::: status :::</option>
								<option value="0">done</option>
								<option value="1">doing</option>
							</select>
						</div>
					</div>						
					<div class="form-group row">
						<label class="col-3 col-form-label">StartDate</label>
						<div class="col-3">
							<input type="date" class="form-control" id="careerStartDate"
								name="careerStartDate" />
						</div>
						<label class="col-3 col-form-label">End Date</label>
						<div class="col-3">
							<input type="date" class="form-control" id="careerEndDate"
								name="careerEndDate" />
						</div>
					</div>
					<div class="form-group row">
						<input type="button"
							class="btn btn-outline-primary addCareerBtn btn-block" value="Add Career(+)" />
					</div>		
					<table class="table tableCareer">
						<thead class="">
							<tr>
								<th>Title</th>
								<th>Description</th>
								<th>Start Date</th>
								<th>End Date</th>
								<th>Status</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<br/>
					<h3>Play Streamming&nbsp;&nbsp;</h3>
					<hr />
					<div class="form-group row">
						<div class="col-10">
							<input type="text" id="searchYoutubeKeyword"
								name="searchYoutubeKeyword" class="form-control"
								placeholder="Search Your Youtube Streams" />
						</div>
						<div class="col-2">
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-outline-primary"
								data-toggle="modal" data-target="#searchMyYoutubeList"
								id="searchMyYoutube">Search My Youtube</button>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-1 col-form-label">Title</label>
						<div class="col-4">
							<input type="text" class="form-control" id="youtubeTitle"
								name="youtubeTitle" />
							<!-- 			    	<input type="text" class="form-control" id="streamTitle_0" name="profileStreamList[0].streamTitle"/>   -->
						</div>
						<label class="col-1 col-form-label">URL</label>
						<div class="col-4">
							<input type="text" class="form-control" id="youtubeUrl"
								name="youtubeUrl" />
							<!-- 		    		<input type="text" class="form-control" id="streamUrl_0" name="profileStreamList[0].streamUrl"/> -->
						</div>
						<div class="col-2">
							<input type="button" class="btn btn-default addStreamBtn"
								value="+" />
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
									<h5 class="modal-title" id="exampleModalLongTitle">Youtube
										List</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div id="youtubeListDiv"></div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary">Save
										changes</button>
								</div>
							</div>
						</div>
					</div>
					<br />

					<h3>Contact Info.</h3>
					<hr />
					<div class="form-group row">
						<label class="col-2 col-form-label">Email</label>
						<div class="col-10">
							<input type="email" class="form-control" id="email"
								name="profileContactInfoDto.email"
								placeholder="write your e-mail" />
						</div>
					</div>
					<br />
					<div class="form-group row">
						<label class="col-2 col-form-label">Phone No.</label>
						<div class="col-10">
							<input type="tel" class="form-control" id="phoneNo"
								name="profileContactInfoDto.phoneNo"
								placeholder="write your phone No." />
						</div>
					</div>
					<br />
					<div class="form-group row">
						<label class="col-2 col-form-label">cellPhoneNo</label>
						<div class="col-10">
							<input type="tel" class="form-control" id="cellPhoneNo"
								name="profileContactInfoDto.cellPhoneNo"
								placeholder="write your cell phone No." />
						</div>
					</div>
					<br />
					<div class="form-group row">
						<label class="col-2 col-form-label">website url</label>
						<div class="col-10">
							<input type="url" class="form-control" id="websiteUrl"
								name="profileContactInfoDto.websiteUrl"
								placeholder="write your website url"
								aria-describedby="basic-addon3" />
						</div>
					</div>
					<br />
					<div class="form-group row">
						<label class="col-2 col-form-label">facebook</label>
						<div class="col-10">
							<input type="text" class="form-control" id="facebookUrl"
								name="profileContactInfoDto.faceebookUrl"
								placeholder="write your facebook id" />
						</div>
					</div>
					<br />
					<div class="form-group row">
						<label class="col-2 col-form-label">twitter</label>
						<div class="col-10">
							<input type="text" class="form-control" id="twitterUrl"
								name="profileContactInfoDto.twitterUrl"
								placeholder="write your twitter id" />
						</div>
					</div>
					<br />
					<div class="form-group row">
						<label class="col-2 col-form-label">instagram</label>
						<div class="col-10">
							<input type="text" class="form-control" id="instagramUrl"
								name="profileContactInfoDto.instagramUrl"
								placeholder="write your instagram id" />
						</div>
					</div>
					<br />
					<div class="form-group row">
						<label class="col-2 col-form-label">Address</label>
						<div class="col-10">
							<input type="text" class="form-control" id="address"
								name="profileContactInfoDto.address"
								placeholder="write your address" />
						</div>
					</div>
					<br />
