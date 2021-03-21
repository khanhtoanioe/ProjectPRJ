<%-- 
    Document   : mainPage
    Created on : Mar 13, 2021, 9:40:55 AM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.itemDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/group_assignment" user="root"  password=""/> 
<sql:query dataSource="${db}" var="rs" >
    SELECT catName FROM `category`;
</sql:query>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Page</title>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/navbars/">
        <style>
            <%@ include file="css/style.css" %>
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
                        <a href="chat-history.jsp" class="btn" type="button" name="accept" style="padding:10px; background: #e58679"><i class="fa fa-weixin" aria-hidden="true"></i></a>
                        <ul id="MenuItems">
                            <li><div class="dropdown">
                                    <button class="dropbtn">Category</button>
                                    <div class="dropdown-content">
                                        <c:forEach var="category" items="${rs.rows}" >
                                            <a href="" ><c:out value="${category.catName}" /></a>
                                        </c:forEach>
                                        <a href="#">Electronic</a>
                                    </div>
                                </div> 
                            </li>  
                            <li><a href="homePage.html">Home</a></li>
                            <li><a href="products.html">Products</a></li>
                            <li><a href="/Profile/<%=(String) session.getAttribute("IDcard")%>">Account</a></li>
                            <li><a href="compad.html">Login/Register</a></li>        
                        </ul>
                    </nav>
                    <a href="cart.html"><img src="../images/cart.png" width="30px" height="30px"></a>
                        <% ResultSet resultset = DAO.DealingListDAO.getReciever(); %>
                        <% while (resultset.next()) {
                                if (resultset.getString("reciever").equals(session.getAttribute("IDcard"))) {%>
                    <a href="<%= getServletContext().getContextPath()%>/customer/notiDeal"><img src="../images/cart2.png" width="30px" height="30px"></a>

                    <% break;
                            }
                        } %>

                    <img src="../images/menu.png" class="menu-icon"
                         onclick="menutoggle()">
                </div>

                <div class="row">
                    <div class="col-2" >
                        <h1>Trao đổi<br>Hàng hóa!</h1>
                        <p>Bạn đang có một món nào đó nhưng vì một lí do nào đó mà mình không dùng đến? Hãy đăng lên Mitto và gợi ý một sản phẩm mà mình muốn trao đổi.<br>Bạn sẽ có cơ hội giao lưu sản phẩm với nhừng người có cùng sở thích.</p>
                        <a href="${pageContext.request.contextPath}/customer/uploadItem" class="btn">Bắt đầu ngay &#8594;</a>
                    </div>
                    <div class="col-2" >
                        <img src="../images/front-page.png" alt="" width="555px" height="600px" >
                    </div>

                </div>
            </div>
        </div>

        <div class="small-container">
            <div>
                <h2 class="title">Top categories</h2>
                <% if (request.getAttribute("category") == null) { %>
                <div class="row">
                    <% ResultSet rs = itemDAO.getAllItem();%>
                    <% while (rs.next()) { %>
                    <% if (!rs.getString("ownerID").equals(session.getAttribute("IDcard")) && rs.getInt("status") != 1) {%>
                    <div class="col-4"   >
                        <a href="<%= getServletContext().getContextPath()%>/customer/viewProduct?itemID=<%= rs.getInt("itemID")%>">
                            <img src="data:image/jpg;base64,<%= itemDAO.getImageString(rs.getBlob("image1"))%>"></a>
                        <a href="<%= getServletContext().getContextPath()%>/customer/viewProduct?itemID=<%= rs.getInt("itemID")%>"><strong><%= rs.getNString("name")%></strong></a><br>
                    </div>
                    <% } %>
                    <% }%>
                </div>
                <% } %>
                <% if (request.getAttribute("category") == null) { %>
                <div class="row">
                    <% ResultSet rs = itemDAO.getAllItem();%>
                    <% while (rs.next()) { %>
                    <% if (!rs.getString("ownerID").equals(session.getAttribute("IDcard")) && rs.getInt("status") != 1 && rs.getString("category").equals(request.getAttribute("category"))) {%>
                    <div class="col-4"   >
                        <a href="<%= getServletContext().getContextPath()%>/customer/viewProduct?itemID=<%= rs.getInt("itemID")%>">
                            <img src="data:image/jpg;base64,<%= itemDAO.getImageString(rs.getBlob("image1"))%>"></a>
                        <a href="<%= getServletContext().getContextPath()%>/customer/viewProduct?itemID=<%= rs.getInt("itemID")%>"><strong><%= rs.getNString("name")%></strong></a><br>
                    </div>
                    <% } %>
                    <% }%>
                </div>
                <% }%>

                <h2 class="title">New item</h2>
                <div class="row">
                    <div class="col-4">
                        <a href="product-details.html"><img src="../images/adidas.jpg"></a>
                        <a href="product-details.html"><strong>Adidas shoes Size: 41
                            </strong></a><br>
                        <a href="product-details.html"><h4>Swap: Nike shoes Size: 39</h4></a>

                        <p>Waiting</p>
                    </div>
                    <div class="col-4">
                        <img src="../images/airpod.jpg">
                        <a href="products-details.html"><strong>Apple Airpod 2
                            </strong></a><br>
                        <a href="products-details.html"><h4>Swap: Apple Airpod 3</h4></a>

                        <p>DONE</p>
                    </div>
                    <div class="col-4">
                        <img src="../images/headphone.jpg">
                        <a href="products-details.html"><strong>Sony headphone
                            </strong></a><br>
                        <a href="products-details.html"><h4>Swap: And other headphone</h4></a>

                        <p>Waiting</p>
                    </div>
                    <div class="col-4">
                        <img src="../images/levi-jean.jpg">
                        <a href="products-details.html"><strong>LEVI Jeans
                            </strong></a><br>
                        <a href="products-details.html"><h4>Swap: Other brand jean</h4></a>
                        <p>Waiting</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4">
                        <img src="../images/nike.jpg">
                        <a href="products-details.html"><strong>Nike shoes Size: 39
                            </strong></a><br>
                        <a href="products-details.html"><h4>Swap: Nike shoes Size: 41</h4></a>
                        <p>Waiting</p>
                    </div>
                    <div class="col-4">
                        <img src="../images/pepsi.jpg">
                        <a href="products-details.html"><strong>Pepsi, 355mL Cans, 24 Pack
                            </strong></a><br>
                        <a href="products-details.html"><h4>Swap: COCA COLA</h4></a>

                        <p>Waiting</p>
                    </div>
                    <div class="col-4">
                        <img src="../images/samsung-a12.jpg">
                        <a href="products-details.html"><strong>BLUE SamSung A12 2020
                            </strong></a><br>
                        <a href="products-details.html"><h4>BLACK SamSung A12 2020</h4></a>

                        <p>Waiting</p>
                    </div>
                    <div class="col-4">
                        <img src="../images/book.jpg">
                        <a href="products-details.html"><strong>I Am Gifted, So Are You!
                            </strong></a><br>
                        <a href="products-details.html"><h4>Swap: Any kind of book</h4></a>
                        <p>Waiting</p>
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
