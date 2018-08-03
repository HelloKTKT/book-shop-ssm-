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
<script language="javascript">    
function isValid(form)    
{    
if (form.id.Name=="")    
 {    
 alert("书名不能为空");    
 return false;    
 }    
if (form.author.value=="")    
{    
alert("作者不能为空！");    
return false;    
}    
  if (form.Publisher.value=="")    
{    
alert("出版社不能为空！");    
return false;    
}   
if (form.prive.value=="")    
{    
alert("价格不能为空");    
return false;    
}  

else return true;    
}  
   
</script>    
<c:if test="${sessionScope.admin==null}">
<c:redirect url="index.jsp"/>
</c:if>

<body>
<div class="container" style="width:50%">
<div class="panel panel-default">
<div class="panel-heading">添加图书</div>
<div class="panel-body">

<form enctype="multipart/form-data" action="Addbooks" method="post" onSubmit="return isValid(this); ">

<div class="form-group">
    <label for="exampleInputEmail1">书名：</label>
    <input type="text" class="form-control" id="exampleInputEmail1 Name" placeholder="请输入书名" name="Name">
  </div>

  <div class="form-group">
    <label for="exampleInputPassword1">作者：</label>
    <input type="text" class="form-control" id="exampleInputPassword1 author" placeholder="请输入作者" name="author">
  </div>
    <div class="form-group">
    <label for="exampleInputPassword1">出版社：</label>
    <input type="text" class="form-control" id="exampleInputPassword1 publisher" placeholder="请输入出版社名称" name="Publisher">
  </div>
      <div class="form-group">
    <label for="exampleInputPassword1">价格：</label>
    <input type="text" class="form-control" id="exampleInputPassword1 prive" placeholder="请输入价格" name="prive">
  </div>
    </div>
      <div class="form-group" style="padding:0px 3%;">
    <label for="exampleInputPassword1">简介：</label>
    <textarea name="intro"  rows="5" class="form-control intro"></textarea>
   
  </div>
  <div class="form-group" >
    <label for="exampleInputFile">上传书籍封面</label>
    <input type="file" id="exampleInputFile pic" name="pic1" >
    <p class="help-block">支持jpg格式</p>
  </div>
    <div class="form-group">
   <input type="submit" class="btn btn-success" value="提交"/>
     </form>
  </div>
  
  
  </div>


</div>

</div>



</body>