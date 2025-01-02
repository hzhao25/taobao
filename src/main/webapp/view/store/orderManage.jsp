<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.store.StoreOrder" %>
<%@ page import="Service.store.StoreOrderService" %>

<%
    StoreOrderService storeOrderService = new StoreOrderService();
    List<StoreOrder> orders = storeOrderService.getAllOrders();
%>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>订单管理</title>
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
        h2 {
            color: #555;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: #fff;
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #f8f9fa;
        }
        tr:hover {
            background: #f1f1f1;
        }
        button {
            background-color: #28a745;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
        .no-orders {
            text-align: center;
            padding: 20px;
            color: #999;
        }
    </style>
</head>
<body>
<h1>订单管理</h1>
<h2>顾客订单列表</h2>

<table>
    <tr>
        <th>订单ID</th>
        <th>顾客ID</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    <%
        for (StoreOrder order : orders) {
    %>
    <tr>
        <td><%= order.getId() %></td>
        <td><%= order.getCustomerId() %></td>
        <td><%= order.getStatus() %></td>
        <td>
            <form action="orderDetails.jsp" method="get">
                <input type="hidden" name="orderId" value="<%= order.getId() %>">
                <button type="submit">查看详情</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>