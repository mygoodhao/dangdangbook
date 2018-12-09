<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- 告诉浏览器不要缩放 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="bower_components/bootswatch/dist/sketchy/bootstrap.css" rel="stylesheet" type="text/css" id="linka"/>
<title>大类名</title>
</head>
<body>
<div class="container-fluid" style="width: 60%">
		<div class="row">
			<div class="col-md-12">
				<div class="card" >
					<div class="card-body">
						<form method="post" autocomplete="off" action="smallTypeAdd">
							<div class="form-group row">
								<label for="inputBid" class="col-sm-2 col-form-label text-right">大类名</label>
								<div class="col-sm-10">
									<select name="bid" class="form-control" id="inputTid">
									
									</select>
								</div>
							</div>
								
								<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right">小类名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="小类名" name="name"">
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
<script type="text/javascript">
		/*var xhr = new XMLHttpRequest();
		xhr.open("GET","findAllBigType");
		xhr.send();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4){
					if (xhr.status==200) {
						console.dir(xhr.responseText);
						eval(xhr.responseText);
					}
				}
			}*/
		
		function fillSel(types){
			for (var i = 0; i < types.length; i++) {
				var op = new Option(types[i].name,types[i].id);
				document.getElementById("inputTid").appendChild(op);
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
</script>
<!--<script type="text/javascript" src="findAllBigType"></script>  -->
</body>
</html>














