package cn.edu.haust.renting.servlet;

import cn.edu.haust.renting.entity.User;
import cn.edu.haust.renting.result.Result;
import cn.edu.haust.renting.utils.UserUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AdminServlet", value = "/admin", loadOnStartup = 1)
public class AdminServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.forward("admin.jsp", req, resp);
    }
}
