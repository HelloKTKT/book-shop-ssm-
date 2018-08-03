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
<div class="panel-heading">订单列表</div>
<div class="panel-body">
<div><table>
<tr><td>订单编号：${order.oid}</td><td>&nbsp;客户ID：${order.ID}</td><td>&nbsp;总价：${order.total}</td></tr>
<tr><td><p>收货人：${order.receiver}</p>
<p>地址：${order.address}</p>
<p>邮政编号：${order.post}</p>
<p>联系电话：${order.mobile}</p></td><td>&nbsp;备注：${order.message}</td><td>&nbsp;订单状态：${order.state}&nbsp;
<c:if test="${order.state=='待处理'}">
<a href="DealOrder?oid=${order.oid}" class="btn btn-success">确认发货</a>
</c:if>
</td></tr>
</table>
</div>
<table class="table">
<tr><th>书籍编号</th><th>书籍名称</th><th>数量</th><th>价格</th></tr>
<c:forEach items="${list }" var="l">
<tr>
<td>${l.bookID}</td>
<td>${l.name}</td>
<td>${l.number}</td>
<td>${l.allPrice}</td>
</tr>
</c:forEach>
</table>
</div>
</div>

</div>




</body>