
<%@page import="java.util.Map"%>
<%@ page import="com.springboot.swt.project.entity.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="component/head.jsp"%>
</head>
<body>
	<%
	List<Student> list = (List<Student>) request.getAttribute("studentlist");
	
	List<Student> absentlist = (List<Student>) request.getAttribute("absendstudentlist");
	
	List<Batch> activebatch = (List<Batch>) request.getAttribute("activebatch");
	%>
	<script>
		//      function for  Active batch list 
function findActiveBatches() {
    var url = "http://localhost:9090/valunteer/findActivebatches";
    var xhttp = new XMLHttpRequest();

    xhttp.onreadystatechange = function() {
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
        console.error('Element with id "batchList1" not found.');
        return;
    }

    // Clear existing items
    batchList.innerHTML = '';

    // Log batches1 for debugging
    console.log('Batches data:', batches1);

    if (!Array.isArray(batches1) || batches1.length === 0) {
        alert('No active batches found.');
        return;
    }

    // Iterate over the batches and create list items
    batches1.forEach(function(batch) {
        if (!batch.batchId || !batch.batchTopic) {
            console.warn('Batch object missing required properties:', batch);
            return;
        }

        var li = document.createElement('li');
        var a = document.createElement('a');
        var url = "http://localhost:9090/valunteer/findallstudent?batchId=" + batch.batchId;

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
		var batchId =
	<%=list.get(0).getBatch().getBatchId()%>
		
	<%}%>
		// Get the roll number input value
			if (!rollNo)
				rollNo = document.getElementById('email-field').value;
			if (!rollNo) {
				alert("Please Enter Roll Number...");
				return;
			}
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {

				console.log("susessfully....");
				document.getElementById(rollNo).remove();
			};
			xhttp.open("GET", url + rollNo + "&batchId=" + batchId, true);
			xhttp.send();

		}
	</script>

	<%@ include file="component/navbar.jsp"%>
	<main class="main">
		<!-- Contact Section -->
		<section id="login" class="contact section">
			<!-- Section Title -->
			<div class="container section-title">
				<h2>User Attendence</h2>
			</div>
			<!--col-xl-2 col-md-6 col-sm-11 py-4 -->
			<nav id="navmenu" class="navmenu">
				<div class="text-center">
					<p class="text-xs font-weight-bold mb-0">Batch Name</p>
				</div>
				<ul class="justify-content-center col-xl-9 col-md-6 col-sm-7 py-9 ">
					<li class="dropdown"><a href="#" onclick="findActiveBatches()"
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
								<label for="email-field" class="pb-2">Enter Roll No.</label> <input
									type="number" class="form-control" name="text" id="email-field"
									required>

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

				<!-- End Contact Form -->
			</div>
			<!-- 
//-------------------------------------------------------------------------------------------- -->
			<div class="py-4">
				<div class="row">
					<aside class="col-xl-2 col-md-6 col-sm-11 py-4">

						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Edit
											Profile</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="card-body p-3">
											<div
												class="d-flex flex-column align-items-center text-center">
												<img
													src="https://bootdey.com/img/Content/avatar/avatar7.png"
													alt="Admin" class="rounded-circle" width="150">
												<div class="mt-3">
													<h4>aman</h4>
													<p class="text-secondary mb-1">batch id</p>
													<p class="text-muted font-size-sm">aman@gmail.com</p>
													<!-- <button class="btn btn-primary">Profile</button> -->
													<!-- <button type="button" class="btn btn-outline-primary"
												data-bs-toggle="modal" data-bs-target="#exampleModal">Edit
												Profile</button>   -->
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>

									</div>
								</div>
							</div>
					</aside>
					<%
					if (list != null) {
					%>

					<section class="col py-4 px-2">
						<div class="row mt-8 ">
							<div class="col-lg-8 mb-lg-0 mb-4">
								<div class="card z-index-2 h-100">
									<div class="card-header pb-0 pt-3 bg-transparent">
										<h6 class="text-capitalize text-center">Student List</h6>

									</div>

									<div class="card-body p-3 ">
										<div class="chart ">
											<!-- <canvas id="chart-line" class="chart-canvas" height="300"></canvas> -->

											<table class="table align-items-center ">
												<div class="nested-div ">
													<%
													for (int i = 0; i < list.size(); i++) {
													%>

													<div class="table-responsive">
														<table class="table align-items-center ">
															<tbody>
																<tr id="<%=list.get(i).getRollNo()%>">
																	<td>
																		<div class="text-center">
																			<p class="text-xs font-weight-bold mb-0">Roll no:</p>
																			<h6 class="text-sm mb-0"><%=list.get(i).getRollNo()%></h6>
																		</div>
																	</td>
																	<td>
																		<div class="text-center">
																			<p class="text-xs font-weight-bold mb-0">Name:</p>
																			<h6 class="text-sm mb-0"><%=list.get(i).getUser().getName()%></h6>
																		</div>
																	</td>
																	<td class="text-center">
																		<div class="col text-center">
																			<p class="text-xs font-weight-bold mb-0">Id:</p>
																			<h6 class="text-sm mb-0"><%=list.get(i).getBatch().getBatchId()%></h6>
																		</div>
																	</td>
																	<td>
																		<div class="">
																			<!-- <button type="button" class="btn btn-outline-success"
																				onclick="">Allow</button> -->
																			<button type="button" class="btn btn-outline-danger"
																				onclick="studentabsent('<%=list.get(i).getRollNo()%>')">Remove</button>
																		</div>
																	</td>
																</tr>
														</table>
													</div>

													<%
													}
													%>
												</div>

												</tbody>
											</table>


										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
					<%
					}
					%>

				</div>
			</div>
	</main>
	<!-- /Contact Section -->
	<%@ include file="component/footer.jsp"%>
	<%@ include file="component/script.jsp"%>

</body>

</html>
