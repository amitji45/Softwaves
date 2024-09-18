
<%@page import="java.util.Map"%>
<%@ page import="com.springboot.swt.project.entity.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="component/head.jsp"%>
<script>
function allowVolunteer(id , name) {
	url = "http://localhost:9090/admin/VolunteerApproval/allow?id=";
	allowOrBlockVolunteer(id, url , name );
 }
function blockVolunteer(id , name) {
	url = "http://localhost:9090/admin/VolunteerApproval/block?id=";
	allowOrBlockVolunteer(id, url , name);
}

function allowOrBlockVolunteer(id, url , name) {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		findAllVolunteer(name);
	};
	xhttp.open("GET", url + id + "", true);
	xhttp.send();
}
	function findAllVolunteer(name){
		
		$.ajax({
			  url: 'http://localhost:9090/user/findVolunteer?name='+name,
			  type: 'GET',
			  dataType: 'json', // No need to parse the response manually
		        success: function(response) {
		            // Clear the existing table body to prevent duplicates
		            $('#tableid').empty();

		            // Iterate over the response and append rows
		            response.forEach(user => {
		                const newRow = $('<tr>').attr('id', user.id);
		                newRow.append(
		                    $('<td>').html('<p class="text-xs font-weight-bold mb-0">Current Role</p><h6 class="text-sm mb-0">' + user.role+ '</h6>'),
		                    $('<td>').html('<p class="text-xs font-weight-bold mb-0">batch</p><h6 class="text-sm mb-0">' + user.batch + '</h6>'),
		                    $('<td>').html('<p class="text-xs font-weight-bold mb-0">Name:</p><h6 class="text-sm mb-0">' + user.name + '</h6>'),
		                    $('<td>').html('<p class="text-xs font-weight-bold mb-0">User Id:</p><h6 class="text-sm mb-0">' + user.id + '</h6>'),
		                    $('<td>').html('<button type="button" class="btn btn-outline-success " onclick="allowVolunteer(\''+user.id +'\' , \''+name+'\')" >Approve</button>'),
		                    $('<td>').html('<button type="button" class="btn btn-outline-danger" onclick="blockVolunteer(\''+user.id+'\' , \''+name +'\')" >remove</button>')
		                   
		                );
		                // Append the new row to the table
		                $('#tableid').append(newRow);
		            });
		        },
		        error: function(error) {
		            console.error('Error:', error);
		        }
			});
			
	}
	
	</script>
</head>
<body>
	<%
	List<Student> list = (List<Student>) request.getAttribute("data");
	
	
	%>
	

	<%@ include file="component/navbar.jsp"%>
	<main class="main">
		<!-- Contact Section -->
		<section id="login" class="contact section">
			<!-- Section Title -->
			<div class="container section-title">
				<h2>Volunteer Approval</h2>
			</div>
			<!--col-xl-2 col-md-6 col-sm-11 py-4 -->
			
			<!-- End Section Title -->
			<div class="container d-flex justify-content-center">
				<div class="col-lg-6">
					<div class="php-email-form">
						<div class="row gy-4">

							<div class="col-md-12">
								<label for="email-field" class="pb-2">Enter Roll No.</label> <input
									type="text" class="form-control" name="text" id="email-field" onkeyup="findAllVolunteer(this.value)"
									required>

							</div>
							<div class="col-md-12 text-center">
								<button type="button" class="btn btn-secondary"
									onclick="">Enter</button>
								<button type="button" class="btn btn-secondary"
									>delete</button>
							</div>
						</div>

					</div>
				</div>

				<!-- End Contact Form -->
			</div>
			<!-- 
//-------------------------------------------------------------------------------------------- -->
			<div class="py-4">
				<div class="row">
				
					<section class="col py-4 px-2">
						<div class="row">
    <div class="col-lg-8 mb-lg-0 mb-4 mx-auto">
        <div class="card z-index-2 h-100">
            <div class="card-header pb-0 pt-3 bg-transparent">
                <h6 class="text-capitalize text-center">Student List</h6>
            </div>

            <div class="card-body p-3 ">
                <div class="chart ">
                    <table class="table align-items-center ">
                        <div class="nested-div ">

                            <div class="table-responsive">
                                <table class="table align-items-center " id="tableid">
                                    <tbody>

                                    </tbody>
                                </table>
                            </div>

                        </div>

                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
					</section>
				

				</div>
			</div>
	</main>
	<!-- /Contact Section -->
	<%@ include file="component/footer.jsp"%>
	<%@ include file="component/script.jsp"%>

</body>

</html>
