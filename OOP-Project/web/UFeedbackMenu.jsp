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

        <form action="" method="POST" onsubmit="return isValidForm()">

            <script>
                function isValidForm() {
                    
                    var input = document.getElementById('Submit');

                    if (input.value.length == 0) {

                        alert("Field is empty! ");
                        return false;
                    }
                }
            </script>


            <textarea id="Submit" name="Feedback" rows="4" cols="20"></textarea>
            <br>
            <input type="submit" value="Submit" name="Submit" />

        </form>

        <%
            String text = request.getParameter("Feedback");

            if (text != null) {

                usr.sendFeedback(usr.getID(), text);
                out.print("<p>Feedback Sent</p>");
                out.print("<a href=index.jsp> Return </a>");
            }
        %>
        



    </body>
</html>
