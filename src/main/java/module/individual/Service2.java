package module.individual;

import dao.individual.UserDao;
import javaBean.Products;
import javaBean.User;

import java.sql.SQLException;
import java.util.List;

public class Service2 {
    public static boolean validateUser(User user){
        return UserDao.authenticateUser(user);
    }
    //获取所有用户
    public List<User> getAllUsers(){
        System.out.println("获取用户列表");
        return UserDao.getAllUsers();
    }

    public boolean registerUser(User user) {
        return UserDao.registerUser(user);
    }

    public boolean updateUserpassword(String username, String newPassword) {
        return UserDao.updatePassword(username,newPassword);
    }

    public static List<Products> getProductList() throws SQLException {
        return UserDao.getProductList();
    }
}
