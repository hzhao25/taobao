<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加新地址</title>
    <style>
        /* 设置页面背景颜色 */
        body {
            font-family: Arial, sans-serif;
            background-color: rgb(55, 171, 104); /* 设置背景色 */
            color: white; /* 设置字体颜色为白色，以与背景对比 */
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        h1 {
            text-align: center;
            padding: 20px;
            font-size: 24px;
        }

        form {
            width: 50%;
            margin: 0 auto;
            background-color: white; /* 设置表单背景颜色 */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        label {
            font-size: 16px;
            margin-bottom: 8px;
            display: block;
            color: rgb(55, 171, 104); /* 设置label的字体颜色 */
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 12px; /* 增加输入框与其他元素的垂直间距 */
            border-radius: 4px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input[type="submit"] {
            background-color: rgb(55, 171, 104); /* 设置提交按钮的背景色 */
            color: white; /* 设置字体颜色 */
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: rgb(45, 151, 84); /* 设置提交按钮的悬浮背景色 */
        }
    </style>
</head>
<body>
<h1>添加收货地址</h1>

<form action="Servlet?action=addAddress" method="post">
    <label for="name">收货人姓名：</label>
    <input type="text" id="name" name="name" required><br>

    <label for="address">收货地址：</label>
    <input type="text" id="address" name="address" required><br>

    <label for="number">联系电话：</label>
    <input type="text" id="number" name="number" required><br>

    <input type="submit" value="添加地址">
</form>
</body>
</html>
