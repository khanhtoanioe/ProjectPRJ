<%-- 
    Document   : chat-history
    Created on : Mar 20, 2021, 8:45:34 PM
    Author     : Asus Vivobook
--%>

<%@page import="DAO.customerDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.ChatSessionDetailDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
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


            h4 {
                margin: 2rem 0rem 1rem;
            }

            /*      .table-image {
                      td, th {
                        vertical-align: middle;
                    }
                    }*/
            .table td {
                text-align: center;   
            }
        </style>
    </head>
    <body>

        <div class="header">
            <div class="container">

                <div class="navbar" id="mynavbar">
                    <div class="logo">
                        <a href="homePage.html"><img src="../images/logo.png" width="225px"></a>
                    </div>
                    <nav>
                        <!--Button to chat page-->
                        <a class="btn" type="button" name="accept" style="padding:10px; background: #e58679"><i class="fa fa-weixin" aria-hidden="true"></i></a>
                        <ul id="MenuItems">
                            <li><div class="dropdown">
                                    <button class="dropbtn">Category</button>
                                    <div class="dropdown-content">
                                        <a href="#">Electronic</a>
                                        <a href="#">Computer 2</a>
                                        <a href="#">Women's Fashion</a>
                                        <a href="#">Men's Fashion</a>
                                        <a href="#">Baby</a>
                                        <a href="#">Toys and Games</a>
                                        <a href="#">Tool</a>
                                        <a href="#">Sport and Outdoor</a>
                                        <a href="#">Home and Kitchen</a>
                                        <a href="#">Health and Household</a>
                                        <a href="#">Beauty and personal care</a>
                                    </div>
                                </div> 
                            </li>  
                            <li><a href="homePage.html">Home</a></li>
                            <li><a href="products.html">Products</a></li>
                            <li><a href="account.html">Account</a></li>        
                        </ul>
                    </nav>
                    <a href="#"><img src="../images/cart.png" width="30px" height="30px"></a>
                    <a href="#"><img src="../images/cart2.png" width="30px" height="30px"></a>
                    <img src="../images/menu.png" class="menu-icon"
                         onclick="menutoggle()">
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <h6 class="text-muted">Notification</h6>

                <ul class="list-group">

                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <div>Message</div>
                        <div>From</div>
                        <div>Time</div>
                        <div>Content</div> 
                        <div>Action</div>
                    </li>
                    <%
                        String IDCard = (String) session.getAttribute("IDcard");
                        ResultSet rs = ChatSessionDetailDAO.getChatBox(IDCard);
                        while (rs.next()) {
                    %>
                    <!-- Row 1 -->
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <%
                            ResultSet rsChat = ChatSessionDetailDAO.getContentPerBox(rs.getString("sessionID"));
                        %>
                        <!--nếu ID card của session bằng với idcard1 thì cho hiện lên idcard 2 (hiện tên người mình nhắn) -->
                        <div><strong><%if (IDCard.equals(rs.getString("IDCard1"))) {%>
                                <%=customerDAO.getName(rs.getString("IDCard2"))%>
                                <%} else {%>
                                <%=customerDAO.getName(rs.getString("IDCard1"))%>
                                <%}%>
                            </strong>
                        </div>
                        <div>
                            <%if (rsChat.getString("sendFrom").equals(IDCard)) {%>
                            You
                            <%} else {%>
                            <%=customerDAO.getName(rsChat.getString("sendFrom"))%>
                            <%}%>
                        </div>
                        <div><%=rsChat.getString("timeSendChat")%></div>
                        <div><%=rsChat.getString("content")%></div> 
                        <div>
                            <a href="/Chat/<%if(IDCard.equals(rs.getString("IDCard1"))){%>
                               <%=rs.getString("IDCard2")%>
                               <%} else {%>
                               <%=rs.getString("IDCard1")%>
                               <%}%>" class="btn btn-success" type="submit" name="accept"><i class="fa fa-arrow-right" aria-hidden="true"></i> Chat now</a>
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
                            <li>Coupons</li>
                            <li>Blog Post</li>
                            <li>Return Policy</li>
                            <li>Join Affiliate</li>
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