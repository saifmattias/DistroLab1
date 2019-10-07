/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import BO.Item;
import BO.Login;
import BO.Order;
import BO.OrderAndItem;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDB extends Order {

    static Connection con = null;

    public OrderDB() {
        super();
    }

    public static boolean insertOrder(Order order, List<Item> cart) {
        boolean status = false;
        try {
            PreparedStatement ps = null;
            con = DBmanager.connect();
            String insertToItem = "INSERT INTO ordertable (firstname, lastname, ShippingAddress, city,zip, TotalPrice,OrderDate, UID) VALUES(?,?,?,?,?, ?, ?,?)";
            ps = con.prepareStatement(insertToItem);
            ps.setString(1, order.getFirstname());
            ps.setString(2, order.getLastname());
            ps.setString(3, order.getShippingAddress());
            ps.setString(4, order.getCity());
            ps.setString(5, order.getZip());
            ps.setFloat(6, order.getTotalPrice());
            ps.setString(7, order.getOrderDate());
            ps.setInt(8, order.getUID());
            int n = ps.executeUpdate();
            ResultSet rs = ps.executeQuery("SELECT LAST_INSERT_ID() FROM Account");
            rs.next();
            for (int i = 0; i < cart.size(); i++) {
                status = OrderAndItem.insertOrderItem(new OrderAndItem(String.valueOf(rs.getInt(n)), cart.get(i).getArtNr(), cart.get(i).getname(), order.getTotalPrice()));
            }
            return status;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public static List<Order> searchOrder(Login user) throws IOException, SQLException {
        List<Order> v = new ArrayList<>();
        try {
            PreparedStatement ps = null;
            con = DBmanager.connect();
            String test = "SELECT * from ordertable WHERE UID = '" + user.getUID() + "'";
            ps = con.prepareStatement(test);
            ResultSet rs = ps.executeQuery(test);
            while (rs.next()) {
                while (rs.next()) {
                    v.add(new Order(String.valueOf(rs.getInt("OID")), rs.getString("firstname"), rs.getString("lastname"), rs.getString("ShippingAddress"),
                            rs.getString("city"), rs.getString("zip"), rs.getString("OrderDate"), rs.getFloat("TotalPrice"), rs.getString("OrderStatus"), rs.getInt("UID")));
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            return v;
        }
    }

    public static void removeOrder(int OID) {
        try {
            PreparedStatement ps = null;
            con = DBmanager.connect();
            String removeOrder = "UPDATE ordertable SET OrderStatus = 'Canceled' WHERE OID = " + OID;
            ps = con.prepareStatement(removeOrder);
            int n = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static List<Order> getAllOrder() {
        List<Order> v = new ArrayList<>();
        try {
            PreparedStatement ps = null;
            con = DBmanager.connect();
            String test = "SELECT * from ordertable";
            ps = con.prepareStatement(test);
            ResultSet rs = ps.executeQuery(test);
            while (rs.next()) {
                v.add(new Order(String.valueOf(rs.getInt("OID")), rs.getString("firstname"), rs.getString("lastname"), rs.getString("ShippingAddress"),
                        rs.getString("city"), rs.getString("zip"), rs.getString("OrderDate"), rs.getFloat("TotalPrice"), rs.getString("OrderStatus"), rs.getInt("UID")));
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            return v;
        }
    }

    public static List<Order> getAllOrderByID(int UID) {
        List<Order> v = new ArrayList<>();
        try {
            PreparedStatement ps = null;
            con = DBmanager.connect();
            String test = "SELECT * from ordertable where UID=" + UID;
            ps = con.prepareStatement(test);
            ResultSet rs = ps.executeQuery(test);
            while (rs.next()) {
                v.add(new Order(String.valueOf(rs.getInt("OID")), rs.getString("firstname"), rs.getString("lastname"), rs.getString("ShippingAddress"),
                        rs.getString("city"), rs.getString("zip"), rs.getString("OrderDate"), rs.getFloat("TotalPrice"), rs.getString("OrderStatus"), rs.getInt("UID")));
            }
            if (v.size() == 0) {
                System.out.println("häääääst gawad");
                v.add(new Order("0", "Ingen order", "Ingen order", "Ingen order",
                        "Ingen order", "Ingen order", "Ingen order", 0, "Ingen order", 0));
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            
            return v;
        }
    }

    public static void update(String whatToUpdate, int OID) {
        try {
            PreparedStatement ps = null;
            con = DBmanager.connect();
            String update = "UPDATE ordertable SET OrderStatus = '" + whatToUpdate + "' WHERE OID = " + OID;
            ps = con.prepareStatement(update);
            int n = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
