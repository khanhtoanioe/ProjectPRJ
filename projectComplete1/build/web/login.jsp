<%-- 
    Document   : login
    Created on : Mar 12, 2021, 6:59:32 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<%
    Cookie cookie = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("IDcard")) {
                response.sendRedirect(getServletContext().getContextPath() + "/customer?IDcard=" + cookies[i].getValue());
            }
        }
    }
%>


<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.79.0">
        <title>Signin</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>
        <!-- Bootstrap core CSS Offline-->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/signin.css" rel="stylesheet">
        <script type="text/javascript">
            $().ready(function () {
                $("#Form").validate({
                    rules: {
                        "IDcard": {
                            required: true,
                            maxlength: 12,
                            digits: true
                        },
                        "password": {
                            required: true,
                            maxlength: 32
                        }
                    },
                    messages: {
                        "IDcard": {
                            required: "User name is required",
                            maxlength: 'ID card is too long',
                            digits: 'ID card must be digits'
                        },
                        "password": {
                            required: "Password is required",
                            maxlength: "Password is too long"
                        }
                    }
                });
            });
        </script>
        <style>

            <%@ include file="css/bootstrap.min.css" %>
            <%@ include file="css/signin.css" %>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>



    </head>
    <body class="text-center">

        <main class="form-signin">
            <form id="Form" method="post" action="<%= getServletContext().getContextPath()%>/customer">
                <img class="mb-4" src="${pageContext.servletContext.contextPath}/images/signin.png" alt="logo image" width="300" height="100">
                <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
                <label for="username" class="visually-hidden">Email address</label>
                <input type="text" id="username" class="form-control" placeholder="Username" required autofocus name="IDcard">
                <label for="inputPassword" class="visually-hidden">Password</label>
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required name="password">
                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="remember-me" name="remember"> Remember me
                    </label>
                </div>
                <c:if test="${param.login != null}">
                    <h5 style="color:red;"> WRONG USERNAME OR PASSWORD </h5>
                </c:if>
                <div class="button">
                    <button class="w-100 btn btn-md btn-primary" type="submit" name="btnLogin">Sign in</button>
                </div>
            </form>

            <div class="button" style="margin-top: 10px">
                <a  href="<%= getServletContext().getContextPath()%>/customer/signUp"><button class="w-100 btn pull-right btn-md btn-primary">Create your account</button></a>
            </div>

            <p class="mt-5 mb-3 text-muted">&copy; 2021</p>

        </main>            
    </body>
</html>


