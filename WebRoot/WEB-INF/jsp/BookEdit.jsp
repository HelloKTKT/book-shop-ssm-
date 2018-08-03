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
function deletebook(button){
var r=confirm("确认删除该书籍信息吗?");
if (r==true)
  {
  window.location.href="DeleteBook?id="+button.id;
  }
else
  {

alert(button.id);
}

}
   
</script>    


<body>
<div class="container" style="width:50%">
<div class="panel panel-default">
<div class="panel-heading">编辑图书&nbsp; <a class="btn btn-success" href="javascript:history.back();" >返回</a></div>
<div class="panel-body">

<form enctype="multipart/form-data" action="EditBookSubmit" method="post" onSubmit="return isValid(this); ">
<input type="hidden" value="${book.bookID}" name="BookID"/>
<div class="form-group">
    <label for="exampleInputEmail1">书名：</label>
    <input type="text" class="form-control" id="exampleInputEmail1 Name" placeholder="请输入书名" name="Name" value="${book.name }">
  </div>

  <div class="form-group">
    <label for="exampleInputPassword1">作者：</label>
    <input type="text" class="form-control" id="exampleInputPassword1 author" placeholder="请输入作者" name="author" value="${book.author }">
  </div>
    <div class="form-group">
    <label for="exampleInputPassword1">出版社：</label>
    <input type="text" class="form-control" id="exampleInputPassword1 publisher" placeholder="请输入出版社名称" name="Publisher" value="${book.publisher }">
  </div>
      <div class="form-group">
    <label for="exampleInputPassword1">价格：</label>
    <input type="text" class="form-control" id="exampleInputPassword1 prive" placeholder="请输入价格" name="prive" value="${book.prive }">
  </div>
    </div>
      <div class="form-group" style="padding:0px 3%;">
    <label for="exampleInputPassword1">简介：</label>
    <textarea name="intro"  rows="5" class="form-control intro" >${book.intro}</textarea>
   
  </div><input type="hidden" value="${book.pic}" name="pic"/>
  <div> <p><b>封面:</b></p><img src="${book.pic} " width="100" height="120"/></div>
  <div class="form-group" >
    <label for="exampleInputFile">上传书籍封面</label>
    <input type="file" id="exampleInputFile pic" name="pic1" >
    <p class="help-block">支持jpg格式</p>
  </div>
    <div class="form-group">
   <input type="submit" class="btn btn-success" value="确认修改"/>
     </form>
        <button class="btn btn-danger del" id="${book.bookID}" onclick="deletebook(this);" >删除</button>
  </div>
  
  
  </div>


</div>

</div>



</body>