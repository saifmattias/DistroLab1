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
        List<Order> ordersCopy = orders;
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
        List<Order> ordersCopy = orders;
        return ordersCopy;
    }

}
