<%--
  Created by IntelliJ IDEA.
  User: 34158
  Date: 2024/12/30
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>购物车</title>
    <link rel="stylesheet" href="Cart.css">
</head>
<body>
<div class="header">
    <h1>购物车</h1>
</div>
<div class="container">
    <!-- 购物车商品列表 -->
    <div class="cart-items">
        <div class="cart-item">
            <div class="item-info">
                <img src="https://via.placeholder.com/80" alt="商品图片">
                <div>
                    <h3>商品名称: 蓝牙耳机</h3>
                    <p>品牌：XYZ</p>
                    <p class="price">￥299.00</p>
                </div>
            </div>
            <div class="quantity">
                <button>-</button>
                <input type="number" value="1">
                <button>+</button>
            </div>
            <div class="price">￥299.00</div>
        </div>
        <div class="cart-item">
            <div class="item-info">
                <img src="https://via.placeholder.com/80" alt="商品图片">
                <div>
                    <h3>商品名称: 无线鼠标</h3>
                    <p>品牌：ABC</p>
                    <p class="price">￥59.00</p>
                </div>
            </div>
            <div class="quantity">
                <button>-</button>
                <input type="number" value="1">
                <button>+</button>
            </div>
            <div class="price">￥59.00</div>
        </div>
    </div>

    <!-- 购物车结算 -->
    <div class="summary">
        <div class="total-price">
            总价：￥358.00
        </div>
        <button class="checkout-btn">去结算</button>
    </div>
</div>

<div class="footer">
    <span>© 2024 淘宝网</span>
</div>
</body>
</html>
