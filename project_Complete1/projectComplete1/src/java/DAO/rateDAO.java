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
import java.util.logging.Level;
import java.util.logging.Logger;
import models.rate;

/**
 * Class to control the rating
 *
 * @author Mitto
 */
public class rateDAO {

    /**
     *
     */
    public static Connection conn = DBconnection.getConnection();

    /**
     * Method to add new comment from user
     *
     * @param r
     * @return boolean value
     */
    public static boolean addComment(rate r) {
        try {
            if (r.getIDRated().equals(r.getIDRater())) { //tranh truong hop rate cho chinh minh
                return false;
            }
            PreparedStatement st = conn.prepareStatement("INSERT INTO rate (IDRated,IDRater,rateStar,rateComment)  values(?,?,?,?)");
            st.setString(1, r.getIDRated());
            st.setString(2, r.getIDRater());
            st.setInt(3, Integer.parseInt(r.getRateStar()));
            st.setString(4, r.getRateComment());
//            if (st.execute()) {
//                return true;
//            }
            st.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(rateDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    /**
     * Method to get the user who rate and all the information of the rating by
     * the user who are rated
     *
     * @param id
     * @return Result set of rating
     */
    public static ResultSet getAllInforByIDRated(String id) {
        try {
            PreparedStatement st = conn.prepareStatement("SELECT IDRater,rateStar, rateComment,dateComment from rate where IDRated=?");
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(rateDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * Method to check if user 1 has ever rate for user 2
     *
     * @param idRater
     * @param idRated
     * @return the number
     */
    public static int checkRated(String idRater, String idRated) {
        try {
            PreparedStatement st = conn.prepareStatement("SELECT COUNT(*) as num  FROM `rate` WHERE IDRater=? and IDRated=?");
            st.setString(1, idRater);
            st.setString(2, idRated);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("num");
            }
        } catch (SQLException ex) {
            Logger.getLogger(rateDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
