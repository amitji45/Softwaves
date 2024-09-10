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
				<h2>Enter new Password</h2>
			</div>
			<!-- End Section Title -->
			<div class="container d-flex justify-content-center ">

				<div class="col-lg-7">

					<form action="../user/resetpass" method="post" class="php-email-form " onsubmit="return validatePasswords()">
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
									new Password</span> <input type="password" class="form-control"
									placeholder="password" name="pass1" required id="pass1" data-required-match="pass2" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$">
							</div>
						</div>
						<div class="row mb-4">
							<div class="input-group mb-3">
								<span class="col-lg-2 col-4 input-group-text" id="basic-addon1">
									Re-enter new Password</span> <input type="password" class="form-control"
									placeholder="Re-enter password" name="pass2" id="pass2" data-required-match="pass1">
							</div>
						</div>

						<div class="col-md-12 text-center">
							<button type="submit" id="findbutton">re-set</button>
						</div>
						<input type="hidden" value="<%=request.getParameter("email")%>" name="email">
					</form>
				</div>
				<!-- End Contact Form -->
			</div>

		</section>
		<!-- /Contact Section -->
	</main>
	<%@ include file="component/footer.jsp"%>
	<%@ include file="component/script.jsp"%>
	<script>
	function validatePasswords() {
	    const pass1 = document.getElementById("pass1");
	    const pass2 = document.getElementById("pass2");

	    if (pass1.value !== pass2.value) {
	        alert("Passwords must match.");
	        return false;
	    }

	    return true;
	}</script>
</body>
</html>