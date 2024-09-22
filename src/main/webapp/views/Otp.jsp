<%@ page import="com.springboot.swt.project.entity.User" %>

	<!DOCTYPE html>
	<html>

	<head>
		<%@ include file="component/head.jsp" %>
			<link href="/assets/css/Otp.css" rel="stylesheet">
	</head>

	<body>

		<% User usertopass=(User)request.getAttribute("user69"); String s=usertopass.getEmail(); String
			purpose=(String)request.getAttribute("purpose"); %>

			<%@ include file="component/navbar.jsp" %>
				<main class="main">
					<section id="contact" class="contact section">

						<!-- Section Title -->
						<div class="container section-title">
							<h2>OTP verification</h2>
						</div>
						<!-- End Section Title -->
						<div class="container d-flex justify-content-center ">

							<div class="position-relative">
								<div class="card p-2 text-center">
									<h6>Please enter the one time password <br> to verify your account</h6>
									<div> <span>A code has been sent to</span> <small>
											<%=s %>
										</small> </div>
									<div id="otp" class="inputs d-flex flex-row justify-content-center mt-2"> <input
											class="m-2 text-center form-control rounded" type="text" id="first"
											maxlength="1" /> <input class="m-2 text-center form-control rounded"
											type="text" id="second" maxlength="1" /> <input
											class="m-2 text-center form-control rounded" type="text" id="third"
											maxlength="1" /> <input class="m-2 text-center form-control rounded"
											type="text" id="fourth" maxlength="1" /> <input
											class="m-2 text-center form-control rounded" type="text" id="fifth"
											maxlength="1" /> <input class="m-2 text-center form-control rounded"
											type="text" id="sixth" maxlength="1" /> </div>
									<div class="mt-4"> <button id="validateButton" value="<%=s %>"
											class="btn btn-danger px-4 validate">Validate</button> </div>
									<div hidden class="mt-4"> <button id="hiddenpurpose" value="<%=purpose %>"
											class="btn btn-danger px-4 validate">alidate</button> </div>
								</div>
							</div>
							<!-- End Contact Form -->
						</div>

					</section>
					<!-- /Contact Section -->
				</main>
				<%@ include file="component/footer.jsp" %>
					<%@ include file="component/script.jsp" %>

						<script type="text/javascript">


							var email = document.getElementById("validateButton").value;
							var purpose1 = document.getElementById("hiddenpurpose").value;
					
							var cn = '<%= usertopass.getContactNo() %>';
							var n = '<%=usertopass.getName() %>';
							var pass = '<%= usertopass.getPassword() %>';
							var purpose11 = '<%= purpose%>';
						
							document.addEventListener("DOMContentLoaded", function (event) {

								function OTPInput() {
									const inputs = document.querySelectorAll('#otp > *[id]');
									for (let i = 0; i < inputs.length; i++) { inputs[i].addEventListener('keydown', function (event) { if (event.key === "Backspace") { inputs[i].value = ''; if (i !== 0) inputs[i - 1].focus(); } else { if (i === inputs.length - 1 && inputs[i].value !== '') { return true; } else if (event.keyCode > 47 && event.keyCode < 58) { inputs[i].value = event.key; if (i !== inputs.length - 1) inputs[i + 1].focus(); event.preventDefault(); } else if (event.keyCode > 64 && event.keyCode < 91) { inputs[i].value = String.fromCharCode(event.keyCode); if (i !== inputs.length - 1) inputs[i + 1].focus(); event.preventDefault(); } } }); }
								} OTPInput();
							});

							$(document).ready(function () {
								$(".validate").click(function () {
									// Your function logic here
									

									var otpValue = "";
									$("#otp input").each(function () {
										otpValue += $(this).val();
									});
									// this is the user otp 

									// this is the ajax call
									$.ajax({

										url: "http://localhost:9090/user/verify",
										type: "POST",
										data: {
											otp: otpValue,
											contactNo: cn,
											email: email,
											name: n,
											password: pass,
											purpose: purpose11
										},
										success: function (response) {

											if (response.success && response.redirectUrl) {
												window.location.href = response.redirectUrl;
											} else {

												// Handle error or other scenarios
												console.error("Verification failed:", response.errorMessage);
											}

										},
										error: function (xhr, status, error) {
											// Handle errors (e.g., display an error message)
											alert("Otp is in-correct please enter correct otp");

										}
									});
								});
							});
						</script>
	</body>

	</html>