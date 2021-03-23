<%-- 
    Document   : chat
    Created on : Mar 15, 2021, 9:43:15 PM
    Author     : Asus Vivobook
--%>

<%@page import="DAO.customerDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Messenger</title>
        <link rel="preconnect" href="https://fonts.gstatic.com">

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            <%@include file="css/style.css" %>
        </style>

        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/navbars/">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    </head>
    <body>
        <style>
            /* Chat containers */
            .container {
                border: 2px solid #dedede;
                background-color: #f1f1f1;
                border-radius: 5px;
                padding: 10px;
                margin: 10px 0;
                max-width: 100%
            }

            /* Darker chat container */
            .darker {
                border-color: #ccc;
                background-color: #ddd;
            }

            /* Clear floats */
            .container::after {
                content: "";
                clear: both;
                display: table;
            }

            /* Style images */
            .container img {
                float: left;
                max-width: 60px;
                width: 100%;
                margin-right: 20px;
                border-radius: 50%;
            }

            /* Style the right image */
            .container img.right {
                float: right;
                margin-left: 20px;
                margin-right:0;
            }

            /* Style time text */
            .time-right {
                float: right;
                color: #aaa;
            }

            /* Style time text */
            .time-left {
                float: left;
                color: #999;
            }
            .type_msg {border-top: 1px solid #c4c4c4;position: relative;}

            .input_msg_write input {
                background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
                border: 2px solid black;
                color: #4c4c4c;
                font-size: 25px;
                min-height: 100px;
                /*width: 100%;*/
            }

        </style>
        <div class="header">
            <%@include file="navigate.jsp" %>
        </div>
        <%
            ResultSet content = (ResultSet) session.getAttribute("content");
            // String sendFrom = (String) content.getString("sendFrom");
            String idCard = (String) session.getAttribute("IDcard");

        %>
        <%            while (content.next()) {
                String sendFrom = (String) content.getString("sendFrom");
                if ((sendFrom).equals(idCard)) {
        %>
        <div class="container darker">
            <p style="text-align:right"><%= content.getString("content")%></p>
            <span class="time-right"><%= content.getString("timeSendChat")%></span>
        </div>

        <%} else {%>
        <div class="container">
            <p><%=customerDAO.getName(sendFrom)%>: <%= content.getString("content")%> </p>
            <span class="time-left"><%= content.getString("timeSendChat")%> </span>
        </div>
        <%}%>
        <%}%>


        <form action="<%= getServletContext().getContextPath()%>/Chat" method="post">
            <div class="type_msg">
                <div class="input_msg_write">
                    <input type="text" class="write_msg" placeholder="Type a message" name="txtChat" style="width:85%;" />

                    <input type="submit" name="btnNewChat" class="w3-button w3-blue w3-round-small" value="Send" style="width:10%;height: 10%;float: right; border-radius: 10px;">
                </div>
            </div>
        </form>

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
