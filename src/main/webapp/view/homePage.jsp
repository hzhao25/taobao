<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的网站</title>
    <style>
        /* 全局样式 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        /* 导航栏样式 */
        .navbar {
            background-color: rgb(55, 171, 104);
            display: flex;  /* 使用 Flexbox 来布局 */
            justify-content: center;  /* 所有项居中排列 */
            align-items: center;  /* 垂直居中对齐 */
            padding: 10px 20px;  /* 设置上下内边距 */
            position: relative;
            width: 100%;
        }

        /* 导航项样式 */
        .navbar a, .dropdown {
            color: white;
            text-decoration: none;
            font-size: 18px;
            padding: 10px;
            display: inline-block;
            text-align: center;
        }

        .navbar a:hover, .dropdown:hover {
            background-color: rgba(255, 255, 255, 0.3);
            border-radius: 5px;
        }

        /* 下拉菜单样式 */
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: rgb(55, 171, 104);
            min-width: 160px;
            z-index: 1;
            text-align: left;
        }

        .dropdown-content a {
            color: white;
            padding: 10px;
            display: block;
            text-decoration: none;
        }

        .dropdown-content a:hover {
            background-color: rgba(255, 255, 255, 0.3);
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        /* 搜索框容器 */
        .search-container {
            display: flex;
            align-items: center;
            margin-left: 20px;  /* 搜索框和其他项之间的间距 */
        }

        .search-box {
            padding: 8px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            width: 200px;  /* 设置搜索框宽度 */
            outline: none;
        }

        .search-box:focus {
            border-color: rgb(55, 171, 104);
            box-shadow: 0 0 5px rgba(55, 171, 104, 0.5);
        }

        .search-btn {
            background-color: rgb(55, 171, 104);
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            margin-left: 10px;
        }

        .search-btn:hover {
            background-color: #4caf50;
        }


        /* 商品展示区 */
        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin: 20px 0;
        }

        /* 每个商品的样式 */
        .product {
            width: 20%; /* 每行显示5个商品 */
            margin-bottom: 15px; /* 减小底部间距 */
            background-color: white;
            padding: 8px; /* 减小内边距 */
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease-in-out;
            background-color: rgb(55, 171, 104); /* 设置商品框背景色 */
        }

        /* 商品图片 */
        .product img {
            width: 100%;
            height: auto;
            border-radius: 8px;
            transition: transform 0.3s ease-in-out;
        }

        /* 鼠标悬浮时放大图片 */
        .product:hover img {
            transform: scale(1.1);
        }

        /* 商品名字和价格 */
        .product-name {
            font-size: 14px; /* 减小字体大小 */
            font-weight: bold;
            margin-top: 8px; /* 减小间距 */
            color: white; /* 设置商品名字为白色 */
        }

        .product-price {
            font-size: 12px; /* 减小字体大小 */
            color: white; /* 设置商品价格为白色 */
            margin-top: 4px; /* 减小间距 */
        }

        /* 居中对齐容器 */
        .container {
            width: 80%; /* 设置宽度为80% */
            margin: 0 auto; /* 自动居中 */
            padding: 0 20px; /* 两侧加上20px的边距 */
        }

    </style>
</head>
<body>
<%--导航栏--%>
<div class="navbar">
    <a href="#">首页</a>
    <a href="#">收藏夹</a>
    <a href="#">购物车</a>
    <a href="#">登录注册</a>

    <!-- 个人下拉菜单 -->
    <div class="dropdown">
        <a href="#">个人</a>
        <div class="dropdown-content">
            <a href="#">我的收藏</a>
            <a href="#">我的评价</a>
            <a href="#">我的订单</a>
            <a href="#">购物车</a>
        </div>
    </div>

    <!-- 店铺下拉菜单 -->
    <div class="dropdown">
        <a href="#">店铺</a>
        <div class="dropdown-content">
            <a href="#">我的商品</a>
            <a href="#">客户评价</a>
            <a href="#">客户订单</a>
        </div>
    </div>

    <!-- 搜索框 -->
    <div class="search-container">
        <input type="text" class="search-box" placeholder="搜索商品...">
        <button class="search-btn">搜索</button>
    </div>
</div>


