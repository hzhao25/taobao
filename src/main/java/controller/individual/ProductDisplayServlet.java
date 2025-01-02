package controller.individual;

import dao.individual.DBUtil;
import javaBean.Products;
import module.individual.Service2;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/productDisplay")
public class ProductDisplayServlet extends HttpServlet {

    // 处理请求并返回商品页面
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        // 将商品列表传递到 JSP 页面，或可以进行其他操作
        try {
            request.setAttribute("products", service2.getProductList());  // 如果你还需要传递到 JSP 页面，可以使用这个属性
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        // 跳转到商品展示的 JSP 页面
        request.getRequestDispatcher("/productPage.jsp").forward(request, response);
    }

}

