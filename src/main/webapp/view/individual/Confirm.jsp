<%@ page import="javaBean.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javaBean.Goods" %>
<%@ page import="javax.lang.model.element.NestingKind" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="controller.individual.Servlet" %>
<%@ page import="javaBean.MyAddress" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>确认地址和支付方式</title>
    <link rel="stylesheet" href="Confirm.css">
</head>
<body>
<div class="container">
    <div class="header">
        <h2>请确认信息</h2>
    </div>
    <%
        // 获取所有地址
        new Servlet().searchAllMyAddress(request);
        List<MyAddress> addresses = (List<MyAddress>) session.getAttribute("allAddresses");
    %>
    <form action="Pay.jsp" method="POST">
        <!-- 收货地址选择 -->
        <div class="form-group">
            <label for="address">选择收货地址:</label>
            <select id="address" name="address" required>
                <%
                    for (MyAddress address : addresses) {
                        String name = address.getName();
                        String number = address.getNumber();
                        String addre = address.getAddress();
                %>
                <option value="<%= addre %>">
                    <%= name %> - <%= addre %> - <%= number %>
                </option>
                <%
                    }
                %>
            </select>
        </div>

        <!-- 支付方式选择 -->
        <div class="form-group">
            <label for="payment">选择支付方式:</label>
            <select id="payment" name="payment" required>
                <option value="alipay">支付宝</option>
                <option value="wechat">微信支付</option>
                <option value="creditCard">信用卡</option>
            </select>
        </div>

        <button type="submit" class="btn">确认</button>
    </form>
</div>
</body>
</html>
