<%@ page import="com.springboot.swt.project.entity.User" %>

    <%@ page import="com.springboot.swt.project.entity.User,java.util.ArrayList" %>

        <%@ page import="java.nio.charset.StandardCharsets" %>
            <!DOCTYPE html>
            <html>

            <head>
                <%@ include file="component/head.jsp" %>
            </head>

            <body>

                <%@ include file="component/navbar.jsp" %>
                    <div class="py-4">
                        <div class="row">
                            <section class="col py-4 ">
                                <div class="footer-newsletter">
                                    <div class="container ">
                                        <div class="row justify-content-center text-center ">
                                            <div class="col-lg-6 ">
                                                <h2> Completed Batch Record </h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="py-4">
                                    <div class="row">

                                        <section class="col py-4 px-2">
                                            <!-- ---------------------------------------------=============================================== -->
                                                                    <!-- ---------------------------------------------=============================================== -->
                                            <div class="row">
                                                <div class="col-lg-8 mb-lg-0 mb-4 mx-auto">
                                                    <div class="card">
                                                        <div class="card-header pb-0 pt-3">
                                                            <div class="d-flex justify-content-center">

                                                                <h6 class="text-capitalize text-center"
                                                                id="batchandstudent"></h6>
                                                            </div>
                                                        </div>

                                                         

                                                                        <div class="table-responsive" id="completedbatchdiv"
                                                                           style="display: none;">
                                                                            <table class="table align-items-center ">
                                                                                <tbody  id="batchListtableId">
                    
                                                                                </tbody> 

                                                                            </table>
                                                                            <table class="table align-items-center ">
                                                                                <tbody  id="studentListtbody"></tbody>
                                                                            </table>
                                                                            <div class="card-body p-3" id="graphdiv"
                                                                                style="display: none;">
                                                                                <div class="chart">
                                                                                    <canvas id="chart-line"
                                                                                        class="chart-canvas"
                                                                                        height="300"></canvas>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                    <script src="<%=assetspath%>js/main.js"></script>
                    <script src="<%=assetspath%>js/chartjs.min.js"></script>
                    <%@ include file="component/footer.jsp" %>
                        <%@ include file="component/script.jsp" %>
                            <script src="<%=assetspath%>js/main.js"></script>
                            <script src="<%=assetspath%>js/chartjs.min.js"></script>
                            <script>

                                function updatebatch(url) {
                                    var xhttp = new XMLHttpRequest();
                                    xhttp.open("GET", url, true);

                                    xhttp.onreadystatechange = function () {
                                        if (this.readyState === 4) {
                                            if (this.status === 200) {
                                                var updatedBatch = JSON.parse(this.responseText);
                                                loadBatch();
                                            } else {
                                                console.log("Error: " + this.status); // Log any error
                                            }
                                        }
                                    };

                                    xhttp.send();
                                }
                                window.onload = function () {
                                    loadBatch();

                                }

                                function countActiveBatchStudent(batchId, callback) {
                                    console.log(batchId);
                                    $.ajax({
                                        url: 'http://localhost:9090/admin/getAllStudentByBatchId?batchId=' + batchId,
                                        type: 'GET',
                                        dataType: 'json',
                                        success: function (response) {
                                            const count = response.length;
                                            console.log('Count of students:', count);
                                            callback(count); // Call the callback with the count
                                        },
                                        error: function (error) {
                                            console.error('Error:', error);
                                            callback("not found"); // Call the callback with an error message
                                        }
                                    });
                                }



                                function loadBatch() {

                                    document.getElementById('batchandstudent').innerText = 'Completed Batch'

                                    document.getElementById('graphdiv').style.display = 'none';
                                    $('#batchListtableId').empty();
                                    $('#studentListtbody').empty();
                                    $.ajax({
                                        url: 'http://localhost:9090/admin/getBatch',
                                        type: 'GET',
                                        dataType: 'json',
                                        success: function (response) {
                                            $('#studentListtbody').empty(); // Clear the existing table body to prevent duplicates
                                            let requests = []; // To hold the AJAX requests for total students
                                            var check=true;
                                            // Iterate over the response and append rows
                                            response.forEach(batch => {
                                                if (batch.currentStatus === "Completed") {
                                                    // Create a request to get the number of students
                                                    check=false;
                                                    const request = $.ajax({
                                                        url: 'http://localhost:9090/admin/getAllStudentByBatchId?batchId=' + batch.batchId,
                                                        type: 'GET',
                                                        dataType: 'json'
                                                    }).then(studentResponse => {
                                                        return studentResponse.length; // Return the number of students
                                                    });
                                                    requests.push(request); // Store the request promise
                                                }
                                            });
                                            if(check)
                                            {
                                                document.getElementById('batchandstudent').innerText = 'not Available Completed Batch...';
                                                return ;
                                            }
                                            Promise.all(requests).then(totalStudentsArray => {
                                                response.forEach((batch, index) => {
                                                    // Append only if the batch is completed
                                                    if (batch.currentStatus === "Completed") {
                                                        document.getElementById('completedbatchdiv').style.display = 'block';
                                                          $.ajax({
                                                            url: 'http://localhost:9090/admin/getAllStudentByBatchId?batchId=' + batch.batchId,
                                                            type: 'GET',
                                                            dataType: 'json',
                                                            success: function (studentResponse) {
                                                                let totalStudents = studentResponse.length; // Update total student count
                                                                 const newRow = $('<tr>').attr('id', batch.batchId);
                                                                newRow.append(
                                                                    $('<td>').html('<p class="text-xs font-weight-bold mb-0">Name:</p><h6 class="text-sm mb-0">' + batch.batchTopic + '</h6>'),
                                                                    $('<td>').html('<p class="text-xs font-weight-bold mb-0">Batch ID</p><h6 class="text-sm mb-0">' + batch.batchId + '</h6>'),
                                                                    $('<td>').html('<p class="text-xs font-weight-bold mb-0">Start Date</p><h6 class="text-sm mb-0">' + batch.startDate + '</h6>'),
                                                                    $('<td>').html('<p class="text-xs font-weight-bold mb-0">End Date</p><h6 class="text-sm mb-0">' + batch.endDate + '</h6>'),
                                                                    $('<td>').html('<p class="text-xs font-weight-bold mb-0">Total Students</p><h6 class="text-sm mb-0">' + totalStudents + '</h6>'),
                                                                    $('<td>').html('<a class="btn btn-outline-danger" onclick="batchDetails(\'' + batch.batchId + '\')">Details</a>')
                                                                );

                                                                // Append the new row to the table after getting total students
                                                                $('#batchListtableId').append(newRow);
                                                            },
                                                            error: function (error) {
                                                                console.error('Error fetching student count:', error);
                                                            }
                                                        });
                                                    }
                                                });
                                            });

                                        },
                                        error: function (error) {
                                            console.error('Error:', error);
                                            $('#batchListtableId').empty();
                                            $('#studentListtbody').empty();
                                        }
                                    });
                                }



                                function batchDetails(batchId) {
                                    document.getElementById('graphdiv').style.display = 'none';
                                    document.getElementById('batchandstudent').innerText = 'Student List';

                                    console.log("batchid => " + batchId);

                                    $('#batchListtableId').empty();
                                    $('#studentListtbody').empty();

                                    // Add back button
                                    const backRow = $('<tr>');
                                    backRow.append(
                                        $('<td>').attr('colspan', 2).html('<button type="button" class="btn btn-outline-secondary" style="width: 100%;" onclick="loadBatch()">Back to all batches</button>')
                                    );
                                    $('#batchandstudent').append(backRow);

                                    // AJAX call to fetch students
                                    $.ajax({
                                        url: 'http://localhost:9090/admin/getAllStudentByBatchId?batchId=' + batchId,
                                        type: 'GET',
                                        dataType: 'json',
                                        success: function (response) {
                                            // Log response for debugging
                                            console.log(response);

                                            // Clear table before appending new data
                                            $('#studentListtbody').empty();

                                            if (response.length === 0) {
                                                const newRow = $('<tr>');
                                                newRow.append(
                                                    $('<td>').attr('colspan', 4).html('<h2 class="text-sm mb-0">No students available.</h2>')
                                                );
                                                $('#studentListtbody').append(newRow);
                                            } else {
                                                // Iterate over the response and append rows
                                                response.forEach(student => {
                                                    console.log("batchId:", student.batchId);

                                                    const newRow = $('<tr>').attr('id', student.batchId);
                                                    newRow.append(
                                                        $('<td>').html('<p class="text-xs font-weight-bold mb-0">Roll No:</p><h6 class="text-sm mb-0">' + student.rollNo + '</h6>'),
                                                        $('<td>').html('<p class="text-xs font-weight-bold mb-0">Name:</p><h6 class="text-sm mb-0">' + student.user.name + '</h6>'),
                                                        $('<td>').html('<p class="text-xs font-weight-bold mb-0">Present Count:</p><h6 class="text-sm mb-0">' + student.attendanceCount + '</h6>'),
                                                        $('<td>').html('<a class="btn btn-outline-danger" onclick="marksDetails(\'' + student.batch.batchId + '\', \'' + student.id + '\')">Details</a>')
                                                    );
                                                    $('#studentListtbody').append(newRow);
                                                });
                                            }
                                        },
                                        error: function (error) {
                                            console.error('Error:', error);

                                            const newRow = $('<tr>');
                                            newRow.append(
                                                $('<td>').attr('colspan', 4).html('<h6 class="text-sm mb-0">Page not found. Error: 404</h6>')
                                            );
                                            $('#studentListtbody').append(newRow);

                                            document.getElementById('graphdiv').style.display = 'none';
                                        }
                                    });
                                }
                                function marksDetails(batchId, pkId) {

                                    document.getElementById('batchandstudent').innerText = 'Student Details'
                                    $('#batchListtableId').empty();
                                    $('#studentListtbody').empty();
                                    // Create a new row
                                    const backRow = $('<tr>');
                                    // Append the Back button to the row
                                    backRow.append(
                                        $('<td>').attr('colspan', 2).html('<button type="button" class="btn btn-outline-secondary" style="width: 100%;" onclick="batchDetails(' + batchId + ')">Back  Student List</button>')
                                    );
                                    // Append the new row to the table
                                    $('#batchandstudent').append(backRow);
                                    $.ajax({
                                        url: 'http://localhost:9090/admin/getcompletedmarks?studId=' + pkId,
                                        type: 'GET',
                                        dataType: 'json', // No need to parse the response manually
                                        success: function (response) {
                                            document.getElementById('graphdiv').style.display = 'block';
                                            granph(response);
                                        },
                                        error: function (error) {
                                            console.error('Error:', error);
                                            const newRow = $('<tr>');
                                            $('#studentListtbody').empty();
                                            $('#batchListtableId').empty();
                                            newRow.append(
                                                $('<td>').html(' <h6 class="text-sm mb-0 "> page not found  Error : 404 </h6>'));
                                            $('#studentListtbody').append(newRow);
                                        }
                                    });
                                }
                                function granph(response) {
                                    if (response.length <= 0) {
                                        $('#batchListtableId').empty();
                                        $('#studentListtbody').empty();
                                        document.getElementById('graphdiv').style.display = 'none';
                                        const newRow = $('<tr>');
                                        newRow.append(
                                            $('<td>').html(' <h6 class="text-sm mb-0 "> no available student marks.. </h6>'));
                                        $('#studentListtbody').append(newRow);
                                        return;
                                    }
                                    console.log(response);
                                    var ctx1 = document.getElementById("chart-line").getContext("2d");
                                    var gradientStroke1 = ctx1.createLinearGradient(0, 230, 0, 50);
                                    gradientStroke1.addColorStop(1, 'rgba(94, 114, 228, 0.2)');
                                    gradientStroke1.addColorStop(0.2, 'rgba(94, 114, 228, 0.0)');
                                    gradientStroke1.addColorStop(0, 'rgba(94, 114, 228, 0)');
                                    new Chart(ctx1, {
                                        type: "line",
                                        data: {
                                            labels: ["Week1", "Week2", "Week3", "Week4", "Week5",
                                                "Week6", "Week7", "Week8"],
                                            datasets: [{
                                                label: "Marks Progress",
                                                tension: 0.4,
                                                borderWidth: 0,
                                                pointRadius: 0,
                                                borderColor: "#5e72e4",
                                                backgroundColor: gradientStroke1,
                                                borderWidth: 3,
                                                fill: true,
                                                data: response,
                                                maxBarThickness: 6
                                            }],
                                        },
                                        options: {
                                            responsive: true,
                                            maintainAspectRatio: false,
                                            plugins: {
                                                legend: {
                                                    display: false,
                                                }
                                            },
                                            interaction: {
                                                intersect: false,
                                                mode: 'index',
                                            },
                                            scales: {
                                                y: {
                                                    grid: {
                                                        drawBorder: false,
                                                        display: true,
                                                        drawOnChartArea: true,
                                                        drawTicks: false,
                                                        borderDash: [5, 5]
                                                    },
                                                    ticks: {
                                                        display: true,
                                                        padding: 10,
                                                        color: '#fbfbfb',
                                                        font: {
                                                            size: 11,
                                                            family: "Open Sans",
                                                            style: 'normal',
                                                            lineHeight: 2
                                                        },
                                                    }
                                                },
                                                x: {
                                                    grid: {
                                                        drawBorder: false,
                                                        display: false,
                                                        drawOnChartArea: false,
                                                        drawTicks: false,
                                                        borderDash: [5, 5]
                                                    },
                                                    ticks: {
                                                        display: true,
                                                        color: '#ccc',
                                                        padding: 20,
                                                        font: {
                                                            size: 11,
                                                            family: "Open Sans",
                                                            style: 'normal',
                                                            lineHeight: 2
                                                        },
                                                    }
                                                },
                                            },
                                        },
                                    });
                                }

                            </script>

            </body>

            </html>