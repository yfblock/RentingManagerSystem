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

@WebServlet(name = "AdminUserServlet", value = "/admin-user", loadOnStartup = 1)
public class AdminUserServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.forward("admin_user.jsp", req, resp);
    }

    @Override
    protected Result<?> handlePost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        // 获取 POST 请求参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // 判断参数是否存在
        if(username == null || password == null) {
            return new Result<>(false, "账号或密码错误", null);
        }
        // 获取用户并判断用户是否存在
        User user = userInterface.getUserByUsername(username);
        if(user == null) {
            return new Result<>(false, "账号不存在", null);
        }
        // 判断用户密码是否正确
        if(!UserUtil.encode(password).equals(user.getPassword())) {
            return new Result<>(false, "密码错误", null);
        }
        // 登录成功
        return new Result<>(true, "登录成功", null);
    }
}
