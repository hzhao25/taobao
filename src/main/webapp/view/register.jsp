<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>注册页面</title>
  <link rel="stylesheet" href="styles.css">
  <style>
    /* 全局样式 */
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .container {
      background-color: white;
      padding: 40px;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 400px;
      text-align: center;
    }

    h2 {
      color: rgb(55,171,104);
      margin-bottom: 20px;
    }

    .form {
      display: flex;
      flex-direction: column;
      gap: 20px;
    }

    .form-group {
      display: flex;
      flex-direction: column;
      align-items: flex-start;
    }

    label {
      color: #333;
      margin-bottom: 8px;
      font-size: 14px;
    }

    input {
      padding: 10px;
      width: 100%;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 14px;
    }

    input:focus {
      border-color: rgb(55,171,104);
      outline: none;
      box-shadow: 0 0 5px rgba(55,171,104, 0.3);
    }

    .submit-btn {
      background-color: rgb(55,171,104);
      color: white;
      padding: 12px;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .submit-btn:hover {
      background-color: #4caf50;
    }

    .login-link {
      margin-top: 20px;
      font-size: 14px;
    }

    .login-link a {
      color: rgb(55,171,104);
      text-decoration: none;
    }

    .login-link a:hover {
      text-decoration: underline;
    }

  </style>
</head>
<body>
<div class="container">
  <h2>注册账号</h2>
  <form action="registerServlet" method="POST" class="form">
    <div class="form-group">
      <label for="username">用户名</label>
      <input type="text" id="username" name="username" required placeholder="请输入用户名">
    </div>
    <div class="form-group">
      <label for="password">密码</label>
      <input type="password" id="password" name="password" required placeholder="请输入密码">
    </div>
    <div class="form-group">
      <label for="confirmPassword">确认密码</label>
      <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="请确认密码">
    </div>
    <button type="submit" class="submit-btn">注册</button>
  </form>
  <p class="login-link">已有账号？<a href="login.jsp">登录</a></p>
</div>
</body>
</html>
