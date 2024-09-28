<%@ page import="com.springboot.swt.project.entity.Student,java.util.List" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <%@ include file="component/head.jsp" %>
    </head>

    <body>
        <%@ include file="component/navbar.jsp" %>
            <% List<Student> studentList = (List<Student>) session.getAttribute("studentList");
                    %>
                    <section id="contact" class="section">

                        <div class="container section-title">
                            <h2>All Students</h2>
                        </div>
                        <div class="container">
                            <div class="row ">
                                <div class="col-lg-8 mb-lg-0 mb-4 mx-auto">
                                    <div class="card ">
                                        <div class="card-header pb-0 p-3">
                                            <div class="d-flex justify-content-between">
                                                <h6 class="mb-2">Students</h6>
                                            </div>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table align-items-center " id=>
                                                <tbody>
                                                    <%if(studentList==null || studentList.isEmpty()) { %>
                                                        <p class="d-flex justify-content-center ">NO STUDENT ENTRY FOUND
                                                        </p>
                                                        <%} else { for (Student student : studentList) { %>
                                                            <tr id="<%=student.getRollNo()%>">
                                                                <td>
                                                                    <div class="text-center">
                                                                        <p class="text-xs font-weight-bold mb-0">Name:
                                                                        </p>
                                                                        <h 6 class="text-sm mb-0">
                                                                            <%=student.getUser().getName()%>
                                                                                </h6>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="text-center">
                                                                        <p class="text-xs font-weight-bold mb-0">RollNo:
                                                                        </p>
                                                                        <h6 class="text-sm mb-0">
                                                                            <%=student.getRollNo()%>
                                                                        </h6>
                                                                    </div>
                                                                </td>

                                                                <td>
                                                                    <div class="text-center">
                                                                        <p class="text-xs font-weight-bold mb-0">Email:
                                                                        </p>
                                                                        <h6 class="text-sm mb-0">
                                                                            <%=student.getUser().getEmail()%>
                                                                        </h6>
                                                                    </div>
                                                                </td>
                                                                <% if(student.getBatch().getCurrentStatus().equals("Enroll"))
                                                                    {%>
                                                                    <td>
                                                                        <div class="text-center">
                                                                            <button type="button"
                                                                                class="btn btn-outline-danger " onclick="removeStudentFromBatch('<%=student.getId()%>','<%=student.getRollNo()%>')">Remove</button>
                                                                        </div>
                                                                    </td>
                                                                    <%}%>
                                                            </tr>
                                                            <% } } %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <script>
                    
                    	
                        function removeStudentFromBatch(id,rollNo) {
									console.log(id);
                            $.ajax({
                                url: 'http://localhost:9090/admin/removeStudent?id=' + id,
                                type: 'GET',
                                dataType: 'json', // No need to parse the response manually
                                success: function (response) {
                    				document.getElementById(rollNo).remove();

                                },
                                error: function (error) {
                                    console.error('Error:', error);
                                }
                            });

                        }

                    </script>
                    <%@ include file="component/footer.jsp" %>
                        <%@ include file="component/script.jsp" %>
    </body>

    </html>
