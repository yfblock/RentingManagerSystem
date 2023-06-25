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
        String title = req.getParameter("title");
        String type = req.getParameter("type");
        req.setAttribute("type", 0);
        try {
            if(title != null) {
                req.setAttribute("houses", houseInterface.findHouseByName(title));
            } else if(type != null && type.equals("1")) {
                req.setAttribute("type", 1);
                req.setAttribute("houses", houseInterface.findHouseByOrder(0));
            } else if(type != null && type.equals("2")) {
                req.setAttribute("type", 2);
                req.setAttribute("houses", houseInterface.findHouseByOrder(1));
            } else {
                req.setAttribute("houses", houseInterface.getHouses());
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        this.forward("index.jsp", req, resp);
    }
}
