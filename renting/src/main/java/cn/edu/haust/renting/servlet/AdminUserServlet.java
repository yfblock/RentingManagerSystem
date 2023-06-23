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
        try {
            req.setAttribute("users", userInterface.getUsers());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        this.forward("admin_user.jsp", req, resp);
    }

    protected Result<?> postAdd(HttpServletRequest req, HttpServletResponse resp) throws SQLException, NumberFormatException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        Integer role = Integer.valueOf(req.getParameter("role"));

        if(username == null || password == null || username.length() < 5 || password.length() < 5 || role == null) {
            return new Result<>(false, "账号或密码格式不正确", null);
        }

        User user = userInterface.getUserByUsername(username);
        if(user != null) {
            return new Result<>(false, "用户名已经存在", null);
        }

        if(phone == null) {
            phone = "";
        }

        userInterface.addUserWithPhone(username, UserUtil.encode(password), phone, role);
        return new Result<>(true, "添加成功", null);
    }

    protected Result<?> postGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        return new Result<>(true, "获取成功", userInterface.getUserById(id));
    }

    protected Result<?> postDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        userInterface.deleteUserById(id);
        return new Result<>(true, "删除成功", null);
    }

    protected Result<?> postUpdate(HttpServletRequest req, HttpServletResponse resp) throws SQLException, NumberFormatException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        User user = userInterface.getUserById(id);
        Integer role = Integer.valueOf(req.getParameter("role"));
        if(user == null) {
            return new Result<>(false, "用户不存在", null);
        }
        if(role == null) {
            return new Result<>(false, "表单参数错误", null);
        }
        String password = req.getParameter("password");
        if("".equals(password) || password == null) {
            password = user.getPassword();
        } else if(password.length() < 5) {
            return new Result<>(false, "密码格式错误", null);
        } else {
            password = UserUtil.encode(password);
        }
        String phone = req.getParameter("phone");
        if(phone == null) {
            phone = "";
        }
        userInterface.updateUserInfoById(id, password, phone, role);
        return new Result<>(true, "修改成功", null);
    }

    @Override
    protected Result<?> handlePost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        String op = req.getParameter("op");
        if(op == null) {
            return new Result<>(false, "没有对应的操作", null);
        }

        try {
            if("delete".equals(op)) {
                return this.postDelete(req, resp);
            } else if("add".equals(op)) {
                return this.postAdd(req, resp);
            } else if("get".equals(op)) {
                return this.postGet(req, resp);
            } else if("update".equals(op)) {
                return this.postUpdate(req, resp);
            }
            return new Result<>(false, "没有对应的操作", null);
        } catch (NumberFormatException e) {
            return new Result<>(false, "参数格式错误", null);
        }
    }
}
