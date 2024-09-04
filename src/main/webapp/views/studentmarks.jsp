<%@ page import="com.springboot.swt.project.entity.User"%>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="component/head.jsp"%>
<link href="<%=assetspath%>css/demo.css"
	rel="stylesheet">
</head>
</head>
<body>

	<%@ include file="component/navbar.jsp"%>
	
<div class="row mt-4">
<%
	User user = (User)session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("/swt/login");
	}
		ArrayList<Integer> marksList=(ArrayList<Integer>) request.getAttribute("marksList");
	
	
		 
	
	%>
	<div class="d-flex justify-content-center">
	<div class="col-8 md-10 mb-lg-8 mb-4">
				<div class="card">
					<div class="card-header pb-0 p-3">
						<div class="d-flex justify-content-between">
							<h6 class="mb-2">Students Marks</h6>
						</div>
					</div>
					<div class="table-responsive">
						<table class="table align-items-center ">
							<tbody>
								<%if(marksList!=null){
									for(Integer marks : marksList){ %>
								
								<tr>
									<td>
										<div class="text-center">
											<p class="text-xs font-weight-bold mb-0">Name:</p>
											<h6 class="text-sm mb-0">Test <%=(marksList.indexOf(marks))+1%></h6>
										</div>
									</td>
									
									<td class="align-middle text-sm">
										<div class="col text-center">
											<p class="text-xs font-weight-bold mb-0">Obtained Marks:</p>
											<h6 class="text-sm mb-0"><%=marks%>></h6>
										</div>
									</td>
								</tr>
								<%}}
								else{%>
									<tr>
									<td>
										<div class="text-center">
											<p class="text-xs font-weight-bold mb-0">NO ENTRIES AVAILABLE</p>
										</div>
									</td>
								</tr>
								<%}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			</div>
			</div>
			<%@ include file="component/footer.jsp"%>
</body>
</html>