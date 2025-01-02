<%@ page import="java.sql.Blob" %>
<%@ page import="javaBean.MyComment" %>
<%@ page import="java.util.List" %>
<%@ page import="controller.individual.Servlet" %>
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
<%
    new Servlet().searchAllMyComment(request);
    List<MyComment> comments = (List<MyComment>) session.getAttribute("allComments");
    for (int i = 0; i < comments.size(); i++) {
        MyComment comment = comments.get(i);
        String name = comment.getName();  // 商品名称
        Blob photo = comment.getPhoto();  // 商品图片
        float price = comment.getPrice(); // 商品价格
        String description = comment.getIntroduction();  // 商品描述
        String photoUrl = comment.convertBlobToBase64(photo); // 将图片Blob转为Base64编码
        int comment_score = comment.getComment_score(); // 评论星级
        String evaluate = comment.getComment(); // 评论内容
%>

<div class="container">
    <!-- 评价项 -->
    <div class="review-item">
        <div class="item-info">
            <img src="data:image/jpeg;base64,<%= photoUrl %>" alt="商品图片">
            <div>
                <h3><%= name %></h3>
                <p class="price">￥<%= price %></p>
                <p class="description"><%= description %></p>
            </div>
        </div>
        <div class="review-actions">
            <div class="rating">
                <%
                    // 显示星级
                    for (int j = 0; j < comment_score; j++) {
                        out.print("★");
                    }
                    for (int j = comment_score; j < 5; j++) {
                        out.print("☆");
                    }
                %>
            </div>
            <p class="review-content">
                <%= evaluate %>
            </p>
        </div>
    </div>
</div>

<% } %>

<!-- 页脚 -->
<div class="footer">
    <span>© 2024 淘宝网</span>
</div>

</body>
</html>
