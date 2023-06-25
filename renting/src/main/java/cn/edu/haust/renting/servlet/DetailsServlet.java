package cn.edu.haust.renting.servlet;

import cn.edu.haust.renting.entity.House;
import cn.edu.haust.renting.result.Result;

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

    @Override
    protected Result<?> handlePost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        String idStr = req.getParameter("id");
        if(idStr == null) {
            return new Result<>(false, "参数异常", null);
        }
        Integer id = Integer.valueOf(idStr);
        House house = houseInterface.getHouseById(id);
        if(house == null) {
            return new Result<>(false, "房屋资产不存在", null);
        }
        if(house.getOrdered() != 0) {
            return new Result<>(false, "房屋已被租赁", null);
        }
        houseInterface.toOrderById(id);
        return new Result<>(true, "租赁成功", null);
    }
}
