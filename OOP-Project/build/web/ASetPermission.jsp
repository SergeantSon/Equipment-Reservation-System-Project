<%-- 
    Document   : ASetPermission
    Created on : Dec 24, 2018, 4:53:51 AM
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
        <title>Set Permission</title>
    </head>
    <body>
        <%
            Admin admn = (Admin) session.getAttribute("instance");
            List<Employee> eList = (List) session.getAttribute("eList");
            
            String input = request.getParameter("rButton");
            
            Employee emp = eList.get(Integer.parseInt(input.substring(input.indexOf(" ")+1)));
            admn.setPermissionLevel(emp.getID(), Integer.parseInt(input.substring(0, input.indexOf(" "))));
        %>

        <p>Permission Level Updated</p>
        <a href=index.jsp> Return </a>

    </body>
</html>
