<%@page import="java.util.Map" %>
	<%@ page import="com.springboot.swt.project.entity.Student" %>
		<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
			<!DOCTYPE html>
			<html>

			<head>
				<%@ include file="component/head.jsp" %>
					<script>
						window.onload = function () {
							// Call findAllVolunteer with the desired name (if applicable)
							findAllVolunteer(""); // Replace with the actual name
						};
						function studentDetails(userId, name) {
							Swal.fire({
															icon: "error",
															title: "Wait !",
															text: "This part of website is under maintenance",

														});
							// $('#studentdetails').empty();
							// const backRow = $('<tr>');
							// backRow.append(
							// 	$('<td>').attr('colspan', 2).html('<button type="button" class="btn btn-outline-secondary" style="width: 100%;" onclick="findAllVolunteer(\'' + name + '\')">Back to all Students</button>')
							// );
							// $('#studentdetails').append(backRow);
							// var url='<%=linkSetup%>admin/getAllStudentByUserId?userId=' + userId;
							// var xhttp = new XMLHttpRequest();
                            //         xhttp.open("GET", url , true);

                            //         xhttp.onreadystatechange = function () {
                            //             if (this.readyState === 4) {
                            //                 if (this.status === 200) {
                            //                     var updatedBatch = JSON.parse(this.responseText);
                            //                     const newRow = $('<tr>').attr('id', student.batchId);
													
                            //                 } else {
                            //                     console.log("Error: " + this.status); // Log any error
                            //                 }
                            //             }
                            //         };

                            //         xhttp.send();
							// $.ajax({
							// 	url: '<%=linkSetup%>admin/getAllStudentByUserId?userId=' + userId,
							// 	type: 'GET',
							// 	dataType: 'json',
							// 	success: function (response) {
							// 		// Log response for debugging
									
							// 		console.log(response);


									// // Clear table before appending new data
									// if (response.length === 0) {
									// 	const newRow = $('<tr>');
									// 	newRow.append(
									// 		$('<td>').attr('colspan', 4).html('<h2 class="text-sm mb-0">No available.. data</h2>')
									// 	);
									// 	$('#studentdetails').append(newRow);
									// } else {
									// 	// Iterate over the response and append rows
									// 	  response.forEach(student => {
									// 		console.log("batchId:", student.batchId);
									// 		const newRow = $('<tr>').attr('id', student.batchId);
									// 		newRow.append(
									// 			$('<td>').html('<p class="text-xs font-weight-bold mb-0">Roll No:</p><h6 class="text-sm mb-0">' + student.rollNo + '</h6>'),
									// 			$('<td>').html('<p class="text-xs font-weight-bold mb-0">Name:</p><h6 class="text-sm mb-0">' + student.user.name + '</h6>'),
									// 			$('<td>').html('<p class="text-xs font-weight-bold mb-0">Present Count:</p><h6 class="text-sm mb-0">' + student.attendanceCount + '</h6>'),
									// 			$('<td>').html('<a class="btn btn-outline-danger" onclick="">Details</a>')
									// 		);
									// 		$('#studentdetails').append(newRow);
									// 	});
									// }
							// 	},
							// 	error: function (error) {
							// 		console.error('Error:', error);
							// 		const newRow = $('<tr>');
							// 		newRow.append(
							// 			$('<td>').attr('colspan', 4).html('<h6 class="text-sm mb-0">Page not found. Error: 404</h6>')
							// 		);
							// 		$('#studentdetails').append(newRow);


							// 	}
							// });


						}

						function findAllVolunteer(name) {

							$.ajax({
								url: '<%=linkSetup%>user/findVolunteer?name=' + name,
								type: 'GET',
								dataType: 'json', // No need to parse the response manually
								success: function (response) {

									// Clear the existing table body to prevent duplicates
									$('#studentdetails').empty();

									// Iterate over the response and append rows
									response.forEach(user => {
										const newRow = $('<tr>').attr('id', user.id);
										newRow.append(
											$('<td>').html('<p class="text-xs font-weight-bold mb-0">Name :</p><h6 class="text-sm mb-0">' + user.name + '</h6>'),
											$('<td>').html('<p class="text-xs font-weight-bold mb-0">batch</p><h6 class="text-sm mb-0">' + (user.batch == null ? "Not in Active Batch " : user.batch) + '</h6>'),
											// $('<td>').html('<p class="text-xs font-weight-bold mb-0">User id </p><h6 class="text-sm mb-0">' + user.id + '</h6>'),
											// $('<td>').html('<button type="button" class="btn btn-outline-danger "  >details</button>'),
											$('<td>').html('<button type="button" class="btn btn-outline-danger " onclick="studentDetails(\'' + user.id + '\' , \'' + name + '\')" >details</button>'),
										);
										// Append the new row to the table
										$('#studentdetails').append(newRow);
									});
								},
								error: function (error) {
									console.error('Error:', error);
								}
							});

						}

					</script>
			</head>

			<body>


				<%@ include file="component/navbar.jsp" %>
					<main class="main">
						<!-- Contact Section -->
						<section id="login" class="contact section">
							<!-- Section Title -->
							<div class="container section-title">
								<h2>All Students</h2>
							</div>
							<!--col-xl-2 col-md-6 col-sm-11 py-4 -->
							<div class="container d-flex justify-content-center">
								<div class="col-lg-6">
									<div class="php-email-form">
										<div class="row gy-4">

											<div class="col-md-12">
												<label for="email-field" class="pb-2">Enter Student Name</label> <input
													type="text" class="form-control" name="text" id="email-field"
													onkeyup="findAllVolunteer(this.value)" required>

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

									<section class="col py-4 px-2">
										<div class="row">
											<div class="col-lg-6 mb-lg-0 mb-4 mx-auto">
												<div class="card ">
													<div class="card-header pb-0 p-3">
														<div class="d-flex justify-content-center">
															<h6 class="mb-2">All Students</h6>
														</div>
													</div>
													<div class="table-responsive">
														<table class="table align-items-center ">
															<tbody id="studentdetails">

															</tbody>
														</table>

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