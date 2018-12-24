<%-- 
    Document   : AAddUser
    Created on : Dec 24, 2018, 4:00:10 AM
    Author     : brk
--%>

<%@page import="Classes.Admin"%>
<%@page import="Classes.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add User</title>
    </head>
    <body>
        <%
            Admin amn = (Admin) session.getAttribute("instance");

            String userID = request.getParameter("uID");
            String userPassword = request.getParameter("uPass");
            String userName = request.getParameter("uName");
            String userSurname = request.getParameter("uSurname");
            String userPosition = request.getParameter("uPosition");
            String userMail = request.getParameter("uMail");
            String userPhone = request.getParameter("uPhone");
            int userPermission = Integer.parseInt(request.getParameter("uPerm"));

            Employee emp = new Employee(userID, userPassword, userName, userSurname, userPosition, userMail, userPhone, userPermission);
            amn.addUser(emp);
        %>

        <p>Success!</p>
        <a href=index.jsp> Return </a>
    </body>
</html>
