<%@page import="java.util.Map" %>
	<%@page import="java.util.LinkedHashSet" %>
		<%@ page import="com.springboot.swt.project.entity.Student" %>
			<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
				<!DOCTYPE html>
				<html>

				<head>
					<%@ include file="component/head.jsp" %>
				</head>

				<body>
					<% List<Student> list = (List<Student>) request.getAttribute("studentlist");

							List<Student> absentlist = (List<Student>) request.getAttribute("absendstudentlist");

									List<Batch> activebatch = (List<Batch>) request.getAttribute("activebatch");
											%>
											<script>
												document.addEventListener('DOMContentLoaded', function () {
													findActiveBatches();
												});
												//      function for  Active batch list 
												function findActiveBatches() {
													var url = "http://localhost:9090/valunteer/findActivebatches";
													var xhttp = new XMLHttpRequest();
													xhttp.onreadystatechange = function () {
														if (this.readyState === XMLHttpRequest.DONE) {
															if (this.status === 200) {
																try {
																	// Attempt to parse the JSON response
																	var response = JSON.parse(this.responseText);
																	if (response == null || response.length === 0) {
																		Swal.fire({
																			icon: "error",
																			title: "Oops...",
																			text: "Error: no Active batches.."
																		});
																	}
																	updateBatchList(response);
																} catch (e) {
																	// Handle JSON parsing error

																	Swal.fire({
																		icon: "error",
																		title: "Oops...",
																		text: "Error: no Active batches.."

																	});
																	//    console.error('JSON parsing error:', e);
																}
															}
														}
													};
													xhttp.open("GET", url, true);
													xhttp.send();
												}
												// Function to update the batch list
												function presentrowappend(student) {

													const newRow = $('<tr>').attr('id', student.rollNo);
													newRow.append(
														$('<td>').html('<p class="text-xs font-weight-bold mb-0">rollNo:</p><h6 class="text-sm mb-0">' + student.rollNo + '</h6>'),
														$('<td>').html('<p class="text-xs font-weight-bold mb-0">Name:</p><h6 class="text-sm mb-0">' + student.user.name + '</h6>'),
														$('<td>').html('<a class="btn btn-outline-danger" onclick="studentabsent(\'' + student.rollNo + '\')">Absent</a>'),
														$('<td>').html('<p id="batchIdinlist" data-batch-id="' + student.batch.batchId + '" style="display:none;">' + student.batch.batchId + '</p>'),
													);
													$('#presenttableid').append(newRow);
													return;

												}
												function absentrowappend(student) {

													const newRow = $('<tr>').attr('id', student.rollNo);
													newRow.append(
														$('<td>').html('<p class="text-xs font-weight-bold mb-0">rollNo:</p><h6 class="text-sm mb-0">' + student.rollNo + '</h6>'),
														$('<td>').html('<p class="text-xs font-weight-bold mb-0">Name:</p><h6 class="text-sm mb-0">' + student.user.name + '</h6>'),
														$('<td>').html('<a class="btn btn-outline-success" onclick="studentpresent(\'' + student.rollNo + '\')">Present</a>'),
														$('<td>').html('<p id="batchIdinlist" data-batch-id="' + student.batch.batchId + '" style="display:none;">' + student.batch.batchId + '</p>')
													);
													$('#absenttableid').append(newRow);

													return;	
												}
												function updateBatchList(batches1) {
													var batchList = document.getElementById('batchList1');
													batchList.textContent = '';
													var op1 = document.createElement('option');
													op1.textContent = 'None';
													batchList.appendChild(op1);
													batches1.forEach(function (batch) {
														if (!batch.batchId || !batch.batchTopic) {
															console.warn('Batch object missing required properties:', batch);
															return;
														}
														var op = document.createElement('option');
														var batchId = batch.batchId;
														op.value = batch.batchId;
														op.textContent = batch.batchTopic;
														batchList.appendChild(op);
													});
												}

												function showStudentAttendance() {
													var batchList = document.getElementById('batchList1');

													$('#presenttableid').empty();
													$('#absenttableid').empty();
													var batchId = batchList.value;

													$.ajax({
														url: 'http://localhost:9090/valunteer/findallstudent?batchId=' + batchId,
														type: 'GET',
														dataType: 'json',
														success: function (response) {

															if (response.length >= 1) {
																document.getElementById('NoAvailableStudentinthisBatch').style.display = 'none';
															}
															else {
																document.getElementById('NoAvailableStudentinthisBatch').style.display = 'block';
															}
															let today = new Date().toISOString().split('T')[0];  // Get today's date in 'YYYY-MM-DD' format
															response.forEach(function (student) {


																var formattedAbsentDates = student.absent.map(date => new Date(date).toISOString().split('T')[0]);
																var isAbsentToday = formattedAbsentDates.includes(today); 
																alert(isAbsentToday);
																if (isAbsentToday) {
																	presentrowappend(student);
																	console.log("presentrowappend=> " + student.absent+ "=> "+isAbsentToday);
																}
																else {
																	absentrowappend(student);
																	console.log("absentrowappend=> " + student.absent+ "=> "+isAbsentToday);
																}
															});
														},
														error: function (error) {
															console.error('Error:', error);
															$('#presenttableid').empty();
															const newRow = $('<tr>');
															newRow.append(
																$('<td>').html('<h3 class="text-sm mb-0">Error: Unable to fetch data. Please try again later.</h3>')
															);
															$('#presenttableid').append(newRow);
														}
													});


												}

												function studentpresent(rollNo) {

													var batchId = $('#batchIdinlist').data('batch-id');
													if (!batchId) {
														Swal.fire({
															icon: "error",
															title: "Oops...",
															text: "Batch ID is not set."

														});
														return;
													}
													var url = "http://localhost:9090/valunteer/studentattendance/present?rollNo=" + rollNo + "&batchId=" + batchId;
													markAttendence(rollNo, url, 'present');
												}

												function studentabsent(rollNo) {

													var batchId = $('#batchIdinlist').data('batch-id');
													if (!batchId) {
														Swal.fire({
															icon: "error",
															title: "Oops...",
															text: "Batch ID is not set."

														});
														return;
													}
													var url = "http://localhost:9090/valunteer/studentattendance/absent?rollNo=" + rollNo + "&batchId=" + batchId;
													markAttendence(rollNo, url, 'absent');
												}

												function markAttendence(rollNo, url, status) {
													if (!rollNo) {
														rollNo = document.getElementById('email-field').value;
													}
													if (!rollNo) {
														Swal.fire({
															icon: "error",
															title: "Oops...",
															text: "Please Enter Roll Number"

														});
														return;
													}

													var xhttp = new XMLHttpRequest();
													xhttp.onreadystatechange = function () {
														if (xhttp.readyState === XMLHttpRequest.DONE) {
															if (xhttp.status === 200) {
																var response = xhttp.responseText;
																if (response === null || response.trim() === "") {
																	console.log("Response from server is null or empty.");
																} else {
																	var student = JSON.parse(response);
																	if (status === 'absent') {
																		const presentRow = document.getElementById(student.rollNo);
																		if (presentRow) {
																			presentRow.remove(); // Remove from present table
																		}
																		absentrowappend(student);

																		const trId = student.rollNo;
																		$('#' + trId).append(
																			$('<td>').html('<i class="bi bi-check2-circle"></i>')  // Example: Adding an icon or some content
																		);
																		// Append to the absent table
																		Swal.fire({
																			icon: "success",
																			title: "Oops...",
																			text: "Successfully marked " + student.rollNo + " as absent.",
																			timer: 700
																		});

																	} else if (status === 'present') {

																		// Remove from absent table if exists
																		const absentRow = document.getElementById(student.rollNo);
																		if (absentRow) {
																			absentRow.remove(); // Remove from absent table
																		}
																		presentrowappend(student);

																		const trId = student.rollNo;
																		$('#' + trId).append(
																			$('<td>').html('<i class="bi bi-check2-circle"></i>')  // Example: Adding an icon or some content
																		);
																		Swal.fire({
																			icon: "success",
																			title: "Done",
																			text: "Successfully marked " + student.rollNo + " as present.",
																			timer: 700
																		});

																	}
																}
															} else {
																Swal.fire({
																	icon: "error",
																	title: "Oops...",
																	text: "Please Insert Corect No. " + rollNo
																});
															}
														}
													};
													xhttp.open("GET", url, true);
													xhttp.send();
												}


											</script>

											<%@ include file="component/navbar.jsp" %>
												<main class="main">
													<!-- Contact Section -->
													<section id="login" class="contact section">
														<!-- Section Title -->
														<div class="container section-title">
															<h2>User Attendance</h2>
															<h3 id="Attendancename"></h3>
														</div>

														<!-- End Section Title -->
														<div class="container d-flex justify-content-center">
															<div class="col-lg-6">
																<div class="php-email-form">
																	<div class="row gy-4">
																		<div class="col-md-12">
																			<label for="email-field" class="pb-2">Select
																				Batch</label>
																			<select class="form-control" name="batch"
																				id="batchList1" selected="selected"
																				onchange="showStudentAttendance()">

																			</select>
																		</div>
																		<div class="col-md-12">
																			<label for="email-field" class="pb-2">Enter
																				Roll
																				No.</label> <input type="number"
																				class="form-control" name="text"
																				id="email-field" required>

																		</div>
																		<div class="col-md-12 text-center">

																			<button type="button"
																				class="btn btn-secondary"
																				onclick="studentpresent(document.getElementById('email-field').value)">Present</button>

																			<button type="button"
																				class="btn btn-secondary"
																				onclick="studentabsent(document.getElementById('email-field').value)">Absent</button>
																		</div>
																	</div>

																</div>
															</div>

														</div>
														<div class="container section-title"
															id="NoAvailableStudentinthisBatch" style="display: none;">

															<h2>No Available Student in this Batch..</h2>


														</div>
													</section>
													<!------------------------------------------------------------------------------------------------------------------------------------------->
													<section class="col py-4 px-2">
														<div class="row">
															<div class="col-lg-5 mb-lg-0 mb-4 mx-auto">
																<div class="card">
																	<div class="card-header pb-0 p-3">
																		<div class="d-flex justify-content-center">
																			<h6 class="mb-2">
																				Student Present List</h6>
																		</div>
																	</div>

																	<div class="table-responsive" id="presentcard..">
																		<table class="table align-items-center ">
																			<tbody id="presenttableid">

																			</tbody>
																		</table>

																	</div>

																</div>
															</div>
															<div class="col-lg-5 mb-lg-0 mb-4 mx-auto">
																<div class="card ">
																	<div class="card-header pb-0 p-3">
																		<div class="d-flex justify-content-center">
																			<h6 class="mb-2">
																				Student Absent List</h6>
																		</div>
																	</div>

																	<div class="table-responsive" id="absentcardcard..">

																		<table class="table align-items-center  ">
																			<tbody id="absenttableid">

																			</tbody>
																		</table>
																	</div>

																</div>
															</div>
														</div>

													</section>
												</main>
												<!-- /Contact Section -->
												<%@ include file="component/footer.jsp" %>
													<%@ include file="component/script.jsp" %>

				</body>

				</html>