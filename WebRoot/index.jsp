<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线书城管理系统-登录</title>
<link rel="stylesheet" href="<%=path %>/css/bootstrap.css"/>
<style>


</style>

</head>
<script src="<%=path %>/js/jquery.js"></script>
<script src="<%=path %>/js/bootstrap.js"></script>
<script type="text/javascript">
    $(function(){
      $("#submit1").click(function(){
    var username = $(".username").val();
    var password = $(".password").val();
    var data= {username:username,password:password};

     //用ajax去数据库匹配，
    $.ajax({
        url:"Login", //要处理的页面
        data:data, //要传过去的数据
        type:"POST",  //提交方式
        dataType:"text", //返回的数据类型，TEXT字符串 JSON返回JSON XML返回XML；dataType中T要大写！！
        success: function(data){  //回调函数，data为形参，页面返回的值
            if(data.trim()=="OK")//trim()去空格
            {
      window.location.href='houtai.jsp';

            }
            else
            {

                $("#myModal").modal("show");

            }
        },
        error:function(data){ 

         alert(data); 

     }
    }); 
    }
	
)
    });
</script> 


<body>
<div class="container" style="width:30%">
<div class="panel panel-default" style="margin-top:100px;">
 <div class="panel-heading"><h2 style="font-family:微软雅黑;" class="text-center">在线书城管理系统</h2></div>
 <div class="panel-body">
<form  >
 <div class="form-group">
    <div class="input-group">
      <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
      <input type="text" class="form-control username"  />
    </div></div>
     <div class="form-group">
    <div class="input-group">
      <div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
      <input type="password" class="form-control password"  />
    </div></div>
     
    <div class="form-group">
      <button type="button" class="btn btn-success text-center" id="submit1" style="width:100%"  >登录</button>
    </div>
  </div>

</form></div></div>

</div>

<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">错误</h4>
      </div>
      <div class="modal-body">
        <p>您输入的账号或密码有误</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



</body>
</html>
