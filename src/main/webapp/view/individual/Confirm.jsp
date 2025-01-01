<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>确认地址和支付方式</title>
    <link rel="stylesheet" href="Confirm.css">
</head>
<body>
<div class="container">
    <div class="header">
        <h2>请确认</h2>
    </div>

    <form action="confirmOrder.jsp" method="POST">
        <!-- 收货地址选择 -->
        <div class="form-group">
            <label for="address" class="label">选择收货地址:</label>
            <select id="address" name="address" class="select" required>
                <option value="address1">
                    <div>
                        <h3>姓名：张三</h3>
                        <p>地址：北京市朝阳区建国路88号</p>
                        <p>电话：13812345678</p>
                    </div>
                </option>
                <option value="address2">
                    <div>
                        <h3>姓名：李四</h3>
                        <p>地址：上海市浦东新区世纪大道88号</p>
                        <p>电话：13987654321</p>
                    </div>
                </option>
                <option value="address3">
                    <div>
                        <h3>姓名：王五</h3>
                        <p>地址广东省广州市天汇大厦A座101</p>
                        <p>电话：13765432109</p>
                    </div>
                </option>
            </select>
        </div>

        <!-- 支付方式选择 -->
        <div class="form-group">
            <label for="payment" class="label">选择支付方式:</label>
            <select id="payment" name="payment" class="select" required>
                <option value="alipay">支付宝</option>
                <option value="wechat">微信支付</option>
                <option value="creditCard">信用卡</option>
            </select>
        </div>

        <!-- 隐藏的购物车商品信息 -->
        <input type="hidden" name="selectedItems" value="<%= request.getParameter("selectedItems") %>" />

        <button type="submit" class="btn">确认订单</button>
    </form>
</div>
</body>
</html>
