package Service.store;

import model.store.StoreOrder;
import dao.store.StoreOrderDao;

import java.util.List;

public class StoreOrderService {
    private StoreOrderDao storeOrderDao = new StoreOrderDao();

    public List<StoreOrder> getAllOrders() {
        return storeOrderDao.getAllOrders();
    }

    public StoreOrder getOrderById(int id) {
        return storeOrderDao.getOrderById(id);
    }

    public void updateOrderStatus(int orderId, String status) {
        storeOrderDao.updateOrderStatus(orderId, status);
    }
}
