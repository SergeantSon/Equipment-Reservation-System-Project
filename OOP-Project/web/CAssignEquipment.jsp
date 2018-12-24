<%-- 
    Document   : CAssignEquipment
    Created on : Dec 23, 2018, 6:06:55 AM
    Author     : brk
--%>

<%@page import="Classes.Clerk"%>
<%@page import="java.util.List"%>
<%@page import="Classes.Request"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Equipment</title>
    </head>

    <form>

        <body>
            <%
                Clerk clrk = (Clerk) session.getAttribute("instance");

                Request temp = new Request();
                List<Request> rList = (List) session.getAttribute("rList");
                String rrr = request.getParameter("cButton");
                temp = rList.get(Integer.parseInt(rrr.substring(rrr.indexOf(" ") + 1)));

                clrk.assignEquipment(temp.RequestId, temp.geteName(), Boolean.parseBoolean(rrr.substring(0, rrr.indexOf(" "))));
            %>

            <p>Success!</p>
            <a href=index.jsp> Return </a>

        </body>
</html>
