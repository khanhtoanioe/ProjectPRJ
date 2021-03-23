<%-- 
    Document   : header
    Created on : Mar 21, 2021, 2:08:40 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.itemDAO"%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/group_assignment" user="root"  password=""/> 
<sql:query dataSource="${db}" var="rs" >
    SELECT catName FROM `category`;
</sql:query>
<%@page import="java.sql.ResultSet"%>
<div class="navbar" id="mynavbar">
    <div class="logo">
        <a href="<%=getServletContext().getContextPath()%>/customer/home"><img src="http://localhost:8080/images/logo.png" width="225px"></a>
    </div>
    <nav>
        <a href="/chat-history.jsp" class="btn" type="button" name="accept" style="padding:10px; background: #e58679"><i class="fa fa-weixin" aria-hidden="true"></i></a>
        <ul id="MenuItems">
            <li><div class="dropdown">
                    <button class="dropbtn">Category</button>
                    <div class="dropdown-content">
                        <c:forEach var="category" items="${rs.rows}" >
                            <a href="<%= getServletContext().getContextPath()%>/customer/search?category=${category.catName}" ><c:out value="${category.catName}" /></a>
                        </c:forEach>
                    </div>
                </div> 
            </li>  
            <li><a href="<%=getServletContext().getContextPath()%>/customer/home">Home</a></li>

            <li><a href="/Profile/<%=(String) session.getAttribute("IDcard")%>">Account</a></li>
            <li><a href="<%=getServletContext().getContextPath()%>/customer/logout">Logout</a></li>
        </ul>
    </nav>
        <% ResultSet resultset = DAO.DealingListDAO.getReciever(); %>
        <% while (resultset.next()) {
                        if (resultset.getString("reciever").equals(session.getAttribute("IDcard"))) {%>
    <a href="<%= getServletContext().getContextPath()%>/customer/notiDeal"><img src="http://localhost:8080/images/cart2.png" width="30px" height="30px"></a>

    <% break;
            }
        }%>

    <img src="../images/menu.png" class="menu-icon"
         onclick="menutoggle()">
</div>
