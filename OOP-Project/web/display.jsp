<%-- 
    Document   : display
    Created on : Dec 11, 2018, 4:52:17 PM
    Author     : brk
--%>
<%@page import="Classes.Employee" %>
<%@page import="Classes.User" %>
<%@page import="Classes.Clerk" %>
<%@page import="Classes.Admin" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
    </head>
    <body>
        <%
            Employee credentials = new Employee();

            String id = request.getParameter("ID");
            String password = request.getParameter("Password");

            credentials = credentials.login(id, password);
            int Display = credentials.getPermissionLevel();

            //Failed login display
            if (Display == 0) { %>

        <a href="index.jsp">Login Error</a>

        <% } else if (Display == 1) {

            session.setAttribute("instance", credentials);
        %>

        <a href="SearchEquipment.jsp">Search Equipment</a>
        <br>
        <a href="FeedbackMenu.jsp">Write Feedback</a>
        <br>
        <a href="index.jsp" onclick=" <% id = null;
            password = null;%>">Logout</a> 
        <br>

        <% } else if (Display == 2) { %>
        <a href="AddEquipment.jsp">Add Equipment</a>
        <br>
        <%
                session.setAttribute("instance", credentials);
                out.print("Clerk");
            }
            //Admin Display
            if (Display == 3) {

                Employee newUser = new Admin();
                newUser = credentials;
                credentials = null;
                session.setAttribute("instance", newUser);
                out.print("Admin");

            }

        %>
    </body>
</html>
