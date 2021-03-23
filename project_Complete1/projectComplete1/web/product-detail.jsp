<%-- 
    Document   : product-detail
    Created on : Mar 16, 2021, 4:41:23 PM
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
<%@page import="models.item"%>
<%@page import="DAO.itemDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Products</title>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />

    </head>
    <body>
        <% item item = itemDAO.getItemById(Integer.parseInt(request.getParameter("itemID")));%>
        <style>
            .btn{
                margin: 10px 0;
            }
        </style>
        <div class="header">
            <div class="container">
                <div class="navbar" id="mynavbar">
                    <div class="logo">
                        <a href="<%=getServletContext().getContextPath()%>/customer/home"><img src="../images/logo.png" width="225px"></a>
                    </div>
                    <nav>
                        <a href="/chat-history.jsp" class="btn" type="button" name="accept" style="padding:10px; background: #e58679"><i class="fa fa-weixin" aria-hidden="true"></i></a>
                        <ul id="MenuItems">
                            <li><div class="dropdown">
                                    <button class="dropbtn">Category</button>
                                    <div class="dropdown-content">
                                        <c:forEach var="category" items="${rs.rows}" >
                                            <a href="<%= getServletContext().getContextPath()%>/customer/search?category=${category.catName}" ><c:out value="${category.catName}" /></a>
                                        </c:forEach>
                                    </div>
                                </div> 
                            </li>  
                            <li><a href="<%=getServletContext().getContextPath()%>/customer/home">Home</a></li>

                            <li><a href="/Profile/<%=(String) session.getAttribute("IDcard")%>">Account</a></li>

                        </ul>
                    </nav>
                    <img src="../images/cart.png" width="30px" height="30px">
                    <% ResultSet resultset = DAO.DealingListDAO.getReciever(); %>
                    <% while (resultset.next()) {
                            if (resultset.getString("reciever").equals(session.getAttribute("IDcard"))) {%>
                    <a href="<%= getServletContext().getContextPath()%>/customer/notiDeal"><img src="../images/cart2.png" width="30px" height="30px"></a>

                    <% break;
                            }
                        }%>

                    <img src="../images/menu.png" class="menu-icon"
                         onclick="menutoggle()">
                </div>
                <%--<%@include file="navigate.jsp" %>--%>

            </div>
        </div>

        <!--single product details-->
        <div class="small-container single-product">
            <div class="row">
                <div class="col-2">
                    <img src="data:image/jpg;base64,<%= itemDAO.getImageString(item.getImage1())%>" width="100%" id="productImg">
                    <div class="small-img-row ">

                        <div class="small-img-col">
                            <img src="data:image/jpg;base64,<%= itemDAO.getImageString(item.getImage1())%>" width="100%" class="small-img">
                        </div>
                        <div class="small-img-col">
                            <img src="data:image/jpg;base64,<%= itemDAO.getImageString(item.getImage2())%>" width="100%" class="small-img">
                        </div>
                        <div class="small-img-col">
                            <img src="data:image/jpg;base64,<%= itemDAO.getImageString(item.getImage3())%>" width="100%" class="small-img">
                        </div>
                        <div class="small-img-col">
                            <img src="data:image/jpg;base64,<%= itemDAO.getImageString(item.getImage4())%>" width="100%" class="small-img">
                        </div>
                    </div>
                </div>
                <div class="col-2">
                    <h4><%= item.getName()%></h4><br>


                    <a href="<%=getServletContext().getContextPath()%>/Chat/<%=item.getOwnerID()%>" class="btn">Chat with owner</a> <!-- nhảy qua chat -->
                    <a href="<%=getServletContext().getContextPath()%>/Profile/<%=item.getOwnerID()%>" class="btn">User profile</a>
                    <a href="<%= getServletContext().getContextPath()%>/customer/sendDeal?itemID=<%= item.getItemID()%>" class="btn"><strong>Status:</strong> Waiting<br>Click to begin dealing</a> <!--chuyển đổi status món hàng -->

                    <br>
                    <!--Description-->
                    <strong>Description: </strong><br>

                    <p><%= item.getDescription()%></p>


                </div>
                <!--title-->
                <div class="small-container">
                    <div class="row row-2">
                        <h2>Related Products</h2>   
                    </div>
                </div>
                <div class="small-container">

                    <div class="row">
                        <% ResultSet rs = itemDAO.getItemByCategory(item.getCategory()); %>
                        <% int flag = 1; %>
                        <% while (flag <= 4 && rs.next()) {%>
                        <% if (rs.getInt("itemID") != item.getItemID() && rs.getInt("status") != 1) {%>
                        <div class="col-4">
                            <a href="<%= getServletContext().getContextPath()%>/customer/viewProduct?itemID=<%= rs.getInt("itemID")%>"><img src="data:image/jpg;base64,<%= itemDAO.getImageString(rs.getBlob("image1"))%>"></a>
                            <a href="<%= getServletContext().getContextPath()%>/customer/viewProduct?itemID=<%= rs.getInt("itemID")%>"><h4><%= rs.getString("Name")%></h4></a>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>

                            </div>
                            <p>Waiting</p> 
                        </div>               
                        <% flag++;
                                }
                            }%>
                    </div>

                </div>
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
                            <li><a href="aboutUs.jsp" style="color:white;">About us</a></li>
                        </ul>
                    </div>
                    <div class="footer-col-3">
                        <h3>Follow us</h3>
                        <ul>
                            <a href="https://www.facebook.com/"><li>Facebook</li></a>
                            <a href="https://www.youtube.com/"><li>YouTube</li></a>
                        </ul>
                    </div>
                </div>
                <hr>
                <p class="copyright">Copyright 2021</p>
            </div>
        </div>
        <!--JS For toggle menu-->
        <script>
            var MenuItems = document.getElementById('MenuItems');
            var x = document.getElementById("mynavbar");
            MenuItems.style.maxHeight = "0px";
            function menutoggle() {
                if (MenuItems.style.maxHeight == "0px" && x.className === "navbar") {
                    MenuItems.style.maxHeight = "700px";
                    x.className += " responsive";
                } else {
                    MenuItems.style.maxHeight = "0px";
                    x.className = "topnav";
                }
            }
        </script>
        <script>
            var productImg = document.getElementById('productImg');
            var smallImg = document.getElementsByClassName('small-img')
            smallImg[0].onclick = function () {
                productImg.src = smallImg[0].src;
            }
            smallImg[1].onclick = function () {
                productImg.src = smallImg[1].src;
            }
            smallImg[2].onclick = function () {
                productImg.src = smallImg[2].src;
            }
            smallImg[3].onclick = function () {
                productImg.src = smallImg[3].src;
            }
        </script>
    </body>
</html>
