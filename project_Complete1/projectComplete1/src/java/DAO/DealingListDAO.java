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
 * @author Mitto
 */
public class DealingListDAO {

    private static Connection conn = DB.DBconnection.getConnection();

    /**
     *  Method to get receiver
     * @return result set(receiver row)
     */
    public static ResultSet getReciever() {
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT reciever FROM dealinglist");
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(DealingListDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     *  Method to get deal by receiver id
     * @param reciever
     * @return result set (deal row)
     */
    public static ResultSet getDealByReciever(String reciever) {
        try {
            PreparedStatement st = conn.prepareStatement("SELECT senderItem,recieverItem FROM dealinglist WHERE reciever=?");
            st.setString(1, reciever);
            ResultSet rs = st.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(DealingListDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     *  Method to delete deal 
     * @param senderItem
     * @param recieverItem
     * @return success or fail
     */
    public static boolean deleteItemDealed(int senderItem, int recieverItem) {
        try {
            PreparedStatement st = conn.prepareStatement("DELETE FROM dealinglist WHERE senderItem=? or recieverItem=?");
            st.setInt(1, senderItem);
            st.setInt(2, recieverItem);
            st.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DealingListDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    /**
     *  Method to delete item when rejected
     * @param senderItem
     * @param recieverItem
     * @return true or false
     */
    public static boolean deleteItemReject(int senderItem, int recieverItem) {
        try {
            PreparedStatement st = conn.prepareStatement("DELETE FROM dealinglist WHERE senderItem=? AND recieverItem=?");
            st.setInt(1, senderItem);
            st.setInt(2, recieverItem);
            st.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DealingListDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
