<!DOCTYPE html>
<html>
<head>
<%@ include file="component/head.jsp"%>
</head>
<body>
	<%@ include file="component/navbar.jsp"%>
	<main class="main">
		<section id="contact" class="contact section">

			<!-- Section Title -->
			<div class="container section-title">
				<h2>Registration</h2>
			</div>
			<!-- End Section Title -->
			<div class="container d-flex justify-content-center ">

				<div class="col-lg-7">

					<form action="../user/tempregis" method="post" class="php-email-form">
						<%
						if (request.getParameter("error") != null) {
						%>
						<div class="row mb-4">
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<%=request.getParameter("error")%>
								<button type="button" class="btn-close" data-bs-dismiss="alert"
									aria-label="Close"></button>
							</div>
						</div>

						<%
						}
						%>
						<div class="row mb-4">
							<div class="input-group mb-3">
								<span class="col-lg-2 col-4 input-group-text" id="basic-addon1">
									Name</span> <input type="text" class="form-control"
									placeholder="Enter Name" name="name" required>
							</div>
						</div>

						<div class="row mb-4">
							<div class="input-group mb-3">
								<span class="col-lg-2 col-4 input-group-text" id="basic-addon1">
									Email</span> <input type="text" class="form-control"
									placeholder="Enter Email" name="email" required>
							</div>
						</div>

						<div class="row mb-4">
							<div class="input-group mb-3">
								<span class="col-lg-2 col-4 input-group-text" id="basic-addon1">Phone
									No</span> <input type="text" class="form-control"
									placeholder="Enter Contact No." name="contactNo" required>
							</div>
						</div>

						<div class="row mb-4">
							<div class="input-group mb-3">
								<span class="col-lg-2 col-4 input-group-text" id="basic-addon1">
									Password </span> <input type="password" class="form-control"
									placeholder="Enter Password" name="password" required>
							</div>
						</div>

						<div class="col-md-12 text-center">
							<button type="submit">Register</button>
						</div>
					</form>
				</div>
				<!-- End Contact Form -->
			</div>

		</section>
		<!-- /Contact Section -->
	</main>
	<%@ include file="component/footer.jsp"%>
	<%@ include file="component/script.jsp"%>
</body>
</html>