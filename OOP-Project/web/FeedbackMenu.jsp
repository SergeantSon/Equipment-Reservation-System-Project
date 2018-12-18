<%-- 
    Document   : FeedbackMenu
    Created on : Dec 16, 2018, 8:48:14 PM
    Author     : brk
--%>

<%@page import="Classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback Menu</title>
    </head>
    <body>
        <%
            User usr = (User) session.getAttribute("instance");
        %>
        <h1>Write a Feedback</h1>

        <form action="" method="POST">
            <textarea name="Feedback" rows="4" cols="20">
            </textarea>
            <input type="submit" value="Submit" name="Submit" />

        </form>
        <%
            String text = request.getParameter("Feedback");
            if(text == null){
                out.print("string bos");
            }else {
                usr.sendFeedback(usr.getID(), text);
                out.print("<p>Feedback Sent</p>");
            }
        %>
    </body>
</html>
