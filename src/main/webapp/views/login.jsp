<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="component/head.jsp"%>
</head>
<body>
<%  %>
	<%@ include file="component/navbar.jsp"%>
	<main class="main">
		<!-- Contact Section -->
		<section id="login" class="contact section">
			<!-- Section Title -->
			<div class="container section-title">
				<h2>Login</h2>
			</div>
			<!-- End Section Title -->
			<div class="container d-flex justify-content-center">
				<div class="col-lg-6">
					<form action="../user/login" method="post" class="php-email-form">
						<div class="row gy-4">
							<%
							if (request.getParameter("error") != null) {
							%>
							<div class="col-lg-12">
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
							<%
							if (request.getParameter("success") != null) {
							%>
							<div class="col-lg-12">
								<div class="alert alert-success alert-dismissible fade show"
									role="alert">
									<%=request.getParameter("success")%>
									<button type="button" class="btn-close" data-bs-dismiss="alert"
										aria-label="Close"></button>
								</div>
							</div>

							<%
							}
							%>
							<div class="col-md-12">
								<label for="email-field" class="pb-2">Your Email</label> <input
									type="text" class="form-control" name="email" id="email-field"
									required>
							</div>


							<div class="col-md-12">
								<label for="password-field" class="pb-2">Your Password</label> <input
									type="password" class="form-control" name="password"
									id="subject-field" required>
							</div>


							<div class="col-md-12 text-center">
								<button type="submit">Login</button>
							</div>
							<div class="col-md-12 text-center">
								<p>
		<!-- when we click on forget pass word button forget api will be called for view  -->
									Forget <a href="forget">Password</a> ?
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
	<%@ include file="component/footer.jsp"%>
	<%@ include file="component/script.jsp"%>
</body>
</html>