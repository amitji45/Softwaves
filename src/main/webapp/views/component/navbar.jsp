
<%@ page import="com.springboot.swt.project.entity.User"%>
<%@ page import="com.springboot.swt.project.entity.Batch"%>
<%@ page import="com.springboot.swt.project.entity.User,java.util.List"%>
<header id="header" class="header d-flex align-items-center sticky-top">
	<div
		class="container-fluid container-xl position-relative d-flex align-items-center">

		<a href="index.html" class="logo d-flex align-items-center me-auto">
			<!-- Uncomment the line below if you also wish to use an image logo -->
			<!-- <img src="assets/img/logo.png" alt=""> -->
			<h1 class="sitename"><%=siteName%></h1>
		</a>

		<%
		User user1 = (User) session.getAttribute("user");
		User admin = (User) session.getAttribute("admin");

		List<Batch> batches = (List<Batch>) request.getAttribute("temp");
		%>


		<script type="text/javascript">
			function createBatch(batch_name) {
				url = "http://localhost:9090/admin/newbatch?name=";
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function(response) {
					if (this.readyState == 4 && this.status == 200) {
						alert(response.target.responseText);

					}
				};
				xhttp.open("GET", url + batch_name + "", true);
				xhttp.send();
			}

			function findEnrollBatche() {

				var url = "http://localhost:9090/user/allbatches";
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState === 4 && this.status === 200) {
						// Parse the JSON response (assuming the server sends JSON)
						var response = JSON.parse(this.responseText);

						updateEnrollBatchList(response);
					} else if (this.readyState === 4) {

						console.error("Error:  " + this.status + " "
								+ this.statusText);
					}
				};
				xhttp.open("GET", url, true);
				xhttp.send();

			}
			function updateEnrollBatchList(batches) {
				var batchList = document.getElementById('batchList');

				// Clear existing items
				batchList.innerHTML = '';

				// Iterate over the batches and create list items
				batches
						.forEach(function(batch) {
							var li = document.createElement('li');
							var a = document.createElement('a');
							a.textContent = batch.batchTopic;
							a.href = "#";
							a.addEventListener('click',function(event) {												// Prevent the default link behavior
							var url = "http://localhost:9090/user/enrollstudent?batchId="+ batch.batchId;
							var xhr = new XMLHttpRequest();
							xhr.onreadystatechange = function() {
								if (xhr.readyState === XMLHttpRequest.DONE) {
									if (this.status === 200) {
										alert('response: '+ xhr.responseText);
	
									} else {
										alert('response: '+ xhr.statusText);
									}
								}
							};
							xhr.open('GET', url, true);
							xhr.send();
						});
							li.appendChild(a);
							batchList.appendChild(li);
						});
			}
		</script>
		<nav id="navmenu" class="navmenu">
			<ul>

				<li><a href="#hero" class="active">Home</a></li>
				<li><a href="#about">About</a></li>
				<li><a href="#rules">Rules</a></li>
				<li><a href="#review">Review</a></li>
				<%
				if (user1 != null && user1.getRole().equalsIgnoreCase("volunteer")) {
				%>
				<li><a href="/valunteer/userattendance">Attendence</a></li>
				<li><a href="/valunteer/volunteerMarks">Marking</a></li>
				<%
				}
				%>
				<%
				if (admin != null && admin.getRole().equalsIgnoreCase("Admin")) {
				%>
				<li class="dropdown"><a href="#"><span>Students</span> <i
						class="bi bi-chevron-down toggle-dropdown"></i></a>
					<ul>
						<li><a href="/admin/approval">Approval</a></li>
						<li class="dropdown"><a href="#"><span>Marks</span> <i
								class="bi bi-chevron-down toggle-dropdown"></i></a>
							<ul>
								<li><a href="#">c & C++</a></li>
								<li><a href="#">Core Java</a></li>
								<li><a href="#">Advance Java</a></li>

							</ul></li>


						<li><a href="#">All Students</a></li>

						<li class="dropdown"><a href="#"><span>New Batch</span><i
								class="bi bi-chevron-down toggle-dropdown"></i></a>
							<ul>
								<li><a href="#" onclick="createBatch('C\C++')">c & C++</a></li>
								<li><a href="#" onclick="createBatch('Core Java')">Core
										Java</a></li>
								<li><a href="#" onclick="createBatch('Advance Java')">Advance
										Java</a></li>

							</ul></li>

					</ul></li>

				<%
				}
				%>
				<%
				if (user1 != null || admin != null) {
				%>

				<li class="dropdown"><a href="#" onclick="findEnrollBatche()"><span>Enroll</span>
						<i class="bi bi-chevron-down toggle-dropdown"></i></a>
					<ul>
						<li id="batchList" id="batchId" />

					</ul></li>
				<%
				}
				%>
			</ul>
		</nav>
		<%
		if (user1 == null && admin == null) {
		%>
		<a class="btn-getstarted" href="/swt/login">Sign In</a>
		<%
		} else {
		%>
		<a class="btn-getstarted" href="/user/logout">Sign Out</a>
		<%
		}
		%>
	</div>
</header>