<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" href="<%=path %>/css/bootstrap.css"/>
</head>
<script src="<%=path %>/js/jquery.js"></script>
<script src="<%=path %>/js/bootstrap.js"></script>

<body>
<div class="container">
<div class="panel panel-default">
<div class="panel-heading">用户列表</div>
<div class="panel-body">
<table class="table">
<tr><th>编号</th><th>性别</th><th>联系电话</th><th>城市</th><th>电子邮箱</th><th>操作</th></tr>
<c:forEach items="${usersList}" var="u">
<tr>

<td>${u.ID}</td>
<td>${u.sex}</td>
<td>${u.phone}</td>
<td>${u.home}</td>
<td>${u.email}</td>
<td ><a class="btn btn-success edit" id="${u.ID}" href="UserOrder?id=${u.ID}" >查看用户订单</a>&nbsp;
</td></tr>
</c:forEach>
<tr style="text-align:center"><td colspan="6">
<a href="UsersList" class="btn btn-default">首页</a>&nbsp;
<c:if test="${page>1}">
<a href="UsersList?page=${page-1}" class="btn btn-default">上一页</a>&nbsp;
</c:if>
<c:if test="${end==0}">
<a href="UsersList?page=${page+1}" class="btn btn-default">下一页</a>
</c:if>
</td></tr>
</table>
</div>
</div>

</div>




