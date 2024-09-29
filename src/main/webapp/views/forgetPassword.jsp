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
				<h2>Forget Password</h2>
			</div>
			<!-- End Section Title -->
			<div class="container d-flex justify-content-center ">

				<div class="col-lg-7">

					<form action="../user/otp" method="post" class="php-email-form">
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
								<div class="col-md-12">
								<label for="email-field" class="pb-2">Your Email</label> <input
									type="text" class="form-control" name="email" 
									required>
							</div></div>
						</div>
						<input type="hidden" name="purpose"  value="otp">
						
						<div class="col-md-12 text-center">
							<button type="submit" id="findbutton">Generate OTP</button><!-- when we click on this button it will hit user/otp api  -->
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
	<script></script>
</body>
</html>