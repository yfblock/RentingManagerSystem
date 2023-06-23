package cn.edu.haust.renting.servlet;

import cn.edu.haust.renting.entity.House;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DetailsServlet", value = "/details", loadOnStartup = 1)
public class DetailsServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Integer id = Integer.valueOf(req.getParameter("id"));
            req.setAttribute("id", id);
            House house = houseInterface.getHouseById(id);
            if(house == null) {
                return;
            }
            req.setAttribute("house", house);
            this.forward("details.jsp", req, resp);
        } catch (NumberFormatException | SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
