<%@page import="org.hibernate.collection.spi.PersistentBag" %>
<%@ page import="com.springboot.swt.project.entity.Student"%>
<%@ page import="com.springboot.swt.project.entity.User,java.util.ArrayList,java.util.Map"%>


<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="component/head.jsp"%>
<link href="<%=assetspath%>css/demo.css"
	rel="stylesheet">
</head>
<body>
	<%@ include file="component/navbar.jsp"%>
	<%
	List<Student> allStudents= (List<Student>)session.getAttribute("allStudents");	
	List<Batch> allBatches= (List<Batch>)session.getAttribute("allBatches");	
	List<User> notAllowedUsers= (List<User>)session.getAttribute("notAllowedUsers");	
	List<User> volunteerList= (List<User>)session.getAttribute("volunteerList");	
	Map<Batch, Integer> avgBatches=(Map<Batch, Integer>)session.getAttribute("avgBatches");
	
	%>
	<section class="col py-4">
		<div class="row">
			<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
				<div class="card ">
					<div class=" card-body p-3">
						<div class="row">
							<div class="col-8">
								<div class="numbers">
									<p class="text-sm mb-0 text-sm font-weight-bold">All Students</p>
									<h5 class="font-weight-bolder"><%=allStudents!=null?allStudents.size():"0" %></h5>
									<p class="mb-0">
										<span class="text-success text-sm font-weight-bolder">students</span>
										data available
									</p>
									<a	href="/admin/allStudent"
										class="bg-gradient-primary shadow-primary btn text-light mt-1 justify-content-right"
										>View</a>
								</div>
							</div>
							<div class="col-4 text-end">
								<div
									class="icon icon-shape bg-gradient-primary shadow-primary text-center rounded-circle">
									<i class="fa-solid fa-calendar-days text-lg opacity-10"
										aria-hidden="true"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
				<div class="card">
					<div class="card-body p-3">
						<div class="row">
							<div class="col-8">
								<div class="numbers">
									<p class="text-sm mb-0  font-weight-bold">Manage Batches</p>
									<h5 class="font-weight-bolder"><%=allBatches!=null?allBatches.size():"0" %></h5>
									<p class="mb-0">
										<span class="text-success text-sm font-weight-bolder">Batches</span>
										available
									</p>
									<a	href="/admin/ManageBatches"
										class="bg-gradient-warning shadow-warning btn text-light mt-1 justify-content-right"
										>View</a>
								</div>
							</div>
							<div class="col-4 text-end">
								<div
									class="icon icon-shape bg-gradient-warning shadow-warning text-center rounded-circle">
									<i class="fa-solid fa-list-check text-light text-lg opacity-10"
										aria-hidden="true"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
				<div class="card">
					<div class="card-body p-3">
						<div class="row">
							<div class="col-8">
								<div class="numbers">
									<p class="text-sm mb-0 text-sm font-weight-bold">Register Students</p>
									<h5 class="font-weight-bolder"><%=notAllowedUsers!=null?notAllowedUsers.size():"0" %></h5>
									<p class="mb-0">
										<span class="text-success text-sm font-weight-bolder"></span>
										to be Registered
									</p>
										<a	href="/admin/approval"
										class="bg-gradient-success shadow-primary btn text-light mt-1 justify-content-right"
										>View</a>
								</div>
							</div>
							<div class="col-4 text-end">
								<div
									class="icon icon-shape bg-gradient-success shadow-primary text-center rounded-circle">
									<i class="fa-solid fa-chart-pie text-lg opacity-10"
										aria-hidden="true"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
				<div class="card ">
					<div class="card-body p-3">
						<div class="row">
							<div class="col-8">
								<div class="numbers">
									<p class="text-sm mb-0 text-sm font-weight-bold">Volunteers</p>
									<h5 class="font-weight-bolder"><%=volunteerList!=null?volunteerList.size():"0" %></h5>
									<p class="mb-0">
										<span class="text-success text-sm font-weight-bolder">volunteers</span>
										approved
									</p>
									<a	href="/admin/VolunteerApproval"
										class="bg-gradient-danger shadow-primary btn text-light mt-1 justify-content-right"
										>View</a>
								</div>
							</div>
							<div class="col-4 text-end">
								<div
									class="icon icon-shape bg-gradient-danger shadow-primary text-center rounded-circle">
									<i class="fa-solid fa-square-poll-vertical text-lg opacity-10"
										aria-hidden="true"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
					<div class="col-lg-7 mb-lg-0 mb-4">
						<div class="card z-index-2 h-100">
							<div class="card-header pb-0 pt-3 bg-transparent">
								<h6 class="text-capitalize">Batches Week Test Report</h6>
							</div>
							
							<div class="card-body p-3">
								<div class="chart">
									<canvas id="chart-line" class="chart-canvas" height="100"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-5">
						<div class="card card-carousel overflow-hidden h-100 p-0">
							<div class="card z-index-2 h-100">
								<div class="card-header pb-0 pt-3 bg-transparent">
									<h6 class="text-capitalize">Notice</h6>
								</div>
								<div class="card-body p-3"></div>
							</div>
						</div>
					</div>
				</div>
	</section>
	<script src="<%=assetspath%>js/main.js"></script>
	<script src="<%=assetspath%>js/chartjs.min.js"></script>
	
	
	<script>

		// ---------------
	const canvas = document.getElementById('chart-line');
	const ctx = canvas.getContext('2d');
	const labelList = getLabel();
	const dataList = getData();
	// Define the data for the bar graph
	const data = {
	  labels: labelList,
	  datasets: [{
	    label: <%=avgBatches!=null%>?'Average':'',
	    data: dataList,
	    backgroundColor: [
	      'rgba(255, 99, 132, 0.2)',
	      'rgba(54, 162, 235, 0.2)',
	      'rgba(255, 206, 86, 0.2)',
	      'rgba(75, 192, 192, 0.2)'
	    ],
	    borderColor: 
	 [
	      'rgba(255, 99, 132, 1)',
	      'rgba(54, 162, 235, 1)',
	      'rgba(255, 206, 86, 1)',
	      'rgba(75, 192, 192, 1)'
	    ],
	    borderWidth: 2
	  }]
	};

	// Define the chart options
	const options = {
  scales: {
    y: {
      max: 100, // Adjust the maximum value as needed
      ticks: {
        stepSize: 10// Adjust the step size between ticks
      }
    }
  }
};
	// Create the bar chart using Chart.js
	const chart = new Chart(ctx, {
	  type: 'bar',
	  data: data,
	  options: options
	});
	
	function getData()
	{
		const List = new Array();
		
		<%if(avgBatches!=null){
		for(Map.Entry<Batch, Integer> avg : avgBatches.entrySet()){%>
		
		List.push(<%=avg.getValue()!=null?avg.getValue():0%>);
		
		<%}}	
		else{%>
			
			List.push(0);
		
		<%}%>
		console.log(List);
		return List;
	}
	
	
	function getLabel()
	{
		const List = new Array();
		<%if(avgBatches!=null){
		for(Map.Entry<Batch, Integer> avg : avgBatches.entrySet()){%>
		
		List.push('<%=avg.getKey().getBatchTopic()!=null?avg.getKey().getBatchTopic():0%>')

		<%}}
		else{%>
			
			List.push('No Batch Data')
		
		<%}%>
		console.log(List);
		return List;
	}
	
	</script>
	
	<%@ include file="component/footer.jsp"%>
	<%@ include file="component/script.jsp"%>
</body>
</html>
