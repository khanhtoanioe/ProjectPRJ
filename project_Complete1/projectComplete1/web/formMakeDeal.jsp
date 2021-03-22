<%-- 
    Document   : formMakeDeal
    Created on : Mar 17, 2021, 11:25:41 PM
    Author     : Admin
--%>

<%@page import="DAO.itemDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:if test="${param.btnSendDeal != null}">
    <sql:setDataSource driver="com.mysql.jdbc.Driver" var="db" url="jdbc:mysql://localhost/group_assignment" password="" user="root"/>
    <c:catch>
        <sql:update dataSource="${db}"  >
            INSERT INTO `dealinglist` (`senderItem`, `recieverItem`, `reciever`) VALUES(?,?,?);
            <sql:param value="${param.senderItem}"/>
            <sql:param value="${param.recieverItem}"/>
            <sql:param value="${param.reciever}"/>
        </sql:update>
    </c:catch>
    <c:redirect url="${pageContext.request.contextPath}/customer/dealSuccess"/>
</c:if>
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
        <form action="<%= getServletContext().getContextPath()%>/formMakeDeal.jsp" >
            <div class="small-container">
                <div>
                    <h2 class="title">CHOOSE ITEM YOU WANT TO TRADE</h2>
                    <div class="row">
                        <% ResultSet rs = itemDAO.getAllItem();%>
                        <% while (rs.next()) { %>
                        <% if (rs.getString("ownerID").equals(session.getAttribute("IDcard")) && rs.getInt("status") == 0 ) {%>
                        <div class="col-4"   >
                            <label for="senderItem"></label>
                            <input type="radio" name="senderItem" id="senderItem" value="<%= rs.getInt("itemID")%>">
                            <input type="number" value="${param.recieverItem}" style="display: none;" name="recieverItem" >
                            <input type="text" value="${param.reciever}" style="display: none;" name="reciever">
                            <img src="data:image/jpg;base64,<%= itemDAO.getImageString(rs.getBlob("image1"))%>">
                            <strong><%= rs.getNString("name")%></strong>

               
                        </div>
                        <% } %>
                        <% }%>
                        <a href="<%=getServletContext().getContextPath()%>/customer/home"> Click here to back to home page</a>
                        <input type="submit" value="SEND DEAL" name="btnSendDeal">
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
