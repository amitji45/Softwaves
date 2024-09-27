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
															} else {

																Swal.fire({
																	icon: "error",
																	title: "Oops...",
																	text: 'Error: ' + this.statusText

																});
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
														// $('<td>').html('<a class="btn btn-outline-success" onclick="studentpresent(\'' + student.rollNo + '\')">Present</a>'),
														$('<td>').html('<p id="batchIdinlist" data-batch-id="' + student.batch.batchId + '" style="display:none;">' + student.batch.batchId + '</p>')
													);
													document.getElementById('batchandstudent').style.display = 'block';
													$('#presenttableid').append(newRow);

												}
												function absentrowappend(student) {
													const newRow = $('<tr>').attr('id', student.rollNo);
													newRow.append(
														$('<td>').html('<p class="text-xs font-weight-bold mb-0">rollNo:</p><h6 class="text-sm mb-0">' + student.rollNo + '</h6>'),
														$('<td>').html('<p class="text-xs font-weight-bold mb-0">Name:</p><h6 class="text-sm mb-0">' + student.user.name + '</h6>'),
														// $('<td>').html('<a class="btn btn-outline-danger" onclick="studentabsent(\'' + student.rollNo + '\')">Absent</a>'),
														$('<td>').html('<a class="btn btn-outline-success" onclick="studentpresent(\'' + student.rollNo + '\')">Present</a>'),
														$('<td>').html('<p id="batchIdinlist" data-batch-id="' + student.batch.batchId + '" style="display:none;">' + student.batch.batchId + '</p>')
													);
													$('#absenttableid').append(newRow);
												}
												function updateBatchList(batches1) {
													var batchList = document.getElementById('batchList1');
													// Check if the batchList element exists
													if (!batchList) {
														Swal.fire({
															icon: "error",
															title: "Oops...",
															text: "not available"

														});
														console.error('Element with id "batchList1" not found.');
														return;
													}

													batchList.innerHTML = '';

													if (!Array.isArray(batches1) || batches1.length === 0) {
														console.warn('No active batches found.');
														return;
													}
													batches1.forEach(function (batch) {
														if (!batch.batchId || !batch.batchTopic) {
															console.warn('Batch object missing required properties:', batch);
															return;
														}
														var li = document.createElement('li');
														var a = document.createElement('a');
														var batchId = batch.batchId;

														a.textContent = batch.batchTopic;
														a.href = '#';

														a.addEventListener('click', function (event) {
															event.preventDefault();

															$.ajax({
																url: 'http://localhost:9090/valunteer/findallstudent?batchId=' + batchId,
																type: 'GET',
																dataType: 'json',
																success: function (response) {
																	$('#presenttableid').empty();
																	$('#absenttableid').empty();

																	if (response.length >= 1) {
																		//document.getElementById('batchandstudent').style.display = 'block';
																		document.getElementById('PleaseSelectBatchAvailableStudent').style.display = 'none';
																		document.getElementById('NoAvailableStudentinthisBatch').style.display = 'none';
																	} else {
																		// document.getElementById('batchandstudent').style.display = 'none';
																		document.getElementById('PleaseSelectBatchAvailableStudent').style.display = 'block';
																		document.getElementById('NoAvailableStudentinthisBatch').style.display = 'block';
																	}
																	let today = new Date().toISOString().split('T')[0];
																	response.forEach(function (student) {

																		var isAbsentToday = student.absent.includes(today);
																		if (isAbsentToday) {

																			document.getElementById('absentcard').style.display = 'block';
																			absentrowappend(student);
																		}
																		else {
																			presentrowappend(student);
																		}
																	});
																},
																error: function (error) {
																	console.error('Error:', error);
																	$('#presenttableid').empty();
																	const newRow = $('<tr>');
																	newRow.append(
																		$('<td>').html('<h6 class="text-sm mb-0">Error: Unable to fetch data. Please try again later.</h6>')
																	);
																	$('#presenttableid').append(newRow);
																}
															});
														});

														li.appendChild(a);
														batchList.appendChild(li);
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
																	document.getElementById('absentcard').style.display = 'block';
																	if (status === 'absent') {
																		const presentRow = document.getElementById(student.rollNo);
																		if (presentRow) {
																			presentRow.remove(); // Remove from present table
																		}
																		absentrowappend(student);
																		// Append to the absent table
																		Swal.fire({
																			icon: "success",
																			title: "Oops...",
																			text: "Successfully marked " + student.rollNo + " as absent."
																		});
																	} else if (status === 'present') {

																		// Remove from absent table if exists
																		const absentRow = document.getElementById(student.rollNo);
																		if (absentRow) {
																			absentRow.remove(); // Remove from absent table
																		}
																		presentrowappend(student);
																		Swal.fire({
																			icon: "success",
																			title: "Oops...",
																			text: "Successfully marked " + student.rollNo + " as present."
																		});
																		 
																	}
																}
															} else {
																Swal.fire({
																			icon: "error",
																			title: "Oops...",
																			text: "Plese Insert Corect No. " +rollNo + " default"
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
															<h2>User Attendence</h2>
															<% if (list !=null&&list.size()>0) {
																String currentBatch=request.getParameter("batchId"); %>
																<h3>
																	Batch :-<%=list.get(0).getBatch().getBatchTopic()%>
																</h3>
																<% } else { %>
																	<h3 style="display: none;"
																		id="PleaseSelectBatchAvailableStudent">Please
																		Select Batch Available Student</h3>
																	<% } %>
														</div>
														<!--col-xl-2 col-md-6 col-sm-11 py-4 -->
														<nav id="navmenu" class="navmenu">
															<ul
																class="justify-content-center col-xl-9 col-md-6 col-sm-7 py-9 ">
																<li class="dropdown"><a href="#"
																		onclick="findActiveBatches()"
																		id=""><span>Attendence</span> <i
																			class="bi bi-chevron-down toggle-dropdown"></i></a>
																	<ul>
																		<li id="batchList1" id="batchId"></li>

																	</ul>
															</ul>
														</nav>
														<!-- End Section Title -->
														<div class="container d-flex justify-content-center">
															<div class="col-lg-6">
																<div class="php-email-form">
																	<div class="row gy-4">

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

														<!------------------------------------------------------------------------------------------------------------------------------------------->
														<div class="py-4" id="batchandstudent" style="display: none;">
															<div class="row">
																<section class="col py-4 px-2">
																	<div class="row">
																		<div class="col-lg-8 mb-lg-0 mb-4 mx-auto">
																			<div class="card z-index-2 h-100">
																				<div class="card-header pb-0 p-3">
																					<h6
																						class="text-capitalize text-center">
																						Student List</h6>
																				</div>
																				<div class="card-body p-3 "
																					id="presentcard..">
																					<div class="chart ">
																						<table
																							class="table align-items-center ">
																							<div class="nested-div ">

																								<div
																									class="table-responsive">

																									<table
																										class="table align-items-center "
																										id="presenttableid">
																									</table>
																								</div>
																							</div>
																						</table>
																					</div>
																				</div>

																			</div>
																		</div>
																	</div>
																	<!-- ---------- -->
																	<div class="row" style="display: none;"
																		id="absentcard">
																		<div class="col-lg-8 mb-lg-0 mb-4 mx-auto">
																			<div class="card z-index-2 h-100">
																				<div class="card-header pb-0 p-3">
																					<h6
																						class="text-capitalize text-center">
																						Student Absent List</h6>
																				</div>
																				<div class="card-body p-3 "
																					id="absentcardcard..">
																					<div class="chart ">
																						<table
																							class="table align-items-center ">
																							<div class="nested-div ">
																								<div
																									class="table-responsive">

																									<table
																										class="table align-items-center  "
																										id="absenttableid">
																									</table>
																								</div>
																							</div>
																						</table>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
															</div>
													</section>
													</div>
													</div>
												</main>
												<!-- /Contact Section -->
												<%@ include file="component/footer.jsp" %>
													<%@ include file="component/script.jsp" %>

				</body>

				</html>