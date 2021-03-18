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
import models.ChatSessionDetail;

/**
 *
 * @author Asus
 */
public class ChatSessionDetailDAO {

    private static Connection conn = DB.DBconnection.getConnection();

//    public static int addNewChatContent(ChatSessionDetail c) {
//        try {
//            PreparedStatement st = conn.prepareStatement("Insert into chatsessiondetail(sessionID,content,sendFrom) values (?,?,?)");
//            st.setInt(1, c.getChatID());
//            st.setString(2, c.getContent());
//            st.setString(3, c.getSendFrom());
//            int count = st.executeUpdate();
//            return count;
//        } catch (SQLException ex) {
//            Logger.getLogger(ChatSessionDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return 35;
//    }
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
}
