<%@ page import="com.springboot.swt.project.entity.User" %>

    <%@ page import="com.springboot.swt.project.entity.User,java.util.ArrayList" %>
        <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
            <!DOCTYPE html>
            <html>

            <head>
                <%@ include file="component/head.jsp" %>
            </head>

            <body>

                <%@ include file="component/navbar.jsp" %>
                    <div class="py-4">
                        <div class="row">
                            <section class="col py-4">
                                Active batches
                                <div class="row">
                                    <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                                        <div class="card ">
                                            <div class=" card-body p-3">
                                                <div class="row">

                                                    <div class="col-8">
                                                        <div class="numbers">
                                                            <p class="text-sm mb-0 font-weight-bold">C/C++</p>
                                                            <h5 class="font-weight-bolder">986</h5>
                                                            <p class="mb-0">
                                                                <span
                                                                    class="text-success text-sm font-weight-bolder">100%</span>
                                                                since Today
                                                                <a class="bg-gradient-warning btn text-light mt-1"
                                                                    onclick="batchDetails(this); changeColor(this);">View</a>
                                                            </p>
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
                                                            <p class="text-sm mb-0 font-weight-bold">core Java</p>
                                                            <h5 class="font-weight-bolder">986</h5>
                                                            <p class="mb-0">
                                                                <span
                                                                    class="text-success text-sm font-weight-bolder">100%</span>
                                                                since Today
                                                                <a class="bg-gradient-warning btn text-light mt-1"
                                                                    onclick="batchDetails(this); changeColor(this);">View</a>
                                                            </p>
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
                                                            <p class="text-sm mb-0 font-weight-bold">Advance Java</p>
                                                            <h5 class="font-weight-bolder">986</h5>
                                                            <p class="mb-0">
                                                                <span
                                                                    class="text-success text-sm font-weight-bolder">100%</span>
                                                                since Today
                                                                <a class="bg-gradient-warning btn text-light mt-1"
                                                                    onclick="batchDetails(this); changeColor(this);">View</a>
                                                            </p>
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
                                                            <p class="text-sm mb-0 font-weight-bold">DSA</p>
                                                            <h5 class="font-weight-bolder">986</h5>
                                                            <p class="mb-0">
                                                                <span
                                                                    class="text-success text-sm font-weight-bolder">100%</span>
                                                                since Today
                                                                <a class="bg-gradient-warning btn text-light mt-1"
                                                                    onclick="batchDetails(this); changeColor(this);">View</a>
                                                            </p>
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
                                </div>
                                <div class="row mt-4">
                                    <div class="col-lg-13  mb-lg-0 mb-4">
                                        <div class="card z-index-2 h-100">
                                            <div class="card-header pb-0 pt-3 bg-transparent">
                                                <h6 class="text-capitalize">completed Batches
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    Batch Name:- </h6>

                                            </div>
                                            <div class="card-body p-3">

                                                <div class="table-responsive">
                                                    <table class="table align-items-center " id="backtable">
                                                        <tbody></tbody>
                                                    </table>
                                                    <table class="table align-items-center " id="tableid">
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>

                    <script>
                        let lastClickedButton = null; // Track the last clicked button
                        function changeColor(element) {
                            if (!element) return;
                            if (lastClickedButton) {
                                lastClickedButton.classList.remove('bg-primary');
                                lastClickedButton.classList.add('bg-gradient-warning');
                            }

                            // Set the current button to blue
                            element.classList.remove('bg-gradient-warning');
                            element.classList.add('bg-primary');

                            // Update the last clicked button to the current one
                            lastClickedButton = element;
                            return;
                        }
                    </script>
                    <style>
                        .bg-gradient-warning {
                            background-color: yellow;
                            /* Original color */

                            /* Ensure it behaves like a button */
                        }

                        .bg-primary {
                            background-color: blue !important;

                            /* Change text color for visibility */
                        }
                        .separator-line {
                            height: 1px;
                            /* Set the height */
                            background-color: rgb(0, 0, 0);
                            /* Set the color */
                            border: none;
                            /* Remove any borders */
                        }
                    </style>

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
                                    loadBatch(null);
                                }
                                function loadBatch(element) {
                                    changeColor(element);

                                    $('#backtable').empty();
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
                                                    batch.currentStatus === "Completed" ? $('<td>').html('<p class="text-xs font-weight-bold mb-0">Name:</p><h6 class="text-sm mb-0">' + batch.batchTopic + '</h6>') : null,
                                                    batch.currentStatus === "Completed" ? $('<td>').html('<p class="text-xs font-weight-bold mb-0">batch status </p><h6 class="text-sm mb-0">' + batch.currentStatus + '</h6>') : null,
                                                    batch.currentStatus === "Completed" ? $('<td>').html('<p class="text-xs font-weight-bold mb-0">start date  </p><h6 class="text-sm mb-0">' + batch.startDate + '</h6>') : null,
                                                    batch.currentStatus === "Completed" ? $('<td>').html('<p class="text-xs font-weight-bold mb-0">end date  </p><h6 class="text-sm mb-0">' + batch.endbatch + '</h6>') : null,
                                                    // batch.currentStatus === "Enroll" ? $('<td>').html('<button type="button" class="btn btn-outline-success" onclick="startbatch(\'' + batch.batchId + '\')">Start</button>') : null,
                                                    // batch.currentStatus === "Enroll" ? $('<td>').html('<button type="button" class="btn btn-outline-danger" onclick="deletebatch(\'' + batch.batchId + '\')">delete</button>') : null,
                                                    // batch.currentStatus === "Active" ? $('<td>').html('<button type="button" class="btn btn-outline-danger" onclick="endbatch(\'' + batch.batchId + '\')">end</button>') : null,
                                                    batch.currentStatus === "Completed" ? $('<td>').html('<a class="btn btn-outline-info"  onclick="batchDetails(null)">Details</a>') : null
                                                );
                                                // Append the new row to the table
                                                $('#tableid').append(newRow);
                                                // const separatorRow = $('<tr>').append(
                                                //     $('<td colspan="4" class="separator-line"/>') // Use a CSS class for styling
                                                // );
                                                // $('#tableid').append(separatorRow);
                                            });
                                        },
                                        error: function (error) {
                                            console.error('Error:', error);
                                        }
                                    });

                                }
                                function batchDetails() {

                                    $('#backtable').empty();
                                    // Create a new row
                                    const backRow = $('<tr>');
                                    // Append the Back button to the row
                                    backRow.append(
                                        $('<td>').attr('colspan', 2).html('<button type="button" class="btn btn-outline-secondary" style="width: 100%;" onclick="loadBatch(this)">Back all batches</button>')
                                    );
                                    // Append the new row to the table
                                    $('#backtable').append(backRow);

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
                                                    batch.currentStatus === "Completed" ? $('<td>').html('<p class="text-xs font-weight-bold mb-0">Name:</p><h6 class="text-sm mb-0">' + batch.batchTopic + '</h6>') : null,
                                                    batch.currentStatus === "Completed" ? $('<td>').html('<a class="btn btn-outline-info" href="/admin/getBatchDetails?id=' + batch.batchid + '">Details</a>') : null
                                                );
                                                // Append the new row to the table
                                                $('#tableid').append(newRow);
                                                // const separatorRow = $('<tr>').append(
                                                //     $('<td colspan="1" class="separator-line"/>') // Use a CSS class for styling
                                                // );
                                                // $('#tableid').append(separatorRow);
                                            });
                                        },
                                        error: function (error) {
                                            console.error('Error:', error);
                                        }
                                    });

                                }
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
                                            data: [50, 40, 60, 20, 95, 89, 73, 30],
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
                            </script>
            </body>

            </html>