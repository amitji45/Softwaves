<%@ page import="com.springboot.swt.project.entity.Batch,java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="component/head.jsp"%>
</head>
<body>
	<%@ include file="component/navbar.jsp"%>
	<div id="mainList"><%
	List<Batch> batchList = (List<Batch>) request.getAttribute("batchList");
	System.out.println(batchList);

	%>
	</div>
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
						<table class="table align-items-center " id="mainTable">
							<tbody>
								<%if(batchList==null)
								{
									%>
									<p class="d-flex justify-content-center">NO BATCHES AVAILABLE</p>
									<%}
								else
								{
								for (Batch batch : batchList) {
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
											<button type="button" class="btn btn-outline-success"
												onclick="startbatch('<%=batch.getBatchId()%>')">Start</button>
											<button type="button" class="btn btn-outline-danger"
												onclick="deletebatch('<%=batch.getBatchId()%>')">Delete</button>
										</div>
									</td>
									<%
									} else if (batch.getCurrentStatus().equals("Active")) {
									%>
									<td>
										<div class="text-center">
											<button type="button" class="btn btn-outline-danger"
												onclick="endbatch('<%=batch.getBatchId()%>')">End</button>
										
										</div>
									</td>
									<%
									}
									else {
										%>
										<td></td>
										<% 
									}
									%>
									
									<td>
										<div class="text-center">
											<a  class="btn btn-outline-info"
												href="/admin/getBatchDetails?id=<%=batch.getBatchId()%>">Details</a>
										</div>
									</td>
								</tr>
								<%
								}
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
	function endbatch(batchId)
	{
		url="http://localhost:9090/admin/endbatch?id=" + batchId;
		updatebatch(url);
	}
	function startbatch(batchId)
	{
		url="http://localhost:9090/admin/startbatch?id=" + batchId;
		updatebatch(url);

	}
	function deletebatch(batchId)
	{
		url= "http://localhost:9090/admin/deletebatch?id="+batchId;
		updatebatch(url);
	}
	
	function updatebatch(url) {
	    var xhttp = new XMLHttpRequest();
	    xhttp.open("GET", url, true);
	    xhttp.onreadystatechange = function() {
	        if (this.readyState === 4 && this.status === 200) {
	            // Server se response mil gaya
	            var response = this.responseText;
	        	console.log(response);
	        }
	        else {
	        	console.log("not working");
				//location.reload();
				//<%
			//	batchList = (List<Batch>) request.getAttribute("batchList");
				//%>
				document.getElementById("mainList").innerHTML = this.responseText;
	        	console.log(responseText);
	        }
	    };
	    xhttp.send();
	    document.addEventListener('DOMContentLoaded', function() {
            demo();
        });
	}
	
	
	
	</script>
	<%@ include file="component/footer.jsp"%>
	<%@ include file="component/script.jsp"%>
</body>
</html>