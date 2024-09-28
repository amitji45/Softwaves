<%@ page import="com.springboot.swt.project.entity.Batch,java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="component/head.jsp"%>
</head>
<body>
	<%@ include file="component/navbar.jsp"%>
	<%
	List<Batch> batches = (List<Batch>) request.getAttribute("batches");
	%>
	<section id="contact" class="section">

		<div class="container section-title">
			<h2>All Batches</h2>
		</div>

		<div class="row">
			<div class="col-lg-12 mb-lg-0 mb-4">
				<div class="card ">
					<div class="card-header pb-0 p-3">
						<div class="d-flex justify-content-between">
							<h6 class="mb-2">Batches</h6>
						</div>
					</div>
					<div class="table-responsive">
						<table class="table align-items-center ">
							<tbody>
								<%
								for (Batch batch : batches) {
								%>
								<tr id="<%=batch.getBatchId()%>">
									<td>
										<div class="text-center">
											<p class="text-xs font-weight-bold mb-0">Name:</p>
											<h6 class="text-sm mb-0"><%=batch.getBatchTopic()%></h6>
										</div>
									</td>
									<td class="align-middle text-sm">
										<div class="col text-center">
											<p class="text-xs font-weight-bold mb-0">Status</p>
											<h6 class="text-sm mb-0"><%=batch.getCurrentStatus()%></h6>
										</div>
									</td>
									<td class="align-middle text-sm">
										<div class="col text-center">
											<p class="text-xs font-weight-bold mb-0">Start Date</p>
											<h6 class="text-sm mb-0"><%=batch.getStartDate()%></h6>
										</div>
									</td>
									<%
									if (batch.getCurrentStatus().equals("Enroll")) {
									%>
									<td>
										<div class="text-center">
											<a class="btn btn-outline-success"
												href="startbatch?id=<%=batch.getBatchId()%>">Start</a>
											<button type="button" class="btn btn-outline-danger"
												onclick="blockUser('<%=batch.getBatchId()%>')">Delete</button>
										</div>
									</td>
									<%
									} else if (batch.getCurrentStatus().equals("Active")) {
									%>
									<td>
										<div class="text-center">
											<a class="btn btn-outline-danger"
												href="endbatch?id=<%=batch.getBatchId()%>">End</a>
										</div>
									</td>
									<%
									}
									%>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		function allowUser(id) {
			url = "http://localhost:9090/admin/approval/allow?id=";
			allowOrBlockUser(id, url);
		}
		function blockUser(id) {
			url = "http://localhost:9090/admin/approval/block?id=";
			allowOrBlockUser(id, url);
		}

		function allowOrBlockUser(id, url) {
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				document.getElementById(id).remove();
			};
			xhttp.open("GET", url + id + "", true);
			xhttp.send();
		}
	</script>
	<%@ include file="component/footer.jsp"%>
	<%@ include file="component/script.jsp"%>
</body>
</html>