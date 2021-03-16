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
import models.item;

/**
 *
 * @author Admin
 */
public class itemDAO {

    public static Connection conn = DBconnection.getConnection();

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

    public static item getItemById(int id) {
        try {
            PreparedStatement st = conn.prepareStatement("SELECT itemID, ownerID, Name, status, description, category, image1,image2,image3,image4 FROM iteminformation WHERE itemID=?");
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                item item = new item(rs.getInt(1), rs.getString(2), rs.getString(3), (rs.getInt(4) == 1) ? true : false, rs.getString(5), rs.getString(6));
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
            PreparedStatement st = conn.prepareStatement("UPDATE iteminformation SET ownerID=?, Name=?, status=?, description=?, category=?,image1=?,image2=?,image3=?,image4=? WHERE itemID=?");
            st.setString(1, item.getOwnerID());
            st.setString(2, item.getName());
            st.setInt(3, item.getStatus());
            st.setString(4, item.getDescription());
            st.setString(5, item.getCategory());
            st.setInt(6, item.getItemID());
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

}
