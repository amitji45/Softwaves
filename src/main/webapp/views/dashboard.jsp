<%@ page import="com.springboot.swt.project.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="component/head.jsp"%>
</head>
<body>
	<%
	User user = (User)session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("/swt/login");
	}
	%>

	<%@ include file="component/navbar.jsp"%>
	<div class="py-4">
		<div class="row">
			<aside class="col-xl-3 col-md-6 col-sm-11 py-4">
				<div class="card card-carousel overflow-hidden h-100 p-0">
					<div class="card z-index-2 h-100">
						<div class="card-header pb-0 pt-3 bg-transparent">
							<h6 class="text-capitalize text-center">Profile</h6>
						</div>
						<div class="card-body p-3">
							<div class="d-flex flex-column align-items-center text-center">
								<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
									alt="Admin" class="rounded-circle" width="150">
								<div class="mt-3">
									<h4><%=(user != null)? user.getName():null%></h4>
									<p class="text-secondary mb-1"><%=(user != null)? user.getBatch():null%></p>
									<p class="text-muted font-size-sm"><%=(user != null)? user.getEmail():null%></p>
									<button class="btn btn-primary">Profile</button>
									<button type="button" class="btn btn-outline-primary"
										data-bs-toggle="modal" data-bs-target="#exampleModal">Edit
										Profile</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Edit Profile</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="card-body p-3">
									<div class="d-flex flex-column align-items-center text-center">
										<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
											alt="Admin" class="rounded-circle" width="150">
										<div class="mt-3">
											<h4><%=(user != null)? user.getName():null%></h4>
											<p class="text-secondary mb-1"><%=(user != null)? user.getBatch():null%></p>
											<p class="text-muted font-size-sm"><%=(user != null)? user.getEmail():null%></p>
											<button class="btn btn-primary">Profile</button>
											<button type="button" class="btn btn-outline-primary"
												data-bs-toggle="modal" data-bs-target="#exampleModal">Edit
												Profile</button>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
					</div>
				</div>
			</aside>
			<section class="col py-4">
				<div class="row">
					<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
						<div class="card ">
							<div class=" card-body p-3">
								<div class="row">
									<div class="col-8">
										<div class="numbers">
											<p class="text-sm mb-0 text-uppercase font-weight-bold">Attendance</p>
											<h5 class="font-weight-bolder">10</h5>
											<p class="mb-0">
												<span class="text-success text-sm font-weight-bolder">100%</span>
												since Today <a
													class="bg-gradient-primary btn text-light mt-1"
													href="dashboard/attendance">View</a>
											</p>
										</div>
									</div>
									<div class="col-4 text-end">
										<div
											class="icon icon-shape bg-gradient-primary shadow-primary text-center rounded-circle">
											<i class="fa-solid fa-calendar-days text-lg opacity-10"
												aria-hidden="true"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
						<div class="card">
							<div class="card-body p-3">
								<div class="row">
									<div class="col-8">
										<div class="numbers">
											<p class="text-sm mb-0  font-weight-bold">No. of Test</p>
											<h5 class="font-weight-bolder">4</h5>
											<p class="mb-0">
												<span class="text-success text-sm font-weight-bolder">100%</span>
												since Today <a
													class="bg-gradient-warning btn text-light mt-1"
													href="dashboard/attendance">View</a>
											</p>
										</div>
									</div>
									<div class="col-4 text-end">
										<div
											class="icon icon-shape bg-gradient-warning shadow-warning text-center rounded-circle">
											<i
												class="fa-solid fa-list-check text-light text-lg opacity-10"
												aria-hidden="true"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
						<div class="card">
							<div class="card-body p-3">
								<div class="row">
									<div class="col-8">
										<div class="numbers">
											<p class="text-sm mb-0 text-uppercase font-weight-bold">Progress</p>
											<h5 class="font-weight-bolder">20%</h5>
											<p class="mb-0">
												<span class="text-success text-sm font-weight-bolder">100%</span>
												since Today <a
													class="bg-gradient-success btn text-light mt-1"
													href="dashboard/attendance">View</a>
											</p>
										</div>
									</div>
									<div class="col-4 text-end">
										<div
											class="icon icon-shape bg-gradient-success shadow-primary text-center rounded-circle">
											<i class="fa-solid fa-chart-pie text-lg opacity-10"
												aria-hidden="true"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
						<div class="card ">
							<div class="card-body p-3">
								<div class="row">
									<div class="col-8">
										<div class="numbers">
											<p class="text-sm mb-0 text-uppercase font-weight-bold">Average</p>
											<h5 class="font-weight-bolder">75.6</h5>
											<p class="mb-0">
												<span class="text-success text-sm font-weight-bolder">100%</span>
												since Today <a 
													class="bg-gradient-danger btn text-light mt-1"
													href="dashboard/attendance">View</a>
											</p>
										</div>
									</div>
									<div class="col-4 text-end">
										<div
											class="icon icon-shape bg-gradient-danger shadow-primary text-center rounded-circle">
											<i
												class="fa-solid fa-square-poll-vertical text-lg opacity-10"
												aria-hidden="true"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col-lg-7 mb-lg-0 mb-4">
						<div class="card z-index-2 h-100">
							<div class="card-header pb-0 pt-3 bg-transparent">
								<h6 class="text-capitalize">Week Based Progress</h6>
							</div>
							<div class="card-body p-3">
								<div class="chart">
									<canvas id="chart-line" class="chart-canvas" height="300"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-5">
						<div class="card card-carousel overflow-hidden h-100 p-0">
							<div class="card z-index-2 h-100">
								<div class="card-header pb-0 pt-3 bg-transparent">
									<h6 class="text-capitalize">Notice</h6>
								</div>
								<div class="card-body p-3"></div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<%@ include file="component/footer.jsp"%>
	<%@ include file="component/script.jsp"%>
	<script src="<%=assetspath%>js/main.js"></script>
	<script src="<%=assetspath%>js/chartjs.min.js"></script>
	<script>
		var ctx1 = document.getElementById("chart-line").getContext("2d");

		var gradientStroke1 = ctx1.createLinearGradient(0, 230, 0, 50);

		gradientStroke1.addColorStop(1, 'rgba(94, 114, 228, 0.2)');
		gradientStroke1.addColorStop(0.2, 'rgba(94, 114, 228, 0.0)');
		gradientStroke1.addColorStop(0, 'rgba(94, 114, 228, 0)');
		new Chart(ctx1, {
			type : "line",
			data : {
				labels : [ "Week1", "Week2", "Week3", "Week4", "Week5",
						"Week6", "Week7", "Week8" ],
				datasets : [ {
					label : "Marks Progress",
					tension : 0.4,
					borderWidth : 0,
					pointRadius : 0,
					borderColor : "#5e72e4",
					backgroundColor : gradientStroke1,
					borderWidth : 3,
					fill : true,
					data : [ 50, 40, 60, 20, 95, 89, 73, 30 ],
					maxBarThickness : 6

				} ],
			},
			options : {
				responsive : true,
				maintainAspectRatio : false,
				plugins : {
					legend : {
						display : false,
					}
				},
				interaction : {
					intersect : false,
					mode : 'index',
				},
				scales : {
					y : {
						grid : {
							drawBorder : false,
							display : true,
							drawOnChartArea : true,
							drawTicks : false,
							borderDash : [ 5, 5 ]
						},
						ticks : {
							display : true,
							padding : 10,
							color : '#fbfbfb',
							font : {
								size : 11,
								family : "Open Sans",
								style : 'normal',
								lineHeight : 2
							},
						}
					},
					x : {
						grid : {
							drawBorder : false,
							display : false,
							drawOnChartArea : false,
							drawTicks : false,
							borderDash : [ 5, 5 ]
						},
						ticks : {
							display : true,
							color : '#ccc',
							padding : 20,
							font : {
								size : 11,
								family : "Open Sans",
								style : 'normal',
								lineHeight : 2
							},
						}
					},
				},
			},
		});
	</script>
</body>
</html>