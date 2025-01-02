<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.store.StoreOrder" %>
<%@ page import="model.store.Customer" %>
<%@ page import="Service.store.StoreOrderService" %>
<%@ page import="Service.store.CustomerService" %>
<%
    StoreOrderService storeOrderService = new StoreOrderService();
    CustomerService customerService = new CustomerService();

    int orderId = Integer.parseInt(request.getParameter("orderId"));
    StoreOrder order = storeOrderService.getOrderById(orderId);
    Customer customer = customerService.getCustomerById(order.getCustomerId());
%>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>订单详情</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
        }
        p {
            font-size: 16px;
            color: #555;
        }
    </style>
</head>
<body>
<h1>订单详情</h1>
<% if (order != null && customer != null) { %>
    <p>订单ID: <%= order.getId() %></p >
    <p>顾客名称: <%= customer.getName() %></p >
    <p>收件人: <%= customer.getName() %></p >
    <p>收货地址: <%= customer.getAddress() %></p >
    <p>电话: <%= customer.getPhone() %></p >
    <p>状态: <%= order.getStatus() %></p >
<% } else { %>
    <p>未找到订单或顾客详情。</p >
<% } %>
<a href="">返回订单管理</a>
</body>
</html>