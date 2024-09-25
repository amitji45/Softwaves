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
																alert('Error: no Active batches..');
																//    console.error('JSON parsing error:', e);
															}
														} else {
															alert('Error: ' + this.statusText);
														}
													}
												};
												xhttp.open("GET", url, true);
												xhttp.send();
											}
											// Function to update the batch list
											function updateBatchList(batches1) {
												var batchList = document.getElementById('batchList1');

												// Check if the batchList element exists
												if (!batchList) {
													alert('not available...');
													console.error('Element with id "batchList1" not found.');
													return;
												}

												// Clear existing items
												batchList.innerHTML = '';

												// Log batches1 for debugging

												if (!Array.isArray(batches1) || batches1.length === 0) {
													alert('No active batches found.');
													return;
												}

												// Iterate over the batches and create list items
												batches1
													.forEach(function (batch) {
														if (!batch.batchId || !batch.batchTopic) {
															console
																.warn(
																	'Batch object missing required properties:',
																	batch);
															return;
														}

														var li = document.createElement('li');
														var a = document.createElement('a');
														var url = "http://localhost:9090/valunteer/findallstudent?batchId="
															+ batch.batchId;

														// Set the text and href of the <a> tag
														a.textContent = batch.batchTopic; // Assuming each batch object has a 'batchTopic' property
														a.href = url; // Set the URL to navigate to
														a.id = 'batch-' + batch.batchId; // Set ID for potential use in other operations

														// Append the <a> tag to the <li>
														li.appendChild(a);

														// Append the <li> to the list
														batchList.appendChild(li);
													});
											}

											//      function for student  attendance for present
											function studentpresent(rollNo) {
												url = "http://localhost:9090/valunteer/studentattendance/present?rollNo=";
												markAttendence(rollNo, url);
											}
											//      function for student  attendance for absent
											function studentabsent(rollNo) {
												url = "http://localhost:9090/valunteer/studentattendance/absent?rollNo=";
												markAttendence(rollNo, url);
											}

											function markAttendence(rollNo, url) {
	<%if (list != null) {%>
		var batchId = '<%=list.get(0).getBatch().getBatchId()%>';
	<%} else {%>
													alert('No available student');
													return; // Exit the function if no batchId is available
<%}%>
		// Get the roll number input value
			if (!rollNo) {
													rollNo = document.getElementById('email-field').value;
												}
												if (!rollNo) {
													alert("Please Enter Roll Number");
													return;
												}

												var xhttp = new XMLHttpRequest();
												xhttp.onreadystatechange = function () {
													if (xhttp.readyState === XMLHttpRequest.DONE) {
														if (xhttp.status === 200) {
															// Check the response from the server
															var response = xhttp.responseText;
															if (response === null || response.trim() === "") {
																alert("Response from server is null or empty.");
															} else {
																alert("Successfully marked attendance.");
																document.getElementById(rollNo).remove();
															}
														} else {
															alert("Error occurred while marking attendance. Status: "
																+ xhttp.status);
														}
													}
												};
												xhttp.open("GET", url + rollNo + "&batchId=" + batchId, true);
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
														<% if (list !=null) { String
															currentBatch=request.getParameter("batchId"); %>
															<h3>
																Batch :-
																<%=list.get(0).getBatch().getBatchTopic()%>
															</h3>
															<% } else { %>
																<h3>Please Select Batch Available Student</h3>
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
																	<li id="batchList1" id="batchId" />

																</ul>
														</ul>
													</nav>
													<!-- End Section Title -->
													<div class="container d-flex justify-content-center">
														<div class="col-lg-6">
															<div class="php-email-form">
																<div class="row gy-4">

																	<div class="col-md-12">
																		<label for="email-field" class="pb-2">Enter Roll
																			No.</label> <input type="number"
																			class="form-control" name="text"
																			id="email-field" required>

																	</div>
																	<div class="col-md-12 text-center">
																		<button type="button" class="btn btn-secondary"
																			onclick="studentpresent(document.getElementById('email-field').value)">Enter</button>
																		<button type="button" class="btn btn-secondary"
																			onclick="studentabsent(document.getElementById('email-field').value)">delete</button>
																	</div>
																</div>

															</div>
														</div>

													</div>

													<!------------------------------------------------------------------------------------------------------------------------------------------->
													<div class="py-4">
														<div class="row">
															<% if (list !=null) { %>
																<section class="col py-4 px-2 ">
																	<div class="row ">
																		<div class="col-lg-8 mb-lg-0 mb-4 mx-auto">
																			<div class="card z-index-2 h-100">
																				<div
																					class="card-header pb-0 pt-3 bg-transparent">
																					<h6
																						class="text-capitalize text-center">
																						Student List</h6>
																				</div>
																				<div class="card-body p-3 ">
																					<div class="chart ">
																						<!-- <canvas id="chart-line" class="chart-canvas" height="300"></canvas> -->

																						<table
																							class="table align-items-center ">
																							<div class="nested-div ">
																								<% for (int i=0; i <
																									list.size(); i++) {
																									%>

																									<div
																										class="table-responsive">
																										<table
																											class="table align-items-center ">
																											<tbody>
																												<tr
																													id="<%=list.get(i).getRollNo()%>">
																													<td>
																														<div
																															class="text-center">
																															<p
																																class="text-xs font-weight-bold mb-0">
																																Roll
																																no:
																															</p>
																															<h6
																																class="text-sm mb-0">
																																<%=list.get(i).getRollNo()%>
																															</h6>
																														</div>
																													</td>
																													<td>
																														<div
																															class="text-center">
																															<p
																																class="text-xs font-weight-bold mb-0">
																																Name:
																															</p>
																															<h6
																																class="text-sm mb-0">
																																<%=list.get(i).getUser().getName()%>
																															</h6>
																														</div>
																													</td>
																													<td
																														class="text-center">
																														<div
																															class="col text-center">
																															<p
																																class="text-xs font-weight-bold mb-0">
																																Id:
																															</p>
																															<h6
																																class="text-sm mb-0">
																																<%=list.get(i).getBatch().getBatchId()%>
																															</h6>
																														</div>
																													</td>
																													<td>
																														<div
																															class="">
																															<!-- <button type="button" class="btn btn-outline-success"
																				onclick="">Allow</button> -->
																															<button
																																type="button"
																																class="btn btn-outline-danger"
																																onclick="studentabsent('<%=list.get(i).getRollNo()%>')">Remove</button>
																														</div>
																													</td>
																												</tr>
																										</table>
																									</div>

																									<% } %>
																							</div>

																							</tbody>
																						</table>


																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</section>
																<% } else { %>
																	<h3 class="container section-title">Not Available
																		Student in
																		This Batch!</h3>
																	<% } %>
														</div>
													</div>
											</main>
											<!-- /Contact Section -->
											<%@ include file="component/footer.jsp" %>
												<%@ include file="component/script.jsp" %>

			</body>

			</html>