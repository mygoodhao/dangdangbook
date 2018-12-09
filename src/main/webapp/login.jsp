<%@ page import="com.oracle.shubook.model.Admin" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<!-- 告诉浏览器不要缩放 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- CSS -->
<!-- <link href="bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" /> -->
<link href="bower_components/bootswatch/dist/sketchy/bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container-fluid" style="width: 60%">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<%--
							Map<String,String> errors = (Map<String, String>) request.getAttribute("map");
							if(errors!=null){
								Set<String> set = errors.keySet();
								for (String srt:
									 set) {
								out.print(srt+errors.get(srt));
								}
							}
						--%>
						<form method="post" autocomplete="off" action="login" id="yanzheng">
							<%
								Map<String,String> errors = (Map<String, String>) request.getAttribute("map");
								Admin admin = (Admin) request.getAttribute("admin");
								if (admin != null) {
							%>
							<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right">用户名:</label>
								<div class="col-sm-10">
									<%
									if(errors!=null&&errors.get("name")!=null){
									%>
					<input type="text" class="form-control is-invalid" id="inputName" placeholder="用户名" name="name" value="<%=admin.getName()%>">
									<div class="invalid-feedback">
										<%=errors.get("name")%>
									</div>
									<%
									}else{
									%>
					<input type="text" class="form-control" id="inputName" placeholder="用户名" name="name" value="<%=admin.getName()%>">
									<%
									}
									%>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPwd1" class="col-sm-2 col-form-label text-right">密码:</label>
								<div class="col-sm-10">
									<%
									if(errors!=null&&errors.get("pwd")!=null){
									    %>
									<input type="password" class="form-control is-invalid" id="inputPwd1" placeholder="密码" name="pwd">
									<div class="invalid-feedback">
										<%=errors.get("pwd")%>
									</div>
									<%
									}else{
									%>
									<input type="password" class="form-control" id="inputPwd1" placeholder="密码" name="pwd">
									<%
									}
									%>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputVcode" class="col-sm-2 col-form-label text-right">验证码:</label>
								<div class="col-sm-5">
									<%
									if(errors!=null&&errors.get("vcode")!=null){
									    %>
									<input class="form-control is-invalid" id="inputVcode" placeholder="验证码" name="vcode">
									<div class="invalid-feedback">
										<%=errors.get("vcode")%>
									</div>
									<%
									}else{
										%>
									<input class="form-control" id="inputVcode" placeholder="验证码" name="vcode">
									<%
									}
									%>
								</div>
								<div class="col-sm-5">
									<img src="vcode.png" id="Imgvcode">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">登录</button>
								</div>
							</div>
							<%
								} else {
							%>
							<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right">用户名:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="用户名" name="name">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPwd1" class="col-sm-2 col-form-label text-right">密码:</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="inputPwd1" placeholder="密码" name="pwd">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputVcode" class="col-sm-2 col-form-label text-right">验证码:</label>
								<div class="col-sm-5">
									<input class="form-control" id="inputVcode" placeholder="验证码" name="vcode">
								</div>
								<div class="col-sm-5">
									<img src="vcode.png" id="Imgvcode">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">登录</button>
								</div>
							</div>
							<%
								}
							%>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="bower_components/jquery/dist/jquery.js"></script>
	<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
<script type="text/javascript">
	$(function () {
		$("#Imgvcode").click(function () {
			$(this).attr("src","vcode.png?a="+Math.random())
        })
    });
	</script>
<script type="text/javascript" src="bower_components/jquery-validation/dist/jquery.validate.js"></script>
<script type="text/javascript" src="bower_components/jquery-validation/src/localization/messages_zh.js"></script>
<script type="text/javascript">
    $(function () {
        $("#yanzheng").validate({
            rules:{
                name:{
                    required: true,
                    maxlength:10,
					minlength:3
                },
                pwd:{
                    required: true,
                    maxlength:10,
                    minlength:3
                },
            },
            messages:{

            },
            errorElement:"div",
            errorClass:"invalid-feedback",
            //填写正确，显示正确的样式
            //is-valid:是有效的
            validClass:"is-valid",
            //改变错误的地方的样式，让它高亮显示
            //is-invalid:是无效的
            highlight:function (element,errorClass,validClass){
                $(element).addClass("is-invalid").removeClass(validClass);
            },
            //填写正确，就取消高亮显示
            unhighlight:function (element,errorClass,validClass) {
                $(element).removeClass("is-invalid").addClass(validClass);
            },
        })
    });
</script>
</body>
</html>