package cn.edu.haust.renting.servlet;

import cn.edu.haust.renting.dao.HouseInterface;
import cn.edu.haust.renting.dao.UserInterface;
import cn.edu.haust.renting.result.Result;
import com.alibaba.fastjson.JSON;
import io.github.yfblock.yfSql.Sql.BasicDataSource;
import io.github.yfblock.yfSql.Utils.DataRunnerUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;

public class BaseServlet extends HttpServlet {
    protected UserInterface userInterface;
    protected HouseInterface houseInterface;
    protected DataSource dataSource;
    @Override
    public void init() {
        dataSource = new BasicDataSource("com.mysql.cj.jdbc.Driver", "jdbc:mysql://127.0.0.1:3306/rent?useUnicode=true&characterEncoding=utf8&useSSL=false", "root", "123456");
        userInterface = DataRunnerUtil.getWrapper(UserInterface.class, dataSource);
        houseInterface = DataRunnerUtil.getWrapper(HouseInterface.class, dataSource);
    }

    @Override
    public void destroy() {
        super.destroy();
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String path = req.getRequestURI();
        System.out.println(path);
        if(path.lastIndexOf("/login") == -1 && !path.equals("/") && session.getAttribute("user") == null) {
            resp.sendRedirect("/login");
            return;
        }
        session.setAttribute("user", session.getAttribute("user"));
        super.service(req, resp);
    }

    protected void forward(String path, HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {
        req.setAttribute("originPath", req.getAttribute(RequestDispatcher.FORWARD_REQUEST_URI));
        req.getRequestDispatcher("WEB-INF/template/" + path).forward(req, rep);
    }

    protected <T> void json(T t, HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().print(JSON.toJSONString(t));
    }

    protected Result<?> handlePost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        return new Result<>(false, "调用接口不支持", null);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Result<?> resultCode;
        try {
            resultCode = this.handlePost(req, resp);
        } catch (SQLException e) {
            resultCode = new Result<>(false, "系统错误", e.getMessage());
        }

        this.json(resultCode, resp);
    }
}
