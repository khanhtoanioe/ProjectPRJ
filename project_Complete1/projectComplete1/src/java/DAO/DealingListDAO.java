/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DealingListDAO {
    
    private static Connection conn = DB.DBconnection.getConnection();
    
    public static ResultSet getReciever(){
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT reciever FROM dealinglist");
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(DealingListDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static ResultSet getDealByReciever(String reciever ){
        try {
            PreparedStatement st = conn.prepareStatement("SELECT senderItem,recieverItem WHERE reciever=?");
            st.setString(1, reciever);
            ResultSet rs = st.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(DealingListDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
