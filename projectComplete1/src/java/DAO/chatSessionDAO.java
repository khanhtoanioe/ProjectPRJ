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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Asus
 */
public class chatSessionDAO {

    private static Connection conn = DB.DBconnection.getConnection();

    public static int addNewChat(String id1, String id2) {
        try {
            ResultSet cnt = conn.createStatement().executeQuery("Select COUNT(*) as num from chatsession");
            cnt.next();
            PreparedStatement st = conn.prepareStatement("Insert into chatsession values (?,?,?)");
            st.setString(1, id1);
            st.setString(2, id2);
            st.setInt(3, cnt.getInt("num") + 1);
            int count = st.executeUpdate();
//            int count = cnt.getInt("num");
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(chatSessionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static ResultSet checkChatExist(String id1, String id2) {
        ResultSet check = null;
        try {
            PreparedStatement st = conn.prepareCall("Select sessionID from chatsession where IDCard1=? and IDCard2=? or IDCard1=? and IDCard2=?");
            st.setString(1, id1);
            st.setString(2, id2);
            st.setString(4, id1);
            st.setString(3, id2);
            check = st.executeQuery();
            check.next();
            return check;
        } catch (SQLException ex) {
            Logger.getLogger(chatSessionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
