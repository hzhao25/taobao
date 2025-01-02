<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的网站</title>
    <style>
        /* 全局样式 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        /* 导航栏样式 */
        .navbar {
            background-color: rgb(55, 171, 104);
            display: flex;  /* 使用 Flexbox 来布局 */
            justify-content: center;  /* 所有项居中排列 */
            align-items: center;  /* 垂直居中对齐 */
            padding: 10px 20px;  /* 设置上下内边距 */
            position: relative;
            width: 100%;
        }

        /* 导航项样式 */
        .navbar a, .dropdown {
            color: white;
            text-decoration: none;
            font-size: 18px;
            padding: 10px;
            display: inline-block;
            text-align: center;
        }

        .navbar a:hover, .dropdown:hover {
            background-color: rgba(255, 255, 255, 0.3);
            border-radius: 5px;
        }

        /* 下拉菜单样式 */
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: rgb(55, 171, 104);
            min-width: 160px;
            z-index: 1;
            text-align: left;
        }

        .dropdown-content a {
            color: white;
            padding: 10px;
            display: block;
            text-decoration: none;
        }

        .dropdown-content a:hover {
            background-color: rgba(255, 255, 255, 0.3);
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        /* 搜索框容器 */
        .search-container {
            display: flex;
            align-items: center;
            margin-left: 20px;  /* 搜索框和其他项之间的间距 */
        }

        .search-box {
            padding: 8px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            width: 200px;  /* 设置搜索框宽度 */
            outline: none;
        }

        .search-box:focus {
            border-color: rgb(55, 171, 104);
            box-shadow: 0 0 5px rgba(55, 171, 104, 0.5);
        }

        .search-btn {
            background-color: rgb(55, 171, 104);
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            margin-left: 10px;
        }

        .search-btn:hover {
            background-color: #4caf50;
        }


        /* 商品展示区 */
        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin: 20px 0;
        }

        /* 每个商品的样式 */
        .product {
            width: 20%; /* 每行显示5个商品 */
            margin-bottom: 15px; /* 减小底部间距 */
            background-color: white;
            padding: 8px; /* 减小内边距 */
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease-in-out;
            background-color: rgb(55, 171, 104); /* 设置商品框背景色 */
        }

        /* 商品图片 */
        .product img {
            width: 100%;
            height: auto;
            border-radius: 8px;
            transition: transform 0.3s ease-in-out;
        }

        /* 鼠标悬浮时放大图片 */
        .product:hover img {
            transform: scale(1.1);
        }

        /* 商品名字和价格 */
        .product-name {
            font-size: 14px; /* 减小字体大小 */
            font-weight: bold;
            margin-top: 8px; /* 减小间距 */
            color: white; /* 设置商品名字为白色 */
        }

        .product-price {
            font-size: 12px; /* 减小字体大小 */
            color: white; /* 设置商品价格为白色 */
            margin-top: 4px; /* 减小间距 */
        }

        /* 居中对齐容器 */
        .container {
            width: 80%; /* 设置宽度为80% */
            margin: 0 auto; /* 自动居中 */
            padding: 0 20px; /* 两侧加上20px的边距 */
        }

    </style>
</head>
<body>
<%--导航栏--%>
<div class="navbar">
    <a href="#">首页</a>
    <a href="#">购物车</a>
    <a href="#">登录注册</a>
    <%
        // 获取 session 中的角色信息
        String role = (String) session.getAttribute("role");
    %>
    <!-- 根据 session 中的 role 显示不同的下拉菜单 -->
    <% if ("user".equals(role)) { %>
    <!-- 个人下拉菜单 -->
    <div class="dropdown">
        <a href="#">个人</a>
        <div class="dropdown-content">
            <a href="#">我的评价</a>
            <a href="#">我的订单</a>
            <a href="#">购物车</a>
        </div>
    </div>
    <% } else { %>
    <!-- 店铺下拉菜单 -->
    <div class="dropdown">
        <a href="#">店铺</a>
        <div class="dropdown-content">
            <a href="#">我的商品</a>
            <a href="#">客户评价</a>
            <a href="#">客户订单</a>
        </div>
    </div>
    <% } %>

    <!-- 搜索框 -->
    <form action="SearchServlet" method="post">
        <div class="search-container">
            <input type="text" class="search-box" name="searchQuery" placeholder="搜索商品...">
            <button class="search-btn">搜索</button>
        </div>
    </form>

