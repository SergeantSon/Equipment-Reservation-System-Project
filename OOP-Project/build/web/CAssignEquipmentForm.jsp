<%-- 
    Document   : AssignEquipment
    Created on : Dec 19, 2018, 12:22:57 AM
    Author     : brk
--%>

<%@page import="java.util.List"%>
<%@page import="Classes.Request"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Menu</title>
    </head>
    <body>
        <h1>Select Equipment: </h1>

        <%
            Request temp = new Request();

            List<Request> rList = temp.requestList();
            session.setAttribute("rList", rList);
        %>

        <form name="Send" action="CAssignEquipment.jsp" method="POST">
            <table border="1">
                <tbody>
                    <tr>
                        <td>Request ID:</td>
                        <td>User ID:</td>
                        <td>Equipment Name:</td>
                        <td>Date:</td>
                        <td>Select: </td>
                    </tr>
                    <%for (int i = 0; i < rList.size(); i++) {%>
                    <tr>
                        <td><%= rList.get(i).getRequestId()%></td>
                        <td><%= rList.get(i).getUserID()%></td>
                        <td><%= rList.get(i).geteName()%></td>
                        <td><%= rList.get(i).getDate()%></td>
                        <td>
                            <input type="radio" name="cButton" value="true <%= i %>" checked="checked"/>Accept
                            <input type="radio" name="cButton" value="false <%= i %>" />Decline
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
            <br>
            <input type="submit" value="Submit" name="Submit" />
        </form>

    </body>
</html>
