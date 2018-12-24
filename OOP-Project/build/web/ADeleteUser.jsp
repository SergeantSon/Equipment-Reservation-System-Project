<%-- 
    Document   : ADeleteUser
    Created on : Dec 24, 2018, 4:34:37 AM
    Author     : brk
--%>

<%@page import="java.util.List"%>
<%@page import="Classes.Employee"%>
<%@page import="Classes.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete User</title>
    </head>
    <body>
        <%
            Admin admn = (Admin) session.getAttribute("instance");
            List<Employee> eList = (List) session.getAttribute("eList");

            Employee emp = eList.get(Integer.parseInt(request.getParameter("rButton")));
            admn.deleteUser(emp.getID());
        %>

        <p>User Deleted!</p>
        <a href=index.jsp> Return </a>

    </body>
</html>
