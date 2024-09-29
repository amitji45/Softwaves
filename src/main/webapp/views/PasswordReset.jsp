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
								<div class="col-md-12">
								<label for="password-field" class="pb-2">New Password</label> <input
									type="password" class="form-control" name="pass1"
									id="pass1" required>
							</div></div>
						</div>
						<div class="row mb-4">
							<div class="input-group mb-3">
								<div class="col-md-12">
								<label for="password-field" class="pb-2">Re- Enter New Password</label> <input
									type="password" class="form-control" name="pass2"
									id="pass2" required>
							</div></div>
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
	        
			Swal.fire({
												icon: "error",
												title: "Oops...",
												text:"Passwords must match."
												
											});
	        return false;
	    }

	    return true;
	}</script>
</body>
</html>