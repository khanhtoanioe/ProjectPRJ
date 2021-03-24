/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.customerDAO;
import DAO.itemDAO;
import DAO.rateDAO;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;
import models.customer;
import models.item;
import models.rate;

/**
 *
 * @author Asus
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 1000,
        maxRequestSize = 1024 * 1024 * 1000)
public class ProfileController extends HttpServlet {

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
            out.println("<title>Servlet ProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileController at " + request.getContextPath() + "</h1>");
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
        HttpSession ss1, ss2;
        String URI = request.getRequestURI();
        if (URI.contains("/UserItem/Delete")) {
            String URISplit[] = URI.split("/");
            String id = URISplit[URISplit.length - 1];
            itemDAO.deleteById(Integer.parseInt(id));
            response.sendRedirect("/Profile/" + URISplit[URISplit.length - 4]);
        } else if (URI.contains("/UserItem/Edit")) {
            String URISplit[] = URI.split("/");
            String id = URISplit[URISplit.length - 1];
            item it = itemDAO.getItemById(Integer.parseInt(id));
            if (it == null) {
                response.sendRedirect("/Profile/" + URISplit[URISplit.length - 4]);
            } else {
                ss1 = request.getSession();
                ss1.setAttribute("item", it);
                request.getRequestDispatcher("/editItem.jsp").forward(request, response);
            }
        } else if (URI.startsWith(getServletContext().getContextPath() + "/Profile/")) {
            String URISplit[] = URI.split("/");
            String id = URISplit[URISplit.length - 1];
            customer user = customerDAO.getCustomerByID(id);
            if (user == null) {
                response.sendRedirect("/");
            } else {
                ss2 = request.getSession();
                ss2.setAttribute("user", user);
                request.getRequestDispatcher("/user-profile.jsp").forward(request, response);
            }
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
    @Override
    //đang test cái edit, làm hoài vẫn ko đc
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String IDCard, passWord, name, phoneNumber, address, dateOfBirth, email;
        String itemName, des, cat;
        Blob image1, image2, image3;
        if (request.getParameter("btnEditUser") != null) {
            customer cus = null;
            IDCard = request.getParameter("txtID");
            
            name = request.getParameter("txtName");
            phoneNumber = request.getParameter("txtPhone");
            address = request.getParameter("txtAddress");
            dateOfBirth = request.getParameter("txtBirth");
            email = request.getParameter("txtEmail");
            passWord = request.getParameter("txtPwd");
            if (passWord.isEmpty()) {
                cus = new customer(IDCard, name, phoneNumber, address, dateOfBirth, email);
                customerDAO.editCustomerInforNoPass(cus);
            } else {
                cus = new customer(IDCard, passWord, name, phoneNumber, address, dateOfBirth, email);
                customerDAO.editCustomerInfor(cus);
            }
            
            response.sendRedirect("/Profile/" + IDCard);
        }
        if (request.getParameter("btnRate") != null) {
            HttpSession session = request.getSession();
            String rater = (String) session.getAttribute("IDcard");
            rate r = new rate(request.getParameter("id"), rater, request.getParameter("txtRate"), request.getParameter("txtCmt"));
            if (rateDAO.addComment(r)) {
                response.sendRedirect("/Profile/" + request.getParameter("id"));
            } else {
                PrintWriter out = response.getWriter();
                out.write("<h1>you have rate this trader, you can not rate again</h1>");
            }
            
        }
        
        if (request.getParameter("btnEditItem") != null) {
            item item1 = new item();
            item1.setName(request.getParameter("name"));
            item1.setCategory(request.getParameter("category"));
            item1.setDescription(request.getParameter("description"));
            item1.setOwnerID(request.getParameter("itemOwnerID"));
            item1.setItemID(Integer.parseInt(request.getParameter("itemID")));
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
                
                item1.setImage1(imageBlob1);
                item1.setImage2(imageBlob2);
                item1.setImage3(imageBlob3);
                item1.setImage4(imageBlob4);
            } catch (SQLException ex) {
                Logger.getLogger(customerController.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                int count = itemDAO.updateItem(item1);
                response.sendRedirect("/Profile/" + request.getParameter("itemOwnerID"));
            } catch (Exception e) {
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
