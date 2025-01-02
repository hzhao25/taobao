package Service.store;

import model.store.Order;
import dao.store.OrderDao;

import java.util.List;

public class OrderService {
    private OrderDao orderDAO = new OrderDao();

    public List<Order> getAllOrders() {
        return orderDAO.getAllOrders();
    }
}
