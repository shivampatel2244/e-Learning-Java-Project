<%--
  Created by IntelliJ IDEA.
  User: shivp
  Date: 26-06-2024
  Time: 11:39 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%--<%--%>
<%--    String fname = "";--%>
<%--    try {--%>

<%--        String fid = request.getParameter("fid");--%>

<%--        String Driver = application.getInitParameter("Driver");--%>
<%--        String Database = application.getInitParameter("Database");--%>
<%--        String Username = application.getInitParameter("Username");--%>

<%--        Class.forName(Driver);--%>
<%--        Connection con = DriverManager.getConnection(Database, Username, "");--%>
<%--        PreparedStatement pst = con.prepareStatement("select fname,fdesignation,fqualification,femail,fcontact,fimage from faculty_profile where fid=?");--%>
<%--        pst.setInt(1, Integer.parseInt(fid));--%>

<%--        ResultSet rs = pst.executeQuery();--%>
<%--        if (rs.next()) {--%>
<%--            fname = rs.getString("fname");--%>
<%--            String fdesignation = rs.getString("fdesignation");--%>
<%--            String fqualification = rs.getString("fqualification");--%>
<%--            String femail = rs.getString("femail");--%>
<%--            String fcontact = rs.getString("fcontact");--%>
<%--            byte[] imgBytes = rs.getBytes("fimage");--%>
<%--            String base64Image = java.util.Base64.getEncoder().encodeToString(imgBytes);--%>
<%--            String fimage = "data:image/jpeg;base64," + base64Image;--%>
<%--//                        String img = rs.getString("fimage");--%>
<%--//                        String fimage = "Upload/" + img;--%>
<%--        %>--%>
<%--<%--%>
<%--        }--%>
<%--    } catch (Exception e) {--%>
<%--        e.printStackTrace();--%>
<%--    }--%>
<%--%>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <!-- =======================
    Page content START -->
    <section class="pt-5 pb-0">
        <div class="container">
            <div class="row g-0 g-lg-5">
                <!-- Left sidebar START -->

                <div class="col-lg-4">
                    <%
                        try {

                            String fid = request.getParameter("fid");

                            String Driver = application.getInitParameter("Driver");
                            String Database = application.getInitParameter("Database");
                            String Username = application.getInitParameter("Username");

                            Class.forName(Driver);
                            Connection con = DriverManager.getConnection(Database, Username, "");
                            PreparedStatement pst = con.prepareStatement("select fname,fdesignation,fqualification,femail,fcontact,fimage from faculty_profile where fid=?");
                            pst.setInt(1, Integer.parseInt(fid));

                            ResultSet rs = pst.executeQuery();
                            if (rs.next()) {
                                String fname = rs.getString("fname");
                                String fdesignation = rs.getString("fdesignation");
                                String fqualification = rs.getString("fqualification");
                                String femail = rs.getString("femail");
                                String fcontact = rs.getString("fcontact");
                                byte[] imgBytes = rs.getBytes("fimage");
                                String base64Image = java.util.Base64.getEncoder().encodeToString(imgBytes);
                                String fimage = "data:image/jpeg;base64," + base64Image;
//                        String img = rs.getString("fimage");
//                        String fimage = "Upload/" + img;
                    %>
                    <div class="row">
                        <div class="col-md-6 col-lg-12">
                            <!-- Instructor image START -->
                            <div class="card shadow p-2 mb-4 text-center">
                                <div class="rounded-3">
                                    <!-- Image -->
                                    <img src="<%= fimage%>" class="card-img" alt="course image">
                                </div>

                                <!-- Card body -->
                                <div class="card-body px-3">
                                    <h5 class="mt-2"><%= fname%></h5>
                                </div>
                            </div>
                            <!-- Instructor image END -->
                        </div>

                        <div class="col-md-6 col-lg-12">
                            <div class="card card-body shadow p-4 mb-4">

                                <!-- Education START -->
                                <!-- Title -->
                                <h5 class="mb-1">Personal Details</h5>

                                <ul class="list-group list-group-borderless">
                                    <li class="list-group-item px-0">
                                        <span class="h6 fw-light"><i class="fas fa-fw fa-envelope text-primary me-1 me-sm-3"></i> Email :</span>
                                        <span><%= femail%></span>
                                    </li>
                                    <li class="list-group-item px-0">
                                        <span class="h6 fw-light"><i class="fas fa-fw fa-headphones text-primary me-1 me-sm-3"></i> Phone number :</span>
                                        <span><%= fcontact%></span>
                                    </li>
                                    <li class="list-group-item px-0">
                                        <span class="h6 fw-light"><i class="fas fa-fw fa-chalkboard-teacher text-primary me-1 me-sm-3"></i> Designation :</span>
                                        <span><%= fdesignation%>r</span>
                                    </li>
                                    <li class="list-group-item px-0">
                                        <span class="h6 fw-light"><i class="fas fa-fw fa-certificate text-primary me-1 me-sm-3"></i> Qualification :</span>
                                        <span><%= fqualification%></span>
                                    </li>
                                </ul>

                                <hr> <!-- Divider -->
                            </div>
                        </div>
                    </div> <!-- Row End -->
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </div>
                <!-- Left sidebar END -->

                <!-- Main content START -->
                <div class="col-lg-8">

                    <!-- Course START -->
                    <div class="row g-4">
                        <!-- Title -->
                        <h2>Assigned Courses List</h2>

                        <!-- Card item START -->
                        <%
                            try {
                                String fid = request.getParameter("fid");

                                String Driver = application.getInitParameter("Driver");
                                String Database = application.getInitParameter("Database");
                                String Username = application.getInitParameter("Username");
                                String Password = application.getInitParameter("");

                                Class.forName(Driver);
                                Connection con = DriverManager.getConnection(Database, Username, Password);

                                String query = "SELECT fp.fname, cp.cname,cp.cimage " +
                                        "FROM faculty_profile fp " +
                                        "JOIN cource_playlist cp ON fp.fname = cp.cfacultyname " +
                                        "WHERE fp.fid = ?";

                                PreparedStatement pst = con.prepareStatement(query);
                                pst.setString(1, fid);

                                ResultSet rs = pst.executeQuery();

                                while (rs.next()) {
                                    byte[] imgBytes = rs.getBytes("cimage");
                                    String base64Image = java.util.Base64.getEncoder().encodeToString(imgBytes);
                                    String cimage = "data:image/jpeg;base64," + base64Image;
                        %>
                        <div class="col-sm-6">
                            <div class="card bg-transparent">
                                <div class="overflow-hidden rounded-3">
                                    <img src="<%= cimage%>" class="card-img" alt="course image">
                                </div>

                                <!-- Card body -->
                                <div class="card-body">
                                    <!-- Title -->
                                    <h5 class="card-title"><a href="#"><%= rs.getString("cname") %></a></h5>
                                </div>
                            </div>
                        </div>
                        <%
                                }

                                rs.close();
                                pst.close();
                                con.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                        <!-- Card item END -->
                    </div>
                    <!-- Course END -->
                </div>
                <!-- Main content END -->
            </div><!-- Row END -->
        </div>
    </section>
    <!-- =======================
    Page content END -->

</body>
</html>
