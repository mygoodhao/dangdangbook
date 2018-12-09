<%@page import="com.oracle.shubook.model.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<title>主页</title>
<!-- 1.告诉浏览器不要缩放 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 2.css样式 -->
<link rel="stylesheet" type="text/css" id="theme_link" />
	<link rel="stylesheet" type="text/css" href="bower_components/fontawesome/web-fonts-with-css/css/fontawesome-all.css">

<script type="text/javascript" src="bower_components/jquery/dist/jquery.js"></script>
<script type="text/javascript" src="bower_components/jquery.cookie/jquery.cookie.js"></script>
<script type="text/javascript">
	//当页面初次加载时
	if ($.cookie("bootstrapTheme")) {//如果有默认的主题  就是用上次默认的
		$("#theme_link").attr(
				"href",
				"bower_components/bootswatch/dist/"+ $.cookie("bootstrapTheme")+"/bootstrap.css");
	} else {//如果没有默认的主题就显示这个
		$("#theme_link").attr("href","bower_components/bootswatch/dist/cerulean/bootstrap.css");
	}
</script>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="navbar-toggler-icon"></span>
					</button>
					<a class="navbar-brand" href="#" style="color: red"> 主页 </a>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="navbar-nav">
							<li class="nav-item active"><a class="nav-link" href="#">Link <span class="sr-only">(current)</span>
							</a></li>
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
							<button class="btn btn-primary my-2 my-sm-0" type="submit" style="color: red">搜索</button>
						</form>
						<ul class="navbar-nav ml-md-auto">
							<li class="nav-item active"><a class="nav-link" href="javascript:void(0)"> <select id="theme_sel">
										<option>cerulean</option>
										<option>darkly</option>
										<option>lumen</option>
										<option>slate</option>
										<option>solar</option>
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
</div>
		<div class="row">
			<div class="col-md-12">
				<div class="card border-success">
					<div class="card-header">
						<form class="form-inline" action="bookList" method="post" id="formas">
							<label class="sr-only" for="inputName">书名</label>
							<input type="text" class="form-control mb-2 mr-sm-2" id="inputName"placeholder="书名" name="name" value="<%=request.getParameter("name")==null?"":request.getParameter("name")%>">
							<label class="sr-only" for="inlineFormInputGroupUsername2">大类</label>
								<div class="input-group mb-2 mr-sm-2">
								<select class="form-control" id="inputBid" name="bid">
								<option value="-1">--请选择--</option>
								</select>
							</div>
								
							<label class="sr-only" for="inlineFormInputGroupUsername2">小类</label>
							<div class="input-group mb-2 mr-sm-2">
								<select class="form-control" id="inputSid" name="sid">
								<option value="-1">--请选择--</option>
								</select>
							</div>	
								
							<button type="submit" class="btn btn-primary mb-2">查找</button>
						</form>
					    </div>
					
					<div class="card-bady">
						<div class="col-md-12" style="padding-bottom: 0px; padding-left: 0px; padding-right: 0px;">
							<table class="table table-striped table-sm table-hover table-bordered" style="margin-bottom: 0px;">
								<thead>
									<tr>
										<th>#</th>
										<th>书名</th>
										<th>价格</th>
										<th>作者</th>
										<th>出版社</th>
										<th>出版日期</th>
										<th>简介</th>
										<th>小类</th>
										<th>图片</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<%
										List<Book> ls = (List<Book>) request.getAttribute("ls");
										for (Book book : ls) {
									%>
									<tr>
										<td><%=book.getId()%></td>
										<td><%=book.getName()%></td>
										<td><%=book.getPrice()%></td>
										<td><%=book.getAuthor()%></td>
										<td><%=book.getCbs()%></td>
										<td><%=book.getCbDate()%></td>
										<td style="width: 300px"><%=book.getDesctri()%></td>
										<td><%=book.getSid()%></td>
										<td><img src="upload/<%=book.getPhoto()%>" /></td>
										<td>
										<a href="#modal-container-567337" data-toggle="modal" onclick="window.DelId='<%=book.getId()%>'"
										class="fa fa-trash fa-2x" title="删除"></a><br/>
										<a class="fa fa-edit fa-2x" title="修改" href="toBookEdit?id=<%=book.getId()%>"></a><br/>
											<!-- &bid=<%=request.getAttribute("bid")%> -->
										<a href="bookAdd.jsp" class="fa fa-joint fa-2x" title="添加" ></a>
										
										</td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card-footer" style="padding: 0px">
						<nav style="padding-left: 35%">
							<ul class="pagination" style="margin-bottom: 0px;">

									<%//获取总页数
									int totalPage = (Integer) request.getAttribute("totalPage");
									//获取当前页
									int currentPage = (Integer) request.getAttribute("currentPage");%>
												<%if (currentPage == 1){%>
												<li class="page-item disabled"><a class="page-link" href="#">首页</a></li>
												<li class="page-item disabled"><a class="page-link" href="#">上一页</a></li>
												<%} else {%>
												<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=1%>">首页</a></li>
												<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage - 1%>">上一页</a></li>
												<%}%>
												<%if (totalPage < 5) {//总页数小于5
												for(int i = 1; i <= totalPage; i++) {%>
												<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=i%>"><%=i%></a></li>
												<%}}else if (currentPage <= 3) {//当前页数小于或等于3%>
												<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=1%>">1</a></li>
												<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=2%>">2</a></li>
												<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=3%>">3</a></li>
												<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=4%>">4</a></li>
												<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage%>">...<%=totalPage%></a></li>
												<%} else if (currentPage <= totalPage - 3) {//当前页数小于等于总页数-3%>
												<li class="page-item"><a class="page-link" href="bookList?currentPage=1">1...</a></li>
												<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage - 1%>"><%=currentPage - 1%></a></li>
												<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage%>"><%=currentPage%></a></li>
												<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage + 1%>"><%=currentPage + 1%></a></li>
												<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage%>">...<%=totalPage%></a></li>
												<%} else {%>
												<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=1%>">1...</a></li>
												<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage - 3%>"><%=totalPage - 3%></a></li>
												<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage - 2%>"><%=totalPage - 2%></a></li>
												<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage - 1%>"><%=totalPage - 1%></a></li>
												<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage%>"><%=totalPage%></a></li>
												<%}%>
												<%if (currentPage == totalPage) {%>
												<li class="page-item disabled"><a class="page-link" href="#">下一页</a></li>
												<li class="page-item disabled"><a class="page-link" href="#">末页</a></li>
												<%} else {%>
												<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage + 1%>">下一页</a></li>
												<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage%>">末页</a></li>
												<%}%>
											</ul>
										</nav>
								</div>
						</div>
				</div>
			</div>
		<div class="row">
			<div class="col-md-12">
				<h2>哈哈哈</h2>
				<p class="text-center">哈得力版权&hearts;</p>
				<p>
					<a class="btn" href="#">哈氏哈哈哈得力</a>
				</p>
			</div>
		</div>
		<!-- 删除确认对话框 -->
		<div class="modal fade" id="modal-container-567337" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								操作确认
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							你真的要删除吗？
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary" onclick="exeDel(event)">
								确认
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								取消
							</button>
							</div>
					</div>
					
				</div>
				
			</div>
		<!-- end -->
	<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(function(){
		$("#theme_sel").change(function(evt) {
		$("#theme_link").attr("href","bower_components/bootswatch/dist/"+$(evt.target).val()+"/bootstrap.css");
		//保存前一次使用的主题
	    $.cookie("bootstrapTheme", $(evt.target).val(), {expires:7});});
		<!--  $("#theme_sel").val($.cookie("bootstrapTheme"));-->
		$('a[href="bookList?currentPage=<%=currentPage%>"]').parent("li").addClass("active");
		});
		function fillSel(types){
			for (var i = 0; i < types.length; i++) {
				var op = new Option(types[i].name,types[i].id);
				document.getElementById("inputBid").appendChild(op);
				}
				$("#inputBid").val('<%= request.getAttribute("bid")%>');
				$("#inputBid").trigger("change");
			}
		function fillSmallSel(types){
			document.getElementById("inputSid").innerHTML='<option value="-1">--请选择--</option>';
			for (var i = 0; i < types.length; i++) {
				var op = new Option(types[i].name,types[i].id);
				document.getElementById("inputSid").appendChild(op);
				}
			$("#inputSid").val('<%= request.getAttribute("sid")%>');
			}
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
		 //实现跳转分页回填效果
		$('a[class="page-link"][href^="bookList?currentPage="]').click(function(){
				$(this).attr("href",$(this).attr("href")+"&"+$("#formas").serialize());
			});
		//删除确认
		function exeDel(event){
			window.location.href="bookDel?id="+window.DelId;
			}
	</script>
</body>
</html>





















