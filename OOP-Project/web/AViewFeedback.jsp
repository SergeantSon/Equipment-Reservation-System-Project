<%-- 
    Document   : AViewFeedback
    Created on : Dec 24, 2018, 4:40:03 AM
    Author     : brk
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Classes.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback Menu</title>
    </head>
    <body>
        <% 
            Admin admn = (Admin)session.getAttribute("instance");
            ResultSet rSet = admn.viewFeedback();
        %>
        
        <table border="1">
            <tbody>
                <tr>
                    <td>Feedback Id: </td>
                    <td>User ID: </td>
                    <td>Date: </td>
                    <td>Feedback: </td>
                </tr>
                <% while(rSet.next()){ %>
                <tr>
                    <td><%= rSet.getInt("FeedbackId") %></td>
                    <td><%= rSet.getString("UserName") %></td>
                    <td><%= rSet.getDate("Date") %></td>
                    <td><%= rSet.getString("FEEDBACK") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>

        
    </body>
</html>
