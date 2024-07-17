<%--
  Created by IntelliJ IDEA.
  User: shivp
  Date: 07-07-2024
  Time: 09:27 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" >

<!-- Mirrored from eduport.webestica.com/rtl/sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 May 2024 02:02:43 GMT -->
<head>
    <title>Eduport - LMS, Education and Course Theme</title>

    <!-- Meta Tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Webestica.com">
    <meta name="description" content="Eduport- LMS, Education and Course Theme">


    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">

    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;700&amp;family=Roboto:wght@400;500;700&amp;display=swap">

    <!-- Plugins CSS -->
    <link rel="stylesheet" type="text/css" href="assets/vendor/font-awesome/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="assets/vendor/bootstrap-icons/bootstrap-icons.css">

    <!-- Theme CSS -->
    <link rel="stylesheet" type="text/css" href="assets/css/style-rtl.css">

</head>

<body>

<!-- **************** MAIN CONTENT START **************** -->
<main>
    <section class="p-0 d-flex align-items-center position-relative overflow-hidden">

        <div class="container-fluid">
            <div class="row">
                <!-- left -->
                <div class="col-12 col-lg-6 d-md-flex align-items-center justify-content-center bg-primary bg-opacity-10 vh-lg-100">
                    <div class="p-3 p-lg-5">
                        <!-- Title -->
                        <div class="text-center">
                            <h2 class="fw-bold">Welcome to our largest community</h2>
                            <p class="mb-0 h6 fw-light">Let's learn something new today!</p>
                        </div>
                        <!-- SVG Image -->
                        <img src="assets/images/element/02.svg" class="mt-5" alt="">
                        <!-- Info -->
                        <div class="d-sm-flex mt-5 align-items-center justify-content-center">
                            <!-- Avatar group -->
                            <ul class="avatar-group mb-2 mb-sm-0">
                                <li class="avatar avatar-sm">
                                    <img class="avatar-img rounded-circle" src="assets/images/avatar/01.jpg" alt="avatar">
                                </li>
                                <li class="avatar avatar-sm">
                                    <img class="avatar-img rounded-circle" src="assets/images/avatar/02.jpg" alt="avatar">
                                </li>
                                <li class="avatar avatar-sm">
                                    <img class="avatar-img rounded-circle" src="assets/images/avatar/03.jpg" alt="avatar">
                                </li>
                                <li class="avatar avatar-sm">
                                    <img class="avatar-img rounded-circle" src="assets/images/avatar/04.jpg" alt="avatar">
                                </li>
                            </ul>
                            <!-- Content -->
                            <p class="mb-0 h6 fw-light ms-0 ms-sm-3">4k+ Students joined us, now it's your turn.</p>
                        </div>
                    </div>
                </div>

                <!-- Right -->
                <div class="col-12 col-lg-6 m-auto">
                    <div class="row my-5">
                        <div class="col-sm-10 col-xl-8 m-auto">
                            <!-- Title -->
                            <span class="mb-0 fs-1 d-flex flex-column justify-content-center align-items-center">👋</span>
                            <h1 class="fs-2 d-flex flex-column justify-content-center align-items-center">Login into Eduport!</h1>
                            <p class="lead mb-4">Nice to see you! Please log in with your account.</p>

                            <!-- Form START -->
                            <form action="LoginServlet" method="post">
                                <!-- Email -->
                                <div class="mb-4">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="bi bi-envelope-fill"></i></span>
                                        <input type="email" class="form-control border-0 bg-light rounded-end ps-1" name="email" placeholder="E-mail" id="exampleInputEmail1">
                                    </div>
                                </div>
                                <!-- Password -->
                                <div class="mb-4">
                                    <label for="inputPassword5" class="form-label">Password</label>
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
                                        <input type="password" class="form-control border-0 bg-light rounded-end ps-1" name="pass" placeholder="password" id="inputPassword5">
                                    </div>
                                    <div id="passwordHelpBlock" class="form-text">
                                        Your password must be 8 characters at least
                                    </div>
                                </div>
                                <!-- Check box -->
                                <div class="mb-4 d-flex justify-content-between">
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Remember me</label>
                                    </div>
                                    <div class="text-primary-hover">
                                        <a href="forgot-password.html" class="text-secondary">
                                            <u>Forgot password?</u>
                                        </a>
                                    </div>
                                </div>
                                <!-- Button -->
                                <div class="align-items-center mt-0">
                                    <div class="d-grid">
                                        <button class="btn btn-primary mb-0" type="submit">Login</button>
                                    </div>
                                </div>
                            </form>
                            <!-- Form END -->

                            <!-- Sign up link -->
                            <div class="mt-4 text-center">
                                <span>Don't have an account? <a href="RegistrationPage.jsp">Signup here</a></span>
                            </div>
                        </div>
                    </div> <!-- Row END -->
                </div>
            </div> <!-- Row END -->
        </div>
    </section>
</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Template Functions -->
<script src="assets/js/functions.js"></script>

</body>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 5000,
            timerProgressBar: true,
            didOpen: (toast) => {
                toast.addEventListener('mouseenter', Swal.stopTimer);
                toast.addEventListener('mouseleave', Swal.resumeTimer);
            }
        });

        // Check for URL parameter indicating success (e.g., ?success=true)
        const urlParams = new URLSearchParams(window.location.search);
        const successParam = urlParams.get('s');

        if (successParam && successParam === 'r') {
            // Display success toast
            Toast.fire({
                icon: 'success',
                title: 'Registration successfully!'
            });
            urlParams.delete('s');
            const newUrl = `./Login.jsp`;
            window.history.replaceState({}, document.title, newUrl);

        }

        if (successParam && successParam === 'nl') {
            // Display success toast
            Swal.fire({
                icon: "error",
                title: "Oops...",
                text: "Invalid Credentials!"
            });
            urlParams.delete('s');
            const newUrl = `./Login.jsp`;
            window.history.replaceState({}, document.title, newUrl);
        }
    });


</script>

<!-- Mirrored from eduport.webestica.com/rtl/sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 May 2024 02:02:44 GMT -->
</html>