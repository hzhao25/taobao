package dao.store;

import model.store.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/taobao";
    private String dbUser = "root";
    private String dbPass = "root123456";

    public void addProduct(Product product) {
        String sql = "INSERT INTO products (name, price, description, shipping_info, image) VALUES (?, ?, ?, ?, ?)";
        System.out.println("插入表中");
        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPass);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setString(3, product.getDescription());
            statement.setString(4, product.getShippingInfo());
            statement.setBytes(5, product.getImage());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateProduct(Product product) {
        String sql = "UPDATE products SET name = ?, price = ?, description = ?, shipping_info = ?, image = ?, is_available = ? WHERE id = ?";

        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPass);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setString(3, product.getDescription());
            statement.setString(4, product.getShippingInfo());
            statement.setBytes(5, product.getImage());
            statement.setBoolean(6, product.isAvailable());
            statement.setInt(7, product.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void setProductAvailability(int id, boolean isAvailable) {
        String sql = "UPDATE products SET is_available = ? WHERE id = ?";
        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPass);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setBoolean(1, isAvailable);
            statement.setInt(2, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(int id) {
        String sql = "UPDATE products SET is_deleted = TRUE WHERE id = ?";
        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPass);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE is_deleted = FALSE";

        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPass);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            while (resultSet.next()) {
                Product product = new Product(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getDouble("price"),
                        resultSet.getString("description"),
                        resultSet.getString("shipping_info"),
                        resultSet.getBytes("image"),
                        resultSet.getBoolean("is_available"),
                        resultSet.getBoolean("is_deleted")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
}
