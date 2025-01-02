<%@ page import="javaBean.Order" %>
<%@ page import="dao.individual.CRUD" %>
<%@ page import="controller.individual.Servlet" %>
<%@ page import="module.individual.Service" %>
<%@ page import="java.sql.Blob" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>评价</title>
    <link rel="stylesheet" href="ToComment.css">
</head>
<body>
<div class="header">
    <h1>商品评价</h1>
</div>

<%
    Order order = (Order) session.getAttribute("commentOrder");
    String name = order.getName();
    Blob photo = order.getPhoto();
    float price = order.getPrice();
    String description = order.getIntroduction();
    String photoUrl = order.convertBlobToBase64(photo);
%>

<div class="container">
    <h3>商品信息</h3>
    <div class="cart-item">
        <div class="item-info">
            <img src="data:image/jpeg;base64,<%= photoUrl %>" alt="<%= name %>">
            <div>
                <h3><%= name %></h3>
                <p><%= description %></p>
            </div>
        </div>
        <div class="price">￥<%= price %></div>
    </div>

    <h3>请选择评分</h3>
    <div class="stars">
        <input type="radio" id="star5" name="rating" value="1" /><label for="star5">★</label>
        <input type="radio" id="star4" name="rating" value="2" /><label for="star4">★</label>
        <input type="radio" id="star3" name="rating" value="3" /><label for="star3">★</label>
        <input type="radio" id="star2" name="rating" value="4" /><label for="star2">★</label>
        <input type="radio" id="star1" name="rating" value="5" /><label for="star1">★</label>
    </div>

    <!-- 添加商品信息和订单ID -->
    <form action="Servlet?action=addComment" method="post">
<%--        <input type="hidden" name="orderId" value="<%=request.getAttribute("index")%>" />--%>
<%--        <input type="hidden" name="name" value="<%= name %>" />--%>
<%--        <input type="hidden" name="photo" value="<%= photo %>" />--%>
<%--        <input type="hidden" name="price" value="<%= price %>" />--%>
<%--        <input type="hidden" name="description" value="<%= description %>" />--%>
        <input type="hidden" name="rating" id="rating" />
        <h3>评论内容</h3>
        <textarea name="review" rows="4" placeholder="请输入您的评论" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px;"></textarea>
        <button type="submit" class="submit-btn">提交评价</button>
    </form>
</div>

<div class="footer">
    <span>© 2024 淘宝网</span>
</div>

<script>
    // 设置评分功能：点击星星时更新评分值并高亮显示对应的星星
    const stars = document.querySelectorAll('.stars input');
    const labels = document.querySelectorAll('.stars label');
    const ratingInput = document.getElementById('rating');

    // 遍历所有的radio按钮
    stars.forEach((star, index) => {
        star.addEventListener('change', function() {
            // 更新评分值
            ratingInput.value = this.value;

            // 高亮当前星星及之前的星星
            labels.forEach((label, i) => {
                if (i <= index) {
                    label.style.color = 'gold'; // 高亮
                } else {
                    label.style.color = '#ddd'; // 恢复默认
                }
            });
        });
    });

    // 提交前验证评分是否已写
    document.getElementById('evaluationForm').addEventListener('submit', function(event) {
        const review = document.querySelector('textarea[name="review"]').value;
        // 如果评语未填写，提示用户填写
        if (!ratingInput.value) {
            alert('请先选择评分!');
            event.preventDefault();
        } else if (!review.trim()) {
            alert('请填写评论内容!');
            event.preventDefault();
        }
    });
</script>

</body>
</html>
