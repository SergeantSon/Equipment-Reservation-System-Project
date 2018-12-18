/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author brk
 */
public class Database {

    Employee newEmployee;
    String id = null;
    String query = null;

    PreparedStatement myStatement = null;
    Connection myconObj = null;
    Statement mystatObj = null;
    ResultSet myresObj = null;

    public Database() {
        try {
            myconObj = DriverManager.getConnection("jdbc:derby://localhost:1527/ProjectDB", "berke", "aaqq1234");
            mystatObj = myconObj.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addToDatabase(String query) {
        try {
            myStatement = myconObj.prepareStatement(query);
            myStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ResultSet showAllResult(String Query) {
        try {
            myresObj = mystatObj.executeQuery(Query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return myresObj;
    }

    public Employee loginController(String tId, String tPwd) {

        try {
            query = "Select * From BERKE.EMPLOYEE";
            myresObj = showAllResult(query);
            ////////////////////////////////
            OUTER:
            while (myresObj.next()) {
                if (tId.equals(myresObj.getString("ID")) && tPwd.equals(myresObj.getString("PASSWORD"))) {

                    switch (myresObj.getInt("PERMISSIONLEVEL")) {
                        case 1:
                            newEmployee = new User(
                                    myresObj.getString("ID"),
                                    myresObj.getString("PASSWORD"),
                                    myresObj.getString("NAME"),
                                    myresObj.getString("SURNAME"),
                                    myresObj.getString("POSITION"),
                                    myresObj.getString("MAIL"),
                                    myresObj.getString("PHONE"),
                                    myresObj.getInt("PERMISSIONLEVEL"));
                            break OUTER;
                        case 2:
                            newEmployee = new Clerk(
                                    myresObj.getString("ID"),
                                    myresObj.getString("PASSWORD"),
                                    myresObj.getString("NAME"),
                                    myresObj.getString("SURNAME"),
                                    myresObj.getString("POSITION"),
                                    myresObj.getString("MAIL"),
                                    myresObj.getString("PHONE"),
                                    myresObj.getInt("PERMISSIONLEVEL"));
                            break OUTER;
                        case 3:
                            newEmployee = new Admin(
                                    myresObj.getString("ID"),
                                    myresObj.getString("PASSWORD"),
                                    myresObj.getString("NAME"),
                                    myresObj.getString("SURNAME"),
                                    myresObj.getString("POSITION"),
                                    myresObj.getString("MAIL"),
                                    myresObj.getString("PHONE"),
                                    myresObj.getInt("PERMISSIONLEVEL"));
                            break OUTER;
                        default:
                            break;

                    }
                } else {
                    newEmployee = new Employee();
                }
            }
            ////////////////////////////////
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return newEmployee;
    }

}
