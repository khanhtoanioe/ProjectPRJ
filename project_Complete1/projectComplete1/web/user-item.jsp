<%-- 
    Document   : user-item
    Created on : Mar 17, 2021, 8:35:25 PM
    Author     : Asus Vivobook
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
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
                    <a href="cart.html"><img src="../images/cart.png" width="30px" height="30px"></a>
                    <img src="../images/menu.png" class="menu-icon"
                         onclick="menutoggle()">
                </div>
            </div>
        </div>

        <div class="container">
            <h2>Item manager</h2>
            <table id="example" class="display" style="width:100%">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Status</th>
                        <th>Category</th>
                        <th>Age</th>
                        <th>Trade with user</th>
                        <th>Option 1</th>
                        <th>Option 2</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>test</td>
                        <td>test</td>
                        <td>test</td>
                        <td>test</td>
                        <td>test</td>
                        <td>test</td>
                        <td><button class="btn"><a href="#" onclick="return Confirm('Are you sure?');">Delete</a></button></td>
                        <td><button class="btn"><a href="#">Edit</a></button></td>
                    </tr>
                    <tr>
                        <td>test</td>
                        <td>test</td>
                        <td>test</td>
                        <td>test</td>
                        <td>test</td>
                        <td>test</td>
                        <td><button class="btn"><a href="#" onclick="return Confirm('Are you sure?');">Delete</a></button></td>
                        <td><button class="btn"><a href="#">Edit</a></button></td>
                    </tr>
                    <tr>
                        <td>test</td>
                        <td>test</td>
                        <td>test</td>
                        <td>test</td>
                        <td>test</td>
                        <td>test</td>
                        <td><button class="btn"><a href="#" onclick="return Confirm('Are you sure?');">Delete</a></button></td>
                        <td><button class="btn"><a href="#">Edit</a></button></td>
                    </tr>
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
