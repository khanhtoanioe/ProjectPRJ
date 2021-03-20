/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.DBconnection;
import java.sql.Connection;

/**
 *
 * @author Admin
 */
public class tranferHistoryDAO {
    public static Connection conn = DBconnection.getConnection();
    
    public static boolean addHistory(){
        return true;
    }
}
