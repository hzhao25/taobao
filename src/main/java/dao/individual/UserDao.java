package dao.individual;

import javaBean.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import java.util.ArrayList;
import java.util.List;

import javaBean.*;
public class UserDao {

    //    验证登录用户(单个用户)
    public static boolean authenticateUser(User user) {
        boolean isValid = false;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            rs = stmt.executeQuery();

            if (rs.next()) {
                isValid = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, stmt, conn);
        }
        return isValid;
    }
    //获取多个用户
    public static List<User> getAllUsers() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<User> userList = new ArrayList<>();  // 用来存储所有的用户

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT username, userpassword FROM user";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                userList.add(user);  // 将用户添加到列表中
//                System.out.println("读取用户: " + user.getUsername());  // 打印读取的用户信息
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, stmt, conn);
        }

        return userList;  // 返回用户列表
    }

    public static boolean registerUser(User user) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean isValid = false;

        try {
            conn = DBUtil.getConnection();
            String sql = "insert into user(username,password) values(?,?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            System.out.println(user.getUsername()+user.getPassword());
            if (stmt.executeUpdate() > 0) {
                isValid = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(null, stmt, conn);
        }
        return isValid;
    }
    public static boolean updatePassword(String username, String newPassword) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean updateSuccess = false;  // 用于标记密码更新是否成功

        try {
            conn = DBUtil.getConnection();
            String sql = "UPDATE user SET password = ? WHERE username = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, newPassword);  // 设置新的密码
            stmt.setString(2, username);     // 设置用户名

            int rowsAffected = stmt.executeUpdate();  // 执行更新操作

            if (rowsAffected > 0) {
                updateSuccess = true;  // 如果有更新的行数，说明更新成功
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(null,stmt, conn);
        }

        return updateSuccess;  // 返回更新是否成功
    }

}
