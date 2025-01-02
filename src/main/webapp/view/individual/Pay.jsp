<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>支付订单</title>
    <link rel="stylesheet" href="Confirm.css">
</head>
<body>
<div class="container">
    <div class="header">
        <h2>请输入支付密码</h2>
    </div>

    <%
        // 获取用户提交的支付密码（如果有）
        String password = request.getParameter("password");
        boolean isPasswordCorrect = false;

        // 如果有密码输入，进行验证
        if (password != null && !password.isEmpty()) {
            // 判断密码是否为 "123456"
            isPasswordCorrect = "123456".equals(password);
        }
    %>

    <%-- 如果密码已输入，显示验证结果 --%>
    <% if (password != null && !password.isEmpty()) { %>
    <div class="payment-result">
        <% if (isPasswordCorrect) { %>
        <h3>支付成功！</h3>
        <p>感谢您的支付，您的订单已成功处理。</p>
        <% } else { %>
        <h3>支付失败</h3>
        <p>支付密码错误，请重新支付。</p>
        <% } %>
    </div>
    <% } %>

    <%-- 如果没有输入密码或验证失败，则显示输入表单 --%>
    <% if (password == null || password.isEmpty() || !isPasswordCorrect) { %>
    <form action="" method="POST">
        <div class="form-group">
            <label for="password" class="label">请输入支付密码:</label>
            <input type="password" id="password" name="password" class="select" required />
        </div>
        <button type="submit" class="btn">支付</button>
    </form>
    <% } %>

    <form action="Servlet?action=payOrders" method="post">
        <input type="submit" class="btn" value="查看订单">
    </form>
</div>
</body>
</html>
