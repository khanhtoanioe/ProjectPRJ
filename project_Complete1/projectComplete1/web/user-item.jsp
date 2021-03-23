<%-- 
    Document   : user-item
    Created on : Mar 17, 2021, 8:35:25 PM
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
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User Item</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Item Manager</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="../css/style.css">

        <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">

        <script type="text/javascript">
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
        <style>
            td a {
                color: #fefefe;
                font-size: 15px;
            }
        </style>

    </head>
    <body>
        <div class="header">
            <div class="container">
                <%@include file="navigate.jsp" %>
            </div>
        </div>
        <%
            ResultSet userItem = (ResultSet) session.getAttribute("rsUserItem");
        %>
        <div class="container">
            <h2>Item manager</h2>
            <table id="example" class="display" style="width:100%">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Status</th>
                        <th>Category</th>
                        <th>Description</th>
                        <th>Option 1</th>
                        <th>Option 2</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        while (userItem.next()) {
                    %>
                    <tr>
                        <td><%=userItem.getInt("itemID")%></td>
                        <td><%=userItem.getString("Name")%></td>
                        <td><%=userItem.getInt("status")%></td>
                        <td><%=userItem.getString("category")%></td>
                        <td><%=userItem.getString("description")%></td>
                        <td><button class="btn"><a href="/Profile/<%=userItem.getInt("ownerID")%>/UserItem/<%=userItem.getInt("itemID"%>" onclick="return Confirm('Are you sure to delete <%=userItem.getString("Name")%> ?');">Delete</a></button></td>
                        <td><button class="btn"><a href="#">Edit</a></button></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
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
