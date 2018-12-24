package Classes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author brk
 */
public class User extends Employee {
    
    Database temp = new Database();
    List rList = new LinkedList();
    ResultSet rSet;

    String query = null;

    public User() {
    }

    public User(String ID, String Password, String Name, String Surname, String Position, String Mail, String Phone, int PermissionLevel) {
        super(ID, Password, Name, Surname, Position, Mail, Phone, PermissionLevel);
    }

    public void sendReservationRequest(String tId, String eName) {

        query = "INSERT INTO BERKE.\"Requests\" (\"UserID\", \"eName\", \"Date\")  VALUES ('" + tId + "', '" + eName + "', CURRENT_DATE)";
        temp.queryMachine(query);
        temp = null;
    }

    public void sendFeedback(String tId, String text) {

        query = "INSERT INTO BERKE.FEEDBACK (\"UserName\", \"Date\", FEEDBACK) VALUES ('" + tId + "', CURRENT_DATE, '" + text + "')";
        temp.queryMachine(query);
        temp = null;
    }

    public List search(String input) {

        if (input == null) {
            query = " SELECT * FROM BERKE.EQUIPMENT where availability = true ";
        } else {
            query = "Select * From BERKE.Equipment Where Availability = true AND name = '" + input + "' ";
        }

        Database temp2 = new Database();
        rSet = temp2.showAllResult(query);

        try {
            while (rSet.next()) {
                Equipment listElement = new Equipment(
                        rSet.getString("NAME"),
                        rSet.getBoolean("AVAILABILITY"),
                        rSet.getInt("QUANTITY"),
                        rSet.getString("DOCUMENT"));

                rList.add(listElement);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rList;
    }

}
