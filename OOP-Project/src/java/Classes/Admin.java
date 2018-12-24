package Classes;

import java.sql.ResultSet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author brk
 */
public class Admin extends Employee {

    Database temp = new Database();

    String query = null;

    public Admin(String ID, String Password, String Name, String Surname, String Position, String Mail, String Phone, int PermissionLevel) {
        super(ID, Password, Name, Surname, Position, Mail, Phone, PermissionLevel);
    }

    public Admin() {
    }

    public void addUser(Employee emp) {
        query = " INSERT INTO BERKE.EMPLOYEE (ID, PASSWORD, \"NAME\", SURNAME, \"POSITION\", MAIL, PHONE, PERMISSIONLEVEL) VALUES ('" + emp.getID() + "', '" + emp.getPassword() + "', '" + emp.getName() + "', '" + emp.getSurname() + "', '" + emp.getPosition() + "', '" + emp.getMail() + "', '" + emp.getPhone() + "', " + emp.getPermissionLevel() + ") ";
        temp.queryMachine(query);
        temp = null;
    }

    public void deleteUser(String uID) {
        query = "DELETE FROM BERKE.EMPLOYEE WHERE \"ID\" = '" + uID + "'";
        temp.queryMachine(query);
    }

    public ResultSet viewFeedback() {
        query = " SELECT * FROM BERKE.FEEDBACK ";
        return temp.showAllResult(query);
    }

    public void setPermissionLevel(String uID, int pLevel) {
        query = " UPDATE BERKE.EMPLOYEE SET \"PERMISSIONLEVEL\" = " + pLevel + "  WHERE ID = '" + uID + "' ";
        temp.queryMachine(query);
    }
}
