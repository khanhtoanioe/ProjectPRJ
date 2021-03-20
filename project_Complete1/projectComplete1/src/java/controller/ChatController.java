
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.ChatSessionDetailDAO;
import DAO.chatSessionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.ChatSessionDetail;

/**
 *
 * @author Asus
 */
public class ChatController extends HttpServlet {

    HttpSession session;
    String idCard2;
    int chatID;

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
            out.println("<title>Servlet ChatController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChatController at " + request.getContextPath() + "</h1>");
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
        int count;
        String URI = request.getRequestURI();
        String URISplit[] = URI.split("/");
        if (URI.startsWith(getServletContext().getContextPath() + "/Chat/")) {
            session = request.getSession();
            String idCard1 = (String) session.getAttribute("IDcard");
            idCard2 = URISplit[URISplit.length - 1];

            chatID = chatSessionDAO.checkChatExist(idCard1, idCard2);

            if (chatID == 0) {
                count = chatSessionDAO.addNewChat(idCard1, idCard2);
                chatID = chatSessionDAO.checkChatExist(idCard1, idCard2);
                ResultSet csd = ChatSessionDetailDAO.getChatContent(chatID);
                HttpSession ss = request.getSession();
                ss.setAttribute("content", csd);
                request.getRequestDispatcher("/chat.jsp").forward(request, response);
            } else {
                ResultSet csd = ChatSessionDetailDAO.getChatContent(chatID);
                HttpSession ss = request.getSession();
                ss.setAttribute("content", csd);
                request.getRequestDispatcher("/chat.jsp").forward(request, response);
            }
//            response.setContentType("text/html;charset=UTF-8");
//            try (PrintWriter out = response.getWriter()) {
//                /* TODO output your page here. You may use following sample code. */
//                out.println("<!DOCTYPE html>");
//                out.println("<html>");
//                out.println("<head>");
//                out.println("<title>Servlet ChatController</title>");
//                out.println("</head>");
//                out.println("<body>");
//                out.println("<h1>" + idCard1 + "<h1>");
//                out.println("<h1>" + idCard2 + "<h1>");
//                out.println("<h1>" + chatID + "<h1>");
////                out.println("<h1>" + count + "<h1>");
//                out.println("</body>");
//                out.println("</html>");
//            }
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
        String btn = null;
        String sendFrom, content;
        int chatID1;
        btn = request.getParameter("btnNewChat");
        if (btn != null) {
            content = request.getParameter("txtChat");
            if (content.isEmpty()) {
                response.sendRedirect("/Chat/" + idCard2);
            } else {
                sendFrom = (String) session.getAttribute("IDcard");

//                ChatSessionDetail dt = new ChatSessionDetail(chatID1, content, sendFrom);
                int count = ChatSessionDetailDAO.addNewChatContent(chatID, content, sendFrom);
//                response.setContentType("text/html;charset=UTF-8");
//                try (PrintWriter out = response.getWriter()) {
//                    /* TODO output your page here. You may use following sample code. */
//                    out.println("<!DOCTYPE html>");
//                    out.println("<html>");
//                    out.println("<head>");
//                    out.println("<title>Servlet ChatController</title>");
//                    out.println("</head>");
//                    out.println("<body>");
//                    out.println("<h1>" + content + "<h1>");
//                    out.println("<h1>" + sendFrom + "<h1>");
//                    out.println("<h1>" + idCard2 + "<h1>");
//                    out.println("<h1>" + chatID + "<h1>");
//                    out.println("<h1>" + count + "<h1>");
//                    out.println("</body>");
//                    out.println("</html>");
//                }
                if (count > 0) {
                    response.sendRedirect("/Chat/" + idCard2);
                }
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
