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
            credentials = null;
        %>

        <a href="USearchEquipment.jsp">Search Equipment</a>
        <br>
        <a href="UFeedbackMenu.jsp">Write Feedback</a>
        <br>
        <a href="index.jsp" onclick=" <% id = null; password = null;%>">Logout</a> 
        <br>

        <% } else if (Display == 2) { 
        
            session.setAttribute("instance", credentials);
            credentials = null;
        
        %>
        
        <a href="CAddForm.jsp">Add Equipment</a>
        <br>
        <a href="CDeleteForm.jsp">Delete Equipment</a>
        <br>
        <a href="CPrepareDocForm.jsp">Prepare Equipment Document</a>
        <br>
        <a href="CAssignEquipmentForm.jsp">Assign Equipment</a>
        <br>
        
        <% } else if (Display == 3) {

                session.setAttribute("instance", credentials);
                credentials = null;

            }

        %>
    </body>
</html>
