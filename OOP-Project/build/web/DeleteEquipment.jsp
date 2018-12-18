<%-- 
    Document   : DeleteEquipment
    Created on : Dec 18, 2018, 10:32:42 PM
    Author     : brk
--%>

<%@page import="java.util.List"%>
<%@page import="Classes.Clerk"%>
<%@page import="Classes.Equipment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success</title>
    </head>
    <body>
        <%
            Equipment eqp;

            Clerk clrk = (Clerk) session.getAttribute("instance");
            List<Equipment> eList = (List) session.getAttribute("eList");

            eqp = eList.get(Integer.parseInt(request.getParameter("rButton")));
            clrk.deleteEquipment(eqp.getName());
        %>
        <p>Equipment Deleted!</p>
    </body>
</html>
