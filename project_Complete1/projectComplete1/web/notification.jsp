<%-- 
    Document   : notification
    Created on : Mar 19, 2021, 7:16:56 PM
    Author     : Asus Vivobook
--%>

<%@page import="DAO.customerDAO"%>
<%@page import="models.item"%>
<%@page import="DAO.itemDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Notification</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Notification</title>


        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="../css/style.css">
        <style type="text/css">
            .btn-success{
                color: #fff;
                background-color: #198754;
                border-color: #198754;
            }
            .btn-danger{
                color: #fff;
                background-color: #dc3545;
                border-color: #dc3545;
            }
        </style>
    </head>
    <body>

        <div class="header">
            <div class="container">
                <%@include file="navigate.jsp" %>
            </div>
        </div>




        <div class="row">
            <div>
                <h6 class="text-muted">Notification</h6>

                <ul class="list-group">
                    <!-- Row 1 -->
                    <% ResultSet rs = DAO.DealingListDAO.getDealByReciever(session.getAttribute("IDcard").toString()); %>
                    <% while (rs.next()) { %>
                    <% item senderItem = itemDAO.getItemById(rs.getInt("senderItem"));%>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <div>  <a href="<%= getServletContext().getContextPath()%>/Profile/<%= senderItem.getOwnerID()%>" style="color: #0c63e4"> <%= customerDAO.getCustomerByID(senderItem.getOwnerID()).getName()%>  </a> with item </div>
                        <a style="color: #0c63e4" href="<%= getServletContext().getContextPath()%>/customer/viewProduct?itemID=<%= senderItem.getItemID()%>"><%= senderItem.getName()%></a>
                        <div class="image-parent">
                            <img src="data:image/jpg;base64,<%= DAO.itemDAO.getImageString(senderItem.getImage1())%>" class="img-thumbnail" width="100px">
                        </div>
                        <div>
                            WANT TO TRADE WITH YOUR <br>
                            <%= itemDAO.getItemById(rs.getInt("recieverItem")).getName()%>
                        </div>
                        <div>
                            <a href="<%= getServletContext().getContextPath()%>/customer/RejectDeal?senderItem=<%= rs.getInt("senderItem")%>&recieverItem=<%= rs.getInt("recieverItem")%>"><button class="btn btn-danger" type="submit" name="reject">Reject</button></a>
                            <a href="<%= getServletContext().getContextPath()%>/customer/AcceptDeal?senderItem=<%= rs.getInt("senderItem")%>&recieverItem=<%= rs.getInt("recieverItem")%>"><button class="btn btn-success" type="submit" name="accept">Accept</button></a>
                        </div>
                    </li>
                    <%}%>
                </ul>
            </div>
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
