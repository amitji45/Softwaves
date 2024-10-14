<%@ page import="com.springboot.swt.project.entity.Student"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.time.DayOfWeek"%>
<%@ page import="java.time.format.TextStyle"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Locale"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="component/head.jsp"%>
<link href="<%=assetspath%>css/attendance.css" rel="stylesheet">
</head>
<body>
<%
   String encodedJson = request.getParameter("student");
    Student studentUser =null;
try {
       ObjectMapper objectMapper = new ObjectMapper();
         studentUser = objectMapper.readValue(encodedJson, Student.class);

   } catch (Exception e) {
   }
%>
<script>

    	function findStudentBatches() {

    	var url = "<%=linkSetup%>user/find/student/batch";
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState === XMLHttpRequest.DONE) {
                if (this.status === 200) {
                    try {
                        const response = JSON.parse(this.responseText);
                        updateBatchList(response);
                    }
                    catch (e) {
                        console.error('Error parsing JSON:', e);

                    }
                } else {

                    console.error('Request failed. Status:', this.status,
                        'Status text:', this.statusText);
                }
            }
        };

        xhttp.open("GET", url, true);
        xhttp.send();
    }

    function updateBatchList(batches1) {

        var batchList = document.getElementById('batchList1');
        batchList.innerHTML = ''; // Clear existing options

        var op1 = document.createElement('option');
        op1.textContent = 'None'; // Default text
        op1.disabled = true; // Disable the default option
        op1.selected = true; // Set it as selected
        batchList.appendChild(op1);

        batches1.forEach(function (batch) {
            if (!batch.batch.batchId || !batch.batch.batchTopic) {
                console.warn('Batch object missing required properties:', batch);
                return;
            }

            var studentJson = JSON.stringify(batch);
            var stud = encodeURIComponent(studentJson);
            var url = '<%=linkSetup%>user/dashboard/attendance?student=' + stud;

            var op = document.createElement('option');
            op.textContent = batch.batch.batchTopic; // Set display text
            op.setAttribute('data-url', url); // Store the URL
            batchList.appendChild(op); // Append the option to the select element
        });
    }
    function findStudentBatches1() {

        var batchList = document.getElementById('batchList1');
        var selectedOption = batchList.options[batchList.selectedIndex];

        // Get the URL from the selected option's data-url attribute
        var selectedUrl = selectedOption.getAttribute('data-url');
        if (selectedUrl) {
            window.location.replace(selectedUrl); // Navigate to the URL
        }
    }
	document.addEventListener('DOMContentLoaded', function () {
        findStudentBatches();
        });

</script>
    <%@ include file="component/navbar.jsp"%>
    <%
     Student student = (Student) request.getAttribute("studentdecodedobject");
    %>
    <div class="container text-center">
    <div class="col-md-12">
        <label for="email-field" class="pb-2">Select
            Batch:- 	<%=(studentUser !=null) ?studentUser.getBatch().getBatchTopic():""%></label>
        <select class="form-control" name="batch"
            id="batchList1" selected="selected"
            onchange="findStudentBatches1()">
        </select>
    </div>
        <div id="calendar" class="mt-3">
            <table class="table">
                <thead>
                    <tr>
                      <th scope="col">Mon</th>
                      <th scope="col">Tue</th>
                      <th scope="col">Wed</th>
                      <th scope="col">Thu</th>
                      <th scope="col">Fri</th>
                      <th scope="col">Sat</th>
                      <th scope="col">Sun</th>
                     </tr>
                  </thead>
                <tbody>

                    <%if(student != null && student.getBatch().getStartDate() != null) {
                        Date date = student.getBatch().getStartDate();
                        Calendar calendar = Calendar.getInstance();
                        calendar.setTime(date);
                        LocalDate localDate = LocalDate.of(calendar.get(Calendar.YEAR),
                            calendar.get(Calendar.MONTH) + 1,
                            calendar.get(Calendar.DAY_OF_MONTH));
                        boolean isAbsent = false;
                        int totalDays = student.getAttendanceCount() + student.absent.size();
                        if (totalDays >= 1) {
                        int j = 1;
                            for (int i = 1; i <= totalDays; i++)
                            {

                                DayOfWeek dayOfWeek = localDate.getDayOfWeek();
                                String dayName = dayOfWeek.getDisplayName(TextStyle.FULL, Locale.getDefault());
                                isAbsent = false;

                                for (String l : student.absent) {
                                    if (localDate.toString().equals(l)) {
                                        isAbsent = true;
                                        break;
                                    }
                                }
                                // Start a new row for every 7 cards
                                if ((j - 1) % 7 == 0) {
                                    %>
                                    <tr>
                                    <%
                                }
                                if(i == 1)
                                {
                                int k = 0;
                                 switch(dayName)
                                 {
                                  case "Monday": k = 0;
                                  break;
                                  case "Tuesday": k = 1;
                                  break;
                                  case "Wednesday": k = 2;
                                  break;
                                  case "Thursday": k = 3;
                                  break;
                                  case "Friday": k = 4;
                                  break;
                                  case "Saturday": k = 5;
                                  break;
                                  case "Sunday": k = 6;
                                  break;
                                  }
                                for(int day = 1 ; day <= k ; day++  )
                                {
                                %>
                                  <td>
                                     <div class="card bg-light">
                                        <div class="card-body p-3">
                                            <p class="font-weight-bolder text-sm mb-0">

                                            </p>
                                            <h5 class="font-weight-bolder text-light">

                                            </h5>
                                        </div>
                                     </div>
                                  </td>
                                <%
                                }
                                j += k;
                                }
                                %>
                                   <td>
                                    <div class="card <%=isAbsent ? "bg-danger" : "bg-success"%>">
                                        <div class="card-body p-3">
                                            <p class="font-weight-bolder text-sm mb-0">
                                                <%=localDate.getDayOfMonth()%>
                                                <%=localDate.getMonth().toString().substring(0,3)%>
                                            </p>
                                            <h5 class="font-weight-bolder text-light">
                                                <%=isAbsent ? "A" : "P"%>
                                            </h5>
                                        </div>
                                    </div>
                                   </td>
                                <%
                                 // Close the row after 7 cards or at the end of the loop
                                if (j % 7 == 0 || i == totalDays) {
                                    %>
                                    </tr>
                                    <%
                                }
                                j++;
                                // Move to the next day
                                localDate = localDate.plusDays(1);
                            }
                        } else {
                        %>
                            <div class="footer-newsletter">
                                <div class="container">
                                    <div class="row justify-content-center text-center">
                                        <div class="col-lg-6">
                                            <h1>No Attendance Record Available</h1>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <%
                        }
                    } else {
                    %>
                    <div class="footer-newsletter">
                        <div class="container">
                            <div class="row justify-content-center text-center">
                                <div class="col-lg-6">
                                    <h1>Please select Active batch or Completed batch</h1>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>
    <%@ include file="component/script.jsp"%>
    <%@ include file="component/footer.jsp"%>
</body>
</html>