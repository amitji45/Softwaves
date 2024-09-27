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







					<nav id="navmenu" class="navmenu">
                        <ul class="justify-content-center col-xl-9 col-md-6 col-sm-7 py-9 ">
                            <li class="dropdown">
                                <a href="#" onclick="findActiveBatches()">
                                    <span id="header1">Select Batch</span>
                                    <i class="bi bi-chevron-down toggle-dropdown"></i>
                                </a>
                                <ul>
                                    <% List<Batch> activebatches = (List<Batch>) session.getAttribute("activebatch");
                                       for (Batch batch : activebatches) { %>
                                        <li>
                                            <a href="#"
                                               onclick="setBatchValue('<%=batch.getBatchId()%>' ,'<%=batch.getBatchTopic()%>'); return false;">
                                                <%=batch.getBatchTopic()%>
                                            </a>
                                        </li>
                                    <% } %>
                                </ul>
                            </li>
                        </ul>
                    </nav>

                    <!-- Select Element -->
                    <select hidden class="justify-content-center col-xl-9 col-md-6 col-sm-7 py-9" id="batchId">
                        <option value="" disabled selected>Select a batch</option>
                        <% for (Batch batch : activebatches) { %>
                            <option value="<%=batch.getBatchId()%>"><%=batch.getBatchTopic()%></option>
                        <% } %>
                    </select>






					<div class="container d-flex justify-content-center">
						<div class="col-lg-6">
							<form method="post" class="php-email-form">
								<div class="row gy-4">


									<div class="row mb-4">
										<div class="input-group mb-3">
											<span class="col-lg-2 col-4 input-group-text" id="basic-addon1">
												Test No.</span> <input type="text" class="form-control"
												placeholder="Enter Test No." name="testNo" id="testNo" required>
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

						/* function uploadMarks(){
							marks=""+ document.getElementById("marks").value;
							rollNo=""+ document.getElementById("rollNo").value;
							batchId=""+document.getElementById("batchId").value;
							url = "http://localhost:9090/valunteer/setmarks?rollNo=";
							
							var xhttp = new XMLHttpRequest();
							
							xhttp.open("GET", url + rollNo + "&batchId=" + batchId + "&marks=" + marks, true);
							xhttp.send();
							if(!response)
								{

									return ;
								}
								document.getElementById("rollNo").value="";
								document.getElementById("marks").value="";
						} */
						function uploadMarks() {
							// Get values from input fields
							var marks = "" + document.getElementById("marks").value;
							var rollNo = "" + document.getElementById("rollNo").value;
							var testNo = "" + document.getElementById("testNo").value;
							var batchId = "" + document.getElementById("batchId").value;
							var url = "http://localhost:9090/valunteer/setmarks?rollNo=";

<<<<<<< HEAD
							if (marks === "" || rollNo === "" || batchId === "") {

								Swal.fire({
                                												icon: "error",
                                												title: "Not Valid ",
                                												text: "Please Enter Valid Data !",
                                												timer : 700
                                											});
=======
							if (marks === "" || rollNo === "" || batchId === "" || testNo=== "") {
								alert('Please Enter Valid Data');
>>>>>>> raghav-dev
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
												console.log('Response is null or empty. Please try again.');
											} else {
												
												// Handle a valid response
												Swal.fire({
												icon: "success",
												title: "Done",
												text: "Marks uploaded successfully!",
												timer : 700
											});
												
											}

											// Clear the input fields
											document.getElementById("rollNo").value = "";
											document.getElementById("marks").value = "";
										} else {
											// Handle HTTP errors
											console.log('Failed to upload marks. Status: ' + this.status);
										}
									}
								};
							}
							// Open and send the request
							xhttp.open("GET", url + rollNo + "&batchId=" + batchId + "&marks=" + marks + "&testNo=" + testNo, true);
							xhttp.send();
						}

function setBatchValue(batchId, batchTopic) {
    var selectElement = document.getElementById("batchId");
    selectElement.value = batchId; // Set the value of the select element
      const header = document.getElementById('myHeader');
                // Append content to the existing content of the h3
                console.log(batchTopic);
                header.textContent = "Selected Batch : "+batchTopic;
                  const header1 = document.getElementById('header1');
                  header1.textContent= batchTopic;
}

					</script>
	</body>

	</html>