package controller.individual;

import dao.individual.DBUtil;
import javaBean.Products;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.net.URL;
import java.nio.file.FileStore;
import java.sql.*;
import java.util.List;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求和响应的字符编码
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // 获取商品信息（这里是数组）
//        String[] productNames = request.getParameterValues("productName[]");
//        String[] productPricesStr = request.getParameterValues("productPrice[]");
//        String[] productImages = request.getParameterValues("productImage[]");

        // 数据库连接
        Connection conn = null;
        PreparedStatement psmt = null;
        HttpSession session = request.getSession();
        List<Products> productList = (List<Products>) session.getAttribute("productList");
        try {
            // 1. 获取数据库连接
            conn = DBUtil.getConnection();

            // 2. SQL 插入语句
//            String sql = "INSERT INTO products (name, price, image) VALUES (?, ?, ?)";
//
//            psmt = conn.prepareStatement(sql);
//
//            // 3. 执行插入操作
//            for (int i = 0; i < productNames.length; i++) {
//                String productName = productNames[i];
//                BigDecimal productPrice = new BigDecimal(productPricesStr[i]);
//                String productImage = productImages[i];
//
//                // 设置参数
//                psmt.setString(1, productName);
//                psmt.setBigDecimal(2, productPrice);
//                FileInputStream in=new FileInputStream(productImage);
//                psmt.setBlob(3, in);
//
//                // 执行插入操作
//                psmt.executeUpdate();
//            }

            String sql = "INSERT INTO cartgoods (name, photo,price, introduction) VALUES (?,?, ?, ?)";
            psmt = conn.prepareStatement(sql);
            for(Products product : productList){
                URL url = new URL(product.getImg());
                InputStream in = url.openStream();
                psmt.setString(1,product.getName());
//                psmt.setString(2,product.getImg());
//                FileInputStream in=new FileInputStream(product.getImg());
                psmt.setBlob(2,in);
                psmt.setBigDecimal(3,product.getPrice());
                psmt.setString(4,product.getDescription());
                System.out.println(product.getName());
                psmt.executeUpdate();
            }
            // 返回结果
            response.getWriter().write("商品信息已提交成功！");
        } catch (SQLException e) {
            e.printStackTrace();  // 打印堆栈信息
            response.getWriter().write("提交失败，数据库错误：" + e.getMessage());  // 返回错误信息
        } finally {
            // 关闭资源
            try {
                if (psmt != null) psmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
