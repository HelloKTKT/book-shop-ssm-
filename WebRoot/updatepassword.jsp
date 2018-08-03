<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updatepassword.jsp' starting page</title>
    <link rel="stylesheet" href="<%=path %>/css/bootstrap.css"/>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script src="<%=path %>/js/jquery.js"></script>
<script src="<%=path %>/js/bootstrap.js"></script>
<script type="text/javascript">
    $(function(){
      $("#submit1").click(function(){
    var oldpw = $(".oldpw").val();
    var newpw1 = $(".newpw1").val();
    var newpw2 = $(".newpw2").val();  
    if(newpw1!=newpw2){   
    alert(newpw1);
      alert(newpw2);
    $(".tips").html("两次密码不一致");
    $("#myModal").modal("show");
    }else{
        var data= {oldpw:oldpw,newpw:newpw1};
     //用ajax去数据库匹配，
    $.ajax({
        url:"UpdatePw", //要处理的页面
        data:data, //要传过去的数据
        type:"POST",  //提交方式
        dataType:"text", //返回的数据类型，TEXT字符串 JSON返回JSON XML返回XML；dataType中T要大写！！
        success: function(data){  //回调函数，data为形参，页面返回的值
            if(data.trim()=="OK")//trim()去空格
            {

             $(".modal-title").html("修改密码成功");
              $(".tips").html("修改密码成功");
              $("#myModal").modal("show");
             $("#form1")[0].reset();
            }
            else
            {
              $(".tips").html("密码错误");
                $("#myModal").modal("show");

            }
        },
        error:function(data){ 

         alert(data); 

     }
    }); }

    }
	
)
    });
</script> 
  
  <body>
<div class="container" style="width:40%">
<div class="panel panel-default" style="margin-top:60px;">
 <div class="panel-heading"><h2 style="font-family:微软雅黑;" class="text-center">当前用户:${sessionScope.admin}</h2></div>
 <div class="panel-body">
<form id="form1" >
 
 <div class="form-group">
    <label for="oldpw">旧密码:</label>
      <input type="text" class="form-control oldpw" id="oldpw"  />
    </div>
    
 <div class="form-group">
    <label for="newpw1">新密码:</label>
      <input type="password" class="form-control newpw1" id="newpw1"  />
    </div>
    
 <div class="form-group">
    <label for="newpw2">再输一次新密码:</label>
      <input type="password" class="form-control newpw2" id="newpw2"  />
    </div>
     
    <div class="form-group">
      <button type="button" class="btn btn-success text-center" id="submit1" style="width:50%"  >确认修改</button>
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
        <p class="tips">您输入密码有误</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
  
  </body>
</html>
