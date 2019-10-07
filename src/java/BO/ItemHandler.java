/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import java.util.List;
import BO.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ItemHandler {

    public List<Item> getItemsWithGroup(String searchByGroup) {
        List<Item> items = new ArrayList<Item>();
        List<Item> itemsReturn = new ArrayList<Item>();

        try {
            items = Item.searchItemsAfterGroup(searchByGroup);
            for(int i=0;i<items.size();i++)
            {
                itemsReturn.add(new Item(items.get(i).getArtNr(),items.get(i).getname(), items.get(i).getdescription(),items.get(i).getCategory()
                ,items.get(i).getprice(),items.get(i).getQuantity()));
            }
        } catch (IOException ex) {
            Logger.getLogger(ItemHandler.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ItemHandler.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            
            return itemsReturn;

        }
    }

    public List<Item> getItems() {
        List<Item> items = new ArrayList<Item>();
        List<Item> itemsReturn = new ArrayList<Item>();
        try {
            items = Item.getItems();
            for(int i=0;i<items.size();i++)
            {
                itemsReturn.add(new Item(items.get(i).getArtNr(),items.get(i).getname(), items.get(i).getdescription(),items.get(i).getCategory()
                ,items.get(i).getprice(),items.get(i).getQuantity()));
            }
        } catch (Exception ex) {
            Logger.getLogger(ItemHandler.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return itemsReturn;

        }
    }

    public void updateItem(String whatToUpdate, Item item) {
        Item.update(whatToUpdate, item);
    }

    public void removeItem(Item item) {
        Item.removeItem(item);
    }

    public void insertItem(Item item) {
        Item.insertItem(item);
    }

}
