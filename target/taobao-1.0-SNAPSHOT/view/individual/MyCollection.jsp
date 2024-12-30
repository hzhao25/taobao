<%--
  Created by IntelliJ IDEA.
  User: 34158
  Date: 2024/12/30
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>我的收藏</title>
  <link rel="stylesheet" href="MyCollection.css">
</head>
<body>
<!-- 页面头部 -->
<header>
  <h1>我的收藏</h1>
</header>

<!-- 收藏列表 -->
<section class="collection-list">
  <!-- 如果收藏为空，显示提示信息 -->
  <c:if test="${empty collections}">
    <div class="no-collection">
      <p>您还没有收藏任何商品哦！</p>
    </div>
  </c:if>

  <!-- 遍历收藏商品 -->
  <c:forEach var="item" items="${collections}">
    <div class="collection-item">
      <!-- 商品图片 -->
      <img class="item-image" src="${item.imageUrl}" alt="商品图片">

      <!-- 商品信息 -->
      <div class="item-info">
        <p class="item-name">${item.name}</p>
        <p class="item-price">￥${item.price}</p>
      </div>

      <!-- 删除按钮 -->
      <button class="remove-btn" onclick="removeFromCollection(${item.id})">删除</button>
    </div>
  </c:forEach>
</section>

<!-- 引入 JavaScript -->
<script>
  // 删除收藏商品的处理函数
  function removeFromCollection(itemId) {
    // 这里可以调用后台接口来删除收藏
    alert('商品 ' + itemId + ' 已从收藏中删除！');
    // 实际开发中应通过AJAX请求或者页面重定向来更新收藏数据
  }
</script>

</body>
</html>
