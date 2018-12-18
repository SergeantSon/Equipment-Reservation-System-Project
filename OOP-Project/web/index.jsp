<%-- 
    Document   : index
    Created on : Dec 11, 2018, 4:10:21 PM
    Author     : brk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <h1>Enter your ID and Password:</h1>

    <form name="loginForm" action="display.jsp">
        <table border="1">
            <tbody>
                <tr>
                    <td>ID:</td>
                    <td><input type="text" name="ID" value="" size="20"/></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="Password" value="" size="20" /></td>
                </tr>
            </tbody>
        </table>
        <br>
        <input type="submit" value="OK" name="OK" />
    </form>

</html>
