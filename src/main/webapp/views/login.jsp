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
					<h2>Login</h2>
				</div>
				<!-- End Section Title -->
				<div class="container">

					<div class="col-lg-7">

						<form action="/menu" method="post" class="php-email-form">


							<div class="row mb-4">
								<div class="form-floating mb-3" >
									<input type="email" class="form-control" id="floatingInput"
										placeholder="name@example.com"> <label
										for="floatingInput">Email address</label>
								</div>



							</div>

							<div class="row mb-4">
								<div class="form-floating">
									<input type="password" class="form-control"
										id="floatingPassword" placeholder="Password"> <label
										for="floatingPassword">Password</label>
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