<%@ page import="com.springboot.swt.project.entity.Student,java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="component/head.jsp"%>
</head>
<body>
	<%@ include file="component/navbar.jsp"%>
	<%
	List<Student> studentList = (List<Student>) session.getAttribute("studentList");
	%>
	<section id="contact" class="section">

		<div class="container section-title">
			<h2>All Students</h2>
		</div>

		<div class="row">
			<div class="col-lg-12 mb-lg-0 mb-4">
				<div class="card ">
					<div class="card-header pb-0 p-3">
						<div class="d-flex justify-content-between">
							<h6 class="mb-2">Students</h6>
						</div>
					</div>
					<div class="table-responsive">
						<table class="table align-items-center ">
							<tbody>
								<%if(studentList==null || studentList.isEmpty())
								{
									%>
									<p class="d-flex justify-content-center">NO STUDENT ENTRY FOUND</p>
									<%}
								else
								{
								for (Student student : studentList) {
								%>
								<tr id="<%=student.getRollNo()%>">
									<td>
										<div class="text-center">
											<p class="text-xs font-weight-bold mb-0">Name:</p>
											<h6 class="text-sm mb-0"><%=student.getUser().getName()%></h6>
										</div>
									</td>
								<td>
										<div class="text-center">
											<p class="text-xs font-weight-bold mb-0">RollNo:</p>
											<h6 class="text-sm mb-0"><%=student.getRollNo()%></h6>
										</div>
									</td>
									
									<td>
										<div class="text-center">
											<p class="text-xs font-weight-bold mb-0">Email:</p>
											<h6 class="text-sm mb-0"><%=student.getUser().getEmail()%></h6>
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
	<%@ include file="component/footer.jsp"%>
	<%@ include file="component/script.jsp"%>
</body>
</html>