/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.DBconnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class tranferHistoryDAO {

    public static Connection conn = DBconnection.getConnection();

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
}
