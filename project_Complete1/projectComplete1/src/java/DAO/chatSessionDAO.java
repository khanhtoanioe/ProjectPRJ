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
 * Class control chat session
 *
 * @author Mitto
 */
public class chatSessionDAO {

    private static Connection conn = DB.DBconnection.getConnection();

    /**
     * Method to add new chat session with user to the database
     *
     * @param id1
     * @param id2
     * @return variable count to check
     */
    public static int addNewChat(String id1, String id2) {
        try {
            PreparedStatement st = conn.prepareStatement("Insert into chatsession (IDCard1,IDCard2) values (?,?)");
            st.setString(1, id1);
            st.setString(2, id2);
            int count = st.executeUpdate();
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(chatSessionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    /**
     * Me thod to check if user 1 have ever talk to user 2 in order to add new
     * chat session
     *
     * @param id1
     * @param id2
     * @return session id of user 1 and user 2
     */
    public static int checkChatExist(String id1, String id2) {
        ResultSet check = null;
        try {
            PreparedStatement st = conn.prepareCall("Select sessionID from chatsession where IDCard1=? and IDCard2=? or IDCard1=? and IDCard2=?");
            st.setString(1, id1);
            st.setString(2, id2);
            st.setString(4, id1);
            st.setString(3, id2);
            check = st.executeQuery();
            if (check.next()) {
                return check.getInt("sessionID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(chatSessionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
