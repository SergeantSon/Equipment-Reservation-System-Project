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
public class Admin extends Employee{

    public Admin(String ID, String Password, String Name, String Surname, String Position, String Mail, String Phone, int PermissionLevel) {
        super(ID, Password, Name, Surname, Position, Mail, Phone, PermissionLevel);
    }

    public Admin() {
    }
    
}
