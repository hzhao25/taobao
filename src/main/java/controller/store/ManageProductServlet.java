package controller.store;

import Service.store.ProductService;
import model.store.Product;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.Blob;

@WebServlet("/ManageProductServlet")
public class ManageProductServlet extends HttpServlet {
    private ProductService productService = new ProductService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");
            String shippingInfo = request.getParameter("shippingInfo");
            // 获取 ServletInputStream
            ServletInputStream inputStream = request.getInputStream();
            byte[] imageBytes = readInputStream(inputStream);

            Product product = new Product(0, name, price, description, shippingInfo, imageBytes, true, false); // 默认上架
            System.out.println(product);
            productService.addProduct(product);

        } else if ("update".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String newName = request.getParameter("newName");
            double newPrice = Double.parseDouble(request.getParameter("newPrice"));
            String newDescription = request.getParameter("newDescription");
            String newShippingInfo = request.getParameter("newShippingInfo");
            Part newImagePart = request.getPart("newImage");
            byte[] newImage = newImagePart.getInputStream().readAllBytes();

            Product product = new Product(productId, newName, newPrice, newDescription, newShippingInfo, newImage, true, false);
            productService.updateProduct(product);

        } else if ("setAvailable".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            productService.setProductAvailability(productId, true);

        } else if ("setUnavailable".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            productService.setProductAvailability(productId, false);

        } else if ("delete".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            productService.deleteProduct(productId);
        }

        response.sendRedirect("goodManage.jsp");
    }

    private byte[] readInputStream(ServletInputStream inputStream) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int bytesRead;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            baos.write(buffer, 0, bytesRead);
        }
        return baos.toByteArray(); }
}
