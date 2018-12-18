package Classes;

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

    public Clerk(String ID, String Password, String Name, String Surname, String Position, String Mail, String Phone, int PermissionLevel) {
        super(ID, Password, Name, Surname, Position, Mail, Phone, PermissionLevel);
    }

    public Clerk() {
    }

    public void addEquipment(String Name, int Quantity, boolean Availability, String Document) {
        query = "INSERT INTO BERKE.EQUIPMENT (\"NAME\", QUANTITY, AVAILABILITY, DOCUMENT) VALUES ('" + Name + "', " + Quantity + ", " + Availability + ", '" + Document + "')";
        temp.addToDatabase(query);
    }
}
