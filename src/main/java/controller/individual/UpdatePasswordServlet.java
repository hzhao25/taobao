package controller.individual;

import javaBean.User;
import module.individual.Service2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdatePasswordServlet")
public class UpdatePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("account");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "新密码和确认密码不一致");
            request.getRequestDispatcher("/password.jsp").forward(request, response);
            return;  // 结束当前请求，避免继续执行后面的代码
        }
        Service2 userService = new Service2();

        if (userService.updateUserpassword(username,confirmPassword)) {
//            response.sendRedirect("/login.jsp");  // 注册成功后跳转到登录页面
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/password.jsp").forward(request, response);
//            request.getRequestDispatcher("/failure.jsp").forward(request, response);
        }
    }
}
