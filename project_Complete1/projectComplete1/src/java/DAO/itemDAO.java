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
 * Class to manage Item
 *
 * @author Mitto
 */
public class itemDAO {

    public static Connection conn = DBconnection.getConnection();

    /**
     *
     * @param blob
     * @return
     * @throws IOException
     * @throws SQLException
     */
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

    /**
     * Method to get all the item in the database
     *
     * @return Result set of item information
     */
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

    /**
     * Method to get all the a item belong to a certain category
     *
     * @param cat
     * @return Result set of item
     */
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

    /**
     * Method to get all the item belong to a certain user
     *
     * @param userId
     * @return Result set of item
     */
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

    /**
     * Method to get the item with certain id
     *
     * @param id
     * @return the item
     */
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

    /**
     * Method to add new item into the database
     *
     * @param item
     * @return boolean value
     */
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

    /**
     * Method to delete an item by id
     *
     * @param id
     * @return boolean value
     */
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

    /**
     * Method to update information of an item by id
     *
     * @param item1
     * @return count variable to check
     */
    public static int updateItem(item item1) {
        try {
            PreparedStatement st = conn.prepareStatement("UPDATE iteminformation SET Name=?, description=?, category=?,image1=?,image2=?,image3=?,image4=? where itemID=?");
            st.setString(1, item1.getName());
            st.setString(2, item1.getDescription());
            st.setString(3, item1.getCategory());
            st.setBlob(4, item1.getImage1());
            st.setBlob(5, item1.getImage2());
            st.setBlob(6, item1.getImage3());
            st.setBlob(7, item1.getImage4());
            st.setInt(8, item1.getItemID());
            int count = st.executeUpdate();
            if (count > 0) {
                return count;
            }
        } catch (SQLException ex) {
            Logger.getLogger(itemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 36;
    }

    /**
     * Method to get all the category name
     *
     * @return Result set of category name
     */
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

    /**
     * Method to change the item status
     *
     * @param itemID
     * @return boolean value
     */
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

    /**
     * Method to get name of the item by item id
     *
     * @param itemID
     * @return name of the item
     */
    public static String getNameByID(int itemID) {
        try {
            PreparedStatement st = conn.prepareStatement("SELECT `Name` FROM `iteminformation` WHERE itemID=?");
            st.setInt(1, itemID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString("name");
            }
        } catch (SQLException ex) {
            Logger.getLogger(itemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }

}
