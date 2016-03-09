<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>复利计算器</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	
  <script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
  <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css" type="text/css">
  </link><script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
  </head>
  
  <body>
  <!-- 标题 start-->
  <nav class="navbar navbar-inverse">
  
   <div class="container">
  <div class="page-header" style="text-align:center">
  <h1 style="text-align:center;color:white">复利计算器
  <ul class="nav navbar-nav navbar-right">
        <li style="font-size:20px "><a href="#">打印</a></li>
        </h1>
</div>
</div>
</nav>
 <!-- 标题 end-->
 
 
<!--计算面板start -->
 <div class="container">
<div class="panel panel-default " >
  <div class="panel-heading">计算</div>
  <form action="<%=path %>/calcuator/Calculator" method="post">
  <div class="panel-body">
  <div> 存入本金： <input name="principal"></div><br>
   <div>  存入年利率：<input name="annualRate">%</div><br>
   <div> 存入年限：<input name="year"></div><br>
    <div> <input type="submit" value="计算"></div><br>
    </div>
    </form>
  </div>
</div>

<!--计算面板end -->

<!-- 显示当前计算结果start -->
 <div class="container">
<div class="panel panel-default ">
  <!-- Default panel contents -->
  <div class="panel-heading">计算结果</div>
<div class="panel-body">
  <div> 终值： <s:property value="total"/> </div><br>
   <s:debug></s:debug>
    </div>
</div>
</div>
<!-- 显示当前计算结果end-->
<!-- 显示未来10天面板start -->
<!-- 显示未来10天面板end -->

<!-- 图形显示start-->
<!-- 图形显示end-->


<!-- 页尾start -->
<div class="footer" style="text-align: center;">
			<!--		<div class="container">-->
			<p>
				14级商软一班  曹嘉琪 版权所有
			</p>
			<p>
				学校：广州商学院
			</p>
			<p>
				电话：88888888
			</p>
		</div>
<!-- 页尾end -->
   
  </body>
</html>
