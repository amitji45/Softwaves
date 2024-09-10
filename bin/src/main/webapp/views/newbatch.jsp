<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="component/head.jsp"%>
</head>
<body>
	<%@ include file="component/navbar.jsp"%>
	<main class="main">
		<!-- Contact Section -->
		<section id="login" class="contact section">
			<!-- Section Title -->
			<div class="container section-title">
				<h2>create batch</h2>
			</div>
			<!-- End Section Title -->
			<div class="container d-flex justify-content-center">
				<div class="col-lg-6">
					<form action="newbatch" method="post" class="php-email-form">
						<div class="row gy-4">
							<div class="col-md-12">
								<label for="email-field" class="pb-2">Enter new Batch</label> <input
									type="text" class="form-control" name="batchTopic" id="email-field"
									required>
							</div>

							<div class="col-md-12">
								<label for="password-field" class="pb-2">startding date </label> <input
									type="date" class="form-control" name="startDate"
									id="subject-field" required>
							</div>


							<div class="col-md-12 text-center">
								<button type="submit">create batch</button>
							</div>

							<div class="col-md-12 text-center">
								<p>
									Forget <a href="#">Password</a> ?
								</p>
								<p>
									Don't have Account ?<a href="regis"> Sign up</a>
								</p>
							</div>
						</div>
					</form>
				</div>
				<!-- End Contact Form -->

			</div>
		</section>
		<!-- /Contact Section -->
	</main>
	 
</body>
</html>