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
<div class="panel-heading">图书列表</div>
<div class="panel-body">
<table class="table">
<tr><th>书名</th><th>作者</th><th>出版社</th><th>单价</th><th>操作</th></tr>
<c:forEach items="${booksList }" var="b">
<tr>

<td>${b.name}</td>
<td>${b.author}</td>
<td>${b.publisher}</td>
<td>${b.prive}</td>
<td ><a class="btn btn-success edit" id="${b.bookID}" href="bookEdit?id=${b.bookID}" >查看</a>&nbsp;
</td></tr>
</c:forEach>
<tr style="text-align:center"><td colspan="6">
<a href="BooksList" class="btn btn-default">首页</a>&nbsp;
<c:if test="${page>1}">
<a href="BooksList?page=${page-1}" class="btn btn-default">上一页</a>&nbsp;
</c:if>
<c:if test="${end==0}">
<a href="BooksList?page=${page+1}" class="btn btn-default">下一页</a>
</c:if>
</td></tr>
</table>
</div>
</div>

</div>




</body>