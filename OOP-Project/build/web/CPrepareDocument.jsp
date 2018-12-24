<%-- 
    Document   : FeedbackMenu
    Created on : Dec 16, 2018, 8:48:14 PM
    Author     : brk
--%>

<%@page import="java.util.List"%>
<%@page import="Classes.Equipment"%>
<%@page import="Classes.Clerk"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Document Menu</title>
    </head>
    <body>
        <%
            Clerk clrk = (Clerk) session.getAttribute("instance");
            List<Equipment> eList = (List) session.getAttribute("eList");

            Equipment eqp;
            
            if (request.getParameter("rButton") != null) {
                eqp = eList.get(Integer.parseInt(request.getParameter("rButton")));
                session.setAttribute("eqp", eqp);
            } else {
                eqp = (Equipment) session.getAttribute("eqp");
            }

        %>
        <h1>Prepare Document</h1>

        <form action="" method="GET" onsubmit="return isValidForm()">

            <script>
                function isValidForm() {

                    var input = document.getElementById('Document');

                    if (input.value.length == 0) {

                        alert("Field is empty! ");
                        return false;
                    }
                }
            </script>

            <textarea id="Document" name="Document" rows="4" cols="20"></textarea>

            <input type="submit" value="Submit2" name="Submit2" />

        </form>

        <%            
            String text = request.getParameter("Document");

            if (text != null) {

                clrk.addDocument(text, eqp.getName());
                out.print("<p>Document Added!</p>");
                out.print("<a href=index.jsp> Return </a>");
            }
        %>

    </body>
</html>
