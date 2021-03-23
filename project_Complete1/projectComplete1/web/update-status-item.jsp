<%-- 
    Document   : update-status-item
    Created on : Mar 17, 2021, 9:56:32 PM
    Author     : Asus Vivobook
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.itemDAO"%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/group_assignment" user="root"  password=""/> 
<sql:query dataSource="${db}" var="rs" >
    SELECT catName FROM `category`;
</sql:query>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Item Status</title>


        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="../css/style.css">
        <style type="text/css">
            #btnClear{
                display: inline-block;
                width: 20%;
            }
        </style>


    </head>
    <body>

        <div class="header">
            <div class="container">
<%@include file="navigate.jsp" %>
            </div>
        </div>

        <div class="container">
            <form method="" action="">

                <!-- Trader name -->
                <div class="mb-3">
                    <label for="trader-name" class="form-label">Trader name</label>
                    <input type="text" class="form-control" id="trader-name">
                    <div id="trader-name" class="form-text">This is the person that want to trade with you.</div>
                </div>

                <!-- Item name -->
                <div class="mb-3">
                    <label for="item-name" class="form-label">Item name</label>
                    <input type="text" class="form-control" id="item-name">
                </div>

                <!-- Waiting radio -->
                <div class="form-check">
                    <input class="form-check-input" checked="" type="radio" id="flexRadioDefault1" name="status">
                    <label class="form-check-label" for="flexRadioDefault1">Waiting</label>
                </div>

                <!-- Dealing radio -->
                <div class="form-check">
                    <input class="form-check-input" type="radio" id="flexRadioDefault2" name="status">
                    <label class="form-check-label" for="flexRadioDefault2">Dealing</label>
                </div>

                <!-- Done raio -->
                <div class="form-check">
                    <input class="form-check-input" type="radio" id="flexRadioDefault2" name="status">
                    <label class="form-check-label" for="flexRadioDefault2">Done</label>
                </div>

                <!-- 2 button -->
                <button id="btnClear" type="submit" class="btn btn-primary btn-md center-block"><i class="fa fa-times-circle-o" aria-hidden="true"></i>  Decline This Deal</button>
                <button id="btnClear" type="submit" class="btn btn-primary btn-md center-block"><i class="fa fa-check-square" aria-hidden="true"></i>  Accept This Deal</button>

            </form>
        </div>


        <!--footer-->
        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="footer-col-1">
                        <img src="../images/logo.png">
                        <p>Our Purpose Is To Sustainably Make the Pleasure and
                            Benefits of Sports Accessible to the Many.</p>
                    </div>
                    <div class="footer-col-2">
                        <h3>Useful links</h3>
                        <ul>
                            <li><a href="/aboutUs.jsp" style="color:white;">About us</a></li>
                        </ul>
                    </div>
                    <div class="footer-col-3">
                        <h3>Follow us</h3>
                        <ul>
                            <li><a href="https://www.facebook.com/">Facebook</a></li>
                            <li><a href="https://www.youtube.com/">YouTube</a></li>
                        </ul>
                    </div>
                </div>
                <hr>
                <p class="copyright">Copyright 2021</p>
            </div>
        </div>
        <script>
            var MenuItems = document.getElementById('MenuItems');
            MenuItems.style.maxHeight = "0px";
            function menutoggle() {
                if (MenuItems.style.maxHeight == "0px") {
                    MenuItems.style.maxHeight = "500px";
                } else {
                    MenuItems.style.maxHeight = "0px";
                }
            }
        </script>

    </body>
</html>