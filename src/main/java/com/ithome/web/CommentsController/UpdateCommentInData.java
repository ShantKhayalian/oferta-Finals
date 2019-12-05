package com.ithome.web.CommentsController;

import com.ithome.web.AdminDao.AgriculturalCreditDao;
import com.ithome.web.AdminDao.BanksDaoController;
import com.ithome.web.AdminDao.CommentDaoComtroller;
import com.ithome.web.AdminDao.CurrancyDao;
import com.ithome.web.Bean.*;
import com.ithome.web.Helpers.AdminChecker;
import com.ithome.web.Helpers.SessionChecker;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/UpdateCommentInData")
public class UpdateCommentInData extends HttpServlet {
    private SessionChecker checker = new SessionChecker();
    private String username = null;
    private AdminChecker adminChecker = new AdminChecker();
    private int adminId = 0;
    private List<Admin> adminList = new ArrayList<>();
    private int productCode = 0;
    private String comment1Am = null;
    private String comment2Am = null;
    private String comment3Am = null;
    private String comment1En = null;
    private String comment2En = null;
    private String comment3En = null;
    private String comment1Ru = null;
    private String comment2Ru = null;
    private String comment3Ru = null;
    private CommentDaoComtroller commentDaoComtroller = new CommentDaoComtroller();
    private List<Comments> commentsList = new ArrayList<>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            updateCommentInData(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            updateCommentInData(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void updateCommentInData(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        request.setCharacterEncoding("UTF-8");
        sessionControlling(request, response);
        getAdminInfo(request, response);
        getParameters(request);
        updateCommentsInData(createNewAGInData(),request,response,productCode);
    }

    private void updateCommentsInData(int newAGInData, HttpServletRequest request, HttpServletResponse response, int productCode) throws ServletException, IOException, SQLException {
        if (newAGInData == 0) {
            String message = "Ինչ-որ սխալ տեղի ունեցավ, փորձեք կրկին";
            getCommentsDetailByProductCode(productCode);
            setRequestToCommentsUpdatePage(request);
            goBackToErrorPage(request, response, message);
        } else {
            String message = "ձեր թարմացումը հաջող է";
            getCommentsDetailByProductCode(productCode);
            setRequestToCommentsUpdatePage(request);
            gotoNextPage(request,response,message);
        }
    }

    private void gotoNextPage(HttpServletRequest request, HttpServletResponse response, String message) throws ServletException, IOException {
        request.setAttribute("message", message);
        request.getRequestDispatcher("/WEB-INF/Results.jsp").forward(request, response);
    }

    private void goBackToErrorPage(HttpServletRequest request, HttpServletResponse response, String message) throws ServletException, IOException {
        request.setAttribute("message", message);
        request.getRequestDispatcher("/WEB-INF/UpdateComments.jsp").forward(request, response);
    }

    private void setRequestToCommentsUpdatePage(HttpServletRequest request) {
        request.setAttribute("username", username);
        request.setAttribute("adminId", adminId);
        request.setAttribute("adminFullInfo", adminList);
        request.setAttribute("commentsList", commentsList);
    }

    private void getCommentsDetailByProductCode(int productCode) throws SQLException {
        commentsList = commentDaoComtroller.getCommentByProdcutCode(productCode);
    }


    private int createNewAGInData() throws SQLException {
        return commentDaoComtroller.updateAgInData(prepaireCommentToData(),productCode);
    }

    private Comments prepaireCommentToData() {
        return new Comments(comment1Am,comment2Am,comment3Am,comment1En,comment2En,comment3En,comment1Ru,comment2Ru,comment3Ru);
    }

    private void getParameters(HttpServletRequest request) {
        comment1Am = request.getParameter("comment1Am");
        comment2Am = request.getParameter("comment2Am");
        comment3Am = request.getParameter("comment3Am");
        comment1En = request.getParameter("comment1En");
        comment2En = request.getParameter("comment2En");
        comment3En = request.getParameter("comment3En");
        comment1Ru = request.getParameter("comment1Ru");
        comment2Ru = request.getParameter("comment2Ru");
        comment3Ru = request.getParameter("comment3Ru");
        productCode = Integer.parseInt(request.getParameter("productCode"));
    }

    /**
     * Controlling the session for admin using helper classes
     *
     * @param request
     * @param response
     * @throws IOException
     */
    private void sessionControlling(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        getSession(session, request, response);
    }

    /**
     * Fill admin in list with the specific id
     *
     * @param adminid
     */
    private void getFullAdminList(int adminid) {
        adminList = adminChecker.getAllInfoofAdmin(adminid);
    }

    /**
     * get admin admin id by username from session
     *
     * @param request
     * @param response
     */
    private void getAdminInfo(HttpServletRequest request, HttpServletResponse response) {
        adminId = adminChecker.getAdminId(username);
        getFullAdminList(adminId);
    }

    /**
     * Session of uadmin if no session true send to login page else get the seesion key
     *
     * @param session
     * @param request
     * @param response
     * @throws IOException
     */
    private void getSession(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (checker.checkSession(request, response)) {
            username = checker.requestSessionofAdmin(session);
        } else {
            response.sendRedirect("/admin/SignIn.jsp");
        }
    }
}



