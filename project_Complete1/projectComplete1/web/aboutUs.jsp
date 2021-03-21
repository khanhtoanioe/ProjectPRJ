<%-- 
    Document   : aboutUs
    Created on : Mar 21, 2021, 4:00:34 PM
    Author     : Asus Vivobook
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <style>
            @import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900,900italic);

            body {
                font-family: 'Source Sans Pro', sans-serif;
                line-height: 1.5;
                color: #323232;
                font-size: 15px;
                font-weight: 400;
                text-rendering: optimizeLegibility;
                -webkit-font-smoothing: antialiased;
                -moz-font-smoothing: antialiased;
            }
            .heading-title {
                margin-bottom: 100px;
            }
            .text-center {
                text-align: center;
            }
            .heading-title h3 {
                margin-bottom: 0;
                letter-spacing: 2px;
                font-weight: normal;
            }
            .p-top-30 {
                padding-top: 30px;
            }
            .half-txt {
                width: 60%;
                margin: 0 auto;
                display: inline-block;
                line-height: 25px;
                color: #7e7e7e;
            }
            .text-uppercase {
                text-transform: uppercase;
            }

            .team-member, .team-member .team-img {
                position: relative;
            }
            .team-member {
                overflow: hidden;
            }
            .team-member, .team-member .team-img {
                position: relative;
            }

            .team-hover {
                position: absolute;
                top: 0;
                left: 0;
                bottom: 0;
                right: 0;
                margin: 0;
                border: 20px solid rgba(0, 0, 0, 0.1);
                background-color: rgba(255, 255, 255, 0.90);
                opacity: 0;
                -webkit-transition: all 0.3s;
                transition: all 0.3s;
            }
            .team-member:hover .team-hover .desk {
                top: 35%;
            }
            .team-member:hover .team-hover, .team-member:hover .team-hover .desk, .team-member:hover .team-hover .s-link {
                opacity: 1;
            }
            .team-hover .desk {
                position: absolute;
                top: 0%;
                width: 100%;
                opacity: 0;
                -webkit-transform: translateY(-55%);
                -ms-transform: translateY(-55%);
                transform: translateY(-55%);
                -webkit-transition: all 0.3s 0.2s;
                transition: all 0.3s 0.2s;
                padding: 0 20px;
            }
            .desk, .desk h4, .team-hover .s-link a {
                text-align: center;
                color: #222;
            }
            .team-member:hover .team-hover .s-link {
                bottom: 10%;
            }
            .team-member:hover .team-hover, .team-member:hover .team-hover .desk, .team-member:hover .team-hover .s-link {
                opacity: 1;
            }
            .team-hover .s-link {
                position: absolute;
                bottom: 0;
                width: 100%;
                opacity: 0;
                text-align: center;
                -webkit-transform: translateY(45%);
                -ms-transform: translateY(45%);
                transform: translateY(45%);
                -webkit-transition: all 0.3s 0.2s;
                transition: all 0.3s 0.2s;
                font-size: 35px;
            }
            .desk, .desk h4, .team-hover .s-link a {
                text-align: center;
                color: #222;
            }
            .team-member .s-link a {
                margin: 0 10px;
                color: #333;
                font-size: 16px;
            }
            .team-title {
                position: static;
                padding: 20px 0;
                display: inline-block;
                letter-spacing: 2px;
                width: 100%;
            }
            .team-title h5 {
                margin-bottom: 0px;
                display: block;
                text-transform: uppercase;
            }
            .team-title span {
                font-size: 12px;
                text-transform: uppercase;
                color: #a5a5a5;
                letter-spacing: 1px;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="heading-title text-center">
                    <h3 class="text-uppercase">OUR TEAM</h3>
                    <p class="p-top-30 half-txt">“I think it's fair to say that personal computers have become the most empowering tool we've ever created. They're tools of communication, they're tools of creativity, and they can be shaped by their user.” </p>
                    - Bill Gates
                </div>

                <div class="col-md-4 col-sm-4">
                    <div class="team-member">
                        <div class="team-img">
                            <img src="images/send.jpg" alt="team member" class="img-responsive"> <!-- Hình ở đây -->
                        </div>
                        <div class="team-hover">
                            <div class="desk">
                                <h4>Hi There !</h4>
                                <p>I love coding and watching cat pic.</p>
                            </div>
                        </div>
                    </div>
                    <div class="team-title">
                        <h5>Tieu Anh Tho</h5>
                        <span>CE</span>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="team-member">
                        <div class="team-img">
                            <img src="images/send.jpg" alt="team member" class="img-responsive"> <!-- Hình ở đây -->
                        </div>
                        <div class="team-hover">
                            <div class="desk">
                                <h4>Hello World</h4>
                                <p>Don't follow your dream, follow me on Instagram.</p>
                            </div>
                        </div>
                    </div>
                    <div class="team-title">
                        <h5>Ho Kha Minh</h5>
                        <span>CE150582</span>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="team-member">
                        <div class="team-img">
                            <img src="images/send.jpg" alt="team member" class="img-responsive"> <!-- Hình ở đây -->
                        </div>
                        <div class="team-hover">
                            <div class="desk">
                                <h4>I love Chess</h4>
                                <p>Talk is CHEAP. Show me the CODE</p>
                            </div>
                        </div>
                    </div>
                    <div class="team-title">
                        <h5>Tran Khanh Toan</h5>
                        <span>CE</span>
                    </div>
                </div>

            </div>

        </div>
    </body>
</html>
