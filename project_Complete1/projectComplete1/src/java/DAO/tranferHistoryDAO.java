/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.DBconnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Class control transfer history
 *
 * @author Mitto
 */
public class tranferHistoryDAO {

    /**
     *
     */
    public static Connection conn = DBconnection.getConnection();

    /**
     * Method to add new transaction to the transfer history
     *
     * @param firstCus
     * @param firsItem
     * @param secondCus
     * @param secondItem
     * @return boolean value
     */
    public static boolean addHistory(String firstCus, int firsItem, String secondCus, int secondItem) {
        try {
            PreparedStatement st = conn.prepareStatement("INSERT INTO tranferhistory (firstCustomer, secondCustomer, firstItem, secondItem) VALUES(?,?,?,?) ");
            st.setString(1, firstCus);
            st.setString(2, secondCus);
            st.setInt(3, firsItem);
            st.setInt(4, secondItem);
            st.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(tranferHistoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    /**
     * Method to get all the transfer history
     *
     * @return Result set of Deal ID, time Deal, first Customer, second
     * Customer, first Item, second Item
     */
    public static ResultSet getAllHistory() {
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT DealID, timeDeal, firstCustomer,secondCustomer,firstItem,secondItem FROM tranferhistory");
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(tranferHistoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * Method to get deal id
     *
     * @param id1
     * @param id2
     * @return deal id
     */
    public static int checkHistory(String id1, String id2) {
        ResultSet check = null;
        try {
            PreparedStatement st = conn.prepareCall("SELECT DealID FROM `tranferhistory` WHERE firstCustomer =? and secondCustomer=? or secondCustomer=? and firstCustomer=?");
            st.setString(1, id1);
            st.setString(2, id2);
            st.setString(3, id1);
            st.setString(4, id2);
            check = st.executeQuery();
            if (check.next()) {
                return check.getInt("DealID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(tranferHistoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;

    }
}
