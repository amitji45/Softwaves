<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<meta content="" name="description">
<meta content="" name="keywords">
<!-- Favicons -->
<meta charset="ISO-8859-1">
<title>Softwaves</title>
<link href="/img/favicon.png " rel="icon">
<link href="/img/apple-touch-icon.png " rel="apple-touch-icon">
</head>
<body>
	<%@ include file="component/navbar.jsp"%>
	<main class="main">
		<center>
			<!-- Contact Section -->
			<section id="contact" class="contact section">

				<!-- Section Title -->
				<div class="container section-title">
					<h2>Registration</h2>
				</div>
				<!-- End Section Title -->
				<div class="container" ce>

					<div class="col-lg-7">

						<form action="/menu" method="post" class="php-email-form">


							<div class="row mb-4">
								<div class="input-group mb-3">
									<span class="input-group-text" id="basic-addon1">Contact No </span> <input type="text" class="form-control"
										placeholder="Contact" aria-label="Username"
										aria-describedby="basic-addon1">
								</div>


							</div>
							
							<div class="row mb-4">
								<div class="input-group mb-3">
									<span class="input-group-text" id="basic-addon1">Enter
										Name</span> <input type="text" class="form-control"
										placeholder="Name" aria-label="Username"
										aria-describedby="basic-addon1">
								</div>


							</div>
							
							<div class="row mb-4">
								<div class="input-group mb-3">
									<span class="input-group-text" id="basic-addon1">Enter
										Email</span> <input type="text" class="form-control"
										placeholder="Email" aria-label="Username"
										aria-describedby="basic-addon1">
								</div>


							</div>
							
							<div class="row mb-4">
								<div class="input-group mb-3">
									<span class="input-group-text" id="basic-addon1">Batch</span> <input type="text" class="form-control"
										placeholder="Batch" aria-label="Username"
										aria-describedby="basic-addon1">
								</div>


							</div>
							
							<div class="row mb-4">
								<div class="input-group mb-3">
									<span class="input-group-text" id="basic-addon1">Role</span> <input type="text" class="form-control"
										placeholder="Student or Invigilator" aria-label="Username"
										aria-describedby="basic-addon1">
								</div>


							</div>
							
							

							<div class="row mb-4">
								<div class="input-group mb-3">
									<span class="input-group-text" id="basic-addon1"> Enter
										Password  </span> <input type="text" class="form-control"
										placeholder="Password" aria-label="Username"
										aria-describedby="basic-addon1">
								</div>


							</div>


							<!-- 2 column grid layout -->
							<div class="row mb-4">
								<div class="col-md-6 d-flex justify-content-center">
									<!-- Checkbox -->
									<div class="form-check mb-3 mb-md-0">
										<input class="form-check-input" type="checkbox" value=""
											id="loginCheck" checked /> <label class="form-check-label"
											for="loginCheck"> Remember me </label>
									</div>
								</div>

								<div class="col-md-6 d-flex justify-content-center">
									<!-- Simple link -->
									<a href="#!">Forgot password?</a>
								</div>
							</div>

							<div class="row mb-4">
								<div class="col-md-12 text-center">
									<button type="submit">Login</button>
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
			<center>
	</main>
	<%@ include file="component/footer.jsp"%>
</body>
</html>