<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%--<%@page import="controller.individual.LoginServlet" %>--%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>登录</title>
  <style>
    /* 页面整体布局 */
    body {
      font-family: Arial, sans-serif;
      background-color: #f5f5f5;
      margin: 0;
      padding: 0;
    }

    /* 登录框容器 */
    .login-container {
      width: 100%;
      max-width: 400px;
      margin: 100px auto;
      background-color: white;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    /* 标题 */
    h2 {
      text-align: center;
      color: rgb(55, 171, 104);
      margin-bottom: 30px;
    }

    /* 表单输入项 */
    .input-group {
      margin-bottom: 15px;
    }

    label {
      font-size: 14px;
      color: #555;
    }

    input[type="text"], input[type="password"] {
      width: 100%;
      padding: 10px;
      margin: 5px 0;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 16px;
    }

    input[type="text"]:focus, input[type="password"]:focus {
      border-color: rgb(55, 171, 104);
    }

    /* 按钮样式 */
    .btn-login {
      width: 100%;
      background-color: rgb(55, 171, 104);
      color: white;
      border: none;
      cursor: pointer;
      font-size: 16px;
      padding: 10px;
      border-radius: 5px;
    }

    .btn-login:hover {
      background-color: #4caf50;
    }

    .btn-login:focus {
      outline: none;
    }

    /* 其他链接样式 */
    .forgot-password, .register {
      text-align: center;
      margin-top: 20px;
    }

    .forgot-password a, .register a {
      color: rgb(55, 171, 104);
      text-decoration: none;
    }

    .forgot-password a:hover, .register a:hover {
      text-decoration: underline;
    }

    /* 页面底部 */
    .footer {
      text-align: center;
      color: #999;
      font-size: 14px;
      margin-top: 30px;
    }

  </style>
</head>
<body>

<div class="login-container">
  <h2>欢迎登录</h2>

  <!-- 账号密码登录表单 -->
  <form action="LoginServlet" method="post">
    <div class="input-group">
      <label for="username">用户名：</label>
      <input type="text" id="username" name="username" placeholder="请输入用户名" required>
    </div>

    <div class="input-group">
      <label for="password">密码：</label>
      <input type="password" id="password" name="password" placeholder="请输入密码" required>
    </div>

    <!-- 用户类型选择开关 -->
    <div class="input-group">
      <label for="user-role">登录角色：</label>
      <div>
        <label for="user-role">
          <input type="radio" id="user-role" name="role" value="user"> 用户
        </label>
        <label for="merchant-role">
          <input type="radio" id="merchant-role" name="role" value="merchant"> 商家
        </label>
      </div>
    </div>

    <button type="submit" class="btn-login">登录</button>
  </form>

  <!-- 忘记密码和注册链接 -->
  <div class="forgot-password">
    <a href="password.jsp">忘记密码？</a>
  </div>

  <div class="register">
    <a href="register.jsp">没有账号？点击注册</a>
  </div>
</div>

</body>
</html>
