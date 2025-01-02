package controller.individual;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javaBean.*;
import module.individual.*;
import javaBean.*;

import static java.lang.System.out;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");// 获取表单中提交的角色
        User user = new User(username, password);
        Service2 userService = new Service2();

        // 设置响应的字符编码
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        Service2 service2 = new Service2();

        // 将商品列表放到 session 中
        HttpSession session = request.getSession();
        try {
            session.setAttribute("productList", service2.getProductList());  // 将产品列表存储到 session 中
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if (role != null) {
            if ("user".equals(role)) {
                // 用户选择了 "用户"
                out.println("用户角色已选择");
            } else if ("merchant".equals(role)) {
                // 用户选择了 "商家"
                out.println("商家角色已选择");
            } else {
                out.println("未知角色");
            }
        } else {
            out.println("没有选择角色");
        }
        session.setAttribute("role",role);
        if (userService.validateUser(user)) {
            // 验证通过，跳转到成功页面
            session.setAttribute("currentUser", username); // 将当前用户的用户名存入 session

            List<User> users = userService.getAllUsers();    // 获取所有用户信息
            request.setAttribute("users", users);
            request.getRequestDispatcher("/homePage.jsp").forward(request, response);
        } else {
            // 验证失败，返回错误信息
            response.sendRedirect("/failure.jsp"); // 跳转到失败页面
        }

    }
}
