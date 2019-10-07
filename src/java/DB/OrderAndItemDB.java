/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import BO.OrderAndItem;
import java.sql.Connection;
import java.sql.PreparedStatement;


public class OrderAndItemDB extends OrderAndItem {
    static Connection con = null;
    public OrderAndItemDB(String OID, String ArtNr, String Name, float TotalPrice) {
        super(OID, ArtNr, Name, TotalPrice);
    }

    public static boolean insertOrderItem(OrderAndItem orderItem) {
        try {
            PreparedStatement ps = null;
            con = DBmanager.connect();
            String insertToItem = "INSERT INTO OrderAndItem (OID, ArtNr, Name, TotalPrice) VALUES(?, ?, ?, ?)";
            ps = con.prepareStatement(insertToItem);
            ps.setString(1, orderItem.getOID());
            ps.setString(2, orderItem.getArtNr());
            ps.setString(3, orderItem.getName());
            ps.setFloat(4, orderItem.getTotalPrice());
            int n = ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

}
