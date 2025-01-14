package controller.store;
import Service.store.StoreOrderService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/ManageOrderServlet")
public class ManageOrderServlet extends HttpServlet {

    private StoreOrderService storeOrderService = new StoreOrderService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        if ("ship".equals(action)) {
            // 更新订单状态为已发货
            storeOrderService.updateOrderStatus(orderId, "已发货");
            response.sendRedirect("orderManage.jsp"); // 重定向回订单管理页面
        }
    }
}