<!-- 页面内容 -->
<!-- 商品展示区 -->
<div class="container">
    <div class="product-container">
        <!-- 商品 1 -->
        <div class="product">
            <img src="https://tse1-mm.cn.bing.net/th/id/OIP-C.y6IbD3EA3TKjTmrJaAs2DwHaLH?rs=1&pid=ImgDetMain" alt="商品1">
            <div class="product-name">商品名称 1</div>
            <div class="product-price">￥199.99</div>
        </div>

        <!-- 商品 2 -->
        <div class="product">
            <img src="https://tse1-mm.cn.bing.net/th/id/OIP-C.y6IbD3EA3TKjTmrJaAs2DwHaLH?rs=1&pid=ImgDetMain" alt="商品2">
            <div class="product-name">商品名称 2</div>
            <div class="product-price">￥299.99</div>
        </div>

        <!-- 商品 3 -->
        <div class="product">
            <img src="https://tse1-mm.cn.bing.net/th/id/OIP-C.y6IbD3EA3TKjTmrJaAs2DwHaLH?rs=1&pid=ImgDetMain" alt="商品3">
            <div class="product-name">商品名称 3</div>
            <div class="product-price">￥399.99</div>
        </div>

        <!-- 商品 4 -->
        <div class="product">
            <img src="https://tse1-mm.cn.bing.net/th/id/OIP-C.y6IbD3EA3TKjTmrJaAs2DwHaLH?rs=1&pid=ImgDetMain" alt="商品4">
            <div class="product-name">商品名称 4</div>
            <div class="product-price">￥499.99</div>
        </div>

        <!-- 商品 5 -->
        <div class="product">
            <img src="https://tse1-mm.cn.bing.net/th/id/OIP-C.y6IbD3EA3TKjTmrJaAs2DwHaLH?rs=1&pid=ImgDetMain" alt="商品5">
            <div class="product-name">商品名称 5</div>
            <div class="product-price">￥599.99</div>
        </div>

        <!-- 商品 6 -->
        <div class="product">
            <img src="https://tse1-mm.cn.bing.net/th/id/OIP-C.y6IbD3EA3TKjTmrJaAs2DwHaLH?rs=1&pid=ImgDetMain" alt="商品6">
            <div class="product-name">商品名称 6</div>
            <div class="product-price">￥699.99</div>
        </div>

        <!-- 商品 7 -->
        <div class="product">
            <img src="https://tse1-mm.cn.bing.net/th/id/OIP-C.y6IbD3EA3TKjTmrJaAs2DwHaLH?rs=1&pid=ImgDetMain" alt="商品7">
            <div class="product-name">商品名称 7</div>
            <div class="product-price">￥799.99</div>
        </div>

        <!-- 商品 8 -->
        <div class="product">
            <img src="https://tse1-mm.cn.bing.net/th/id/OIP-C.y6IbD3EA3TKjTmrJaAs2DwHaLH?rs=1&pid=ImgDetMain" alt="商品8">
            <div class="product-name">商品名称 8</div>
            <div class="product-price">￥899.99</div>
        </div>

        <!-- 商品 9 -->
        <div class="product">
            <img src="https://tse1-mm.cn.bing.net/th/id/OIP-C.y6IbD3EA3TKjTmrJaAs2DwHaLH?rs=1&pid=ImgDetMain" alt="商品9">
            <div class="product-name">商品名称 9</div>
            <div class="product-price">￥999.99</div>
        </div>

        <!-- 商品 10 -->
        <div class="product">
            <img src="https://tse1-mm.cn.bing.net/th/id/OIP-C.y6IbD3EA3TKjTmrJaAs2DwHaLH?rs=1&pid=ImgDetMain" alt="商品10">
            <div class="product-name">商品名称 10</div>
            <div class="product-price">￥1099.99</div>
        </div>

        <!-- 商品 11 -->
        <div class="product">
            <img src="https://tse1-mm.cn.bing.net/th/id/OIP-C.y6IbD3EA3TKjTmrJaAs2DwHaLH?rs=1&pid=ImgDetMain" alt="商品11">
            <div class="product-name">商品名称 11</div>
            <div class="product-price">￥1199.99</div>
        </div>

        <!-- 商品 12 -->
        <div class="product">
            <img src="https://tse1-mm.cn.bing.net/th/id/OIP-C.y6IbD3EA3TKjTmrJaAs2DwHaLH?rs=1&pid=ImgDetMain" alt="商品12">
            <div class="product-name">商品名称 12</div>
            <div class="product-price">￥1299.99</div>
        </div>
    </div>
</div>

</body>
</html>
