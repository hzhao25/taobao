package module.individual;

import dao.individual.CRUD;
import javaBean.Goods;
import javaBean.MyAddress;
import javaBean.MyComment;
import javaBean.Order;

import java.sql.SQLException;
import java.util.List;

public class Service {
    //查找所有购物车商品
    public static List<Goods> searchAllCartGoods() throws SQLException, ClassNotFoundException {
        List<Goods> cartGoods= CRUD.selectAllCartGoods();
        return cartGoods;
    }

    //增加购物车结算商品到订单里
    public static void addOrderFromCart(List<Order> orders){
        CRUD.addOrderFromCart(orders);
    }

    //查找所有订单商品
    public static List<Order> searchAllOrders() throws SQLException, ClassNotFoundException {
        List<Order> orders= CRUD.selectAllOrdersGoods();
        return orders;
    }

    //添加评价到我的评价
    public static void addComment(MyComment comment){
        CRUD.addComment(comment);
    }

    //查找所有订单商品
    public static List<MyComment> searchAllMyComment() throws SQLException, ClassNotFoundException {
        List<MyComment> comments= CRUD.selectAllMyComment();
        return comments;
    }

    //查找所有地址
    public static List<MyAddress> searchAllMyAddress() throws SQLException, ClassNotFoundException {
        List<MyAddress> addresses= CRUD.selectMyAddress();
        return addresses;
    }

    //添加新地址
    public static void addAddress(MyAddress address){
        CRUD.addAddress(address);
    }
}
