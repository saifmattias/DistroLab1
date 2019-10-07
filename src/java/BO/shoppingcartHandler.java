/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import java.util.ArrayList;
import java.util.List;


public class shoppingcartHandler {

    public List<Item> doGet_UpdateBuy(List<Item> cartFromSession, Item item, String quantity) {
        int index = isExisting(item.getArtNr(), cartFromSession);
        if (index == -1) {
            cartFromSession.add(item);
        } else {
            cartFromSession.get(index).setQuantity(Integer.parseInt(quantity));
        }
        return cartFromSession;

    }

    public List<Item> doGet_Remove(List<Item> cartFromSession, Item item) {

        int index = isExisting(item.getArtNr(), cartFromSession);
        cartFromSession.remove(index);
        return cartFromSession;

    }

    public List<Item> doGet_Buy(List<Item> cartFromSession, Item item, Boolean statusCart) {
        if (statusCart == false) {
            List<Item> cart = new ArrayList<Item>();
            cart.add(item);
            System.out.println("cart '== null");
            return cart;
        } else {
            int index = isExisting(item.getArtNr(), cartFromSession);
            if (index == -1) {
                cartFromSession.add(item);
            } else {
                int quantity = cartFromSession.get(index).getQuantity() + 1;
                cartFromSession.get(index).setQuantity(quantity);
            }
            return cartFromSession;
        }

    }

    private int isExisting(String ArtNr, List<Item> cart) {
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getItem().getArtNr().equalsIgnoreCase(ArtNr)) {
                return i;
            }
        }
        return -1;
    }

}
