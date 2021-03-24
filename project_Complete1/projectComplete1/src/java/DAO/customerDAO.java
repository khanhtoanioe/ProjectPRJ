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
 * Class control customer
 *
 * @author Mitto
 */
public class customerDAO {

    /**
     *
     */
    public static Connection conn = DBconnection.getConnection();

    /**
     * Method to insert new customer information to the database
     *
     * @param cus
     * @return boolean value
     */
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

    /**
     * Method to select one customer information by s/he ID
     *
     * @param id
     * @return object of the customer
     */
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

    /**
     * Method to get all the customer
     *
     * @return Result set of the customers
     */
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

    /**
     * Method to edit customer information base on the id card
     *
     * @param cus
     * @return boolean value
     */
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

    /**
     * Method to edit customer information base on the id card
     *
     * @param cus
     * @return boolean value
     */
    public static boolean editCustomerInforNoPass(customer cus) {
        try {
            PreparedStatement st = conn.prepareStatement("UPDATE customer SET name=?,phoneNumber=?,address=?,dateOfBirth=?,email=? where IDCard=?");
            st.setString(1, cus.getName());
            st.setString(2, cus.getPhoneNumber());
            st.setString(3, cus.getAddress());
            st.setString(4, cus.getDateOfBirth());
            st.setString(5, cus.getEmail());
            st.setString(6, cus.getIDCard());
            st.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(customerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    /**
     * Method to get name of the customer base on the id card
     *
     * @param IDCard
     * @return name of the customer
     */
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
