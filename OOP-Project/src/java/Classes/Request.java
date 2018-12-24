/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author brk
 */
public class Request {

    public int RequestId;
    public String UserID;
    public String eName;
    public Date Date;
    public boolean Approved;

    Database temp = new Database();
    String query;
    ResultSet myresObj;
    List resultList = new LinkedList();

    public Request(int RequestId, String UserID, String eName, Date Date, boolean Approved) {
        this.RequestId = RequestId;
        this.UserID = UserID;
        this.eName = eName;
        this.Date = Date;
        this.Approved = Approved;
    }

    public Request() {
    }

    public int getRequestId() {
        return RequestId;
    }

    public String getUserID() {
        return UserID;
    }

    public String geteName() {
        return eName;
    }

    public Date getDate() {
        return Date;
    }

    public boolean isApproved() {
        return Approved;
    }

    public List requestList() {

        query = " SELECT * FROM BERKE.\"Requests\" Where Approved IS NULL";

        myresObj = temp.showAllResult(query);

        try {

            while (myresObj.next()) {

                Request listElement = new Request(
                        myresObj.getInt("RequestID"),
                        myresObj.getString("UserID"),
                        myresObj.getString("eName"),
                        myresObj.getDate("Date"),
                        myresObj.getBoolean("Approved"));

                resultList.add(listElement);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resultList;
    }

}
