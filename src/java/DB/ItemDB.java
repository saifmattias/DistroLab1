/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import BO.Item;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Vector;


public class ItemDB extends Item {
    static Connection con = null;
    public ItemDB(String artNr, String Name, String Description, String Category, float Price, int quantity) {
        super(artNr, Name, Description, Category, Price, quantity);
    }

    public static List<Item> searchItemsAfterGroup(String group) throws IOException, SQLException {
        List<Item> v = new ArrayList<>();
        try {
            PreparedStatement ps = null;
            con = DBmanager.connect();
            String test = "SELECT * from item WHERE Category = '" + group + "'";
            ps = con.prepareStatement(test);
            ResultSet rs = ps.executeQuery(test);
            while (rs.next()) {
                String i = rs.getString("artNr");
                String name = rs.getString("Name");
                String des = rs.getString("Description");
                String cat = rs.getString("Category");
                float pr = rs.getFloat("Price");
                int qu = rs.getInt("Quantity");
                v.add(new ItemDB(i, name, des, cat, pr, qu));
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            return v;
        }
    }
    public static void insertItem(Item item) {
        try {
            PreparedStatement ps = null;
            con = DBmanager.connect();
            String insertToItem = "INSERT INTO Item (ArtNr, Name, Description, Category, Price, Quantity) VALUES(?, ?, ?, ?, ?,?)";
            ps = con.prepareStatement(insertToItem);
            ps.setString(1, item.getArtNr());
            ps.setString(2, item.getname());
            ps.setString(3, item.getdescription());
            ps.setString(4, item.getCategory());
            ps.setFloat(5, item.getprice());
            ps.setInt(6, item.getQuantity());
            int n = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static List<Item> getAllItems() {
        List<Item> v = new ArrayList<>();
        try {
            PreparedStatement ps = null;
            con = DBmanager.connect();
            String test = "SELECT * from item";
            ps = con.prepareStatement(test);
            ResultSet rs = ps.executeQuery(test);
            while (rs.next()) {
                String i = rs.getString("artNr");
                String name = rs.getString("Name");
                String des = rs.getString("Description");
                String cat = rs.getString("Category");
                float pr = rs.getFloat("Price");
                int qu = rs.getInt("Quantity");
                v.add(new ItemDB(i, name, des, cat, pr, qu));
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            return v;
        }
    }

    public static void removeItem(Item item) {
        try {
            PreparedStatement ps = null;
            con = DBmanager.connect();
            String removeItem = "DELETE FROM Item WHERE artNr ='" + item.getArtNr() + "'";
            ps = con.prepareStatement(removeItem);
            int n = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public static void update(String whatToUpdate, Item item) {
        try {
            PreparedStatement ps = null;
            con = DBmanager.connect();
            String update = null;
            if (whatToUpdate.equals("price")) {
                update = "UPDATE Item SET price = " + item.getprice() + " WHERE artNr = '" + item.getArtNr() + "'";
            }
            if (whatToUpdate.equals("Quantity")) {
                update = "UPDATE Item SET Quantity = " + item.getQuantity() + " WHERE artNr = '" + item.getArtNr() + "'";
            }
            ps = con.prepareStatement(update);
            int n = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
