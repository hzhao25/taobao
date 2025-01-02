package controller.store;

import Service.store.StoreService;
import model.store.Store;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
@WebServlet("/ManageStoreServlet")
public class ManageStoreServlet extends HttpServlet {
    private StoreService storeService = new StoreService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // 设置请求编码
        response.setContentType("text/html;charset=UTF-8"); // 设置响应编码
        int storeId = Integer.parseInt(request.getParameter("storeId"));
        String storeName = request.getParameter("storeName");
        String description = request.getParameter("description");
        String storeLocation = request.getParameter("storeLocation");
        String openingTimeStr = request.getParameter("openingTime");

        Store store = new Store(storeId, storeName, description, 0, storeLocation, null);

        // 解析开店时间
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            store.setOpeningTime(sdf.parse(openingTimeStr));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        // 更新店铺信息
        storeService.updateStore(store);

        // 重定向回店铺信息页面
        response.sendRedirect("storeInfor.jsp?storeId=" + storeId);
    }
}
