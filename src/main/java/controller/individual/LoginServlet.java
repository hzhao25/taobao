package controller.individual;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import javaBean.*;
import module.individual.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = new User(username, password);
        Service2 userService = new Service2();

        if (userService.validateUser(user)) {
            // 验证通过，跳转到成功页面
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", username); // 将当前用户的用户名存入 session

            List<User> users = userService.getAllUsers();    // 获取所有用户信息
            request.setAttribute("users", users);
            request.getRequestDispatcher("/homePage.jsp").forward(request, response);
        } else {
            // 验证失败，返回错误信息
//            response.sendRedirect("failure.jsp"); // 跳转到失败页面
        }
    }
}
