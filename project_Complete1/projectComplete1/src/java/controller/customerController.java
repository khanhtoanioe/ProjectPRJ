/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.customerDAO;
import DAO.itemDAO;
import DAO.tranferHistoryDAO;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;
import models.customer;
import models.item;

/**
 *
 * @author Admin
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 1000,
        maxRequestSize = 1024 * 1024 * 1000)
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
        if (request.getParameter("IDcard") != null) {
            HttpSession session = request.getSession();
            session.setAttribute("IDcard", request.getParameter("IDcard"));
            request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
        }
        String URI = request.getRequestURI();
        if (URI.endsWith("/customer/signUp")) {
            request.getRequestDispatcher("/signUp.jsp").forward(request, response);
        }
        if (URI.endsWith("/customer/uploadItem")) {
            request.getRequestDispatcher("/uploadItem.jsp").forward(request, response);
        }
        if (URI.startsWith( getServletContext().getContextPath() +"/customer/viewProduct" )){
            request.getRequestDispatcher("/product-detail.jsp?itemID="+request.getParameter("itemID")).forward(request, response);
        }
        if (URI.startsWith(getServletContext().getContextPath() + "/customer/sendDeal")){
            int recieverItem = Integer.parseInt(request.getParameter("itemID"));
            String reciever = itemDAO.getItemById(recieverItem).getOwnerID();
            request.getRequestDispatcher("/formMakeDeal.jsp?recieverItem="+recieverItem+"&reciever="+reciever).forward(request, response);
        }
        if(URI.startsWith(getServletContext().getContextPath() + "/customer/dealSuccess")){
            request.getRequestDispatcher("/dealSent.jsp").forward(request, response);
        }
        if(URI.startsWith(getServletContext().getContextPath() + "/customer/home")){
            request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
        }
        if(URI.startsWith(getServletContext().getContextPath() + "/customer/notiDeal")){
            request.getRequestDispatcher("/notification.jsp").forward(request, response);
        }
        if(URI.startsWith(getServletContext().getContextPath() + "/customer/RejectDeal")){
            DAO.DealingListDAO.deleteItemReject(Integer.parseInt(request.getParameter("senderItem")), Integer.parseInt( request.getParameter("recieverItem")));
            request.getRequestDispatcher( getServletContext().getContextPath() + "/customer/notiDeal").forward(request, response);
        }
        if(URI.startsWith(getServletContext().getContextPath() + "/customer/AcceptDeal")){
            DAO.DealingListDAO.deleteItemDealed(Integer.parseInt(request.getParameter("senderItem")), Integer.parseInt( request.getParameter("recieverItem")));
            
            int senderItem =Integer.parseInt(request.getParameter("senderItem"));
            int recieverItem = Integer.parseInt( request.getParameter("recieverItem"));
            
            tranferHistoryDAO.addHistory(itemDAO.getItemById(senderItem).getOwnerID(), senderItem, itemDAO.getItemById(recieverItem).getOwnerID() , recieverItem); 
            
            itemDAO.changeItemState(senderItem);
            itemDAO.changeItemState(recieverItem);               
            request.getRequestDispatcher("/notification.jsp").forward(request, response);
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
            if (cus == null) {
                request.getRequestDispatcher("/login.jsp?login='false'").forward(request, response);
            } else {
                if (IDcard.equals(cus.getIDCard()) && getMd5(password).equals(cus.getPassWord())) {

                    if (request.getParameter("remember") != null && request.getParameter("remember").equals("remember-me")) {
                        Cookie cookie = new Cookie("IDcard", IDcard);
                        cookie.setMaxAge(60);
                        response.addCookie(cookie);
                    }
                    HttpSession session = request.getSession();
                    session.setAttribute("IDcard", IDcard);
                    request.getRequestDispatcher("mainPage.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("/login.jsp?login='false'").forward(request, response);
                }
            }
        }
        //doan nay de dang ky tai khoan moi
        if (request.getParameter("btnSignUp") != null) {
            customer cus = new customer();
            cus.setIDCard(request.getParameter("IDcard"));
            cus.setAddress(request.getParameter("address"));
            cus.setDateOfBirth(request.getParameter("dateOfBirth"));
            cus.setEmail(request.getParameter("email"));
            cus.setPhoneNumber(request.getParameter("phoneNumber"));
            cus.setPassWord(getMd5(request.getParameter("passWord")));
            cus.setName(request.getParameter("name"));

            try {
                customerDAO.addCustomer(cus);
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } catch (Exception e) {
                request.getRequestDispatcher("/signUp.jsp").include(request, response);
                PrintWriter out = response.getWriter();
                out.write("<h1>ID card has been used, please use another</h1>");
            }

        }
        //doan nay de upload item
        if (request.getParameter("btnUploadItem") != null) {
            HttpSession session = request.getSession();
            item item = new item();

            item.setName(request.getParameter("name"));
            item.setCategory(request.getParameter("category"));
            item.setDescription(request.getParameter("description"));
            item.setOwnerID(session.getAttribute("IDcard").toString());

            Part filePart1 = request.getPart("image1");
            InputStream fileContent1 = filePart1.getInputStream();

            Part filePart2 = request.getPart("image2");
            InputStream fileContent2 = filePart2.getInputStream();

            Part filePart3 = request.getPart("image3");
            InputStream fileContent3 = filePart3.getInputStream();

            Part filePart4 = request.getPart("image4");
            InputStream fileContent4 = filePart4.getInputStream();

            byte[] imageBytes1 = new byte[(int) filePart1.getSize()];
            fileContent1.read(imageBytes1, 0, imageBytes1.length);
            fileContent1.close();

            byte[] imageBytes2 = new byte[(int) filePart2.getSize()];
            fileContent2.read(imageBytes2, 0, imageBytes2.length);
            fileContent2.close();

            byte[] imageBytes3 = new byte[(int) filePart3.getSize()];
            fileContent3.read(imageBytes3, 0, imageBytes3.length);
            fileContent3.close();

            byte[] imageBytes4 = new byte[(int) filePart4.getSize()];
            fileContent4.read(imageBytes4, 0, imageBytes4.length);
            fileContent4.close();

            try {
                Blob imageBlob1 = new SerialBlob(imageBytes1);
                Blob imageBlob2 = new SerialBlob(imageBytes2);
                Blob imageBlob3 = new SerialBlob(imageBytes3);
                Blob imageBlob4 = new SerialBlob(imageBytes4);

                item.setImage1(imageBlob1);
                item.setImage2(imageBlob2);
                item.setImage3(imageBlob3);
                item.setImage4(imageBlob4);
            } catch (SQLException ex) {
                Logger.getLogger(customerController.class.getName()).log(Level.SEVERE, null, ex);
            }
            try{
                itemDAO.addItem(item);
                request.getRequestDispatcher("/upload-successful.jsp").forward(request, response);
            }catch(Exception e){
                
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
