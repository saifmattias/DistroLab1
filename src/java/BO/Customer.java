/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import DB.CustomerDB;
import java.util.List;

public class Customer {
    private int CID, UID;
    private String Name, Lastname, Address, City, Zip;

    public Customer(String Name, String Lastname, String Address, String City, String Zip) {
        this.Name = Name;
        this.Lastname = Lastname;
        this.Address = Address;
        this.City = City;
        this.Zip = Zip;
    }

    public Customer(int CID, String Name, String Lastname, String Address, String City, String Zip) {
        this.CID = CID;
        this.Name = Name;
        this.Lastname = Lastname;
        this.Address = Address;
        this.City = City;
        this.Zip = Zip;
    }
    
    
    static public Customer searchCustomer(int customerUID) {
        return CustomerDB.searchCustomer(customerUID);
    }
    
    static public void insertCustomer(Customer customer, int uid){
        CustomerDB.insertCustomer(customer, uid);
    }
    public int getCID() {
        return CID;
    }

    public String getName() {
        return Name;
    }

    public String getLastname() {
        return Lastname;
    }

    public String getAddress() {
        return Address;
    }

    public String getCity() {
        return City;
    }

    public String getZip() {
        return Zip;
    }

    @Override
    public String toString() {
        return "Customer{" + "CID=" + CID + ", Name=" + Name + ", Lastname=" + Lastname + ", Address=" + Address + ", City=" + City + ", Zip=" + Zip + '}';
    }
   

}
