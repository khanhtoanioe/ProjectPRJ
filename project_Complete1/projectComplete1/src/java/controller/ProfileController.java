/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.customerDAO;
import DAO.itemDAO;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
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
 * @author Asus
 */
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
            request.getRequestDispatcher("/user-profile.jsp").forward(request, response);
        } else if (URI.contains("/UserItem/Edit")) {
            String URISplit[] = URI.split("/");
            String id = URISplit[URISplit.length - 1];
            item it = itemDAO.getItemById(Integer.parseInt(id));
            if (it == null) {
                response.sendRedirect("/Profile");
            } else {
                ss1 = request.getSession();
                ss1.setAttribute("item", it);
                request.getRequestDispatcher("/editItem.jsp").forward(request, response);
            }
        } else if (URI.startsWith(getServletContext().getContextPath() + "/Profile/")) {
            String URISplit[] = URI.split("/");
            String id = URISplit[URISplit.length - 1];
            customer user = customerDAO.getCustomerByID(id);
            ss2 = request.getSession();
            ss2.setAttribute("user", user);
            request.getRequestDispatcher("/user-profile.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String IDCard, passWord, name, phoneNumber, address, dateOfBirth, email;
        String itemName, des, cat;
        Blob image1, image2, image3;

        if (request.getParameter("btnEdit") != null) {
            IDCard = request.getParameter("txtID");
            passWord = request.getParameter("txtPwd");
            name = request.getParameter("txtName");
            phoneNumber = request.getParameter("txtPhone");
            address = request.getParameter("txtAddress");
            dateOfBirth = request.getParameter("txtBirth");
            email = request.getParameter("txtEmail");
            customer cus = new customer(IDCard, passWord, name, phoneNumber, address, dateOfBirth, email);
            customerDAO.editCustomerInfor(cus);
            request.getRequestDispatcher("/user-profile.jsp").forward(request, response);
        }
        if (request.getParameter("btnEditItem") != null) {
            item item = new item();

            item.setName(request.getParameter("name"));
            item.setCategory(request.getParameter("category"));
            item.setDescription(request.getParameter("description"));

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
                Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
            }
            try{
                itemDAO.updateItem(item);
                request.getRequestDispatcher("/user-profile.jsp").forward(request, response);
            }catch(Exception e){
                
            }
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ProfileController</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>"+ btn2+ "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }

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
