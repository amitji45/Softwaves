<%@ page import="com.springboot.swt.project.entity.Batch,java.util.List" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<%@ include file="component/head.jsp" %>
	</head>

	<body>
		<%@ include file="component/navbar.jsp" %>
			<section id="contact" class="section">

						<div class="container section-title">
							<h2>All Batches</h2>
						</div>

						<div class="row">
							<div class="col-lg-8 mb-lg-0 mb-4 mx-auto">
								<div class="card ">
									<div class="card-header pb-0 p-3">
										<div class="d-flex justify-content-center">
											<h6 class="mb-2">Batches</h6>
										</div>
									</div>
									<div class="table-responsive">
										<table class="table align-items-center " >
											<tbody id="tableid">

											</tbody>
										</table>

									</div>
								</div>
							</div>
						</div>
			</section>
			<script type="text/javascript">
				function endbatch(batchId) {
					url = "http://localhost:9090/admin/endbatch?id=" + batchId;
					updatebatch(url);
				}
				function startbatch(batchId) {
					url = "http://localhost:9090/admin/startbatch?id=" + batchId;
					updatebatch(url);

				}
				function deletebatch(batchId) {
					url = "http://localhost:9090/admin/deletebatch?id=" + batchId;
					updatebatch(url);
					loadBatch();
				}
				function updatebatch(url) {
					var xhttp = new XMLHttpRequest();
					xhttp.open("GET", url, true);

					xhttp.onreadystatechange = function () {
						if (this.readyState === 4) {
							if (this.status === 200) {
								//var updatedBatch = JSON.parse(this.responseText);

							} else {
								console.log("Error: " + this.status); // Log any error
							}
								loadBatch();
						}
					};

					xhttp.send();
				}
				// -----------------
				window.onload = function () {
					loadBatch();
				}
				function loadBatch() {

					$.ajax({
						url: 'http://localhost:9090/admin/getBatch',
						type: 'GET',
						dataType: 'json', // No need to parse the response manually
						success: function (response) {
							// Clear the existing table body to prevent duplicates
							$('#tableid').empty();

							// Iterate over the response and append rows
							response.forEach(batch => {
								const newRow = $('<tr>').attr('id', batch.batchid);
								newRow.append(
									$('<td>').html('<p class="text-xs font-weight-bold mb-0">Name:</p><h6 class="text-sm mb-0">' + batch.batchTopic + '</h6>'),
									$('<td>').html('<p class="text-xs font-weight-bold mb-0">batch status </p><h6 class="text-sm mb-0">' + batch.currentStatus + '</h6>'),
									$('<td>').html('<p class="text-xs font-weight-bold mb-0">start date  </p><h6 class="text-sm mb-0">' + batch.startDate + '</h6>'),
									batch.currentStatus === "Enroll" ? $('<td>').html('<button type="button" class="btn btn-outline-success" onclick="startbatch(\'' + batch.batchId + '\')">Start</button>') : null,
									batch.currentStatus === "Enroll" ? $('<td>').html('<button type="button" class="btn btn-outline-danger" onclick="deletebatch(\'' + batch.batchId + '\')">delete</button>') : null,
									batch.currentStatus === "Active" ? $('<td>').html('<button type="button" class="btn btn-outline-danger" onclick="endbatch(\'' + batch.batchId + '\')">end</button>') : null,
									$('<td>').html('<a class="btn btn-outline-primary" href="/admin/getBatchDetails?id=' + batch.batchId + '">Details</a>'),
								batch.currentStatus==="Active" ?	$('<td>').html('<a class="btn btn-outline-primary" href="/admin/getBatchMarks?id=' + batch.batchId + '"> marks</a>') : null
								);
								// Append the new row to the table
								batch.currentStatus != "Completed" ? $('#tableid').append(newRow):null;
							});
						},
						error: function (error) {
							console.error('Error:', error);
						}
					});

				}

				//-----


			</script>
			<%@ include file="component/footer.jsp" %>
				<%@ include file="component/script.jsp" %>
	</body>

	</html>