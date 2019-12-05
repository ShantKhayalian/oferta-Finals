package com.ithome.web.SearchController;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/ajax")
public class AjaxServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        Gson gson = new Gson();
        String term = request.getParameter("term");
        ProductModel productModel = null;
        try {
            productModel = new ProductModel();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        PrintWriter out = response.getWriter();

        out.print(gson.toJson(productModel.search(term, request, response)));

        out.flush();
        out.close();
    }
}
