/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import DB.OrderAndItemDB;


public class OrderAndItem {

    private String OID, ArtNr, Name;
    private float TotalPrice;

    public OrderAndItem(String OID, String ArtNr, String Name, float TotalPrice) {
        this.OID = OID;
        this.ArtNr = ArtNr;
        this.Name = Name;
        this.TotalPrice = TotalPrice;
    }

    static public boolean insertOrderItem(OrderAndItem orderItem) {
        return OrderAndItemDB.insertOrderItem(orderItem);
    }

    public String getOID() {
        return OID;
    }

    public String getArtNr() {
        return ArtNr;
    }

    public String getName() {
        return Name;
    }

    public float getTotalPrice() {
        return TotalPrice;
    }

    @Override
    public String toString() {
        return "OrderAndItem{" + "OID=" + OID + ", ArtNr=" + ArtNr + ", Name=" + Name + ", TotalPrice=" + TotalPrice + '}';
    }
}
