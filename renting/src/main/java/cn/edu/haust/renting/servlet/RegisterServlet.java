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

@WebServlet(name = "RegisterServlet", value = "/register", loadOnStartup = 1)
public class RegisterServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.forward("register.jsp", req, resp);
    }

    @Override
    protected Result<?> handlePost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        // 获取 POST 请求参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String repassword = req.getParameter("repassword");
        // 判断参数是否存在
        if(username == null || password == null || repassword == null) {
            return new Result<>(false, "账号或密码不能为空", null);
        }
        if(!password.equals(repassword)) {
            return new Result<>(false, "两次密码不一致", null);
        }
        // 获取用户并判断用户是否存在
        User user = userInterface.getUserByUsername(username);
        if(user != null) {
            return new Result<>(false, "账号已存在", null);
        }
        userInterface.addUser(username, UserUtil.encode(password));
        // 注册成功
        return new Result<>(true, "注册成功", null);
    }
}
