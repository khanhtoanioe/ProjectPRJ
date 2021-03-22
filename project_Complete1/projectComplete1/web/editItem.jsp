<%-- 
    Document   : uploadItem
    Created on : Mar 15, 2021, 9:05:13 AM
    Author     : Admin
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="javax.sql.rowset.serial.SerialBlob"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.itemDAO"%>
<%@page import="models.item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/group_assignment" user="root"  password=""/> 
<sql:query dataSource="${db}" var="rs" >
    SELECT catName FROM `category`;
</sql:query>
<html>
    <head>
        <title></title>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.slim.min.js">
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="preconnect" href="https://fonts.gstatic.com">

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/navbars/">

        <script type="text/javascript">
            $().ready(function () {
                $("#Form").validate({
                    rules: {
                        "image1": {
                            required: true,
                        },
                        "image2": {
                            required: true,
                        },
                        "image3": {
                            required: true,
                        },
                        "image4": {
                            required: true,
                        },
                        "name": {
                            required: true,
                            maxlength: 50
                        },
                        "description": {
                            required: true,
                            maxlength: 500
                        }
                    },
                    messages: {
                        "image1": {
                            required: "You must upload 4 pictures again to show your item status",
                        },
                        "image2": {
                            required: "You must upload 4 pictures again to show your item status",
                        },
                        "image3": {
                            required: "You must upload 4 pictures again to show your item status",
                        },
                        "image4": {
                            required: "You must upload 4 pictures again to show your item status",
                        },
                        "name": {
                            required: "The name of item is required",
                            maxlength: "Product name is too long - It must be less than 50 characters"
                        },
                        "description": {
                            required: "The description is required",
                            maxlength: "Description is too long - It must be less than 500 characters"
                        }
                    }
                });
            });
        </script>
        <style>
            <%@include file="css/style.css" %>
            .error{
                color: red;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <%@include file="navigate.jsp" %>
<!--            <div class="navbar" id="mynavbar">
                <div class="logo">
                    <a href="homePage.html"><img src="../images/logo.png" width="225px"></a>
                </div>
                <nav>
                    <ul id="MenuItems">
                        <li><div class="dropdown">
                                <button class="dropbtn">Category</button>
                                <div class="dropdown-content">
                                    <c:forEach var="category" items="${rs.rows}" >
                                        <a><c:out value="${category.catName}" /></a>
                                    </c:forEach>
                                </div>
                            </div> 
                        </li>  
                        <li><a href="homePage.html">Home</a></li>
                        <li><a href="products.html">Products</a></li>
                        <li><a href="account.html">Account</a></li>
                        <li><a href="compad.html">Login/Register</a></li>         
                    </ul>
                </nav>
                <a href="cart.html"><img src="../images/cart.png" width="30px" height="30px"></a>
                <img src="../images/menu.png" class="menu-icon"
                     onclick="menutoggle()">
            </div>-->
        </div>
        <%
//            if (request.getParameter("btnEditItem") != null) {
//                item item = new item();
//
//                item.setName(request.getParameter("name"));
//                item.setCategory(request.getParameter("category"));
//                item.setDescription(request.getParameter("description"));
//
//                Part filePart1 = request.getPart("image1");
//                InputStream fileContent1 = filePart1.getInputStream();
//
//                Part filePart2 = request.getPart("image2");
//                InputStream fileContent2 = filePart2.getInputStream();
//
//                Part filePart3 = request.getPart("image3");
//                InputStream fileContent3 = filePart3.getInputStream();
//
//                Part filePart4 = request.getPart("image4");
//                InputStream fileContent4 = filePart4.getInputStream();
//
//                byte[] imageBytes1 = new byte[(int) filePart1.getSize()];
//                fileContent1.read(imageBytes1, 0, imageBytes1.length);
//                fileContent1.close();
//
//                byte[] imageBytes2 = new byte[(int) filePart2.getSize()];
//                fileContent2.read(imageBytes2, 0, imageBytes2.length);
//                fileContent2.close();
//
//                byte[] imageBytes3 = new byte[(int) filePart3.getSize()];
//                fileContent3.read(imageBytes3, 0, imageBytes3.length);
//                fileContent3.close();
//
//                byte[] imageBytes4 = new byte[(int) filePart4.getSize()];
//                fileContent4.read(imageBytes4, 0, imageBytes4.length);
//                fileContent4.close();
//
//                Blob imageBlob1 = new SerialBlob(imageBytes1);
//                Blob imageBlob2 = new SerialBlob(imageBytes2);
//                Blob imageBlob3 = new SerialBlob(imageBytes3);
//                Blob imageBlob4 = new SerialBlob(imageBytes4);
//
//                item.setImage1(imageBlob1);
//                item.setImage2(imageBlob2);
//                item.setImage3(imageBlob3);
//                item.setImage4(imageBlob4);
//
//                itemDAO.updateItem(item);
//                request.getRequestDispatcher("/user-profile.jsp").forward(request, response);
//
//            }
        %>
        <%            item i = (item) session.getAttribute("item");

        %>


        <div class="col-md-6 offset-md-3 mt-5">
            <form action="<%= getServletContext().getContextPath()%>/Item" method="post" id="Form" >
                <input type="text" class="form-control" id="product-name" readonly="" placeholder="Enter product name" name="itemID" value='<%=i.getItemID()%>' >
                <label for="product-name">Product Name</label>
                <input type="text" class="form-control" id="product-name" placeholder="Enter product name" name="name" value='<%=i.getName()%>' >

                <div class="form-group">
                    <label for="category">Category</label>
                    <select class="form-control" id="category" name="category">
                        <%
                            ResultSet rs = itemDAO.getAllCategory();
                            while (rs.next()) {
                        %>
                        <option value="<%=rs.getString("catName")%>" <%if (i.getCategory().equals(rs.getString("catName"))) {%>selected<%}%>><%=(rs.getString("catName"))%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="description" required="required">Description</label>
                    <!-- <input type="text"  class="form-control" id="description" placeholder="Enter description" name="description"> -->
                    <!--          textarea khong co attribute value-->
                    <textarea rows="4" cols="50" id="description" class="form-control" form="Form" placeholder="Enter description" name="description"  value="<%=i.getDescription()%>"></textarea>
                </div>

                <div class="btn-toolbar" role="toolbar" >

                    <div class="btn-group me-2" role="group" >
                        <button type="button" class="btn btn-secondary btn-lg active"><i class="fa fa-backward" aria-hidden="true"></i> Back</button>
                    </div>

                    <div class="btn-group" role="group" aria-label="Third group">
                        <button type="button" class="btn btn-primary btn-lg active"><i class="fa fa-upload" aria-hidden="true"></i><input type="submit" name="btnEditItem" value="submit"></button>
                    </div>

                </div>
            </form>
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