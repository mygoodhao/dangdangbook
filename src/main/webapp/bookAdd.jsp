<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- 告诉浏览器不要缩放 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="bower_components/bootswatch/dist/sketchy/bootstrap.css" rel="stylesheet" type="text/css" id="linka"/>
<title>添加书籍</title>
</head>
<style type="text/css">
.custom-file-label::after{content: "浏览"}
</style>
<body>
<div class="container-fluid" style="width: 60%">
		<div class="row">
			<div class="col-md-12">
				<div class="card" >
					<div class="card-body">
						<form method="post" autocomplete="off" action="bookAdd" enctype="multipart/form-data" id="yanzheng">
							<div class="form-group row">
								<label for="inputBid" class="col-sm-2 col-form-label text-right">大类名</label>
								<div class="col-sm-10">
									<select name="bid" class="form-control" id="inputBid">
									<option>--请选择--</option>
									
									</select>
								</div>
							</div>
								
								<div class="form-group row">
								<label for="inputSid" class="col-sm-2 col-form-label text-right">小类名</label>
								<div class="col-sm-10">
									<select name="sid" class="form-control" id="inputSid">
									
									</select>
								</div>
							</div>
								
								<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right">书名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="书名" name="name">
								</div>
							</div>
								
								<div class="form-group row">
								<label for="inputPrice" class="col-sm-2 col-form-label text-right">价格</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputPrice" placeholder="价格" name="price">
								</div>
							</div>
								<div class="form-group row">
								<label for="inputAuthor" class="col-sm-2 col-form-label text-right">作者</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputAuthor" placeholder="作者" name="author">
								</div>
							</div>
								<div class="form-group row">
								<label for="inputPress" class="col-sm-2 col-form-label text-right">出版社</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputPress" placeholder="出版社" name="cbs">
								</div>
							</div>
								<div class="form-group row">
								<label for="inputCbDate" class="col-sm-2 col-form-label text-right">出版日期</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputCbDate" placeholder="出版日期" name="cdDate" readonly="readonly">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputDescri" class="col-sm-2 col-form-label text-right">简介</label>
								<div class="col-sm-10">
									<textarea class="form-control" id="inputDescri" name="descri"></textarea>
								</div>
							</div>
							
							<div class="form-group row">
								<label for="inputPhoto" class="col-sm-2 col-form-label text-right">图片</label>
								<div class="col-sm-10">
									<div class="custom-file">
										<input type="file" class="custom-file-input" id="inputPhoto" name="photo"> 
										<label class="custom-file-label" for="inputPhoto" aria-describedby="inputGroupFileAddon02">选择文件</label>
									</div>
									<!--  <input type="file" class="form-control" id="inputPhoto" placeholder="上传头像" name="photo">-->
								</div>
							</div>
							
							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">添加</button>
								</div>
							</div>
						</form>		
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript" src="bower_components/jquery/dist/jquery.js"></script>
<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
<script type="text/javascript" src="bower_components/jquery-validation/dist/jquery.validate.js"></script>
<script type="text/javascript" src="bower_components/jquery-validation/src/localization/messages_zh.js"></script>
<script type="text/javascript">
		
		function fillSel(types){
			for (var i = 0; i < types.length; i++) {
				var op = new Option(types[i].name,types[i].id);
				document.getElementById("inputBid").appendChild(op);
			}
			}

		function fillSmallSel(types){
			document.getElementById("inputSid").innerHTML="";
			for (var i = 0; i < types.length; i++) {
				var op = new Option(types[i].name,types[i].id);
				document.getElementById("inputSid").appendChild(op);
			}
			}
			/*var script = document.createElement("script");
			script.src="findAllBigType";
			document.body.appendChild(script);*/
			$.ajax({
				url:"findAllBigType",
				dataType:"jsonp",
				jsonpCallback:"fillSel",
				});

		$("#inputBid").change(function(){
			$.ajax({
				url:"findAllSmallType",
				dataType:"jsonp",
				data:"bid="+$(this).val(),
				jsonpCallback:"fillSmallSel",
				});
			});
</script>
<!--<script type="text/javascript" src="findAllBigType"></script>  -->
<script type="text/javascript" src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="bower_components/jquery-validation/dist/additional-methods.js"></script>
<script type="text/javascript" src="bower_components/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
<script type="text/javascript">
	$("#inputCbDate").datepicker({
		language : 'zh-CN',
		format : 'yyyy-mm-dd',
		autoclose : true,
		defaultViewDate : {
			year : new Date().getFullYear() - 18
		}
	});
	$(function () {
		$("#yanzheng").validate({
			rules:{
                price:{
                    required: true,
					number:true
				},
                descri:{
                    required: true,
					maxlength:100
				},
				photo:{
                    required:true,
                    accept:"image/*"
				},
			},
			messages:{
                price:{
                    required: "必填项",
                    number:"只能以数字填写"
                },
                photo:{
                    accept:"请选择图片"
                },
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














