<%-- 
    Document   : product-detail
    Created on : Mar 16, 2021, 4:41:23 PM
    Author     : Asus Vivobook
--%>

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
    <style>
        .btn{
            margin: 10px 0;
        }
    </style>
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

<!--single product details-->
<div class="small-container single-product">
    <div class="row">
        <div class="col-2">
            <img src="../images/Logitech-G102.jpg" width="100%" id="productImg">
            <div class="small-img-row ">

                <div class="small-img-col">
                    <img src="../images/Logitech-G102-1.jpg" width="100%" class="small-img">
                </div>
                <div class="small-img-col">
                    <img src="../images/Logitech-G102-2.jpg" width="100%" class="small-img">
                </div>
                <div class="small-img-col">
                    <img src="../images/Logitech-G102-3.jpg" width="100%" class="small-img">
                </div>
                <div class="small-img-col">
                    <img src="../images/Logitech-G102-4.jpg" width="100%" class="small-img">
                </div>
            </div>
        </div>
        <div class="col-2">
            <h4>Logitech G102 Black body</h4><br>
            <strong>Swap: Logitech G102 WHITE body</strong><br>
             
            <a href="#" class="btn">Chat with owner</a> <!-- nhảy qua chat -->
            <a href="#" class="btn">User profile</a>
            <a href="#" class="btn"><strong>Status:</strong> Waiting<br>Click to begin dealing</a> <!--chuyển đổi status món hàng -->
            
            <br>
            <!--Description-->
            <strong>Description: </strong><br>

            <p>I just bought it, never use it. Overall, it's new 99%. Warranty 12 months.
                I can trade it with the one with the white body. Send me a message and we can talk more about this.</p>


            </div>
            <!--title-->
            <div class="small-container">
                <div class="row row-2">
                    <h2>Related Products</h2>   
                </div>
            </div>
            <div class="small-container">
                <div class="row">
                    <div class="col-4">
                        <a href="#"><img src="../images/IP-12-blue.jpg"></a>
                        <a href="#"><h4>BLUE iPhone 12</h4></a>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>

                        </div>
                        <p>Waiting</p> 
                    </div>
                    
                    <div class="col-4">
                        <a href="#"><img src="../images/headphone.jpg"></a>
                        <a href="#"><h4>Sony Headphone</h4></a>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>

                        </div>
                        <p>Waiting</p>
                    </div>
                    
                    <div class="col-4">
                        <a href="#"><img src="../images/samsung-a12.jpg"></a>
                        <a href="#"><h4>SamSung Galaxy A12</h4></a>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                        </div>
                        <p>Waiting</p>
                    </div>
                    
                    <div class="col-4">
                        <a href="#"><img src="../images/airpod.jpg"></a>
                        <a href="#"><h4>Apple Airpod</h4></a>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <p>Waiting</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--footer-->
    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="footer-col-1">
                    <img src="images/logo.png">
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
        }else {
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
