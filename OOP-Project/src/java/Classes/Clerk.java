package Classes;

import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author brk
 */
public class Clerk extends Employee {

    Database temp = new Database();
    String query;
    ResultSet rSet;

    public Clerk(String ID, String Password, String Name, String Surname, String Position, String Mail, String Phone, int PermissionLevel) {
        super(ID, Password, Name, Surname, Position, Mail, Phone, PermissionLevel);
    }

    public Clerk() {
    }

    /////////////////////////////////////
    public void addEquipment(String Name, int Quantity, boolean Availability, String Document) {
        query = "INSERT INTO BERKE.EQUIPMENT (\"NAME\", QUANTITY, AVAILABILITY, DOCUMENT) VALUES ('" + Name + "', " + Quantity + ", " + Availability + ", '" + Document + "')";
        temp.queryMachine(query);
    }

    public void deleteEquipment(String Name) {
        query = "DELETE FROM BERKE.EQUIPMENT WHERE \"NAME\" = '" + Name + "'";
        temp.queryMachine(query);
    }

    public void addDocument(String text, String Name) {
        query = " UPDATE BERKE.EQUIPMENT SET \"DOCUMENT\" = '" + text + "' WHERE \"NAME\" = '" + Name + "' ";
        temp.queryMachine(query);
    }

    public void assignEquipment(int rId, String eName, boolean slctn) {

        if (slctn == false) {

            query = "UPDATE BERKE.\"Requests\" SET \"APPROVED\" = false WHERE \"RequestID\" = " + rId + "";
            temp.queryMachine(query);
        } else if (slctn == true){

            query = "Select Quantity From BERKE.\"EQUIPMENT\" Where Name = '" + eName + "' ";
            rSet = temp.showAllResult(query);

            try {

                while (rSet.next()) {

                    int a = rSet.getInt("Quantity");
                    if (a > 1) {
                        query = "UPDATE BERKE.\"Requests\" SET \"APPROVED\" = true WHERE \"RequestID\" = " + rId + "";
                        temp.queryMachine(query);
                        query = " UPDATE BERKE.EQUIPMENT SET \"QUANTITY\" = QUANTITY - 1 WHERE \"NAME\" = '" + eName + "' ";
                        temp.queryMachine(query);
                    } else {
                        query = "UPDATE BERKE.\"Requests\" SET \"APPROVED\" = true WHERE \"RequestID\" = " + rId + "";
                        temp.queryMachine(query);
                        query = " UPDATE BERKE.EQUIPMENT SET \"QUANTITY\" = 0, \"AVAILABILITY\" = false WHERE \"NAME\" = '" + eName + "' ";
                        temp.queryMachine(query);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
    /////////////////////////////////////
}
