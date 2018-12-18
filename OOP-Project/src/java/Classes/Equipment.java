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
public class Equipment {

    private String Name;
    private boolean Availability;
    private int Quantity;
    private String Document;

    private String query;
    List resultList = new LinkedList();

    public Equipment(String Name, boolean Availability, int Quantity, String Document) {
        this.Name = Name;
        this.Availability = Availability;
        this.Quantity = Quantity;
        this.Document = Document;
    }

    public Equipment() {
    }

    public String getName() {
        return Name;
    }

    public boolean isAvailability() {
        return Availability;
    }

    public int getQuantity() {
        return Quantity;
    }

    public String getDocument() {
        return Document;
    }

    public void setDocument(String Document) {
        this.Document = Document;
    }

    @Override
    public String toString() {
        return "Equipment{" + "Name=" + Name + ", Availability=" + Availability + ", Quantity=" + Quantity + '}';
    }

    public List equipmentList(String search) {

        if (search == null) {
            query = " SELECT * FROM BERKE.EQUIPMENT Where availability = true ";
        } else {
            query = " SELECT * FROM BERKE.EQUIPMENT Where availability = true AND name = '" + search + "'";
        }

        Database temp = new Database();
        ResultSet myresObj = temp.showAllResult(query);

        if (resultList.isEmpty() == true) {

            try {

                while (myresObj.next()) {

                    Equipment listElement = new Equipment(
                            myresObj.getString("NAME"),
                            myresObj.getBoolean("AVAILABILITY"),
                            myresObj.getInt("QUANTITY"),
                            myresObj.getString("DOCUMENT"));

                    resultList.add(listElement);

                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

        return resultList;
    }

}
