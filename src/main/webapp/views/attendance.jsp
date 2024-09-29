<%@ page import="com.springboot.swt.project.entity.Student"%>
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
    <%@ include file="component/navbar.jsp"%>
    <%
    Student student = (Student) request.getAttribute("studentdecodedobject");
    %>
    <div class="container text-center">
        <div id="calendar" class="">
            <table class="table">
                <tbody>
                    <%
                    if (student != null && student.getBatch().getStartDate() != null) {
                        Date date = student.getBatch().getStartDate();
                        Calendar calendar = Calendar.getInstance();
                        calendar.setTime(date);

                        LocalDate localDate = LocalDate.of(calendar.get(Calendar.YEAR),
                            calendar.get(Calendar.MONTH) + 1,
                            calendar.get(Calendar.DAY_OF_MONTH));

                        boolean isAbsent = false;
                        int totalDays = student.getAttendanceCount() + student.absent.size();

                        if (totalDays >= 1) {
                            for (int i = 1; i <= totalDays; i++) {
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
                                if ((i - 1) % 7 == 0) {
                                    %>
                                    <tr>
                                    <%
                                }
                                %>
                                <td>
                                    <div class="card <%=isAbsent ? "bg-danger" : "bg-success"%>">
                                        <div class="card-body p-3">
                                            <p class="font-weight-bolder text-sm mb-0">
                                                <%=localDate.getDayOfMonth()%>
                                                <%=dayName%>
                                            </p>
                                            <h5 class="font-weight-bolder text-light">
                                                <%=isAbsent ? "A" : "P"%>
                                            </h5>
                                        </div>
                                    </div>
                                </td>
                                <%
                                // Close the row after 7 cards or at the end of the loop
                                if (i % 7 == 0 || i == totalDays) {
                                    %>
                                    </tr>
                                    <%
                                }
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
                                    <h1>Batch is Not Started Yet</h1>
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
