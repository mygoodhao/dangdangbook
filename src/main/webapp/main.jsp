<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 告诉浏览器不要缩放 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link  rel="stylesheet" type="text/css" id="linka"/>
<script type="text/javascript" src="bower_components/jquery/dist/jquery.slim.js"></script>
<script type="text/javascript" src="bower_components/jquery.cookie/jquery.cookie.js"></script>
 <script type="text/javascript">
//当代码执行到这时，先加载样式
	if($.cookie('zt')){//如果之前在本浏览器更换过主题，就使用更换后的主题
		$("#linka").attr("href","bower_components/bootswatch/dist/"+$.cookie('zt')+"/bootstrap.css");
		$("#zhuti").val($.cookie('zt'));
		}else{//如果没有，就使用默认的主题
			$("#linka").attr("href","bower_components/bootswatch/dist/cerulean/bootstrap.css");
			}
 </script>
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">

					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="navbar-toggler-icon"></span>
					</button>
					<a class="navbar-brand" href="#">Brand</a>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="navbar-nav">
							<li class="nav-item active"><a class="nav-link" href="#">Link <span class="sr-only">(current)</span></a></li>
							<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
							<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown">Dropdown
									link</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else
										here</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Separated link</a>
								</div></li>
						</ul>
						<form class="form-inline">
							<input class="form-control mr-sm-2" type="text" />
							<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
						</form>
						<ul class="navbar-nav ml-md-auto">
							<li class="nav-item active"><a class="nav-link" href="javascrpt:void(0)">
																			<!--href="javascrpt:void(0)
																				之前更换主题会在地址栏里加上一个#号
																				去掉地址栏里面的#-->
							<select id="zhuti">
							<option>cerulean</option>
							<option>darkly</option>
							<option>simplex</option>
							</select>
							</a></li>
							<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown">选项</a>
								<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="exit.jsp">注销</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else
										here</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Separated link</a>
								</div></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="carousel slide" id="carousel-311648">
					<ol class="carousel-indicators">
						<li data-slide-to="0" data-target="#carousel-311648" class="active"></li>
						<li data-slide-to="1" data-target="#carousel-311648"></li>
						<li data-slide-to="2" data-target="#carousel-311648"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" alt="Carousel Bootstrap First" src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg" />
							<div class="carousel-caption">
								<h4>First Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies
									vehicula ut id elit.</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Second" src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg" />
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies
									vehicula ut id elit.</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Third" src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg" />
							<div class="carousel-caption">
								<h4>Third Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies
									vehicula ut id elit.</p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carousel-311648" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a>
					<a class="carousel-control-next" href="#carousel-311648" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<ul class="nav">
					<li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Profile</a></li>
					<li class="nav-item"><a class="nav-link disabled" href="#">Messages</a></li>
					<li class="nav-item dropdown ml-md-auto"><a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink"
						data-toggle="dropdown">Dropdown link</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else
								here</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Separated link</a>
						</div></li>
				</ul>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#zhuti").change(function (evt){
			//console.dir($(evt.target).val());
		$("#linka").attr("href","bower_components/bootswatch/dist/"+$(evt.target).val()+"/bootstrap.css");
			$.cookie('zt',$(evt.target).val(), { expires: 7 });
			});
		});
	</script>
</body>
</html>