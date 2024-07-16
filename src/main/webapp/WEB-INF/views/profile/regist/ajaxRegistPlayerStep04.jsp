<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>
<h3>Career</h3>
<hr />
<div class="form-group row">
	<label class="col-1 col-form-label" for="careerTitle">Title</label>
	<div class="col-2">
		<input type="text" class="form-control" id="careerTitle" name="careerTitle" />
	</div>
	<label class="col-2 col-form-label" for="careerDescription">Description</label>
	<div class="col-3">
		<textarea class="form-control" id="careerDescription" name="careerDescription"></textarea>
	</div>
	<label class="col-2 col-form-label" for="careerStatus">Career Status</label>
	<div class="col-2">
		<select class="form-control" id="careerStatus" name="careerStatus">
			<option value="-1">::: Status :::</option>
			<option value="0">not playing</option>
			<option value="1">playing</option>
		</select>
	</div>
</div>
<div class="form-group row">
	<label class="col-3 col-form-label" for="careerStartDate">Start Date</label>
	<div class="col-3">
		<input type="date" class="form-control" id="careerStartDate" name="careerStartDate" />
	</div>
	<label class="col-3 col-form-label" for="careerEndDate">End Date</label>
	<div class="col-3">
		<input type="date" class="form-control" id="careerEndDate" name="careerEndDate" />
	</div>
</div>
<div class="form-group row">
	<input type="button" class="btn btn-outline-primary addCareerBtn btn-block" value="Add Career(+)" />
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