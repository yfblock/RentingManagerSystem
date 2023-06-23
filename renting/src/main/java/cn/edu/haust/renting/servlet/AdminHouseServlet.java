package cn.edu.haust.renting.servlet;

import cn.edu.haust.renting.result.Result;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminHouse", value = "/admin-house", loadOnStartup = 1)
public class AdminHouseServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setAttribute("houses", houseInterface.getHouses());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        this.forward("admin_house.jsp", req, resp);
    }

    protected Result<?> postDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        houseInterface.deleteHouseById(id);
        return new Result<>(true, "删除成功", null);
    }

    protected Result<?> postAdd(HttpServletRequest req, HttpServletResponse resp) throws SQLException, UnsupportedEncodingException {
        String title = null;
        String position = null;
        String details = null;
        String cover = null;
        Double price = null;
        Double area = null;

//        req.setCharacterEncoding("utf-8");
        // 配置FileItemFactory工厂
        FileItemFactory factory = new DiskFileItemFactory();
        // 创建用于解析数据的工具类ServletFileUpload类
        ServletFileUpload upload = new ServletFileUpload(factory);
        // 防止上传文件名称乱码
        upload.setHeaderEncoding("gbk");
        // 构造临时路径来存储上传的文件
        String uploadPath = req.getServletContext().getRealPath("/upload");
        // 如果目录不存在则创建
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        try {
            // 解析请求的内容提取文件数据
            List<FileItem> formItems = upload.parseRequest(req);
            if (formItems != null && formItems.size() > 0) {
                // 迭代表单数据，判断每个表单项是普通类型还是上传的文件
                for (FileItem item : formItems) {
                    //上传的数据为文件的表单项处理方式
                    if ("cover".equals(item.getFieldName())) {
                        //文件名
                        String fileName = item.getName();
                        System.out.println("文件名："+fileName);
                        // 保存的路径
                        String filePath = uploadPath + File.separator + fileName;
                        // 保存文件到硬盘
                        File storeFile = new File(filePath);
                        if(!storeFile.exists()) {
                            item.write(storeFile);
                        }
                        cover = "upload/" + fileName;
                    } else if("title".equals(item.getFieldName())) {
                        title = item.getString("UTF-8");
                    } else if("position".equals(item.getFieldName())) {
                        position = item.getString("UTF-8");
                    } else if("details".equals(item.getFieldName())) {
                        details = item.getString("UTF-8");
                    } else if("price".equals(item.getFieldName())) {
                        price = Double.valueOf(item.getString("UTF-8"));
                    } else if("area".equals(item.getFieldName())) {
                        area = Double.valueOf(item.getString("UTF-8"));
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return new Result<>(false, "参数格式错误", null);
        }

        System.out.println(title);
        System.out.println(position);
        System.out.println(details);
        System.out.println(price);
        System.out.println(area);

        if(title == null || position == null || details == null || price == null || area == null) {
            return new Result<>(false, "参数不能为空", null);
        }
        houseInterface.addHouse(title, position, details, cover, price.toString(), area.toString());
        return new Result<>(true, "上传成功", null);
    }

    @Override
    protected Result<?> handlePost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        if(ServletFileUpload.isMultipartContent(req)) {
            return this.postAdd(req, resp);
        }

        String op = req.getParameter("op");
        if(op == null) {
            return new Result<>(false, "没有对应的操作", null);
        }

        try {
            if("delete".equals(op)) {
                return this.postDelete(req, resp);
            } else if("add".equals(op)) {
                return this.postAdd(req, resp);
            }

            return new Result<>(false, "没有 " + op + " 操作", null);
        } catch (NumberFormatException e) {
            return new Result<>(false, "格式错误", null);
        }
    }
}
