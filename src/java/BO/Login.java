/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import DB.LoginDB;
import java.io.IOException;
import java.sql.SQLException;


public class Login {
    private int UID;
    private String Username, Password, usertype;

    public Login(String Username, String Password, String usertype) {
        this.Username = Username;
        this.Password = Password;
        this.usertype = usertype;
    }

    public Login(String Username, String Password) {
        this.Username = Username;
        this.Password = Password;
    }

    public Login(int UID, String usertype) {
        this.UID = UID;
        this.usertype = usertype;
    }
    
    static public Login selectLogin(Login login) throws IOException, SQLException{
        return LoginDB.selectLogin(login);
    }
    
    static public int insertLogin(Login login){
        return LoginDB.insertLogin(login);
    }

    public int getUID() {
        return UID;
    }

    public String getUsername() {
        return Username;
    }

    public String getPassword() {
        return Password;
    }

    public String getUsertype() {
        return usertype;
    }

    @Override
    public String toString() {
        return "Login{" + "UID=" + UID + ", Username=" + Username + ", Password=" + Password + ", usertype=" + usertype + '}';
    }
    
    
}
