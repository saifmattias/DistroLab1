/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import java.util.List;

public class OrderHandler {

    public boolean orderInsert(List<Item> cart, Order order) {
        boolean status = Order.insertOrder(order, cart);
        return status;
    }

    public List<Order> getAllOrder() {
        List<Order> orders = Order.getOrders();
        List<Order> ordersCopy = null ;
        for (int i = 0; i < orders.size(); i++) {
            ordersCopy.add(new Order(orders.get(i).getOID(),orders.get(i).getFirstname(),orders.get(i).getLastname(),orders.get(i).getShippingAddress()
            ,orders.get(i).getCity(),orders.get(i).getZip(),orders.get(i).getOrderDate(),orders.get(i).getTotalPrice(),orders.get(i).getStatus(),orders.get(i).getUID()));
        }
        return ordersCopy;
    }

    public void removeOrder(int OID) {
        Order.removeOrder(OID);
    }

    public void updateOrder(String whatToUpdate, int OID) {
        Order.update(whatToUpdate, OID);
    }

    public List<Order> getAllOrderByID(int UID) {
        List<Order> orders = Order.getOrdersByID(UID);
        List<Order> ordersCopy = null;
        System.out.println("hejsan " + orders.toString());
        for (int i = 0; i < orders.size(); i++) {
            ordersCopy.add(new Order(orders.get(i).getOID(),orders.get(i).getFirstname(),orders.get(i).getLastname(),orders.get(i).getShippingAddress()
            ,orders.get(i).getCity(),orders.get(i).getZip(),orders.get(i).getOrderDate(),orders.get(i).getTotalPrice(),orders.get(i).getStatus(),orders.get(i).getUID()));
        }
        return ordersCopy;
    }

}
