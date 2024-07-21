<%@ page import="java.sql.*" %>
<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course Grid Minimal</title>
    <style>
        .card {
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
        }
        .card-img-top {
            width: 100%;
            height: 300px;
            object-fit: cover;
            object-position: top;
        }
        .qr-code-modal img {
            width: 100%;
            height: auto;
        }
    </style>
</head>
<body>

<section class="py-4">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="bg-light p-4 text-center rounded-3">
                    <h1 class="m-0">Course Grid Minimal</h1>
                    <div class="d-flex justify-content-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb breadcrumb-dots mb-0">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Course minimal</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="container mt-3">
    <div class="row">
        <%
            Cookie[] cookies = request.getCookies();
            String em = null;

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("em")) {
                        em = cookie.getValue();
                        break;
                    }
                }
            }

            int sid = 0;

            try {
                String Driver = application.getInitParameter("Driver");
                String Database = application.getInitParameter("Database");
                String Username = application.getInitParameter("Username");
                String Password = application.getInitParameter("Password");

                Class.forName(Driver);
                Connection con = DriverManager.getConnection(Database, Username, Password);

                PreparedStatement pst = con.prepareStatement("SELECT * FROM student_registration WHERE semail = ?");
                pst.setString(1, em);
                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                    sid = rs.getInt("id");
                }

                rs.close();
                pst.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                String Driver = application.getInitParameter("Driver");
                String Database = application.getInitParameter("Database");
                String Username = application.getInitParameter("Username");
                String Password = application.getInitParameter("Password");

                Class.forName(Driver);
                Connection con = DriverManager.getConnection(Database, Username, Password);

                PreparedStatement pst = con.prepareStatement("SELECT sp.sid, cp.cname, cp.cimage, sp.sid FROM student_payment sp JOIN cource_playlist cp ON sp.cid = cp.cid JOIN student_registration sd ON sp.sid = sd.id WHERE sp.sid = ?");
                pst.setInt(1, sid);
                ResultSet rs = pst.executeQuery();

                while (rs.next()) {
                    String paysid = rs.getString("sid");
                    String studid = rs.getString("sid");
                    String cname = rs.getString("cname");
                    byte[] cimage = rs.getBytes("cimage");
                    String base64Image = Base64.getEncoder().encodeToString(cimage);
                    String CourseImage = "data:image/jpeg;base64," + base64Image;
        %>
        <div class="col-lg-4 mb-5">
            <div class="card">
                <img src="<%= CourseImage %>" alt="" class="card-img-top">
                <div class="card-body">
                    <h5 class="card-title text-center"><%= cname %></h5>
                    <hr style="border: 2px solid red;" />
                    <div style="display: flex; justify-content: space-between">
                        <a href="Pages/ProfilePaymentReceipt.jsp?si=<%= sid %>" class="btn btn-outline-success btn-sm">View Receipt</a>
                        <a href="" class="btn btn-outline-info btn-sm"><i class="far fa-share-square"></i></a>
                    </div>
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
    </div>
</div>


</body>
</html>