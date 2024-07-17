<%--
  Created by IntelliJ IDEA.
  User: shivp
  Date: 06-07-2024
  Time: 08:52 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" >

<!-- Mirrored from eduport.webestica.com/rtl/sign-up.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 May 2024 02:02:44 GMT -->
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
                <div class="col-12 col-lg-5 d-md-flex align-items-center justify-content-center bg-primary bg-opacity-10 vh-lg-100">
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
                            <ul class="avatar-group mb-2 mb-sm-0">
                                <li class="avatar avatar-sm"><img class="avatar-img rounded-circle" src="assets/images/avatar/01.jpg" alt="avatar"></li>
                                <li class="avatar avatar-sm"><img class="avatar-img rounded-circle" src="assets/images/avatar/02.jpg" alt="avatar"></li>
                                <li class="avatar avatar-sm"><img class="avatar-img rounded-circle" src="assets/images/avatar/03.jpg" alt="avatar"></li>
                                <li class="avatar avatar-sm"><img class="avatar-img rounded-circle" src="assets/images/avatar/04.jpg" alt="avatar"></li>
                            </ul>
                            <!-- Content -->
                            <p class="mb-0 h6 fw-light ms-0 ms-sm-3">4k+ Students joined us, now it's your turn.</p>
                        </div>
                    </div>
                </div>

                <!-- Right -->
                <div class="col-12 col-lg-7 px-5">
                    <!-- <div class="row"> -->
                    <!-- <div class="col-sm-10 col-xl-8"> -->
                    <!-- Title -->
                    <div class="d-flex flex-column justify-content-center align-items-center mt-3">
                        <img src="assets/images/element/03.svg" class="h-40px mb-2" alt="">
                        <h4>Sign up for your account!</h4>
                    </div>

                    <!-- Form START -->

                    <form action="RegistrationServlet" id="signupForm" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <!-- Left Column -->
                            <div class="col-md-6">
                                <!-- First Name -->
                                <div class="mb-4">
                                    <label for="firstName" class="form-label">First Name</label>
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="bi bi-person-fill"></i></span>
                                        <input type="text" class="form-control border-0 bg-light rounded-end ps-1" placeholder="First Name" id="firstName" name="fname" required>
                                    </div>
                                </div>
                                <!-- Email -->
                                <div class="mb-4">
                                    <label for="email" class="form-label">Email address</label>
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="bi bi-envelope-fill"></i></span>
                                        <input type="email" class="form-control border-0 bg-light rounded-end ps-1" placeholder="E-mail" id="email" name="email" required>
                                    </div>
                                </div>
                                <!-- Gender -->
                                <div class="mb-4">
                                    <label for="gender" class="form-label">Gender</label>
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="bi bi-gender-ambiguous"></i></span>
                                        <select class="form-control border-0 bg-light rounded-end ps-1" id="gender" name="gender" required>
                                            <option value="" disabled selected>Select Gender</option>
                                            <option value="male">Male</option>
                                            <option value="female">Female</option>
                                            <option value="other">Other</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- Mobile Number -->
                                <div class="mb-4">
                                    <label for="mobileNumber" class="form-label">Mobile Number</label>
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-mobile-alt"></i></span>
                                        <input type="text" class="form-control border-0 bg-light rounded-end ps-1" name="mobile" placeholder="Mobile Number" id="mobileNumber"
                                               pattern="[0-9]{10}" required>
                                        <div class="invalid-feedback">
                                            Mobile number must be exactly 10 digits.
                                        </div>
                                        <div class="valid-feedback">
                                            Looks good!
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Right Column -->
                            <div class="col-md-6">
                                <!-- Last Name -->
                                <div class="mb-4">
                                    <label for="lastName" class="form-label">Last Name</label>
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="bi bi-person-fill"></i></span>
                                        <input type="text" class="form-control border-0 bg-light rounded-end ps-1" placeholder="Last Name" id="lastName" name="lname" required>
                                    </div>
                                </div>
                                <!-- Qualification -->
                                <div class="mb-4">
                                    <label for="qualification" class="form-label">Qualification</label>
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="bi bi-book-half"></i></span>
                                        <input type="text" class="form-control border-0 bg-light rounded-end ps-1" placeholder="Qualification" name="qualification" id="qualification" required>
                                    </div>
                                </div>
                                <!-- Date of Birth -->
                                <div class="mb-4">
                                    <label for="dob" class="form-label">Date of Birth</label>
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="bi bi-body-text"></i></span>
                                        <input type="date" class="form-control border-0 bg-light rounded-end ps-1" name="dob" id="dob" required>
                                    </div>
                                </div>
                                <!-- Confirm Password -->
                                <div class="mb-4">
                                    <label for="confirmPassword" class="form-label">Password</label>
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
                                        <input type="password" class="form-control border-0 bg-light rounded-end ps-1" name="pass" placeholder="*********" id="confirmPassword" required>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="mb-4">
                            <div class="input-group input-group-lg">
                                <span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-file-image"></i></span>
                                <input type="file" class="form-control border-0 bg-light rounded-end ps-1" name="image" id="image" required>
                            </div>
                        </div>

                        <!-- Button -->
                        <div class="align-items-center mt-0">
                            <div class="d-grid">
                                <button class="btn btn-primary mb-0" type="submit">Sign Up</button>
                            </div>
                        </div>
                    </form>

                    <!-- Form END -->


                    <!-- Sign up link -->
                    <div class="mt-3 text-center">
                        <span>Already have an account?<a href="Login.jsp"> Sign in here</a></span>
                    </div>
                </div>
                <!-- </div> -->
                <!-- </div> -->
            </div>
        </div>
    </section>
</main>
<!-- **************** MAIN CONTENT END **************** -->

<script>
    document.getElementById('signupForm').addEventListener('submit', function(event) {
        // Mobile Number Validation
        const mobileNumber = document.getElementById('mobileNumber').value;
        const mobilePattern = /^[0-9]{10}$/;
        const mobileNumberInput = document.getElementById('mobileNumber');

        if (!mobilePattern.test(mobileNumber)) {
            mobileNumberInput.setCustomValidity('Mobile number must be exactly 10 digits.');
        } else {
            mobileNumberInput.setCustomValidity('');
        }

        // Check form validity
        if (!this.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
        }

        this.classList.add('was-validated');
    });
</script>


<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Template Functions -->
<script src="assets/js/functions.js"></script>

</body>

<script>

    const urlParams = new URLSearchParams(window.location.search);
    const successParam = urlParams.get('s');

    if (successParam && successParam === 'nr') {
        // Display success toast
        Swal.fire({
            icon: "error",
            title: "Oops...",
            text: "Registration Failed!"
        });
        urlParams.delete('s');
        const newUrl = `./RegistrationPage.jsp`;
        window.history.replaceState({}, document.title, newUrl);
    }
</script>

<!-- Mirrored from eduport.webestica.com/rtl/sign-up.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 May 2024 02:02:44 GMT -->
</html>
