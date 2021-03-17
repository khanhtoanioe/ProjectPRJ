<%-- 
    Document   : formMakeDeal
    Created on : Mar 17, 2021, 11:25:41 PM
    Author     : Admin
--%>

<%@page import="DAO.itemDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Item Status</title>


        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <div class="small-container">
            <div>
                <h2 class="title">CHOOSE ITEM YOU WANT TO TRADE</h2>
                <div class="row">
                    <% ResultSet rs = itemDAO.getAllItem();%>
                    <% while (rs.next()) { %>
                    <% if (!rs.getString("ownerID").equals(session.getAttribute("IDcard"))) {%>
                    <div class="col-4"   >
                        <label for="senderItem"></label>
                        <input type="radio" name="senderItem" id="senderItem">
                       
                            <img src="data:image/jpg;base64,<%= itemDAO.getImageString(rs.getBlob("image1"))%>">
                        <strong><%= rs.getNString("name")%></strong>

                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                    </div>
                    <% } %>
                    <% }%>
                </div>
            </div>
        </div>
    </body>
</html>
