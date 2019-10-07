/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class LoginHandler {
    
     public Login validate(String user, String pwd) {
         Login userValidate = null;
         Login userValidateCopy = null;
        try {
            userValidate = Login.selectLogin(new Login(user,pwd));
            userValidateCopy = new Login(userValidate.getUID(),userValidate.getUsertype());
        } catch (IOException ex) {
            Logger.getLogger(ItemHandler.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ItemHandler.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return userValidateCopy;
        }
    }
    public void createUser(Login login, Customer customer)
    {
        int uid = Login.insertLogin(login);
        Customer.insertCustomer(customer, uid);
    }
}
