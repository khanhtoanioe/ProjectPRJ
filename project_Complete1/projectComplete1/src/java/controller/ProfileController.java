/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.customerDAO;
import DAO.itemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
        String btn1,btn2 = null;
        String IDCard, passWord, name, phoneNumber, address, dateOfBirth, email;
        btn1 = request.getParameter("btnEdit");
        btn2 = request.getParameter("btnEditItem");
        if (btn1 != null) {
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
        if (btn2!=null){
            
        
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
