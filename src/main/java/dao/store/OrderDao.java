package dao.store;

import model.store.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
    private String dbURL = "jdbc:mysql://localhost:3306/taobao";
    private String dbUser = "root";
    private String dbPass = "root123456";

    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT sO.id, c.name AS customerName, sO.status FROM storeorders sO JOIN customers c ON sO.customer_id = c.id")) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String customerName = rs.getString("customerName");
                String status = rs.getString("status");
                orders.add(new Order(id, customerName, status));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
}
