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
<div class="panel-heading">${orderlist[0].state}订单列表</div>
<div class="panel-body">
<table class="table">
<tr><th>订单号</th><th>用户ID</th><th>总价</th><th>收货信息</th><th>备注</th><th>状态</th><th>操作</th></tr>
<c:forEach items="${orderlist }" var="o">
<tr>

<td>${o.oid}</td>
<td>${o.ID}</td>
<td>${o.total}</td>
<td><p>收货人：${o.receiver}</p>
<p>地址：${o.address}</p>
<p>邮政编号：${o.post}</p>
<p>联系电话：${o.mobile}</p>
</td>
<td>${o.message}</td>
<td>${o.state}</td>
<td ><a class="btn btn-success edit" id="${o.oid}" href="OrderDetail?oid=${o.oid}" >查看具体</a>&nbsp;
</td></tr>
</c:forEach>
<tr style="text-align:center"><td colspan="6">
<a href="OrderList?state=${orderlist[0].state}" class="btn btn-default">首页</a>&nbsp;
<c:if test="${page>1}">
<a href="OrderList?state=${orderlist[0].state}&page=${page-1}" class="btn btn-default">上一页</a>&nbsp;
</c:if>
<c:if test="${end==0}">
<a href="OrderList?state=${orderlist[0].state}&page=${page+1}" class="btn btn-default">下一页</a>
</c:if>
</td></tr>
</table>
</div>
</div>

</div>




</body>