package controller.individual;

import javaBean.Products;
import module.individual.Service2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求的字符编码
        request.setCharacterEncoding("UTF-8");

        // 设置响应的字符编码
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // 获取用户输入的搜索词
        String searchQuery = request.getParameter("searchQuery");
        System.out.println("获取用户输入的搜索词"+searchQuery);
        // 如果没有输入搜索词，返回首页或给出提示
        if (searchQuery == null || searchQuery.trim().isEmpty()) {
            response.sendRedirect("/homePage.jsp"); // 或者显示错误信息
            return;
        }
        HttpSession session = request.getSession();
        // 查找匹配的商品
        List<Products> productList = (List<Products>) session.getAttribute("productList");

        for (Products product : productList) {
            // 使用正则表达式进行匹配
            if (product.getName().toLowerCase().matches(".*" + Pattern.quote(searchQuery.toLowerCase()) + ".*")) {
                Products selectedProduct = product; // 根据名称查找商品
                System.out.println(selectedProduct.getName());
                session.setAttribute("selectProduct", selectedProduct);
                break; // 找到匹配项后退出循环
            }
        }
        request.getRequestDispatcher("/searchProduct.jsp").forward(request, response);
//        List<Products> products = productService.searchProductsByName(searchQuery);
//        // 如果有匹配的商品，跳转到结果页面
//        if (!products.isEmpty()) {
//            request.setAttribute("products", products);
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/searchResult.jsp");
//            dispatcher.forward(request, response);
//        } else {
//            // 如果没有找到商品，给出提示并跳转
//            request.setAttribute("message", "没有找到匹配的商品");
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/searchResult.jsp");
//            dispatcher.forward(request, response);
//        }
    }
}
