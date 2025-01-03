<%@ page import="Service.store.ProductService" %>
<%@ page import="model.store.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 86177
  Date: 2024/12/30
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品管理</title>
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
        form {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            background-color: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            background: #fff;
        }
        th {
            background: #f8f9fa;
        }
        tr:hover {
            background: #f1f1f1;
        }
        /* 按钮样式 */
        .back-to-home-btn {
            background-color: rgb(55, 171, 104); /* 设置按钮的背景色 */
            color: white;
            font-size: 16px;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            margin: 20px 0;
        }

        .back-to-home-btn:hover {
            background-color: rgb(45, 151, 84); /* 悬停时的背景色 */
        }
    </style>
</head>
<body>
<%request.setCharacterEncoding("UTF-8");%>
<h1>商品管理</h1>
<!-- 返回首页按钮 -->
<a href="homePage.jsp" class="back-to-home-btn">返回首页</a>

<%
    ProductService productService = new ProductService();
    List<Product> productList = productService.getAllProducts();
%>

<h2>添加商品</h2>
<form action="ManageProductServlet?action=add" method="post">
    <input type="text" name="name" placeholder="商品名称" required>
    <input type="number" step="0.01" name="price" placeholder="价格" required>
    <textarea name="description" placeholder="描述" rows="4" required></textarea>
    <textarea name="shippingInfo" placeholder="配送信息" rows="2" required></textarea>
    <input type="file" name="image" accept="image/*">
    <input type="submit" value="添加商品">
</form>

<h2>商品列表</h2>
<table>
    <tr>
        <th>商品ID</th>
        <th>商品名称</th>
        <th>价格</th>
        <th>图片</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    <%
        for (Product product : productList) {
    %>
    <tr>
        <td><%= product.getId() %></td>
        <td><%= product.getName() %></td>
        <td><%= product.getPrice() %></td>
        <td><%= product.getImage() %></td>
        <td><%= product.isAvailable() ? "上架" : "下架" %></td>
        <td>
            <form action="ManageProductServlet" method="post" style="display:inline;">
                <input type="hidden" name="action" value="<%= product.isAvailable() ? "setUnavailable" : "setAvailable" %>">
                <input type="hidden" name="productId" value="<%= product.getId() %>">
                <button type="submit"><%= product.isAvailable() ? "下架" : "上架" %></button>
            </form>
            <form action="ManageProductServlet" method="post" style="display:inline;" onsubmit="return confirm('确定要删除该商品吗？');">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="productId" value="<%= product.getId() %>">
                <button type="submit">删除</button>
            </form>
            <form action="ManageProductServlet?action=update" method="post" style="display:inline;">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="productId" value="<%= product.getId() %>">
                <input type="text" name="newName" placeholder="新商品名称" value="<%= product.getName() %>" required>
                <input type="number" step="0.01" name="newPrice" placeholder="新价格" value="<%= product.getPrice() %>" required>
                <textarea name="newDescription" placeholder="新描述" rows="2"><%= product.getDescription() %></textarea>
                <textarea name="newShippingInfo" placeholder="新配送信息" rows="2"><%= product.getShippingInfo() %></textarea>
                <input type="file" name="newImage" accept="image/*">
                <button type="submit">更新</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>