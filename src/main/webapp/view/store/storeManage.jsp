<%--
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
<!-- 返回首页按钮 -->
<a href="homePage.jsp" class="back-to-home-btn">返回首页</a>
<h1>商品管理</h1>
<form action="manageProduct" method="post">
    <input type="hidden" name="action" value="add">
    <input type="text" name="name" placeholder="商品名称" required>
    <input type="number" step="0.01" name="price" placeholder="价格" required>
    <textarea name="description" placeholder="描述" rows="4" required></textarea>
    <button type="submit">添加商品</button>
</form>

<h2>商品列表</h2>
<table>
    <tr>
        <th>商品ID</th>
        <th>商品名称</th>
        <th>价格</th>
        <th>操作</th>
    </tr>
    <!-- TODO: 动态生成商品列表 -->
    <tr>
        <td>1</td>
        <td>示例商品</td>
        <td>100.00</td>
        <td>
            <form action="manageProduct" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="productId" value="1">
                <button type="submit">删除</button>
            </form>
        </td>
    </tr>
    <!-- 其他商品项 -->
</table>
</body>
</html>