<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="css/bootstrap.css"/>
</head>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script>
$(function(){
	$(".navigation li").click(function() {

    $(this).addClass("active").siblings().removeClass("active");
});})

</script>

<c:if test="${sessionScope.admin==null}">
<c:redirect url="index.jsp"/>
</c:if>

<body>

<!--顶部导航栏部分-->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" title="logoTitle" href="#">在线书店管理系统</a>
       </div>
       <div class="collapse navbar-collapse">
           <ul class="nav navbar-nav navbar-right">
               <li role="presentation">
                   <a href="#">当前用户：<span class="badge">${sessionScope.admin}</span></a>
               </li>
               <li>
                   <a href="LoginOut">
                         <span class="glyphicon glyphicon-lock"></span>退出登录</a>
                </li>
            </ul>
       </div>
    </div>      
</nav>
<!-- 中间主体内容部分 -->
<div class="pageContainer">
     <!-- 左侧导航栏 -->
     <div class="pageSidebar col-md-2" style="border-right:#06C solid 2px">
         <ul class="nav nav-stacked nav-pills navigation
">
             <li class="active" >
                 <a href="BooksList" target="mainFrame" >图书信息</a>
             </li>
             
    <li><a href="#" data-toggle="collapse" data-target="#daohang1">图书信息<span class="caret"></span></a>
   <ul class="nav collapse" id="daohang1" style=" padding:0px 20px; ">
<li><a href="BooksList" target="mainFrame">图书列表</a></li>
<li><a href="addbooks.jsp" target="mainFrame">添加图书</a></li>
</ul></li>          
             
             
 <li><a href="#" data-toggle="collapse" data-target="#daohang2">客户信息<span class="caret"></span></a>
   <ul class="nav collapse" id="daohang2" style=" padding:0px 20px; ">
<li><a href="UsersList" target="mainFrame">客户列表</a></li>

</ul></li> 

<li><a href="#" data-toggle="collapse" data-target="#daohang3">订单信息<span class="caret"></span></a>
  <ul class="nav collapse" id="daohang3" style=" padding:0px 20px; ">
<li><a href="OrderList?state=待处理" target="mainFrame">待处理订单</a></li>
<li><a href="OrderList?state=已发货" target="mainFrame">已发货订单</a></li>
<li><a href="OrderList?state=已完成" target="mainFrame">已完成订单</a></li>
</ul></li>

<li><a href="#" data-toggle="collapse" data-target="#daohang4">个人中心<span class="caret"></span></a>
              <ul class="nav collapse" id="daohang4" style=" padding:0px 20px; ">
<li><a href="updatepassword.jsp" target="mainFrame">修改密码</a></li>

</ul></li>

         </ul>
     </div>
     <!-- 左侧导航和正文内容的分隔线 -->
     <div class="splitter "></div>
     <!-- 正文内容部分 -->
     <div class="pageContent col-md-10">
         <iframe src="BooksList" id="mainFrame" name="mainFrame" frameborder="0" width="100%"  height="500px" frameBorder="0"></iframe>
     </div>
 </div>
 <!-- 底部页脚部分 -->
 <div class="footer">
     <p class="text-center">
         2018 &copy; Xu
     </p>


</div>



</body>
</html>