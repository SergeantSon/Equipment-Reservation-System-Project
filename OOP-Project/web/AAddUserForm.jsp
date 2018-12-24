<%-- 
    Document   : AAddUser
    Created on : Dec 24, 2018, 3:50:43 AM
    Author     : brk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add User</title>
    </head>
    <body>
        
        <h1>Enter User Credentials:</h1>

        <form action="AAddUser.jsp" name="Details" method="POST" onsubmit="return isValidForm()">
            <script>
                function isValidForm() {
                    var input = document.getElementById('uId');

                    if (input.value.length == 0) {

                        alert("ID is empty! ");
                        return false;
                    }
                }
            </script>

            <p>User ID:</p>
            <input type="text" id="uId" name="uID" value="" size="15" />
            <br>
            <p>User Password:</p>
            <input type="text" name="uPass" value="" size="15" />
            <br>
            <p>Name:</p>
            <input type="text" name="uName" value="" size="15" />
            <br>
            <p>Surname:</p>
            <input type="text" name="uSurname" value="" size="15" />
            <br>
            <p>Position:</p>
            <input type="text" name="uPosition" value="" size="15" />
            <br>
            <p>Mail</p>
            <input type="text" name="uMail" value="" size="15" />
            <br>
            <p>Phone:</p>
            <input type="text" name="uPhone" value="" size="15" />
            <br>
            <p>Permission Level:</p>
            <input type="text" name="uPerm" value="" size="15" />
            <br>
            <br>
            <input type="submit" value="Submit" name="Submit" onclick="myFunction()"/>
        </form>
    </body>
</html>
