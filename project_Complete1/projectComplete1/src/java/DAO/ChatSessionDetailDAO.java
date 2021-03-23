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
 * Include method to manage chat
 *
 * @author Mitto
 */
public class ChatSessionDetailDAO {

    private static Connection conn = DB.DBconnection.getConnection();

    /**
     * Add new chat message into the chat session in database
     *
     * @param chatID1
     * @param content
     * @param sendFrom
     * @return variable count to check
     */
    public static int addNewChatContent(int chatID1, String content, String sendFrom) {
        try {
            PreparedStatement st = conn.prepareStatement("Insert into chatsessiondetail(sessionID,content,sendFrom) values (?,?,?)");
            st.setInt(1, chatID1);
            st.setString(2, content);
            st.setString(3, sendFrom);
            int count = st.executeUpdate();
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(ChatSessionDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    /**
     * Method to receive chat message content to display in the chat history
     *
     * @param sessionID
     * @return Result set of chat history
     */
    public static ResultSet getChatContent(int sessionID) {
        try {
            PreparedStatement st = conn.prepareStatement("Select sessionID,timeSendChat,content,sendFrom from chatsessiondetail where sessionID = ? order by timeSendChat");
            st.setInt(1, sessionID);
            ResultSet rs = st.executeQuery();
            // rs.next();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ChatSessionDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * Method to get chat session with other user in the chat history page
     *
     * @param IDCard
     * @return Result set of chat session
     */
    public static ResultSet getChatBox(String IDCard) {
        try {
            PreparedStatement st = conn.prepareStatement("SELECT sessionID, IDCard1,IDCard2 from chatsession where IDCard1=? or IDCard2=?");
            st.setString(1, IDCard);
            st.setString(2, IDCard);
            ResultSet rs = st.executeQuery();
            // rs.next();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ChatSessionDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * Method to get Session ID, chat content, sender, time to display in the
     * chat history
     *
     * @param sessionID
     * @return Result set of chat content
     */
    public static ResultSet getContentPerBox(String sessionID) {
        try {
            PreparedStatement st = conn.prepareStatement("SELECT sessionID, timeSendChat,sendFrom,content  FROM `chatsessiondetail` WHERE chatsessiondetail.sessionID=? and timeSendChat=(SELECT max(timeSendChat) from chatsessiondetail WHERE sessionID=?)");
            st.setString(1, sessionID);
            st.setString(2, sessionID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChatSessionDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
