<%@ page import="javaBean.Order" %>
<%@ page import="dao.individual.CRUD" %>
<%@ page import="java.util.List" %>
<%@ page import="controller.individual.Servlet" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="module.individual.Service" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的订单</title>
    <link rel="stylesheet" href="MyOrder.css">
</head>
<body>
<div class="header">
    <h1>我的订单</h1>
</div>

<%
    new Servlet().searchAllOrders(request);
    // 获取所有订单列表
    List<Order> orders = (List<Order>) session.getAttribute("allOrders");
    if (orders != null && !orders.isEmpty()) {
        for (int i=0;i<orders.size();i++) {
            Order order=orders.get(i);
            String name = order.getName();
            Blob photo = order.getPhoto();
            float price = order.getPrice();
            String description = order.getIntroduction();
            boolean isDispatch = order.isIsDispatch();
            boolean isArrive = order.isIsArrive();
            boolean isEvaluate = order.isIsEvaluate();
            String photoUrl = order.convertBlobToBase64(photo);

            String statusMessage = "";
            String buttonText = "去评价";
            String buttonAction = "Servlet?action=orderEvaluate"; // 默认跳转到评价的动作
            boolean buttonDisabled = true; // 默认禁用按钮

            // 根据不同的状态确定显示内容
            if (!isDispatch && !isArrive && !isEvaluate) {
                statusMessage = "未发货";
            } else if (isDispatch && !isArrive && !isEvaluate) {
                statusMessage = "已发货，未签收";
            }else if (isDispatch && isArrive && !isEvaluate) {
                statusMessage = "已签收，去评价";
                buttonText = "去评价";
                buttonAction = "Servlet?action=toComment&index="+i; // 已签收且未评价，跳转到评价页面
                buttonDisabled = false; // 按钮可点击
            } else if (isDispatch && isArrive && isEvaluate) {
                statusMessage = "已评价";
                buttonText = "查看评价";
                buttonAction = "Servlet?action=lookComment"; // 已评价，跳转到查看评价页面
                buttonDisabled = false; // 按钮可点击
            }

%>

<form action="<%= buttonAction %>" method="post">
    <div class="container">
        <div class="cart-item">
            <div class="item-info">
                <img src="data:image/jpeg;base64,<%= photoUrl %>" alt="<%= name %>">
                <div>
                    <h3 id="name">商品名称: <%= name %></h3>
                    <p id="description"><%= description %></p>
                </div>
            </div>
            <div class="price" style="margin-right: 10px">￥<%= price %></div>
            <div class="status" style="margin-right: 10px"><%= statusMessage %></div>
            <button class="evaluate-btn" type="submit" <%= buttonDisabled ? "disabled" : "" %>><%= buttonText %></button>
        </div>
    </div>
</form>

<%
    }
} else {
%>
<p style="text-align: center;">您还没有订单！</p>
<% } %>

<div class="footer">
    <span>© 2024 淘宝网</span>
</div>
</body>
</html>
