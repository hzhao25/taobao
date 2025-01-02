<%@ page import="javaBean.MyAddress" %>
<%@ page import="java.util.List" %>
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

<%
    // 获取所有地址信息
    new controller.individual.Servlet().searchAllMyAddress(request);
    List<MyAddress> addresses = (List<MyAddress>) session.getAttribute("allAddresses");

    // 如果地址列表为空，则显示提示信息
    if (addresses == null || addresses.isEmpty()) {
%>
<p>您还没有添加任何收货地址。</p>
<%
} else {
    // 遍历地址列表并展示每一个地址
    for (MyAddress address : addresses) {
        String name = address.getName();
        String number = address.getNumber();
        String addre = address.getAddress();
%>
<!-- 收货地址项 -->
<div class="container">
    <div class="address-item">
        <div class="address-info">
            <h3><%= name %></h3>
            <p><%= addre %></p>
            <p>电话：<%= number %></p>
        </div>
    </div>
</div>
<%
        }
    }
%>

<!-- 添加新地址按钮 -->
<div class="add-address-btn">
    <a href="AddNewAddress.jsp" style="text-decoration: none; color: white;">添加新地址</a>
</div>

<!-- 页脚 -->
<div class="footer">
    <span>© 2024 淘宝网</span>
</div>

</body>
</html>
