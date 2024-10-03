<%@ page import="com.springboot.swt.project.entity.User" %>
	<%@ page import="com.springboot.swt.project.entity.Batch" %>
		<%@ page import="com.springboot.swt.project.entity.User,java.util.List" %>
			<header id="header" class="header d-flex align-items-center sticky-top">
				<div class="container-fluid container-xl position-relative d-flex align-items-center">

					<a href="#index" class="logo d-flex align-items-center me-auto">
						<!-- Uncomment the line below if you also wish to use an image logo -->
						<!-- <img src="assets/img/logo.png" alt=""> -->
						<h1 class="sitename">
							<%=siteName%>
						</h1>
					</a>

					<% User user1=(User) session.getAttribute("user"); User admin=(User) session.getAttribute("admin");
						List<Batch> batches = (List<Batch>) request.getAttribute("temp");
							%>
							<script type="text/javascript">

								document.addEventListener('DOMContentLoaded', function () {
									findEnrollBatche();
									findActiveBatchesnavbar();
								});
								function createBatch(batch_name) {
									url = "<%=linkSetup%>admin/newbatch?name=";
									var xhttp = new XMLHttpRequest();
									xhttp.onreadystatechange = function (response) {
										if (this.readyState == 4 && this.status == 200) {

											Swal.fire({
												icon: "success",
												title: "Done",
												text: response.target.responseText,

											});
										}
									};
									xhttp.open("GET", url + batch_name + "", true);
									xhttp.send();
								}

								function findEnrollBatche() {
									var url = "<%=linkSetup%>user/allbatches"; // Your API endpoint
									var xhttp = new XMLHttpRequest();

									xhttp.onreadystatechange = function () {
										if (this.readyState === 4) {
											if (this.status === 200) {
												try {
													var response = JSON.parse(this.responseText); // Parse the JSON response
													handleResponse(response);
												} catch (error) {
													console.log("Error batch  fetch problem parsing JSON:", error);

												}
											} else {
												console.log("Error: " + this.status + " " + this.statusText);
												console.log("Failed to fetch batches. Please try again later.");
											}
										}
									};

									xhttp.open("GET", url, true); // Initialize GET request
									xhttp.send(); // Send the request
								}

								// Function to handle the response and update the dropdown
								function handleResponse(response) {

									var dropdownContainer = document.getElementById('dropdownContainer');
									dropdownContainer.innerHTML = ''; // Clear existing dropdown

									if (Array.isArray(response) && response.length >= 1) {

										document.getElementById('findenrollbatchnoneblock').style.display = 'block'
										var enrollBatch = document.createElement('li');
										enrollBatch.className = 'dropdown';
										enrollBatch.id = 'enrollBatch';

										enrollBatch.innerHTML = `<li id="batchList" class="dropdown"></li>`;
										// Append the dropdown to the container
										dropdownContainer.appendChild(enrollBatch);
										// Update the batch list with the response data
										updateEnrollBatchList(response);
									} else {
										document.getElementById('findenrollbatchnoneblock').style.display = 'none'
										// Handle the case when no batches are found
										// console.log("No batches found.");
										// showError("No batches available for Enroll");
										// dropdownContainer.innerHTML = '<p>No batches available for Enroll.</p>'; // Display a message if no batches are found
									}
								}

								// Function to update the batch list with the response data

								function updateEnrollBatchList(batches) {
									var batchList = document.getElementById('batchList');

									// Clear existing items
									batchList.innerHTML = '';

									// Iterate over the batches and create list items
									batches
										.forEach(function (batch) {
											var li = document.createElement('li');
											var a = document.createElement('a');
											a.textContent = batch.batchTopic;

											a.addEventListener('click', function (event) {												// Prevent the default link behavior
												var url = "<%=linkSetup%>user/enrollstudent?batchId=" + batch.batchId;
												var xhr = new XMLHttpRequest();
												xhr.onreadystatechange = function () {
													if (xhr.readyState === XMLHttpRequest.DONE) {
														if (this.status === 200) {
															showError(xhr.responseText);
														} else {
															showError(xhr.statusText);
															$('#enrollBatch').empty();
															location.reload();
														}
													}
												};
												xhr.open('GET', url, true);
												xhr.send();
											});
											li.appendChild(a);
											batchList.appendChild(li);
										});

								}
								// Function to toggle the visibility of the batch list
								// Function to handle batch enrollment
								function enrollInBatch(batchId) {
									var url = "<%=linkSetup%>user/enrollstudent?batchId=" + batchId;
									var xhr = new XMLHttpRequest();
									xhr.onreadystatechange = function () {
										if (xhr.readyState === XMLHttpRequest.DONE) {
											if (xhr.status === 200) {
												showError(xhr.responseText); // Show success message
												// Optionally refresh the list or take other actions
												// Reload batches to reflect any changes
											} else {
												//	showError("Error enrolling in batch: " + xhr.statusText); // Show error message
												console.error("Error enrolling in batch:", xhr.statusText);
											}
										}
									};
									xhr.open('GET', url, true);
									xhr.send();
								}
								// Function to show error messages to the user
								function showError(message) {
									Swal.fire({
										icon: "info",
										title: "Message:",
										text: message,
										timer: 2000
									});// You can replace this with a more sophisticated UI element
								}
								//      function for  Active batch list
								function findActiveBatchesnavbar() {
									var url = "<%=linkSetup%>valunteer/findActivebatches";
									var xhttp = new XMLHttpRequest();

									xhttp.onreadystatechange = function () {

										var userattendanceli = document.getElementById('userattendanceli');
										if (this.readyState === XMLHttpRequest.DONE) {
											if (this.status === 200) {

												try {
													var response = JSON.parse(this.responseText);
													userattendanceli.style.display = 'block';
													document.getElementById('usermarksli').style.display = 'block';
												} catch (e) {
													userattendanceli.style.display = 'none';
												}
											}
										}
									};
									xhttp.open("GET", url, true);
									xhttp.send();
								}

							</script>
							<nav id="navmenu" class="navmenu">
								<ul>

									<% if (user1 !=null && user1.getRole().equalsIgnoreCase("volunteer") || user1 !=null
										&& user1.getRole().equalsIgnoreCase("Student")) { %>
										<li><a href="/user/dashboard" class="active">Home</a></li>
										<li class="dropdown" id="findenrollbatchnoneblock" style="display:none;">
											<a href="#" onclick="findEnrollBatche()"><span>Enroll</span>
												<i class="bi bi-chevron-down toggle-dropdown"></i>
											</a>
											<ul id="dropdownContainer">

											</ul>
										</li>

										<% if (user1 !=null && user1.getRole().equalsIgnoreCase("volunteer")) { %>
											<li id="userattendanceli" style="display: none;"><a
													href="/valunteer/userattendance">Attendance</a></li>
											<li id="usermarksli" style="display: none;"><a
													href="/valunteer/volunteerMarks">Marking</a></li>
											<% } %>
												<% } else if (admin !=null && admin.getRole().equalsIgnoreCase("Admin"))
													{ %>
													<li><a href="/admin/dashboard" class="active">Home</a></li>

													<% } else { %>
														<li><a href="/swt/" class="active">Home</a></li>
														<li><a href="/swt/#about">About</a></li>
														<li><a href="/swt/#rules">Rules</a></li>
														<li><a href="/swt/#review">Review</a></li>
														<li><a href="/swt/#contact">Contact</a></li>
														<% } %>
															<% if (admin !=null
																&&admin.getRole().equalsIgnoreCase("Admin")) { %>
																<li class="dropdown"><a href="#"><span>Students</span>
																		<i class="bi bi-chevron-down toggle-dropdown">
																		</i></a>
																	<ul>
																		<li><a href="/admin/approval">Approval</a></li>




																		<li><a href="/admin/AllStudentDetails">Completed
																				Batch</a></li>
																		<li><a href="/admin/VolunteerApproval">Volunteer
																				approval</a></li>
																		<li><a href="/admin/allStudent">All Student</a>
																		</li>
																		<li><a href="/admin/ManageBatches">Manage
																				Batches</a></li>

																		<li class="dropdown"><a href="#"><span>New
																					Batch</span><i
																					class="bi bi-chevron-down toggle-dropdown"></i></a>
																			<ul>
																				<li><a href="#"
																						onclick="createBatch('C Programming')">C
																						Programming
																					</a></li>
																				<li><a href="#"
																						onclick="createBatch('Core Java')">Core
																						Java</a></li>
																				<li><a href="#"
																						onclick="createBatch('DSA')">
																						DSA</a></li>
																				<li><a href="#"
																						onclick="createBatch('Advance Java')">Advance
																						Java</a></li>
																				<li><a href="#"
																						onclick="createBatch('Interview Class')">Interview
																						Class</a></li>
																			</ul>
																		</li>

																	</ul>
																</li>
																<% } %>
								</ul>
								<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
							</nav>
							<% if (user1==null && admin==null) { %>
								<a class="btn-getstarted" href="/swt/login">Sign In</a>
								<% } else { %>
									<a class="btn-getstarted" href="/user/logout">Sign Out</a>
									<% } %>
				</div>
			</header>