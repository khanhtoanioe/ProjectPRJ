<%-- 
    Document   : user-profile
    Created on : Mar 18, 2021, 10:01:52 AM
    Author     : Asus Vivobook
--%>

<%@page import="DAO.tranferHistoryDAO"%>
<%@page import="DAO.itemDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="models.customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>User Profile</title>


        <!-- Bootstrap navbar -->
        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/navbars/">


        <!-- Link BootStrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="../css/style.css">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

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

                <div class="navbar" id="mynavbar">
                    <div class="logo">
                        <a href="homePage.html"><img src="../images/logo.png" width="225px"></a>
                    </div>
                    <nav>
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
                            <li><a href="compad.html">Login/Register</a></li>         
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
            <div class="row my-2">
                <div class="col-lg-8 order-lg-2">
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a href="" data-target="#profile" data-toggle="tab" class="nav-link active">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a href="" data-target="#rating" data-toggle="tab" class="nav-link">Rating</a>
                        </li>
                        <li class="nav-item">
                            <a href="" data-target="#history" data-toggle="tab" class="nav-link">History</a>
                        </li>
                        <li class="nav-item">
                            <a href="" data-target="#upload" data-toggle="tab" class="nav-link">Uploaded</a>
                        </li>
                    </ul>

                    <%
                        customer user = (customer) session.getAttribute("user");
                        String idCard = (String) session.getAttribute("IDcard");
                    %>
                    <!--Account Information-->
                    <div class="tab-content py-4">
                        <div class="tab-pane active" id="profile">
                            <h5 class="mb-3">Account Information</h5>
                            <div class="row">
                                <div class="col-lg">
                                    <form action="<%=getServletContext().getContextPath()%>/Profile" method="post">
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label form-control-label">Full name</label>
                                            <div class="col-lg-9">
                                                <input class="form-control" type="text" value="<%=user.getName()%>" name="txtName" <%if (!idCard.equals(user.getIDCard())) {%>readonly=""<%}%>>

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label form-control-label">Email</label>
                                            <div class="col-lg-9">
                                                <input class="form-control" type="email" value="<%=user.getEmail()%>" name="txtEmail" <%if (!idCard.equals(user.getIDCard())) {%>readonly=""<%}%>>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label form-control-label">Phone number</label>
                                            <div class="col-lg-9">
                                                <input class="form-control" type="tel" value="<%=user.getPhoneNumber()%>" name="txtPhone" <%if (!idCard.equals(user.getIDCard())) {%>readonly=""<%}%>>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label form-control-label">Date of Birth</label>
                                            <div class="col-lg-9">
                                                <input class="form-control" type="date" value="<%=user.getDateOfBirth()%>" name="txtBirth" <%if (!idCard.equals(user.getIDCard())) {%>readonly=""<%}%>>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label form-control-label">Address</label>
                                            <div class="col-lg-9">
                                                <input class="form-control" type="text" value="<%=user.getAddress()%>" name="txtAddress" <%if (!idCard.equals(user.getIDCard())) {%>readonly=""<%}%>>
                                            </div>
                                        </div>                                 
                                        <div class="form-group row" <%if (!idCard.equals(user.getIDCard())) {%>style="display: none"<%}%> >
                                            <label class="col-lg-3 col-form-label form-control-label">ID Card</label>
                                            <div class="col-lg-9">
                                                <input class="form-control" type="text" value="<%=user.getIDCard()%>" readonly="" name="txtID" >
                                            </div>
                                        </div>
                                        <div class="form-group row" <%if (!idCard.equals(user.getIDCard())) {%>style="display: none"<%}%>>
                                            <label class="col-lg-3 col-form-label form-control-label">Password</label>
                                            <div class="col-lg-9">
                                                <input class="form-control" type="password" value="<%=user.getPassWord()%>" name="txtPwd">
                                            </div>
                                        </div>
                                        <div class="form-group row" <%if (!idCard.equals(user.getIDCard())) {%>style="display: none"<%}%> >
                                            <label class="col-lg-3 col-form-label form-control-label">Confirm password</label>
                                            <div class="col-lg-9">
                                                <input class="form-control" type="password" value="<%=user.getPassWord()%>" name="txtPwdConfirm">
                                            </div>
                                        </div>
                                        <div class="form-group row" <%if (!idCard.equals(user.getIDCard())) {%>style="display: none"<%}%>>
                                            <label class="col-lg-3 col-form-label form-control-label"></label>
                                            <div class="col-lg-9">
                                                <!-- SUBMIT -->
                                                <input type="reset" class="btn btn-secondary" value="Cancel">
                                                <input type="submit" class="btn btn-primary" value="Save Changes" name="btnEdit">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>          


                        <!-- RATING -->
                        <div class="tab-pane" id="rating">

                            <div class="container">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <tr>
                                    <div class="row">
                                        <div class="col-sm">
                                            <th>Name</th>
                                        </div>
                                        <div class="col-sm">
                                            <th>Comment</th>
                                        </div>
                                        <div class="col-sm">
                                            <th>Rate</th>
                                        </div>
                                    </div>
                                    </tr>
                                    </thead>

                                    <tbody>
                                        <!-- Row 1 -->
                                        <tr>
                                    <div class="row">
                                        <div class="col-sm">
                                            <td>Ho Kha Minh</td>
                                        </div>
                                        <div class="col-sm">
                                            <td>Very good, bla bla bla</td>
                                        </div>
                                        <div class="col-sm">
                                            <td>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div> </td>
                                        </div>
                                    </div>
                                    </tr>
                                    <!-- Row 2 -->
                                    <tr>
                                    <div class="row">
                                        <div class="col-sm">
                                            <td>Tieu Anh Tho</td>
                                        </div>
                                        <div class="col-sm">
                                            <td>Not so good, late</td>
                                        </div>
                                        <div class="col-sm">
                                            <td>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div> </td>
                                        </div>
                                    </div>
                                    </tr>
                                    <!-- Row 3 -->
                                    <tr>
                                    <div class="row">
                                        <div class="col-sm">
                                            <td>Tran Khanh Toan</td>
                                        </div>
                                        <div class="col-sm">
                                            <td>Suck</td>
                                        </div>
                                        <div class="col-sm">
                                            <td>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div> </td>
                                        </div>
                                    </div>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>                     

                        <!-- History -->
                        <div class="tab-pane" id="history">
                            <div class="container">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <tr>
                                    <div class="row">
                                        <div class="col-sm">
                                            <th>Time</th>
                                        </div>
                                        <div class="col-sm">
                                            <th>Have</th>
                                        </div>
                                        <div class="col-sm">
                                            <th>Trade with trader</th>
                                        </div>
                                        <div class="col-sm">
                                            <th>Trade with item</th>
                                        </div>
                                    </div>
                                    </tr>
                                    </thead>
                                    <tbody>

                                        <% String id = user.getIDCard(); %>
                                        <!-- Row 1 -->
                                        <% ResultSet rs = tranferHistoryDAO.getAllHistory(); %>
                                        <% while (rs.next()) { %>
                                        <% if (rs.getString("firstCustomer").equals(id)) {%>
                                        <tr>
                                    <div class="row">
                                        <div class="col-sm">
                                            <td><%= rs.getString("timeDeal")%></td>
                                        </div>

                                        <div class="col-sm">
                                            <td><a style="color: #0b5ed7" href="<%= getServletContext().getContextPath()%>/customer/viewProduct?itemID=<%= rs.getInt("firstItem")%>" ><%= rs.getString("firstItem")%></a></td>
                                        </div>
                                        <div class="col-sm">
                                            <td><a style="color: #0b5ed7" href="<%=getServletContext().getContextPath()%>/Profile/<%= rs.getString("secondCustomer") %>"> <%= rs.getString("secondCustomer")%></a></td>
                                        </div>
                                        <div class="col-sm">
                                            <td><a style="color: #0b5ed7" href="<%= getServletContext().getContextPath()%>/customer/viewProduct?itemID=<%= rs.getInt("secondItem")%>" ><%= rs.getString("secondItem")%></a></td>
                                        </div>
                                    </div>
                                    </tr>
                                    <% } %>
                                    <% if (rs.getString("secondCustomer").equals(id)) { %>
                                    <tr>
                                    <div class="row">
                                        <div class="col-sm">
                                            <td><%= rs.getString("timeDeal")%></td>
                                        </div>

                                        <div class="col-sm">
                                            <td><a style="color: #0b5ed7" href="<%= getServletContext().getContextPath()%>/customer/viewProduct?itemID=<%= rs.getInt("secondItem")%>" ><%= rs.getString("secondItem")%></a></td>
                                        </div>
                                        <div class="col-sm">
                                            <td><a style="color: #0b5ed7" href="<%=getServletContext().getContextPath()%>/Profile/<%= rs.getString("firstCustomer") %>"> <%= rs.getString("firstCustomer")%></a></td>
                                        </div>
                                        <div class="col-sm">
                                            <td><a style="color: #0b5ed7" href="<%= getServletContext().getContextPath()%>/customer/viewProduct?itemID=<%= rs.getInt("firstItem")%>" ><%= rs.getString("firstItem")%></a></td>
                                        </div>
                                    </div>
                                    </tr>

                                    <% } %>
                                    <% } %>
                                    <!-- Row 2 -->

                                    </tbody>
                                </table>
                            </div>
                            <div class="container bg-info">
                                <!-- nếu chưa giao dịch với người này thì thêm display: none; vô style="#"-->
                                <form style="#" action=""> 
                                    <h2 class="display-3 text-center">Rate this User </h2>
                                    <div class="mb-3">
                                        <label for="comment" class="form-label">Comment</label>
                                        <input type="text" class="form-control" id="comment" aria-describedby="comment">
                                        <div id="comment" class="form-text">Give opinion about this user.</div>
                                    </div>
                                    <select class="form-select" aria-label="Default select example">
                                        <option selected>Choose stars</option>
                                        <option value="1">One</option>
                                        <option value="2">Two</option>
                                        <option value="3">Three</option>
                                        <option value="4">Four</option>
                                        <option value="5">Five</option>
                                    </select>

                                    <div class="d-grid gap-2 col-6 mx-auto">
                                        <button class="btn btn-primary" type="submit">Submit</button>
                                    </div>

                                </form>
                            </div>
                        </div>
                        <%
                            ResultSet userItem = itemDAO.getUserItem(Integer.parseInt(user.getIDCard()));

                        %>
                        <div class="tab-pane" id="upload">
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
                                            <th>Image 1</th>
                                            <th>Image 2</th>
                                            <th>Image 3</th>
                                            <th>Image 4</th>
                                            <!--                                        <th></th>
                                                                                    <th></th>-->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%                                            while (userItem.next()) {

                                        %>
                                        <tr>
                                            <td><%=userItem.getInt("itemID")%></td>
                                            <td><%=userItem.getString("Name")%></td>
                                            <td><%=userItem.getInt("status")%></td>
                                            <td><%=userItem.getString("category")%></td>
                                            <td><%=userItem.getString("description")%></td>
                                            <td><img src="data:image/jpg;base64,<%= itemDAO.getImageString(userItem.getBlob("image1"))%>"></td>
                                            <td><img src="data:image/jpg;base64,<%= itemDAO.getImageString(userItem.getBlob("image2"))%>"></td>
                                            <td><img src="data:image/jpg;base64,<%= itemDAO.getImageString(userItem.getBlob("image3"))%>"></td>
                                            <td><img src="data:image/jpg;base64,<%= itemDAO.getImageString(userItem.getBlob("image4"))%>"></td>
                                            <td <%if (Integer.parseInt(idCard) != userItem.getInt("ownerID")) {%>style="display: none"<%}%>><button class="btn"><a href="/Profile/<%=userItem.getInt("ownerID")%>/UserItem/Delete/<%=userItem.getInt("itemID")%>" onclick="return Confirm('Are you sure to delete <%=userItem.getString("Name")%> ?');">Delete</a></button></td>
                                            <td <%if (Integer.parseInt(idCard) != userItem.getInt("ownerID")) {%>style="display: none"<%}%>><button class="btn"><a href="/Profile/<%=userItem.getInt("ownerID")%>/UserItem/Edit/<%=userItem.getInt("itemID")%>">Edit</a></button></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>


                </div>
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

