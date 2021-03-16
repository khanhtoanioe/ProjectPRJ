/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.customerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.customer;

/**
 *
 * @author Admin
 */
public class customerController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet customerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet customerController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //check neu co cookie thi chuyen qua mainPage (lay cookie ben login.jsp roi day qua bang get)
        if(request.getParameter("IDcard") != null){
            HttpSession session = request.getSession();
            session.setAttribute("IDcard", request.getParameter("IDcard"));
            request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
        }
        String URI = request.getRequestURI();
        if(URI.endsWith("/customer/signUp")){
            request.getRequestDispatcher("/signUp.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static String getMd5(String input) {
        try {

            // Static getInstance method is called with hashing MD5 
            MessageDigest md = MessageDigest.getInstance("MD5");

            // digest() method is called to calculate message digest 
            //  of an input digest() return array of byte 
            byte[] messageDigest = md.digest(input.getBytes());

            // Convert byte array into signum representation 
            BigInteger no = new BigInteger(1, messageDigest);

            // Convert message digest into hex value 
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } // For specifying wrong message digest algorithms 
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //doan nay de check login
        if (request.getParameter("btnLogin") != null) {
            String IDcard = request.getParameter("IDcard");
            String password = request.getParameter("password");
            customer cus = customerDAO.getCustomerByID(IDcard);
            if(cus == null){
                request.getRequestDispatcher("/login.jsp?login='false'").forward(request, response);
            }else{
                if(IDcard.equals(cus.getIDCard()) && getMd5(password).equals(cus.getPassWord())){
                    
                    if(request.getParameter("remember") != null && request.getParameter("remember").equals("remember-me")){
                        Cookie cookie = new Cookie("IDcard",IDcard);
                        cookie.setMaxAge(60);
                        response.addCookie(cookie);
                    }
                    HttpSession session = request.getSession();
                    session.setAttribute("IDcard", IDcard);
                    request.getRequestDispatcher("mainPage.jsp").forward(request, response);
                }else{
                    request.getRequestDispatcher("/login.jsp?login='false'").forward(request, response);
                }
            }
        }
       //doan nay de dang ky tai khoan moi
       if(request.getParameter("btnSignUp") != null){
           customer cus = new customer();
           cus.setIDCard(request.getParameter("IDcard"));
           cus.setAddress(request.getParameter("address"));
           cus.setDateOfBirth(request.getParameter("dateOfBirth"));
           cus.setEmail(request.getParameter("email"));
           cus.setPhoneNumber(request.getParameter("phoneNumber"));
           cus.setPassWord(getMd5(request.getParameter("passWord")));
           cus.setName(request.getParameter("name"));
           
           try{
               customerDAO.addCustomer(cus);
               request.getRequestDispatcher("/login.jsp").forward(request, response);
           }catch(Exception e){
               request.getRequestDispatcher("/signUp.jsp").include(request, response);
               PrintWriter out = response.getWriter();
               out.write("<h1>ID card has been used, please use another</h1>");
           }
           
       }
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
