<%-- 
    Document   : ReserveEquipment
    Created on : Dec 13, 2018, 12:27:45 PM
    Author     : brk
--%>

<%@page import="Classes.Employee"%>
<%@page import="Classes.Equipment"%>
<%@page import="java.util.List"%>
<%@page import="Classes.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Equipment</title>

    </head>
    <body>
        <h1>Search Equipment</h1>

        <%
            String search = request.getParameter("Search");
            User temp = (User)session.getAttribute("instance");

            List<Equipment> eList = temp.search(search);
            session.setAttribute("eList", eList);
        %>
        
        <form name="Send" action="UReserveEquipment.jsp" method="POST">
            <table border="1">
                <tbody>
                    <tr>
                        <td>Equipment Name:</td>
                        <td>Quantity:</td>
                        <td>Availability:</td>
                        <td>Document</td>
                        <td>Select:</td>
                    </tr>
                    <%for (int i = 0; i < eList.size(); i++) {%>
                    <tr>
                        <td><%= eList.get(i).getName()%></td>
                        <td><%= eList.get(i).getQuantity()%></td>
                        <td><%= eList.get(i).isAvailability()%></td>
                        <td><%= eList.get(i).getDocument()%></td>
                        <td><input type="radio" name="rButton" value="<% out.print(i);%>" /></td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
            <input type="submit" value="Submit" name="Submit" />
        </form>

        <form name="search" action="" method="GET">

            <p> Search: </p> 
            <input type="text" name="Search" value="" size="15" />
            <input type="submit" value="Go" />

        </form>


    </body>
</html>
