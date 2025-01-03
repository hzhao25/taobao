<%@ page import="javaBean.Products" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品信息</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* 全局样式 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        /* 顶部导航样式 */
        .header {
            display: flex;
            justify-content: space-between;
            background-color: rgb(55,171,104);
            padding: 10px 20px;
            color: white;
        }

        .header-link {
            text-decoration: none;
            color: white;
            font-size: 16px;
            font-weight: bold;
            transition: color 0.3s;
        }

        .header-link:hover {
            color: #333;
        }

        /* 页面容器 */
        .container {
            display: flex;
            justify-content: center;
            padding: 40px;
        }

        /* 商品信息区域 */
        .product-info {
            display: flex;
            justify-content: space-between;
            width: 100%;
            max-width: 1200px;
        }

        /* 商品图片样式 */
        .product-image img {
            width: 350px;
            height: auto;
            border-radius: 8px;
            object-fit: cover;
            margin-right: 20px;
        }

        /* 商品信息样式 */
        .product-details {
            width: 60%;
            padding-left: 20px;
        }

        /* 商品标题 */
        .product-title {
            font-size: 28px;
            color: rgb(55,171,104);
            margin-bottom: 15px;
        }

        /* 商品描述 */
        .product-description {
            font-size: 16px;
            color: #666;
            margin-bottom: 20px;
        }

        /* 价格样式 */
        .price {
            font-size: 20px;
            margin-bottom: 20px;
        }

        .price-label {
            font-weight: bold;
        }

        .price-value {
            color: rgb(55,171,104);
        }

        /* 配送信息 */
        .delivery {
            font-size: 16px;
            color: #777;
            margin-bottom: 20px;
        }

        .delivery-label {
            font-weight: bold;
        }

        /* 按钮样式 */
        .actions button {
            background-color: rgb(55,171,104);
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-right: 10px;
            transition: background-color 0.3s ease;
        }

        .actions button:hover {
            background-color: #4caf50;
        }

        /* 最后一个按钮的右边距清除 */
        .actions button:last-child {
            margin-right: 0;
        }
        /* 按钮样式 */
        .back-to-home-btn {
            background-color: rgb(55, 171, 104); /* 设置按钮的背景色 */
            color: white;
            font-size: 16px;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            margin: 20px 0;
        }

        .back-to-home-btn:hover {
            background-color: rgb(45, 151, 84); /* 悬停时的背景色 */
        }
    </style>
</head>
<body>
<!-- 顶部导航 -->
<div class="header">
    <a href="homePage.jsp" class="back-to-home-btn">返回首页</a>
    <a href="store.jsp" class="header-link">进入店铺</a>
</div>
<%-- 获取商品列表 --%>
<%--String productId = request.getParameter("id"); // 获取传递的商品 ID--%>
<%
    List<Products> productList = (List<Products>) session.getAttribute("productList");
    Products selectedProduct = null;

    if (productList != null) {
        for (Products product : productList) {
            if (product.getId() == 2) {
                selectedProduct = product; // 根据 ID 查找商品
                System.out.println(selectedProduct.getName());
                break;
            }
        }
    }
%>
<%session.setAttribute("p",selectedProduct);%>
<div class="container">
    <!-- 商品信息区域 -->
    <div class="product-info">
        <!-- 商品图片 -->
        <div class="product-image">
            <img src="<%= selectedProduct.getImg() %>" alt="商品图片">
        </div>

        <!-- 商品详细信息 -->
        <div class="product-details">
            <h1 class="product-title"><%= selectedProduct.getName() %></h1>
            <p class="product-description"><%= selectedProduct.getDescription() %></p>

            <div class="price">
                <span class="price-label">价格：</span>
                <span class="price-value">¥<%= selectedProduct.getPrice() %></span>
            </div>

            <div class="delivery">
                <span class="delivery-label">配送：</span>
                <span class="delivery-info"><%= selectedProduct.getShippingInfo() %></span>
            </div>

            <form action="Servlet?action=inCart" method="post">
                <div class="actions">
                    <button class="buy-now-btn" type="submit">>立即购买</button>
                    <button class="add-to-cart-btn" type="submit">加入购物车</button>
                    <button class="add-to-wishlist-btn">收藏</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
