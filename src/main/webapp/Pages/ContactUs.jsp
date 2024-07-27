<%--
  Created by IntelliJ IDEA.
  User: shivp
  Date: 26-06-2024
  Time: 11:41 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
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


    String sfname = "";
    String slname = "";
    String semail = "";

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        String Driver = application.getInitParameter("Driver");
        String Database = application.getInitParameter("Database");
        String Username = application.getInitParameter("Username");
        String Password = application.getInitParameter("Password");

        Class.forName(Driver);
        con = DriverManager.getConnection(Database, Username, Password);

        pst = con.prepareStatement("SELECT * FROM student_registration WHERE semail = ?");
        pst.setString(1, em);
        rs = pst.executeQuery();

        if (rs.next()) {
            sid = rs.getInt("id");
            sfname = rs.getString("sfname");
            slname = rs.getString("slname");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
</head>
<body>

    <!-- =======================
Page Banner START -->
    <section class="py-4">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="bg-light p-4 text-center rounded-3">
                        <h1 class="m-0">Course Grid Minimal</h1>
                        <!-- Breadcrumb -->
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
    <!-- =======================
    Page Banner END -->

    <!-- =======================
    Image and contact form START -->
    <section >
        <div class="container">
            <div class="row g-4 g-lg-0 align-items-center">

                <div class="col-md-6 align-items-center text-center">
                    <!-- Image -->
                    <img src="assets/images/element/contact.svg" class="h-400px" alt="">

                    <!-- Social media button -->
                    <div class="d-sm-flex align-items-center justify-content-center mt-2 mt-sm-4">
                        <h5 class="mb-0">Follow us on:</h5>
                        <ul class="list-inline mb-0 ms-sm-2">
                            <li class="list-inline-item"> <a class="fs-5 me-1 text-facebook" href="#"><i class="fab fa-fw fa-facebook-square"></i></a> </li>
                            <li class="list-inline-item"> <a class="fs-5 me-1 text-instagram" href="#"><i class="fab fa-fw fa-instagram"></i></a> </li>
                            <li class="list-inline-item"> <a class="fs-5 me-1 text-twitter" href="#"><i class="fab fa-fw fa-twitter"></i></a> </li>
                            <li class="list-inline-item"> <a class="fs-5 me-1 text-linkedin" href="#"><i class="fab fa-fw fa-linkedin-in"></i></a> </li>
                            <li class="list-inline-item"> <a class="fs-5 me-1 text-dribbble" href="#"><i class="fas fa-fw fa-basketball-ball"></i></a> </li>
                            <li class="list-inline-item"> <a class="fs-5 me-1 text-pinterest" href="#"><i class="fab fa-fw fa-pinterest"></i></a> </li>
                        </ul>
                    </div>
                </div>

                <!-- Contact form START -->
                <div class="col-md-6">
                    <!-- Title -->
                    <h2 class="mt-2 mt-md-0">Let's talk</h2>
                    <p>To request a quote or want to meet up for coffee, contact us directly or fill out the form and we will get back to you promptly</p>

                    <form action="ContactUsServlet" method="POST">

                        <input type="hidden" name="sid" value="<%= sid%>" />
                        <!-- Name -->
                        <div class="mb-4 bg-light-input">
                            <label for="yourName" class="form-label">Your Name </label>
                            <input type="text" class="form-control form-control-lg" name="name" id="yourName" value="<%= sfname%> <%= slname%>" readonly>
                        </div>
                        <!-- Email -->
                        <div class="mb-4 bg-light-input">
                            <label for="emailInput" class="form-label">Email Address</label>
                            <input type="email" class="form-control form-control-lg" name="email" id="emailInput" value="<%= em%>" readonly>
                        </div>
                        <!-- Message -->
                        <div class="mb-4 bg-light-input">
                            <label for="textareaBox" class="form-label">Message</label>
                            <textarea class="form-control" id="textareaBox" name="message" rows="4" required></textarea>
                        </div>
                        <!-- Button -->
                        <div class="d-grid">
                            <button class="btn btn-lg btn-primary mb-0" type="submit">Send Message</button>
                        </div>
                    </form>
                </div>
                <!-- Contact form END -->
            </div>
        </div>
    </section>
    <!-- =======================
    Image and contact form END -->

    <!-- =======================
    Map START -->
    <section class="pt-0">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3666.103141662906!2d72.6361558747766!3d23.23933350820545!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395c2b933477ba9f%3A0xe440409e66bea08a!2sLDRP%20Institute%20of%20Technology%20and%20Research!5e0!3m2!1sen!2sin!4v1721056073651!5m2!1sen!2sin" width="100%" height="500" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>
        </div>
    </section>
    <!-- =======================
    Map END -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const triggerToastFromURL = () => {
                const urlParams = new URLSearchParams(window.location.search);
                const toastType = urlParams.get('toast');

                if (toastType === 'success') {
                    Toastify({
                        text: "✅ Message Send Successfully",
                        duration: 3000,
                        offset: {
                            x: 10,
                            y: 10
                        },
                        backgroundColor: "",
                        close: true, // Show close button
                        gravity: "top", // Toast position: top or bottom
                        position: "right", // Toast position: left, center or right
                        stopOnFocus: true, // Prevent toast from disappearing on hover
                        className: "custom-toast1", // Apply custom class
                    }).showToast();

                    // Remove the 'toast' parameter from the URL
                    urlParams.delete('toast');
                    const newUrl = `${window.location.pathname}?sp_name=cu`;
                    window.history.replaceState({}, document.title, newUrl);
                } else {
                    console.warn(`Toast type "${toastType}" is not recognized.`);
                }
            };

            triggerToastFromURL();
        });

    </script>
    <style>
        /* Custom styles to replicate React Toastify appearance */
        .custom-toast1 {
            border-radius: 6px;
            padding: 12px 20px; /* Padding for better appearance */
            font-family: 'Poppins', sans-serif; /* Font similar to React Toastify */
            font-size: 16px; /* Adjust font size if needed */
            color: green; /* Text color */
            border-bottom: 2px solid green;
            box-shadow: rgb(38, 57, 77) 0px 20px 30px -10px;
        }

        .toastify {
            /* Toastify container styles */
            background: white;
        }

        .toast-close{
            color: green !important; /* Close button color */
            font-size: 16px; /* Adjust close button size */
        }
        .toastify .toastify-close:hover {
            color: #ccc; /* Change color on hover */
        }

    </style>
</body>
</html>
