<%@ page import="javaBean.Goods" %>
<%@ page import="dao.individual.CRUD" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="controller.individual.Servlet" %>
<%@ page import="javaBean.Order" %>
<%@ page import="java.awt.print.Printable" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>购物车</title>
    <link rel="stylesheet" href="Cart.css">
    <script>
        // 计算选中商品的总价
        function calculateTotal() {
            let total = 0;
            // 遍历所有商品的复选框
            let checkboxes = document.querySelectorAll('.item-checkbox');
            checkboxes.forEach(function(checkbox) {
                if (checkbox.checked) {
                    let price = parseFloat(checkbox.getAttribute('data-price'));
                    total += price;
                }
            });
            document.getElementById('total-price').innerText = '总价：￥' + total.toFixed(2);
        }
    </script>

</head>
<body>
<div class="header">
    <h1>购物车</h1>
</div>
<%
    new Servlet().searchAllGoods(request);
    // 获取所有商品
    List<Goods> goods = (List<Goods>) session.getAttribute("cartGoods");
    if (goods != null && !goods.isEmpty()) {
        // 遍历商品列表
        for (int i = 0; i < goods.size(); i++) {
            Goods item = goods.get(i);
            String name = item.getName();
            Blob photo = item.getPhoto();
            float price = item.getPrice();
            String description = item.getIntroduction();
            // 需要将图片 Blob 转换成合适的格式，例如Base64或文件路径，这里假设是文件路径
            String photoUrl = item.convertBlobToBase64(photo);  // 你需要根据实际情况调整
%>
<form action="Servlet?action=ordersAdd" method="post">
    <div class="container">
        <!-- 购物车商品列表 -->
        <div class="cart-items">
            <div class="cart-item">
                <div class="item-info">
                    <!-- 复选框 -->
                    <input type="checkbox" class="item-checkbox" name="box" value="<%=i%>" data-price="<%= price %>" onclick="calculateTotal()">
                    <!-- 商品图片 -->
                    <img src="data:image/jpeg;base64,<%= photoUrl %>" alt="商品图片" id="image">
                    <div>
                        <h3 id="name">商品名称: <%= name %></h3>
                        <p id="description"><%= description %></p>
                    </div>
                </div>
                <div class="price" id="price">￥<%= price %></div>
            </div>
        </div>
    </div>
<%
    }
} else {
%>
<p>购物车为空！</p>
<%
    }
%>

<!-- 购物车结算 -->
<div>
    <div>
        <p class="total-price" id="total-price" style="text-align: left">总价：￥0.00</p>
    </div>
    <input type="submit" value="去结算" class="checkout-btn">
</div>
</form>
<div class="footer">
    <span>© 2024 淘宝网</span>
</div>
</body>
</html>