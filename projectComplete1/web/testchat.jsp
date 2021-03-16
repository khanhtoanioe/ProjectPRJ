<%-- 
    Document   : testchat
    Created on : Mar 14, 2021, 3:38:16 PM
    Author     : Asuss
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>test chat</title>
    </head>
    <body>
        <%
            ResultSet content = (ResultSet) session.getAttribute("content");
            String idCard = (String)session.getAttribute("IDCard");
           // String sendFrom=(String) content.getString("sendFrom");
        %>
        <%
            while (content.next()) {
        %>
        <div><%= content.getString("content")%>   </div>
        <%}%>
        <form action="<%= getServletContext().getContextPath()%>/Chat" method="post">
            <input type="text" name="txtChat" size="500"/><br>
            <input type="submit" value="submit" name="btnNewChat"/>
        </form>
    </body>
</html>
