package dao.individual;

import javaBean.Goods;

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

    public static List<Goods> selectAllGoods() throws SQLException, ClassNotFoundException {
        Connection conn=CRUD.getConn();
        if(conn==null){
            System.out.println("chucuol");
        }
        List<Goods> g=new ArrayList<>();
        String sql="select * from goods";
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
}
