/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import DB.ItemDB;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


public class Item {
    private String artNr, Name, Description, Category;
    private float Price; 
    private int Quantity;

    protected Item(String artNr, String Name, String Description, String Category, float Price) {
        this.artNr = artNr;
        this.Name = Name;
        this.Description = Description;
        this.Category = Category;
        this.Price = Price;
    }

    public Item(String artNr, String Name, String Description, String Category, float Price, int Quantity) {
        this.artNr = artNr;
        this.Name = Name;
        this.Description = Description;
        this.Category = Category;
        this.Price = Price;
        this.Quantity = Quantity;
    }
    static public List<Item> getItems()
    {
        return ItemDB.getAllItems();
    }
    static public void removeItem(Item item){
        ItemDB.removeItem(item);
    }
    
    static public void update(String whatToUpdate, Item item){
        ItemDB.update(whatToUpdate,item);
    }
    public Item getItem()
    {
        return new Item(this.artNr, this.Name, this.Description,this.Category, this.Price);
    }
    static public List<Item> searchItemsAfterGroup(String group) throws IOException, SQLException{
        return ItemDB.searchItemsAfterGroup(group);
    }
    
    static public void insertItem(Item item){
        ItemDB.insertItem(item);
    }
    
    public String getArtNr() {
        return artNr;
    }

    public String getname() {
        return Name;
    }

    public String getdescription() {
        return Description;
    }

    public String getCategory() {
        return Category;
    }

    public float getprice() {
        return Price;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }
    
    
    @Override
    public String toString() {
        return "Item{" + "artNr=" + artNr + ", Name=" + Name + ", Description=" + Description + ", Category=" + Category + ", Price=" + Price + '}';
    }
}
