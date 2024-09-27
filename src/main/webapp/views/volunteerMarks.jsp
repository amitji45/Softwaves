<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<!DOCTYPE html>
	<html>

	<head>
		<%@ include file="component/head.jsp" %>
	</head>

	<body>
		<%@ include file="component/navbar.jsp" %>
			<main class="main">
				<!-- Contact Section -->
				<section id="login" class="contact section">
					<!-- Section Title -->
					<div class="container section-title">
						<h2>Marking</h2>
						<h3 id="myHeader"></h3>
					</div>
					<!-- End Section Title -->



					<!-- End Section Title -->















					<div class="container d-flex justify-content-center">
						<div class="col-lg-6">
							<form method="post" class="php-email-form">
								<div class="row gy-4">


									<div class="row mb-4">
										<div class="col-md-12">
											<label for="batchList1" class="pb-2">Select Batch</label>
											<select class="form-control" name="batch" id="batchList1"
												onchange="showStudentMarks()">
												<!-- Options will be dynamically added here -->
											</select>
										</div>
									</div>
									<div class="row mb-4">
										<div class="input-group mb-3">
											<span class="col-lg-2 col-4 input-group-text" id="basic-addon1">
												Roll No.</span> <input type="text" class="form-control"
												placeholder="Enter Roll No." name="rollNo" id="rollNo" required>
										</div>
									</div>
									 

									<div class="row mb-4">
										<div class="input-group mb-3">
											<span class="col-lg-2 col-4 input-group-text" id="basic-addon1">
												Marks</span> <input type="text" class="form-control"
												placeholder="Enter Marks" name="marks" id="marks" required>
										</div>
									</div>
									<div class="col-md-12 text-center">
										<button type="button" class="btn btn-outline-success"
											onclick="uploadMarks()">Submit</button>
									</div>

								</div>
							</form>
						</div>
						<!-- End Contact Form -->

					</div>
				</section>
				<!-- /Contact Section -->
			</main>
			<%@ include file="component/footer.jsp" %>
				<%@ include file="component/script.jsp" %>
					<script>
						document.addEventListener('DOMContentLoaded', function () {
							findActiveBatches();
						});
						function findActiveBatches() {
							var batchList = document.getElementById('batchList1');
							batchList.textContent = '';
							var op1 = document.createElement('option');
							op1.textContent = 'None';
							batchList.appendChild(op1);

							$.ajax({
								url: "http://localhost:9090/valunteer/findActivebatches",
								type: 'GET',
								dataType: 'json',
								success: function (batches1) {
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
								},
								error: function (error) {
									Swal.fire({
										icon: "error",
										title: "Oops...",
										text: "Error: no Active batches.."

									});
									console.error('Error:', error);
								}
							});

						}
						function showStudentMarks() {
							var batchList = document.getElementById('batchList1');
							var batchId = batchList.value;

							console.log(batchId);
						}

						function uploadMarks() {
							// Get values from input fields
							var marks = "" + document.getElementById("marks").value;
							var rollNo = "" + document.getElementById("rollNo").value;
							var batchId = "" + document.getElementById("batchList1").value;

							var url = "http://localhost:9090/valunteer/setmarks?rollNo=";

							if (marks === "" || rollNo === "" || batchId === "None") {
								Swal.fire({
									icon: "error",
									title: "Oops...",
									timer: 2000,
									text: "Please Enter Valid Data"

								});
							}
							// Create XMLHttpRequest object
							else {
								var xhttp = new XMLHttpRequest();

								// Define the onreadystatechange callback
								xhttp.onreadystatechange = function () {
									if (this.readyState == 4) { // Check if request is complete
										if (this.status == 200) { // Check if request was successful
											var response = this.responseText;
											if (response === null || response.trim() === "") {
												// Handle the case where response is null or empty
												console.error('Response is null or empty. Please try again.');
											} else {
												Swal.fire({
													icon: "success",
													title: "Oops...",
													timer: 2000,
													text: "Marks uploaded successfully!"

												});
											}

											// Clear the input fields
											document.getElementById("rollNo").value = "";
											document.getElementById("marks").value = "";
										} else {
											// Handle HTTP errors
											console.error('Failed to upload marks. Status: ' + this.status);
										}
									}
								};
							}
							// Open and send the request
							xhttp.open("GET", url + rollNo + "&batchId=" + batchId + "&marks=" + marks, true);
							xhttp.send();
						}

						function setBatchValue(batchId, batchTopic) {
							var selectElement = document.getElementById("batchId");
							selectElement.value = batchId; // Set the value of the select element
							const header = document.getElementById('myHeader');
							// Append content to the existing content of the h3
							console.log(batchTopic);
							header.textContent = "Selected Batch : " + batchTopic;
							const header1 = document.getElementById('header1');
							header1.textContent = batchTopic;
						}

					</script>
	</body>

	</html>