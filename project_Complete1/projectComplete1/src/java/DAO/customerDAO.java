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
import models.customer;

/**
 *
 * @author Admin
 */
public class customerDAO {

    public static Connection conn = DBconnection.getConnection();

    public static boolean addCustomer(customer cus) {
        try {
            PreparedStatement st = conn.prepareStatement("INSERT INTO customer VALUES (?,?,?,?,?,?,?)");
            st.setString(1, cus.getIDCard());
            st.setString(2, cus.getPassWord());
            st.setString(3, cus.getName());
            st.setString(4, cus.getPhoneNumber());
            st.setString(5, cus.getAddress());
            st.setString(6, cus.getDateOfBirth());
            st.setString(7, cus.getEmail());

            st.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(customerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static customer getCustomerByID(String id) {
        try {
            PreparedStatement st = conn.prepareStatement("Select passWord,name,phoneNumber,address,dateOfBirth,email from customer where IDCard=?");
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                customer cus = new customer(id, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
                return cus;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(customerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static ResultSet getAllCustomer() {
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("Select IDCard,passWord,name,phoneNumber,address,dateOfBirth,email from customer");
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(customerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static boolean editCustomerInfor(customer cus) {
        try {
            PreparedStatement st = conn.prepareStatement("UPDATE customer SET passWord=md5(?),name=?,phoneNumber=?,address=?,dateOfBirth=?,email=? where IDCard=?");
            st.setString(1, cus.getPassWord());
            st.setString(2, cus.getName());
            st.setString(3, cus.getPhoneNumber());
            st.setString(4, cus.getAddress());
            st.setString(5, cus.getDateOfBirth());
            st.setString(6, cus.getEmail());
            st.setString(7, cus.getIDCard());
            st.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(customerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static String getName(String IDCard) {
        try {
            PreparedStatement st = conn.prepareStatement("SELECT name from customer where IDCard=?");
            st.setString(1, IDCard);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString("name");
            }
        } catch (SQLException ex) {
            Logger.getLogger(customerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
