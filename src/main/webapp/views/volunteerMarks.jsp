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
				<h2>Marking</h2>
			</div>
			<!-- End Section Title -->
			<nav id="navmenu" class="navmenu">
				<ul class="justify-content-center col-xl-9 col-md-6 col-sm-7 py-9 ">
					<li class="dropdown">
						<select class="justify-content-center col-xl-9 col-md-6 col-sm-7 py-9 " id="batchId">
						<%
					    List<Batch> activebatches = (List<Batch>) session.getAttribute("activebatch");
						
						
						
						for(Batch batch : activebatches){
						%>
							<option value="<%=batch.getBatchId()%>" class="dropdown"><%=batch.getBatchTopic()%></option>
						
						<%}%>
						</select>
					</ul>
			</nav>
			<div class="container d-flex justify-content-center">
				<div class="col-lg-6">
					<form method="post" class="php-email-form">
						<div class="row gy-4">
						<div class="row mb-4">
							<div class="input-group mb-3">
								<span class="col-lg-2 col-4 input-group-text" id="basic-addon1">
									Roll No.</span> <input type="text" class="form-control"
									placeholder="Enter Roll No." name="rollNo" id ="rollNo"required>
							</div>
						</div>
							
						<div class="row mb-4">
							<div class="input-group mb-3">
								<span class="col-lg-2 col-4 input-group-text" id="basic-addon1">
									Marks</span> <input type="text" class="form-control"
									placeholder="Enter Marks" name="marks"  id="marks"required>
							</div>
						</div>
							<div class="col-md-12 text-center">
								<button type="button" class="btn btn-outline-success" onclick="uploadMarks()">Submit</button>
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
	<script>
	
		/* function uploadMarks(){
			marks=""+ document.getElementById("marks").value;
			rollNo=""+ document.getElementById("rollNo").value;
			batchId=""+document.getElementById("batchId").value;
			url = "http://localhost:9090/valunteer/setmarks?rollNo=";
			
			var xhttp = new XMLHttpRequest();
			
			xhttp.open("GET", url + rollNo + "&batchId=" + batchId + "&marks=" + marks, true);
			xhttp.send();
			if(!response)
				{
					alert('my name is aman..');
					console.log('mana....');
					return ;
				}
				document.getElementById("rollNo").value="";
				document.getElementById("marks").value="";
		} */
		function uploadMarks() {
		    // Get values from input fields
		    var marks = "" + document.getElementById("marks").value;
		    var rollNo = "" + document.getElementById("rollNo").value;
		    var batchId = "" + document.getElementById("batchId").value;
		    var url = "http://localhost:9090/valunteer/setmarks?rollNo=";
		    
		    // Create XMLHttpRequest object
		    var xhttp = new XMLHttpRequest();
		    
		    // Define the onreadystatechange callback
		    xhttp.onreadystatechange = function() {
		        if (this.readyState == 4) { // Check if request is complete
		            if (this.status == 200) { // Check if request was successful
		                var response = this.responseText;
		                if (response === null || response.trim() === "") {
		                    // Handle the case where response is null or empty
		                    alert('Response is null or empty. Please try again.');
		                } else {
		                    // Handle a valid response
		                    alert('Marks uploaded successfully!');
		                }
		                
		                // Clear the input fields
		                document.getElementById("rollNo").value = "";
		                document.getElementById("marks").value = "";
		            } else {
		                // Handle HTTP errors
		                alert('Failed to upload marks. Status: ' + this.status);
		            }
		        }
		    };
		    
		    // Open and send the request
		    xhttp.open("GET", url + rollNo + "&batchId=" + batchId + "&marks=" + marks, true);
		    xhttp.send();
		}

	
	
	</script>
</body>
</html>