</div>

<!-- 页面内容 -->
<!-- 商品展示区 -->
<div class="container">
    <form action="ProductServlet" method="post">
        <div class="product-container">
            <!-- 商品 1 -->
            <div class="product">
                <a href="product1.jsp">
                    <img  src="https:\\tse1-mm.cn.bing.net\th\id\OIP-C.y6IbD3EA3TKjTmrJaAs2DwHaLH?rs=1&pid=ImgDetMain" alt="商品1">
                </a>
                <div class="product-name">女士大衣</div>
                <div class="product-price">￥499</div>

                <input type="hidden" name="productName[]" value="女士大衣">
                <input type="hidden" name="productPrice[]" value="499">
                <input type="hidden" name="productImage[]" value="https:\\tse1-mm.cn.bing.net\th\id\OIP-C.y6IbD3EA3TKjTmrJaAs2DwHaLH?rs=1&pid=ImgDetMain">
            </div>

            <!-- 商品 2 -->
            <div class="product">
                <a href="product2.jsp">
                    <img src="https://ts1.cn.mm.bing.net/th/id/R-C.fef8cba3e9f5882a0b62a0d05c0776cc?rik=hZtO%2bbzZO0A6vA&riu=http%3a%2f%2fn.sinaimg.cn%2fsinakd20201114s%2f15%2fw1001h1414%2f20201114%2f72f9-kcysmrv3933172.jpg&ehk=M4vZqOfGRKM0AFGa7D6YyyM9s2ZLkZQ8DX4w1b6jI1I%3d&risl=&pid=ImgRaw&r=0" alt="商品2">
                </a>
                <div class="product-name">黑色西装</div>
                <div class="product-price">￥599</div>

                <input type="hidden" name="productName[]" value="黑色西装">
                <input type="hidden" name="productPrice[]" value="599">
                <input type="hidden" name="productImage[]" value="https://ts1.cn.mm.bing.net/th/id/R-C.fef8cba3e9f5882a0b62a0d05c0776cc?rik=hZtO%2bbzZO0A6vA&riu=http%3a%2f%2fn.sinaimg.cn%2fsinakd20201114s%2f15%2fw1001h1414%2f20201114%2f72f9-kcysmrv3933172.jpg&ehk=M4vZqOfGRKM0AFGa7D6YyyM9s2ZLkZQ8DX4w1b6jI1I%3d&risl=&pid=ImgRaw&r=0">
            </div>

            <!-- 商品 3 -->
            <div class="product">
                <a href="product3.jsp">
                    <img src="https://cbu01.alicdn.com/img/ibank/2018/553/366/9132663355_560352766.jpg" alt="商品3">
                </a>
                <div class="product-name">V领衬衫</div>
                <div class="product-price">￥129</div>
                <input type="hidden" name="productName[]" value="V领衬衫">
                <input type="hidden" name="productPrice[]" value="129">
                <input type="hidden" name="productImage[]" value="https://cbu01.alicdn.com/img/ibank/2018/553/366/9132663355_560352766.jpg">
            </div>

            <!-- 商品 4 -->
            <div class="product">
                <img src="https://www.lingla.com/upfile/allimg/231202/02124942K-0.jpg" alt="商品4">
                <div class="product-name">格子西装</div>
                <div class="product-price">￥299</div>
                <input type="hidden" name="productName[]" value="格子西装">
                <input type="hidden" name="productPrice[]" value="299">
                <input type="hidden" name="productImage[]" value="https://www.lingla.com/upfile/allimg/231202/02124942K-0.jpg">
            </div>

            <!-- 商品 5 -->
            <div class="product">
                <img src="https://img.alicdn.com/i2/1926988776/O1CN01tewg9U2EhSgYnMPWY_!!1926988776.jpg" alt="商品5">
                <div class="product-name">20cm玉桂狗娃衣</div>
                <div class="product-price">￥40</div>
                <input type="hidden" name="productName[]" value="20cm玉桂狗娃衣">
                <input type="hidden" name="productPrice[]" value="40">
                <input type="hidden" name="productImage[]" value="https://img.alicdn.com/i2/1926988776/O1CN01tewg9U2EhSgYnMPWY_!!1926988776.jpg">
            </div>

            <!-- 商品 6 -->
            <div class="product">
                <img src="https://img.airmie.cn/img/shijuesheying/chanpinsheying/xiezi/2019-09-07/b890bb93471709165d23e330fe4e555b.jpg" alt="商品6">
                <div class="product-name">鞋子</div>
                <div class="product-price">￥149</div>
                <input type="hidden" name="productName[]" value="鞋子">
                <input type="hidden" name="productPrice[]" value="149">
                <input type="hidden" name="productImage[]" value="https://img.airmie.cn/img/shijuesheying/chanpinsheying/xiezi/2019-09-07/b890bb93471709165d23e330fe4e555b.jpg">
            </div>

            <!-- 商品 7 -->
            <div class="product">
                <img src="https://puui.qpic.cn/vshpic/0/OuCCTWl-9ht_QXXibon18qB8XH3LtloPIMNeLR4ZI_cG9NMH_0/0.jpg" alt="商品7">
                <div class="product-name">帆布鞋</div>
                <div class="product-price">￥99</div>
                <input type="hidden" name="productName[]" value="帆布鞋">
                <input type="hidden" name="productPrice[]" value="99">
                <input type="hidden" name="productImage[]" value="https://puui.qpic.cn/vshpic/0/OuCCTWl-9ht_QXXibon18qB8XH3LtloPIMNeLR4ZI_cG9NMH_0/0.jpg">
            </div>

            <!-- 商品 8 -->
            <div class="product">
                <img src="https://tse4-mm.cn.bing.net/th/id/OIP-C.dUZWQCQ66rvlK55GpQhtQwHaHa?rs=1&pid=ImgDetMain" alt="商品8">
                <div class="product-name">手链</div>
                <div class="product-price">￥39</div>
                <input type="hidden" name="productName[]" value="手链">
                <input type="hidden" name="productPrice[]" value="39">
                <input type="hidden" name="productImage[]" value="https://tse4-mm.cn.bing.net/th/id/OIP-C.dUZWQCQ66rvlK55GpQhtQwHaHa?rs=1&pid=ImgDetMain">
            </div>

            <!-- 商品 9 -->
            <div class="product">
                <img src="https://cbu01.alicdn.com/img/ibank/2019/347/038/12547830743_1443547778.jpg" alt="商品9">
                <div class="product-name">摆件</div>
                <div class="product-price">￥50</div>
                <input type="hidden" name="productName[]" value="摆件">
                <input type="hidden" name="productPrice[]" value="50">
                <input type="hidden" name="productImage[]" value="https://cbu01.alicdn.com/img/ibank/2019/347/038/12547830743_1443547778.jpg">
            </div>

            <!-- 商品 10 -->
            <div class="product">
                <img src="https://img.alicdn.com/imgextra/i3/1030481247/O1CN018hqLeN1L5ATSByge1_!!1030481247.jpg" alt="商品10">
                <div class="product-name">杯子</div>
                <div class="product-price">￥30</div>
                <input type="hidden" name="productName[]" value="杯子">
                <input type="hidden" name="productPrice[]" value="30">
                <input type="hidden" name="productImage[]" value="https://img.alicdn.com/imgextra/i3/1030481247/O1CN018hqLeN1L5ATSByge1_!!1030481247.jpg">
            </div>

            <!-- 商品 11 -->
            <div class="product">
                <img src="https://tse2-mm.cn.bing.net/th/id/OIP-C.iRx_r6r7mu46yRCRmOLF2gHaHa?rs=1&pid=ImgDetMain" alt="商品11">
                <div class="product-name">高跟鞋</div>
                <div class="product-price">￥79</div>
                <input type="hidden" name="productName[]" value="高跟鞋">
                <input type="hidden" name="productPrice[]" value="79">
                <input type="hidden" name="productImage[]" value="https://tse2-mm.cn.bing.net/th/id/OIP-C.iRx_r6r7mu46yRCRmOLF2gHaHa?rs=1&pid=ImgDetMain">
            </div>

            <!-- 商品 12 -->
            <div class="product">
                <img src="https://p1.ssl.qhimg.com/t01e2ec202ff9a2f5c4.jpg" alt="商品12">
                <div class="product-name">帽子</div>
                <div class="product-price">￥39</div>
                <input type="hidden" name="productName[]" value="帽子">
                <input type="hidden" name="productPrice[]" value="39">
                <input type="hidden" name="productImage[]" value="https://p1.ssl.qhimg.com/t01e2ec202ff9a2f5c4.jpg">
            </div>
        </div>
        <input type="submit" value="提交商品信息">
    </form>

</div>
</body>
</html>
