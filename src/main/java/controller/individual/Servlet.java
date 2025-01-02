package controller.individual;

import javaBean.Goods;
import module.individual.Service;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/individual")  // 设置Servlet的URL映射
public class Servlet extends HttpServlet {
    HttpSession session=null;

    public void doPost(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws SQLException,ClassNotFoundException {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws SQLException, ClassNotFoundException {

    }

    public static void searchAllGoods(HttpSession session,HttpServletRequest request) throws SQLException, ClassNotFoundException {
        List<Goods> goods= Service.searchAllGoods();
        session = request.getSession(); // 确保获得 session
        if (session != null) {
            // 在 session 中设置属性
            session.setAttribute("goods", goods);
        } else {
            // 处理 session 为 null 的情况，或者创建一个新的 session
            session = request.getSession(true);
            session.setAttribute("goods", goods);
        }
    }
}
