<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h3>Contact Info.</h3>
<hr />
<div class="form-group row">
	<label class="col-2 col-form-label" for="email" style="color:red;">Email(*)</label>
	<div class="col-10">
		<input type="email" class="form-control" id="email" name="profileContactInfoDto.email" placeholder="write your e-mail" />
		<span name="profileContactInfoDto_emailErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="phoneNo" style="color:red;">Phone No.(*)</label>
	<div class="col-10">
		<input type="tel" class="form-control" id="phoneNo" name="profileContactInfoDto.phoneNo" placeholder="write your phone No." />
		<span name="profileContactInfoDto_phoneNoErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="facebookUrl">facebook</label>
	<div class="col-10">
		<input type="text" class="form-control" id="facebookUrl" name="profileContactInfoDto.faceebookUrl" placeholder="write your facebook id" />
		<span name="profileContactInfoDto_faceebookUrlErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="twitterUrl">X(twitter)</label>
	<div class="col-10">
		<input type="text" class="form-control" id="twitterUrl" name="profileContactInfoDto.twitterUrl" placeholder="write your twitter id" />
		<span name="profileContactInfoDto_twitterUrlErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>
<br />
<div class="form-group row">
	<label class="col-2 col-form-label" for="instagramUrl">instagram</label>
	<div class="col-10">
		<input type="text" class="form-control" id="instagramUrl" name="profileContactInfoDto.instagramUrl" placeholder="write your instagram id" />
		<span name="profileContactInfoDto_instagramUrlErr" class="errorMsg" style="display: none;"></span>
	</div>
</div>