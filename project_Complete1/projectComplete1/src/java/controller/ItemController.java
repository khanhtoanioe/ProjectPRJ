/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.itemDAO;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;
import models.item;

/**
 *
 * @author Asus
 */
public class ItemController extends HttpServlet {

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
            out.println("<title>Servlet ItemController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ItemController at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        if (request.getParameter("btnEditItem") != null) {
            item item1 = new item(Integer.parseInt(request.getParameter("itemID")), request.getParameter("name"), request.getParameter("description"), request.getParameter("category"));
            int count = itemDAO.updateItem(item1);
            response.sendRedirect("/Profile/1111");
        }
//        }
        //  if (true) {
//            response.setContentType("text/html;charset=UTF-8");
//            try (PrintWriter out = response.getWriter()) {
//                /* TODO output your page here. You may use following sample code. */
//                out.println("<!DOCTYPE html>");
//                out.println("<html>");
//                out.println("<head>");
//                out.println("<title>Servlet ProfileController</title>");
//                out.println("</head>");
//                out.println("<body>");
//                out.println("<h1>" + "hello" + "</h1>");
//                out.println("<h1>" + request.getParameter("btnEditItem") != null + "</h1>");
//                out.println("</body>");
//                out.println("</html>");
//            }
        //  }

        //                Part filePart1 = request.getPart("image1");
//                InputStream fileContent1 = filePart1.getInputStream();
//
//                Part filePart2 = request.getPart("image2");
//                InputStream fileContent2 = filePart2.getInputStream();
//
//                Part filePart3 = request.getPart("image3");
//                InputStream fileContent3 = filePart3.getInputStream();
//
//                Part filePart4 = request.getPart("image4");
//                InputStream fileContent4 = filePart4.getInputStream();
//
//                byte[] imageBytes1 = new byte[(int) filePart1.getSize()];
//                fileContent1.read(imageBytes1, 0, imageBytes1.length);
//                fileContent1.close();
//
//                byte[] imageBytes2 = new byte[(int) filePart2.getSize()];
//                fileContent2.read(imageBytes2, 0, imageBytes2.length);
//                fileContent2.close();
//
//                byte[] imageBytes3 = new byte[(int) filePart3.getSize()];
//                fileContent3.read(imageBytes3, 0, imageBytes3.length);
//                fileContent3.close();
//
//                byte[] imageBytes4 = new byte[(int) filePart4.getSize()];
//                fileContent4.read(imageBytes4, 0, imageBytes4.length);
//                fileContent4.close();
//
//                Blob imageBlob1 = new SerialBlob(imageBytes1);
//                Blob imageBlob2 = new SerialBlob(imageBytes2);
//                Blob imageBlob3 = new SerialBlob(imageBytes3);
//                Blob imageBlob4 = new SerialBlob(imageBytes4);
//
//                item.setImage1(imageBlob1);
//                item.setImage2(imageBlob2);
//                item.setImage3(imageBlob3);
//                item.setImage4(imageBlob4);
    }
//            itemDAO.updateItem(item);
//            response.sendRedirect("/Profile/1234");

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
