<%-- 
    Document   : mainPage
    Created on : Mar 13, 2021, 9:40:55 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <a href="/Chat/1111">test message</a>
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
                            <li>
                                <div class="wrap">
                                    <div class="search">
                                        <input type="text" class="searchTerm" placeholder="What are you looking for?">
                                        <button type="submit" class="searchButton">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </li>       
                        </ul>
                    </nav>
                    <a href="cart.html"><img src="../images/cart.png" width="30px" height="30px"></a>
                    <img src="../images/menu.png" class="menu-icon"
                         onclick="menutoggle()">
                </div>

                <div class="row">
                    <div class="col-2" >
                        <h1>Trao đổi<br>Hàng hóa!</h1>
                        <p>Bạn đang có một món nào đó nhưng vì một lí do nào đó mà mình không dùng đến? Hãy đăng lên Mitto và gợi ý một sản phẩm mà mình muốn trao đổi.<br>Bạn sẽ có cơ hội giao lưu sản phẩm với nhừng người có cùng sở thích.</p>
                        <a href="products.html" class="btn">Bắt đầu ngay &#8594;</a>
                    </div>
                    <div class="col-2" >
                        <img src="../images/front-page.png" alt="" width="555px" height="600px" >
                    </div>

                </div>
            </div>
        </div>

        <div class="small-container">
            <h2 class="title">Top categories</h2>
            <div class="row">
                <div class="col-4">
                    <a href="products-details.html"><img src="../images/IP-12-red.jpg"></a>
                    <a href="products-details.html"><strong>RED iPhone 12</strong></a><br>
                    <a href="products-details.html"><h4>Swap: BLUE iPhone 12</h4></a>

                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <p>Waiting</p>
                </div>
                <div class="col-4">
                    <a href="product-details.html"><img src="../images/IP-12-blue.jpg"></a>
                    <a href="product-details.html"><strong>BLUE iPhone 12</strong></a><br>
                    <a href="product-details.html"><h4>Swap: RED iPhone 12</h4></a>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <p>Waiting</p>
                </div>
                <div class="col-4">
                    <a href="product-details.html"><img src="../images/LV.jpg"></a>
                    <a href="product-details.html"><strong>Louis Vuitton T-shirt Size: 32</strong></a><br>
                    <a href="product-details.html"><h4>Swap: Any LV shirt with size: 32</h4></a>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                    </div>
                    <p>Waiting</p>
                </div>
                <div class="col-4">
                    <a href="product-details.html"><img src="../images/Logitech-G102.jpg"></a>
                    <a href="product-details.html"><strong>Logitech G102 Black body</strong></a><br>
                    <a href="product-details.html"><h4>Swap: Logitech G102 WHITE body</h4></a>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <p>Waiting</p>
                </div>
            </div>
            <h2 class="title">New item</h2>
            <div class="row">
                <div class="col-4">
                    <a href="product-details.html"><img src="../images/adidas.jpg"></a>
                    <a href="product-details.html"><strong>Adidas shoes Size: 41
                        </strong></a><br>
                    <a href="product-details.html"><h4>Swap: Nike shoes Size: 39</h4></a>

                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <p>Waiting</p>
                </div>
                <div class="col-4">
                    <img src="../images/airpod.jpg">
                    <a href="products-details.html"><strong>Apple Airpod 2
                        </strong></a><br>
                    <a href="products-details.html"><h4>Swap: Apple Airpod 3</h4></a>

                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <p>DONE</p>
                </div>
                <div class="col-4">
                    <img src="../images/headphone.jpg">
                    <a href="products-details.html"><strong>Sony headphone
                        </strong></a><br>
                    <a href="products-details.html"><h4>Swap: And other headphone</h4></a>

                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                    </div>
                    <p>Waiting</p>
                </div>
                <div class="col-4">
                    <img src="../images/levi-jean.jpg">
                    <a href="products-details.html"><strong>LEVI Jeans
                        </strong></a><br>
                    <a href="products-details.html"><h4>Swap: Other brand jean</h4></a>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <p>Waiting</p>
                </div>
            </div>
            <div class="row">
                <div class="col-4">
                    <img src="../images/nike.jpg">
                    <a href="products-details.html"><strong>Nike shoes Size: 39
                        </strong></a><br>
                    <a href="products-details.html"><h4>Swap: Nike shoes Size: 41</h4></a>

                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <p>Waiting</p>
                </div>
                <div class="col-4">
                    <img src="../images/pepsi.jpg">
                    <a href="products-details.html"><strong>Pepsi, 355mL Cans, 24 Pack
                        </strong></a><br>
                    <a href="products-details.html"><h4>Swap: COCA COLA</h4></a>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                        <i class="fa fa-star-o"></i>
                    </div>
                    <p>Waiting</p>
                </div>
                <div class="col-4">
                    <img src="../images/samsung-a12.jpg">
                    <a href="products-details.html"><strong>BLUE SamSung A12 2020
                        </strong></a><br>
                    <a href="products-details.html"><h4>BLACK SamSung A12 2020</h4></a>

                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                    </div>
                    <p>Waiting</p>
                </div>
                <div class="col-4">
                    <img src="../images/book.jpg">
                    <a href="products-details.html"><strong>I Am Gifted, So Are You!
                        </strong></a><br>
                    <a href="products-details.html"><h4>Swap: Any kind of book</h4></a>

                    <div class="rating">
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
        <script type="text/javascript">
            var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
            (function () {
                var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
                s1.async = true;
                s1.src = 'https://embed.tawk.to/601955e4a9a34e36b972fda3/1ethff1oi';
                s1.charset = 'UTF-8';
                s1.setAttribute('crossorigin', '*');
                s0.parentNode.insertBefore(s1, s0);
            })();
        </script>
    </body>
</html>
