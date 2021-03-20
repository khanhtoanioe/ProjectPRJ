/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.DBconnection;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.item;

/**
 *
 * @author Admin
 */
public class itemDAO {

    public static Connection conn = DBconnection.getConnection();

    public static String getImageString(Blob blob) throws IOException, SQLException {
        InputStream inputStream = blob.getBinaryStream();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
        byte[] imageBytes = outputStream.toByteArray();
        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
        inputStream.close();
        outputStream.close();
        return base64Image;
    }

    public static ResultSet getAllItem() {
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT itemID, ownerID, Name, status, description,category,image1,image2,image3,image4 FROM iteminformation");
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(itemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static ResultSet getItemByCategory(String cat) {
        try {
            PreparedStatement st = conn.prepareStatement("SELECT itemID, ownerID, Name, status, description, category, image1,image2,image3,image4 FROM iteminformation WHERE category=?");
            st.setString(1, cat);
            ResultSet rs = st.executeQuery();

            return rs;

        } catch (SQLException ex) {
            Logger.getLogger(itemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static ResultSet getUserItem(int userId) {
        try {
            PreparedStatement st = conn.prepareStatement("Select itemID,ownerID, Name,status, description, category, image1,image2,image3,image4 from iteminformation where ownerID =? and status = 0 ");
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(itemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static item getItemById(int id) {
        try {
            PreparedStatement st = conn.prepareStatement("SELECT itemID, ownerID, Name, status, description, category, image1,image2,image3,image4 FROM iteminformation WHERE itemID=?");
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                item item = new item(rs.getInt(1), rs.getString(2), rs.getString(3), (rs.getInt(4) == 1) ? true : false, rs.getString(5), rs.getString(6), rs.getBlob(7), rs.getBlob(8), rs.getBlob(9), rs.getBlob(10));
                return item;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(itemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static boolean addItem(item item) {
        try {
            PreparedStatement st = conn.prepareStatement("INSERT INTO iteminformation VALUES(?,?,?,?,?,?,?,?,?,?)");
            st.setInt(1, item.getItemID());
            st.setString(2, item.getOwnerID());
            st.setString(3, item.getName());
            st.setInt(4, item.getStatus());
            st.setString(5, item.getDescription());
            st.setString(6, item.getCategory());
            st.setBlob(7, item.getImage1());
            st.setBlob(8, item.getImage2());
            st.setBlob(9, item.getImage3());
            st.setBlob(10, item.getImage4());
            st.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(itemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static boolean deleteById(int id) {
        try {
            PreparedStatement st = conn.prepareStatement("DELETE FROM iteminformation WHERE itemID=?");
            st.setInt(1, id);
            st.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(itemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static boolean updateItem(item item) {
        try {
            PreparedStatement st = conn.prepareStatement("UPDATE iteminformation SET Name=?, description=?, category=?,image1=?,image2=?,image3=?,image4=? WHERE itemID=?");
            st.setString(1, item.getName());
            st.setString(2, item.getDescription());
            st.setString(3, item.getCategory());
            st.setBlob(4, item.getImage1());
            st.setBlob(5, item.getImage2());
            st.setBlob(6, item.getImage3());
            st.setBlob(7, item.getImage4());
            st.setInt(8, item.getItemID());
            st.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(itemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static ResultSet getAllCategory() {
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT catName FROM category");
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(itemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static boolean changeItemState(int itemID) {
        try {
            PreparedStatement st = conn.prepareStatement("UPDATE iteminformation SET status = 1 WHERE iteminformation.itemID = ? ");
            st.setInt(1, itemID);
            st.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(itemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
