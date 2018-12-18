<%-- 
    Document   : Confirmation
    Created on : Dec 18, 2018, 9:43:25 PM
    Author     : brk
--%>

<%@page import="Classes.Clerk"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            Clerk emp = (Clerk) session.getAttribute("instance");
            emp.addEquipment(request.getParameter("eName"), Integer.parseInt(request.getParameter("eQuantity")), Boolean.parseBoolean(request.getParameter("rButton")), request.getParameter("eDocument"));
            out.print("<p>Equipment Added</p>");

        %>

    </body>
</html>
