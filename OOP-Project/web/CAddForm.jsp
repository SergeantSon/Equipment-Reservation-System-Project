<%-- 
    Document   : AddEquipment
    Created on : Dec 17, 2018, 8:44:05 PM
    Author     : brk
--%>

<%@page import="Classes.Clerk"%>
<%@page import="Classes.Employee"%>
<%@page import="Classes.Equipment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Equipment</title>
    </head>
    <body>
        <h1>Enter the details of the equipment: </h1>
        <form action="CAddEquipment.jsp" name="Details" method="POST" onsubmit="return isValidForm()">

            <script>
                function isValidForm() {
                    var input = document.getElementById('eName');

                    if (input.value.length == 0) {

                        alert("Name is empty! ");
                        return false;
                    }
                }
            </script>

            <p>Equipment Name:</p>
            <input type="text" id="eName" name="eName" value="" size="15" />
            <br>
            <p>Equipment Quantity:</p>
            <input type="text" name="eQuantity" value="" size="15" />
            <br>
            <p>Equipment Availability:</p>
            <input type="radio" name="rButton" value="true" checked="checked"/>True
            <input type="radio" name="rButton" value="false" />False
            <br>
            <p>Equipment Document:</p>
            <input type="text" name="eDocument" value="" size="15" />
            <br>
            <br>
            <input type="submit" value="Submit" name="Submit" onclick="myFunction()"/>

        </form>
    </body>
</html>
