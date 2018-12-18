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
public class Employee{
    
    private String ID;
    private String Password;
    private String Name;
    private String Surname;
    private String Position;
    private String Mail;
    private String Phone;
    private int PermissionLevel;

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
    
    public Employee login(String uname, String pwd){
        
        Database temp = new Database();
        Employee permission = temp.loginController(uname, pwd);
        temp = null;
        
        return permission;
    }
}
