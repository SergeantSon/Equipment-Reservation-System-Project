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
public class Employee{
    
    private String ID;
    private String Password;
    private String Name;
    private String Surname;
    private String Position;
    private String Mail;
    private String Phone;
    private int PermissionLevel;
    
    String query = null;
    ResultSet myresObj;
    List resultList = new LinkedList();

    public Employee(String ID, String Password, String Name, String Surname, String Position, String Mail, String Phone, int PermissionLevel) {
        this.ID = ID;
        this.Password = Password;
        this.Name = Name;
        this.Surname = Surname;
        this.Position = Position;
        this.Mail = Mail;
        this.Phone = Phone;
        this.PermissionLevel = PermissionLevel;
    }

    public Employee() {
    }

    public int getPermissionLevel() {
        return PermissionLevel;
    }

    public String getName() {
        return Name;
    }

    public String getID() {
        return ID;
    }

    public String getPassword() {
        return Password;
    }

    public String getSurname() {
        return Surname;
    }

    public String getPosition() {
        return Position;
    }

    public String getMail() {
        return Mail;
    }

    public String getPhone() {
        return Phone;
    }
    
    public Employee login(String uname, String pwd){
        
        Database temp = new Database();
        Employee permission = temp.loginController(uname, pwd);
        temp = null;
        
        return permission;
    }
    
    public List employeeList(String srch) {

        if (srch == null) {
            query = " SELECT * FROM BERKE.EMPLOYEE";
        } else {
            query = " SELECT * FROM BERKE.EMPLOYEE Where name = '" + srch + "' ";
        }

        Database temp = new Database();
        myresObj = temp.showAllResult(query);

        try {
            while (myresObj.next()) {
                Employee listElement = new Employee(
                        myresObj.getString("ID"),
                        myresObj.getString("PASSWORD"),
                        myresObj.getString("NAME"),
                        myresObj.getString("SURNAME"),
                        myresObj.getString("POSITION"),
                        myresObj.getString("MAIL"),
                        myresObj.getString("PHONE"),
                        myresObj.getInt("PERMISSIONLEVEL"));

                resultList.add(listElement);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resultList;

    }
    
}
