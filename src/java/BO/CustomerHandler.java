/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class CustomerHandler {
    public Customer searchCustomer(String UID) {
         Customer searched = Customer.searchCustomer(Integer.parseInt(UID));
         Customer searchedCopy = searched;
         return searchedCopy;
    }
}
