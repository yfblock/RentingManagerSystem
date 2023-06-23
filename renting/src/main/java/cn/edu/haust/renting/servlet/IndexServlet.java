package cn.edu.haust.renting.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "IndexServlet", urlPatterns = {"", "/index"}, loadOnStartup = 1)
public class IndexServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setAttribute("houses", houseInterface.getHouses());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        this.forward("index.jsp", req, resp);
    }
}
