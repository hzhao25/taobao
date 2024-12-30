<%--
  Created by IntelliJ IDEA.
  User: 34158
  Date: 2024/12/30
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的评价</title>
    <link rel="stylesheet" href="MyComment.css">
</head>
<body>
<!-- 页面头部 -->
<div class="header">
    <h1>我的评价</h1>
</div>
<!-- 页面主体 -->
<div class="container">
    <!-- 评价项 1 -->
    <div class="review-item">
        <div class="item-info">
            <img src="https://via.placeholder.com/80" alt="商品图片">
            <div>
                <h3>蓝牙耳机</h3>
                <p class="price">￥299.00</p>
            </div>
        </div>
        <div class="review-actions">
            <div class="rating">★★★★☆</div>
            <p class="review-content">
                非常好用，音质很清晰，佩戴舒适，适合长时间使用。会推荐给朋友们购买。
            </p>
            <button>编辑评价</button>
        </div>
    </div>

    <!-- 评价项 2 -->
    <div class="review-item">
        <div class="item-info">
            <img src="https://via.placeholder.com/80" alt="商品图片">
            <div>
                <h3>无线鼠标</h3>
                <p class="price">￥59.00</p>
            </div>
        </div>
        <div class="review-actions">
            <div class="rating">★★★☆☆</div>
            <p class="review-content">
                质量还不错，就是有时候连接有点慢，整体还可以。
            </p>
            <button>编辑评价</button>
        </div>
    </div>

    <!-- 评价项 3 -->
    <div class="review-item">
        <div class="item-info">
            <img src="https://via.placeholder.com/80" alt="商品图片">
            <div>
                <h3>智能手表</h3>
                <p class="price">￥599.00</p>
            </div>
        </div>
        <div class="review-actions">
            <div class="rating">★★★★★</div>
            <p class="review-content">
                非常好，功能齐全，操作简单，续航也很长。非常满意。
            </p>
            <button>编辑评价</button>
        </div>
    </div>
</div>
<!-- 页脚 -->
<div class="footer">
    <span>© 2024 淘宝网</span>
</div>
</body>
</html>
