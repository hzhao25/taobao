package controller.individual;

import dao.individual.CRUD;
import javaBean.Goods;
import javaBean.MyAddress;
import javaBean.MyComment;
import javaBean.Order;
import module.individual.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.stream.events.Comment;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/individual")
public class Servlet extends HttpServlet {
    HttpSession session=null;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        session=request.getSession();
        if (request.getParameter("action").equals("ordersAdd")){
            ordersAdd(session,request,response);
        }else if (request.getParameter("action").equals("payOrders")){
            payOrders(response,request);
            try {
                searchAllOrders(request);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            response.sendRedirect("MyOrder.jsp");
        }else if(request.getParameter("action").equals("toComment")){
            List<Order> orders=(List<Order>)session.getAttribute("allOrders");
            int index=Integer.parseInt(request.getParameter("index"));
            Order order=orders.get(index);
            session.setAttribute("commentOrder",order);
            request.setAttribute("index",index);
            RequestDispatcher dispatcher=request.getRequestDispatcher("ToComment.jsp");
            dispatcher.forward(request,response);
        }else if(request.getParameter("action").equals("addComment")){
            try {
                addComment(response,request);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                searchAllMyComment(request);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            response.sendRedirect("MyComment.jsp");
        }else if(request.getParameter("action").equals("addAddress")){
            String name=request.getParameter("name");
            String address=request.getParameter("address");
            String number=request.getParameter("number");
            MyAddress addre=new MyAddress(name,number,address);
            Service.addAddress(addre);
            response.sendRedirect("MyAddress.jsp");
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
    }

    //查找所有的购物车商品信息
    public void searchAllGoods(HttpServletRequest request) throws SQLException, ClassNotFoundException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        List<Goods> cartGoods= Service.searchAllCartGoods();
        session = request.getSession(); // 确保获得 session
        if (session != null) {
            // 在 session 中设置属性
            session.setAttribute("cartGoods", cartGoods);
        } else {
            // 处理 session 为 null 的情况，或者创建一个新的 session
            session = request.getSession(true);
            session.setAttribute("cartGoods", cartGoods);
        }
    }

    //把勾选的购物车商品添加到订单里面
    public void ordersAdd(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        List<Goods> goods=(List<Goods>)session.getAttribute("cartGoods");
        List<Order> orders=new ArrayList<>();
        // 获取所有复选框选中的值
        String[] items = request.getParameterValues("box");
        if (items != null) {
            for (String item : items) {
                int index=Integer.parseInt(item);
                String name=goods.get(index).getName();
                Blob photo=goods.get(index).getPhoto();
                float price=goods.get(index).getPrice();
                String introduction=goods.get(index).getIntroduction();
                Order o=new Order(name,photo,price,introduction);
                orders.add(o);
            }
        session.setAttribute("orders",orders);
        } else {
            System.out.println("无订单！");
        }
        response.sendRedirect("Confirm.jsp");
    }

    //支付完成后把订单添加到订单数据表里
    public void payOrders(HttpServletResponse response,HttpServletRequest request) throws IOException {
        List<Order> order=(List<Order>) session.getAttribute("orders");
        Service.addOrderFromCart(order);
    }

    //查找所有的订单商品信息
    public void searchAllOrders(HttpServletRequest request) throws SQLException, ClassNotFoundException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        List<Order> orders= Service.searchAllOrders();
        session = request.getSession(); // 确保获得 session
        if (session != null) {
            // 在 session 中设置属性
            session.setAttribute("allOrders", orders);
        } else {
            // 处理 session 为 null 的情况，或者创建一个新的 session
            session = request.getSession(true);
            session.setAttribute("allOrders", orders);
        }
    }

    //评价完订单后把评价放到我的评价表里
    public void addComment(HttpServletResponse response,HttpServletRequest request) throws IOException, SQLException {
        Order order= (Order) session.getAttribute("commentOrder");
        String name=order.getName();
        Blob photo=order.getPhoto();
        float price=order.getPrice();
        String introduction=order.getIntroduction();
        int comment_score=Integer.parseInt(request.getParameter("rating"));
        String evaluate=request.getParameter("review");
        MyComment comment=new MyComment(name,photo,price,introduction,comment_score, evaluate);
        Service.addComment(comment);
        session.setAttribute("photo",photo);
    }

    //查找所有的我的评价
    public void searchAllMyComment(HttpServletRequest request) throws SQLException, ClassNotFoundException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        List<MyComment> comments= Service.searchAllMyComment();
        session = request.getSession(); // 确保获得 session
        if (session != null) {
            // 在 session 中设置属性
            session.setAttribute("allComments", comments);
        } else {
            // 处理 session 为 null 的情况，或者创建一个新的 session
            session = request.getSession(true);
            session.setAttribute("allComments", comments);
        }
    }

    //查找所有的我的地址
    public void searchAllMyAddress(HttpServletRequest request) throws SQLException, ClassNotFoundException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        List<MyAddress> addresses= Service.searchAllMyAddress();
        session = request.getSession(); // 确保获得 session
        if (session != null) {
            // 在 session 中设置属性
            session.setAttribute("allAddresses", addresses);
        } else {
            // 处理 session 为 null 的情况，或者创建一个新的 session
            session = request.getSession(true);
            session.setAttribute("allAddresses", addresses);
        }
    }
}
