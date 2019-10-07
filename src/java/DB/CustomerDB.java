/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import BO.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class CustomerDB extends Customer {
    static Connection con = null;
    public static Customer searchCustomer(int customerUID) {
        Customer v = null;
        try {
            PreparedStatement ps = null;
            con = DBmanager.connect();
            String test = "SELECT * from customer WHERE UID = " + customerUID + "";
            ps = con.prepareStatement(test);
            ResultSet rs = ps.executeQuery(test);
            while (rs.next()) {
                int i = rs.getInt("CID");
                String name = rs.getString("Name");
                String lName = rs.getString("Lastname");
                String add = rs.getString("Address");
                String city = rs.getString("City");
                String zip = rs.getString("Zip");
                v = new Customer(i, name, lName, add, city, zip);
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            return v;
        }
    }

    public static void insertCustomer(Customer customer, int uid) {
        try {
            PreparedStatement ps = null;
            con = DBmanager.connect();
            String insertToItem = "INSERT INTO Customer (Name, Lastname, Address, City, Zip, UID) VALUES(?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(insertToItem);
            ps.setString(1, customer.getName());
            ps.setString(2, customer.getLastname());
            ps.setString(3, customer.getAddress());
            ps.setString(4, customer.getCity());
            ps.setString(5, customer.getZip());
            ps.setInt(6, uid);
            int n = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public CustomerDB(String Name, String Lastname, String Address, String City, String Zip) {
        super(Name, Lastname, Address, City, Zip);
    }

}
