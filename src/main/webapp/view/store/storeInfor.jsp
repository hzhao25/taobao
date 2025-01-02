<%@ page import="Service.store.StoreService" %>
<%@ page import="model.store.Store" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>店铺信息管理</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 20px;
    }
    h1 {
      color: #333;
    }
    .store-info {
      background: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
    }
    .info-item {
      margin: 10px 0;
    }
    .info-title {
      font-weight: bold;
    }
    .form-container {
      display: none; /* 初始隐藏 */
      background: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      position: fixed; /* 固定定位 */
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      z-index: 1000;
      width: 300px; /* 设置宽度 */
    }
    .overlay {
      display: none; /* 初始隐藏 */
      position: fixed; /* 固定定位 */
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5); /* 半透明背景 */
      z-index: 999;
    }
    input[type="text"],
    textarea,
    input[type="date"],
    select {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }
    button {
      background-color: rgb(55,171,104); /* 主题颜色 */
      color: white;
      padding: 10px 15px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      width: 100%; /* 按钮宽度 */
    }
    button:hover {
      background-color: #007bff; /* 悬停效果（可选） */
    }
    .close-btn {
      background: none;
      border: none;
      font-size: 18px; /* 调整大小 */
      color: rgb(55,171,104); /* 主题颜色 */
      cursor: pointer;
      position: absolute; /* 绝对定位 */
      top: 10px;
      right: 10px;
    }
  </style>
</head>
</head>
<body>
<h1>店铺信息管理</h1>

<%
  StoreService storeService = new StoreService();
  int storeId = 1;
  Store store = storeService.getStore(storeId);
%>

<div class="store-info">
  <h2>店铺信息</h2>
  <div class="info-item">
    <span class="info-title">店铺名称：</span> <%= store.getStoreName() %>
  </div>
  <div class="info-item">
    <span class="info-title">店铺描述：</span> <%= store.getDescription() %>
  </div>
  <div class="info-item">
    <span class="info-title">开店时长：</span> <%= store.getStoreDuration() %> 个月
  </div>
  <div class="info-item">
    <span class="info-title">所在地区：</span> <%= store.getLocation() %>
  </div>
  <div class="info-item">
    <span class="info-title">开店时间：</span> <%= store.getOpeningTime() %>
  </div>
</div>

<button onclick="showUpdateForm()">更新店铺信息</button>

<div class="overlay" id="overlay"></div>
<div class="form-container" id="form-container">
  <button class="close-btn" onclick="closeUpdateForm()">×</button>

  <h2>更新店铺信息</h2>

  <form action="ManageStoreServlet" method="post">
    <input type="hidden" name="storeId" value="<%= storeId %>">
    <div>
      <label class="info-title">店铺名称：</label>
      <input type="text" name="storeName" value="<%= store.getStoreName() %>" required>
    </div>
    <div>
      <label class="info-title">店铺描述：</label>
      <textarea name="description" placeholder="店铺描述" rows="4" required><%= store.getDescription() %></textarea>
    </div>
    <div>
      <label class="info-title">店铺地点：</label>
      <input type="text" name="storeLocation" value="<%= store.getLocation() %>" placeholder="店铺地点" required>
    </div>
    <div>
      <label class="info-title">开店时间：</label>
      <input type="date" name="openingTime" value="<%= store.getOpeningTime() %>" required>
    </div>
    <button type="submit">更新信息</button>
  </form>
</div>

<script>
  function showUpdateForm() {
    document.getElementById('overlay').style.display = 'block';
    document.getElementById('form-container').style.display = 'block';
  }

  function closeUpdateForm() {
    document.getElementById('overlay').style.display = 'none';
    document.getElementById('form-container').style.display = 'none';
  }
</script>
</body>
</html>