package controller.individual;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import module.individual.*;
import dao.individual.*;
import javaBean.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "密码和确认密码不一致");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;  // 结束当前请求，避免继续执行后面的代码
        }
        Service2 userService = new Service2();
        User user = new User(username, password);

        if (userService.registerUser(user)) {
//            response.sendRedirect("/login.jsp");  // 注册成功后跳转到登录页面
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/register.jsp").forward(request, response);
//            request.getRequestDispatcher("/failure.jsp").forward(request, response);
        }
    }
}