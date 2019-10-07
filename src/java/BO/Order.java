/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import DB.OrderDB;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;


public class Order {

    private String OID, firstname,lastname, ShippingAddress, city,zip, status;
    private String OrderDate;
    private float TotalPrice;
    private int UID;

    public Order(String OID, String firstname, String lastname, String ShippingAddress, String city, String zip, String OrderDate, float TotalPrice,String status, int UID) {
        this.OID=OID;
        this.firstname = firstname;
        this.lastname = lastname;
        this.ShippingAddress = ShippingAddress;
        this.city = city;
        this.zip = zip;
        this.OrderDate = OrderDate;
        this.TotalPrice = TotalPrice;
        this.status = status;
        this.UID = UID;
    }

    public String getStatus() {
        return status;
    }
    
    static public List<Order> searchOrder(Login user) throws IOException, SQLException {
        return OrderDB.searchOrder(user);
    }
    static public List<Order> getOrders() {
        return OrderDB.getAllOrder();
    }
     static public List<Order> getOrdersByID(int uid) {
        return OrderDB.getAllOrderByID(uid);
    }
    public Order() {
    }

    static public boolean insertOrder(Order order, List<Item> cart) {
        return OrderDB.insertOrder(order, cart);
    }
    static public void removeOrder(int OID) {
         OrderDB.removeOrder(OID);
    }
    static public void update(String whatToUpdate, int OID){
        OrderDB.update(whatToUpdate,OID);
    }
    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public String getCity() {
        return city;
    }

    public String getZip() {
        return zip;
    }
    
    public String getOID() {
        return OID;
    }

    public String getShippingAddress() {
        return ShippingAddress;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public float getTotalPrice() {
        return TotalPrice;
    }

    public int getUID() {
        return UID;
    }

    @Override
    public String toString() {
        return "Order{" + "OID=" + OID + ", ShippingAddress=" + ShippingAddress + ", OrderDate=" + OrderDate + ", TotalPrice=" + TotalPrice + ", UID=" + UID + '}';
    }

}
