<%-- 
    Document   : ReserveEquipment
    Created on : Dec 16, 2018, 6:49:02 PM
    Author     : brk
--%>

<%@page import="java.util.List"%>
<%@page import="Classes.User"%>
<%@page import="Classes.Equipment"%>
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
            User usr = (User)session.getAttribute("instance");
            Equipment eqp = (Equipment)session.getAttribute("Equipment");
            List<Equipment> eList = (List)session.getAttribute("eList");
            
            eqp = eList.get(Integer.parseInt(request.getParameter("rButton")));
            usr.sendReservationRequest(usr.getID(), eqp.getName());
        %>
        <p>Request Sent</p>
    </body>
</html>
