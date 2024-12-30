<%--
  Created by IntelliJ IDEA.
  User: 34158
  Date: 2024/12/30
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>收货地址</title>
    <link rel="stylesheet" href="MyAddress.css">
</head>
<body>
<!-- 页面头部 -->
<div class="header">
    <h1>我的收货地址</h1>
</div>

<!-- 页面主体 -->
<div class="container">
    <!-- 收货地址项 1 -->
    <div class="address-item">
        <div class="address-info">
            <h3>张三</h3>
            <p>北京市朝阳区建国路88号</p>
            <p>电话：13812345678</p>
            <p>邮政编码：100022</p>
            <p>备注：无</p>
        </div>
        <div class="address-actions">
            <button>编辑</button>
            <button>删除</button>
        </div>
    </div>

    <!-- 收货地址项 2 -->
    <div class="address-item">
        <div class="address-info">
            <h3>李四</h3>
            <p>上海市浦东新区世纪大道88号</p>
            <p>电话：13987654321</p>
            <p>邮政编码：200122</p>
            <p>备注：请尽量快递送达</p>
        </div>
        <div class="address-actions">
            <button>编辑</button>
            <button>删除</button>
        </div>
    </div>

    <!-- 收货地址项 3 -->
    <div class="address-item">
        <div class="address-info">
            <h3>王五</h3>
            <p>广东省广州市天汇大厦A座101</p>
            <p>电话：13765432109</p>
            <p>邮政编码：510000</p>
            <p>备注：顺丰快递</p>
        </div>
        <div class="address-actions">
            <button>编辑</button>
            <button>删除</button>
        </div>
    </div>

    <!-- 添加新地址按钮 -->
    <div class="add-address-btn">
        <a href="add_address.jsp" style="text-decoration: none; color: white;">添加新地址</a>
    </div>
</div>

<!-- 页脚 -->
<div class="footer">
    <span>© 2024 淘宝网</span>
</div>
</body>
</html>
