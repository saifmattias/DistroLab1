/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import BO.Login;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class LoginDB extends Login {
    static Connection con = null;
    public LoginDB(String Username, String Password, String usertype) {
        super(Username, Password, usertype);
    }

    public static Login selectLogin(Login login) throws IOException, SQLException {
        Boolean status = false;
        try {
            PreparedStatement ps = null;
            con = DBmanager.connect();
            String selectLogin = "select * from Account where username = '" + login.getUsername() + "'" + " and password = '" + login.getPassword() + "'";
            ps = con.prepareStatement(selectLogin);
            ResultSet rs = ps.executeQuery(selectLogin);
            status = rs.next();
            if(status==true)
            {
                return new Login(rs.getInt("UID"),rs.getString("UserType"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return null;
    }

    public static int insertLogin(Login login) {
        int UID=0;
        try {
            PreparedStatement ps = null;
            con = DBmanager.connect();
            String insertToLogin = "INSERT INTO Account (Username, Password, UserType) VALUES(?, ?, ?)";
            ps = con.prepareStatement(insertToLogin);
            ps.setString(1, login.getUsername());
            ps.setString(2, login.getPassword());
            ps.setString(3, "Customer");
            int n = ps.executeUpdate();
            ResultSet rs = ps.executeQuery("SELECT LAST_INSERT_ID() FROM Account");
            rs.next();
            UID = rs.getInt(n);
        } catch (Exception e) {
            System.out.println(e);
        }
        return UID;
    }

}
