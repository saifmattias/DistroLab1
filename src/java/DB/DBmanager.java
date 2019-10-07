/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import java.io.IOException;
import java.sql.*;


public class DBmanager {

    private static Connection con = null;
    private ResultSet rs = null;
    private PreparedStatement pstmt = null;

    public static Connection connect() throws IOException, SQLException {
        try {
            System.out.println("Detta körs i DBManager");
            Class.forName("com.mysql.cj.jdbc.Driver");
             con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/webshopDB?serverTimezone=UTC", "root", "Skolan645");
            System.out.println("Connected!");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Connect ger error");
            System.out.println(e);
        }
        return con;
    }
}
