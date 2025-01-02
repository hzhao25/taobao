package dao.individual;

import javaBean.Goods;
import javaBean.MyAddress;
import javaBean.MyComment;
import javaBean.Order;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CRUD {
    public static Connection getConn(){
        try {
            //注册驱动
            Class.forName("com.mysql.jdbc.Driver");
            //获取数据库连接对象
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/taobao?useSSL=false", "root", "123456");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //存储照片
    public static void saveImg(int id) throws SQLException, FileNotFoundException, ClassNotFoundException {
        Connection conn=CRUD.getConn();
        String sql="update goods set photo=? where price=?";
        PreparedStatement stmt=conn.prepareStatement(sql);
        //读取磁盘当中的文件，转成计算机能够识别的二进制
        //输入流 InputStream
        // 将电脑当中的文件放到程序当中(是以二进流)输入流
        FileInputStream in=new FileInputStream("D:\\壁纸\\91 2560x1440_b85ff564ff554921ab1089ccfdafec6a.jpg");
        stmt.setBlob(1,in);
        stmt.setInt(2,id);
        if(stmt.executeUpdate()>0){
            System.out.println("修改头像成功");
        }else{
            System.out.println("修改头像失败");
        }
        conn.close();
        stmt.close();
    }

    //查找所有购物车商品信息
    public static List<Goods> selectAllCartGoods() throws SQLException, ClassNotFoundException {
        Connection conn=CRUD.getConn();
        List<Goods> g=new ArrayList<>();
        String sql="select * from cartGoods";
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(sql);
        while (rs.next()){
            Goods goods=new Goods();
            goods.setName(rs.getString("name"));
            goods.setPhoto(rs.getBlob("photo"));
            goods.setPrice(rs.getFloat("price"));
            goods.setIntroduction(rs.getString("introduction"));
            g.add(goods);
        }
        conn.close();
        stmt.close();
        return g;
    }

    //增加购物车结算商品到订单
    public static boolean addOrderFromCart(List<Order> orders){
        try {
            Connection conn = CRUD.getConn();
            String sql="insert into orders value(?,?,?,?,?,?,?)";
            PreparedStatement stmt=null;
            for (int i=0;i<orders.size();i++){
                if (!isOrder(orders.get(i))){
                    stmt=conn.prepareStatement(sql);
                    stmt.setString(1,orders.get(i).getName());
                    stmt.setBlob(2,orders.get(i).getPhoto());
                    stmt.setFloat(3,orders.get(i).getPrice());
                    stmt.setString(4,orders.get(i).getIntroduction());
                    stmt.setBoolean(5,false);
                    stmt.setBoolean(6,false);
                    stmt.setBoolean(7,false);
                }
            }
            if(stmt!=null&&stmt.executeUpdate()>0){
                stmt.close();
                return true;
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //查询某条订单是否存在于订单表中
    public static boolean isOrder(Order order) throws SQLException {
        Connection conn=CRUD.getConn();
        String sql="select * from orders where name=? and photo=? and price=? and introduction=?";
        PreparedStatement stmt=conn.prepareStatement(sql);
        stmt.setString(1,order.getName());
        stmt.setBlob(2,order.getPhoto());
        stmt.setFloat(3,order.getPrice());
        stmt.setString(4,order.getIntroduction());
        //查询语句返回的不是更改的行数，而是生成一个结果集，指针最开始并不是指向第一个数据行，下一跳才是第一个数据行。
        ResultSet rs=stmt.executeQuery();
        if(rs.next()){
            return true;
        }
        conn.close();
        stmt.close();
        return false;
    }

    //查找所有的订单信息
    public static List<Order> selectAllOrdersGoods() throws SQLException, ClassNotFoundException {
        Connection conn=CRUD.getConn();
        List<Order> orders=new ArrayList<>();
        String sql="select * from orders";
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(sql);
        while (rs.next()){
            Order order=new Order();
            order.setName(rs.getString("name"));
            order.setPhoto(rs.getBlob("photo"));
            order.setPrice(rs.getFloat("price"));
            order.setIntroduction(rs.getString("introduction"));
            order.setIsDispatch(rs.getBoolean("isDispatch"));
            order.setIsArrive(rs.getBoolean("isArrive"));
            order.setIsEvaluate(rs.getBoolean("isEvaluate"));
            orders.add(order);
        }
        conn.close();
        stmt.close();
        return orders;
    }

    //增加商品评价到我的评价
    public static boolean addComment(MyComment comment){
        try {
            Connection conn = CRUD.getConn();
            String sql="insert into comments value(?,?,?,?,?,?)";
            PreparedStatement stmt=null;
            if (!isComment(comment)){
                stmt=conn.prepareStatement(sql);
                stmt.setString(1,comment.getName());
                stmt.setBlob(2,comment.getPhoto());
                stmt.setFloat(3,comment.getPrice());
                stmt.setString(4,comment.getIntroduction());
                stmt.setInt(5,comment.getComment_score());
                stmt.setString(6,comment.getComment());
            }
            if(stmt!=null&&stmt.executeUpdate()>0){
                stmt.close();
                return true;
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //查询某条评价是否存在于我的评价表中
    public static boolean isComment(MyComment comment) throws SQLException {
        Connection conn=CRUD.getConn();
        String sql="select * from comments where name=? and photo=? and price=? and introduction=? and comment_score=? and comment=?";
        PreparedStatement stmt=conn.prepareStatement(sql);
        stmt.setString(1,comment.getName());
        stmt.setBlob(2,comment.getPhoto());
        stmt.setFloat(3,comment.getPrice());
        stmt.setString(4,comment.getIntroduction());
        stmt.setInt(5,comment.getComment_score());
        stmt.setString(6,comment.getComment());
        //查询语句返回的不是更改的行数，而是生成一个结果集，指针最开始并不是指向第一个数据行，下一跳才是第一个数据行。
        ResultSet rs=stmt.executeQuery();
        if(rs.next()){
            return true;
        }
        conn.close();
        stmt.close();
        return false;
    }

    //查找所有的评价信息
    public static List<MyComment> selectAllMyComment() throws SQLException, ClassNotFoundException {
        Connection conn=CRUD.getConn();
        List<MyComment> comments=new ArrayList<>();
        String sql="select * from comments";
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(sql);
        while (rs.next()){
            MyComment comment=new MyComment();
            comment.setName(rs.getString("name"));
            comment.setPhoto(rs.getBlob("photo"));
            comment.setPrice(rs.getFloat("price"));
            comment.setIntroduction(rs.getString("introduction"));
            comment.setComment_score(rs.getInt("comment_score"));
            comment.setComment(rs.getString("comment"));
            comments.add(comment);
        }
        conn.close();
        stmt.close();
        return comments;
    }

    //查找所有的地址
    public static List<MyAddress> selectMyAddress() throws SQLException, ClassNotFoundException {
        Connection conn=CRUD.getConn();
        List<MyAddress> addresses=new ArrayList<>();
        String sql="select * from myaddress";
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(sql);
        while (rs.next()){
            MyAddress address=new MyAddress();
            address.setName(rs.getString("name"));
            address.setNumber(rs.getString("number"));
            address.setAddress(rs.getString("address"));
            addresses.add(address);
        }
        conn.close();
        stmt.close();
        return addresses;
    }

    //增加新地址
    public static boolean addAddress(MyAddress address){
        try {
            Connection conn = CRUD.getConn();
            String sql="insert into myaddress value(?,?,?)";
            PreparedStatement stmt=null;
            stmt=conn.prepareStatement(sql);
            stmt.setString(1,address.getName());
            stmt.setString(2,address.getNumber());
            stmt.setString(3,address.getAddress());
            if(stmt!=null&&stmt.executeUpdate()>0){
                stmt.close();
                return true;
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
