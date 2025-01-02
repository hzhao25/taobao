package dao.individual;

import javaBean.Goods;
import javaBean.Products;
import javaBean.User;

import java.io.File;
import java.io.FileInputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import static java.lang.System.out;

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
            out.println(user.getUsername()+user.getPassword());
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

    //传入商品图片
    public static boolean saveImg(String name, String url) throws Exception {
        boolean isValid =false;
        FileInputStream fis = null;
        String sql = "UPDATE products SET imge(UUID) = ? WHERE name = ?";
        try(Connection connection = DBUtil.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)) {
            File file = new File(url);
            fis = new FileInputStream(file);
            //设定数据
            statement.setBinaryStream(1, fis, (int) file.length());
            statement.setString(2,name);
            statement.executeUpdate();
            if(statement.executeUpdate()>0){
                isValid =true;
                out.println("学生图片添加成功");
            } else {
                out.println("学生图片添加失败");
            }
        }
        return isValid;
    }
    //读取图片
    public static Blob getStudentPic(String name){
        String sql = "SELECT imge(UUID) FROM products WHERE name = ?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getBlob("picture");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }
    // 获取所有商品
    public static List<Products> getProductList() throws SQLException {
        // 定义一个列表来存储所有商品
//        List<Products> productList = new ArrayList<>();
        Connection connection = DBUtil.getConnection();
        List<Products> g=new ArrayList<>();
        String sql="select * from products";
        Statement stmt=connection.createStatement();
        ResultSet rs=stmt.executeQuery(sql);
        while (rs.next()){
            Products goods=new Products();
            goods.setId(rs.getInt("id"));
            goods.setName(rs.getString("name"));
            goods.setImg(rs.getString("image"));
            goods.setPrice(rs.getBigDecimal("price"));
            goods.setDescription(rs.getString("description"));
            goods.setShippingInfo(rs.getString("shipping_info"));
            g.add(goods);
        }
//        if (g != null) {
//            for (int i = 0; i < g.size(); i++) {
//                Products product = g.get(i);  // 获取商品对象
//                out.println("商品 ID: " + product.getId());
//                out.println("商品名称: " + product.getName());
//                out.println("商品价格: " + product.getPrice());
//                out.println("img:"+product.getImg());
//                out.println("描述："+product.getDescription());
//                out.println("配送："+product.getShippingInfo());
//                out.println("----------------------");  // 用于分隔每个商品的输出
//            }
//        }
        // 返回包含所有商品的列表
        return g;
    }

}
