package dao.store;

import model.store.Store;

import java.sql.*;

public class StoreDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/taobao?useUnicode=true&characterEncoding=UTF-8";
    private String dbUser = "root";
    private String dbPass = "root123456";

    public Store getStoreById(int id) {
        Store store = null;
        String sql = "SELECT * FROM stores WHERE id = ?";

        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPass);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                store = new Store(resultSet.getInt("id"),
                        resultSet.getString("store_name"),
                        resultSet.getString("description"),
                        resultSet.getInt("store_duration"),
                        resultSet.getString("location"),
                        resultSet.getDate("opening_time"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return store;
    }

    public void updateStore(Store store) {
        String sql = "UPDATE stores SET store_name = ?, description = ?, store_duration = ?, location = ?, opening_time = ? WHERE id = ?";

        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPass);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, store.getStoreName());
            statement.setString(2, store.getDescription());
            statement.setInt(3, store.getStoreDuration());
            statement.setString(4, store.getLocation());
            statement.setDate(5, new java.sql.Date(store.getOpeningTime().getTime()));
            statement.setInt(6, store.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
