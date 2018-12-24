<%-- 
    Document   : ADeleteUserForm
    Created on : Dec 24, 2018, 4:19:16 AM
    Author     : brk
--%>

<%@page import="java.util.List"%>
<%@page import="Classes.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete User</title>
    </head>
    <body>

        <h1>Select a user:</h1>

        <%
            String search = request.getParameter("Search");
            Employee temp = new Employee();

            List<Employee> eList = temp.employeeList(search);
            session.setAttribute("eList", eList);
        %>

        <form name="Send" action="ADeleteUser.jsp" method="POST">

            <table border="1">
                <tbody>
                    <tr>
                        <td>ID:</td>
                        <td>Name:</td>
                        <td>Surname:</td>
                        <td>Position:</td>
                        <td>Mail:</td>
                        <td>Phone:</td>
                        <td>Permission Level:</td>
                        <td>Select:</td>
                    </tr>
                    <%for (int i = 0; i < eList.size(); i++) {%>
                    <tr>
                        <td><%= eList.get(i).getID()%></td>
                        <td><%= eList.get(i).getName()%></td>
                        <td><%= eList.get(i).getSurname()%></td>
                        <td><%= eList.get(i).getPosition()%></td>
                        <td><%= eList.get(i).getMail()%></td>
                        <td><%= eList.get(i).getPhone()%></td>
                        <td><%= eList.get(i).getPermissionLevel()%></td>
                        <td><input type="radio" name="rButton" value="<% out.print(i);%>" /></td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
            <br>
            <input type="submit" value="Submit" name="Submit" />

        </form>

        <form name="search" action="" method="GET">

            <p> Search: </p> 
            <input type="text" name="Search" value="" size="15" />
            <input type="submit" value="Go" />

        </form>
    </body>
</html>
