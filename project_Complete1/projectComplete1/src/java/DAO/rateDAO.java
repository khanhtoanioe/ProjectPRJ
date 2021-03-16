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
 *
 * @author Admin
 */
public class rateDAO {

    public static Connection conn = DBconnection.getConnection();

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
}
