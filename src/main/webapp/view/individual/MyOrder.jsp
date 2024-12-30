<%--
  Created by IntelliJ IDEA.
  User: 34158
  Date: 2024/12/30
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的订单</title>
    <link rel="stylesheet" href="MyOrder.css">
</head>
<body>
<div class="container">
    <header class="header">
        <h1>我的订单</h1>
    </header>
    <section class="order-list">
        <c:forEach var="order" items="${orders}"><%--orders代表订单数据，数据类型可以说List<Order>--%>
            <div class="order">
                <div class="order-header">
                    <div class="order-id">订单号：${order.orderId}</div><%--order.orderId是订单号--%>
                    <div class="order-date">${order.orderDate}</div><%--order.orderDate是订单日期--%>
                </div>
                <div class="order-items">
                    <c:forEach var="item" items="${order.items}"><%--商品的详细信息--%>
                        <div class="order-item">
                            <img src="${item.imageUrl}" alt="商品图片">
                            <div class="item-info">
                                <p class="item-name">${item.name}</p>
                                <p class="item-price">￥${item.price}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="order-footer">
                    <div class="order-status">${order.status}</div>
                    <div class="order-actions">
                        <button class="order-action">查看</button>
                        <button class="order-action">去评价</button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </section>
</div>
</body>
</html>
