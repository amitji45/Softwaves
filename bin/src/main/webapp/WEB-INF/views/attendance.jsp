<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.time.LocalDate"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="component/head.jsp"%>
<link href="<%=assetspath%>css/attendance.css" rel="stylesheet">
</head>
<body>
	<%@ include file="component/navbar.jsp"%>
	<div class="container text-center">
		<div id="calendar" class="">
			<table class="table ">
				<thead>
					<tr class="">
						<th scope="col">Sun</th>
						<th scope="col">Mon</th>
						<th scope="col">Tue</th>
						<th scope="col">Wed</th>
						<th scope="col">Thu</th>
						<th scope="col">Fri</th>
						<th scope="col">Sat</th>
					</tr>
				</thead>
				<tbody>
					<%
					LocalDate localDate = LocalDate.of(2024, 7, 31);
					for (int i = 1; i <= 5; i++) {
					%>
					<tr>
						<td>
							<div class="card bg-success">
								<div class=" card-body p-3">
									<p class=" font-weight-bolder text-sm mb-0">
										<%
										localDate = localDate.plusDays(1);
										%><%=localDate.getDayOfMonth()%></p>
									<h5 class="font-weight-bolder text-light ">P</h5>
								</div>
							</div>
						</td>
						<td>
							<div class="card bg-warning">
								<div class=" card-body p-3 ">
									<p class="font-weight-bolder text-sm mb-0">
										<%
										localDate = localDate.plusDays(1);
										%><%=localDate.getDayOfMonth()%></p>
									<h5 class="font-weight-bolder">L</h5>
								</div>
							</div>
						</td>
						<td>
							<div class="card ">
								<div class=" card-body p-3">
									<p class="font-weight-bolder text-sm mb-0">
										<%
										localDate = localDate.plusDays(1);
										%><%=localDate.getDayOfMonth()%></p>
									<h5 class="font-weight-bolder">P</h5>
								</div>
							</div>
						</td>
						<td>
							<div class="card ">
								<div class=" card-body p-3 ">
									<p class="font-weight-bolder text-sm mb-0">
										<%
										localDate = localDate.plusDays(1);
										%><%=localDate.getDayOfMonth()%></p>
									<h5 class="font-weight-bolder text-light">A</h5>
								</div>
							</div>
						</td>
						<td>
							<div class="card ">
								<div class=" card-body p-3">
									<p class="font-weight-bolder text-sm mb-0">
										<%
										localDate = localDate.plusDays(1);
										%><%=localDate.getDayOfMonth()%></p>
									<h5 class="font-weight-bolder">P</h5>
								</div>
							</div>
						</td>
						<td>
							<div class="card ">
								<div class=" card-body p-3">
									<p class="font-weight-bolder text-sm mb-0">
										<%
										localDate = localDate.plusDays(1);
										%><%=localDate.getDayOfMonth()%></p>
									<h5 class="font-weight-bolder">A</h5>
								</div>
							</div>
						</td>
						<td>
							<div class="card ">
								<div class=" card-body p-3">
									<p class="font-weight-bolder text-sm mb-0">
										<%
										localDate = localDate.plusDays(1);
										%><%=localDate.getDayOfMonth()%></p>
									<h5 class="font-weight-bolder">L</h5>
								</div>
							</div>
						</td>
						
					<tr>
						<%
						}
						%>
					
				</tbody>
			</table>
		</div>
	</div>
	</div>
	<%@ include file="component/script.jsp"%>
</body>
</html>