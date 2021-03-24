<%-- 
    Document   : signUp
    Created on : Mar 14, 2021, 2:25:37 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>
        <!-- Link JS Bootstrap -->
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
        <!-- Link Bootstrap -->
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <!-- Link Jquery -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.slim.min.js">

        <!-- Link fontAwesome -->
        <link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

        <style>
            <%@include file="css/createaccount.css"%>
        </style>

        <script type="text/javascript">
            var check = function () {
                if (document.getElementById('password').value ==
                        document.getElementById('confirm_password').value) {
                    document.getElementById('message').style.color = 'green';
                    document.getElementById('message').innerHTML = 'matching';
                } else {
                    document.getElementById('message').style.color = 'red';
                    document.getElementById('message').innerHTML = 'not matching';
                }
            };
            $().ready(function () {
                $("#Form").validate({
                    rules: {
                        "IDcard": {
                            required: true,
                            maxlength: 12,
                            digits: true
                        },
                        "email": {
                            required: true,
                            email: true,
                        },
                        "name": {
                            required: true,
                            maxlength: 50
                        },
                        "dateOfBirth": {
                            required: true,
                        },
                        "phoneNumber": {
                            number: true,
                            minlength: 9,
                            maxlength: 13,
                            required: true
                        },
                        "passWord": {
                            required: true,
                            maxlength: 32
                        },
                        "address": {
                            required: true,
                            maxlength: 500
                        },
                        "passWordConfirm": {
                            required: true,
                            maxlength: 32,
                            equalTo: '#password'
                        }
                    },
                    messages: {
                        "IDcard": {
                            required: "ID card is required",
                            maxlength: 'ID card is too long',
                            digits: 'ID card must be digits'
                        },
                        "email": {
                            required: "Email address is required",
                            email: "Email address is invalid"
                        },
                        "name": {
                            required: "Full name is required",
                            maxlength: "full name is too long"
                        },
                        "dateOfBirth": {
                            required: "Date of Birth is required"
                        },
                        "phoneNumber": {
                            number: "Phone Number must be number",
                            minlength: "Phone Number is too short",
                            maxlength: "Phone Number is to long",
                            required: "Phone Number is required"
                        },
                        "address": {
                            required: "Address is required",
                            maxlength: "Address is to specific"
                        },
                        "passWord": {
                            required: "Password is required",
                            maxlength: "Password is too long"
                        },
                        "passWordConfirm": {
                            required: "Confirm password is required",
                            maxlength: "Confirm password is too long",
                            equalTo: "Confirm password is not match"
                        }
                    }
                });
            });

        </script>
        <style>
            .error{
                color:red;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-xl-9 mx-auto">
                    <div class="card card-signin flex-row my-5">
                        <div class="card-img-left d-none d-md-flex">
                            <!-- Background image for card set in CSS! -->

                        </div>
                        <div class="card-body">
                            <h5 class="card-title text-center">Register</h5>
                            <form class="form-signin" method="post" action="${pageContext.request.contextPath}/customer" id="Form">
                                <div class="form-label-group">
                                    <input type="text" id="IDcard" class="form-control" placeholder="Username" required autofocus name="IDcard">
                                    <label for="IDcard">ID card</label>
                                </div>

                                <div class="form-label-group">
                                    <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required name="email">
                                    <label for="inputEmail">Email address</label>
                                </div>

                                <div class="form-label-group">
                                    <input type="text" id="inputFullname" class="form-control" placeholder="Full name" required name="name">
                                    <label for="inputFullname">Full name</label>
                                </div>

                                <div class="form-label-group">
                                    <input type="date" id="inputDOB" class="form-control" placeholder="Date of Birth" required name="dateOfBirth">
                                    <label for="inputDOB">Date of Birth</label>
                                </div>

                                <div class="form-label-group">
                                    <input type="tel" id="inputPhone" class="form-control" placeholder="Phone number" required name="phoneNumber" pattern="0[0-9\s.-]{9,13}">
                                    <label for="inputPhone">Phone Number</label>
                                    <!-- Kiểm tra SDT: Tìm chuỗi bắt đầu bằng số 0, liên sau số 0 là một chuỗi các chữ số có thể có thêm dấu chấm (.) dấu gạch (-), khoảng trắng (\s) và chuỗi ký tự này dài từ 9 đến 13 ký tự. -->
                                </div>

                                <div class="form-label-group">
                                    <input type="text" class="form-control" name="address" id="address" placeholder="Address" >
                                    <label for="address">Address</label>
                                </div>

                                <hr>

                                <div class="form-label-group">
                                    <input type="password" id="password" class="form-control" placeholder="Password" required name="passWord"  onkeyup='check();'>
                                    <label for="password">Password</label>
                                </div>

                                <div class="form-label-group">
                                    <input type="password" id="confirm_password" class="form-control" placeholder="Password" required name="passWordConfirm" onkeyup='check();'>
                                    <label for="confirm_password">Confirm password</label>
                                    <span id='message'></span>
                                </div>

                                <button class="btn btn-lg btn-primary btn-block text-uppercase" name="btnSignUp" type="submit" id="btnSignUp">Register</button>

                                <a class="d-block text-center mt-2 small" href="${pageContext.request.contextPath}/">Sign In</a>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
