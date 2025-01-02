package dao.store;

import model.store.StoreOrder;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StoreOrderDao {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/taobao";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "123456";

    public List<StoreOrder> getAllOrders() {
        List<StoreOrder> orders = new ArrayList<>();
        String sql = "SELECT * FROM storeorders";

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = connection.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                StoreOrder order = new StoreOrder();
                order.setId(rs.getInt("id"));
                order.setStatus(rs.getString("status"));
                order.setCustomerId(rs.getInt("customer_id"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public StoreOrder getOrderById(int id) {
        StoreOrder order = null;
        String sql = "SELECT * FROM storeorders WHERE id = ?";

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                order = new StoreOrder();
                order.setId(rs.getInt("id"));
                order.setStatus(rs.getString("status"));
                order.setCustomerId(rs.getInt("customer_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }
}
