<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="${base}/manager/css/main.css">
<title>Insert title here</title>
</head>
<body onload="time()" class="app sidebar-mini rtl">
	<!-- Navbar-->
	<header class="app-header">
		<!-- Sidebar toggle button-->
		<a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
			aria-label="Hide Sidebar"></a>
		<!-- Navbar Right Menu-->
		<ul class="app-nav">


			<!-- User Menu-->
			<li><a class="app-nav__item" href="/home"><i
					class='bx bx-log-out bx-rotate-180'></i> </a></li>
		</ul>
	</header>
	
	<!-- Sidebar menu-->
	<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
	<aside class="app-sidebar">
		<div class="app-sidebar__user">
			<!-- <img class="app-sidebar__user-avatar" src="/images/hay.jpg"
				width="50px" alt="User Image"> -->
			<div>
				<p class="app-sidebar__user-name">
					<b>${userLogined.name }</b>
				</p>
				<p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
			</div>
		</div>
		<hr>
		<ul class="app-menu">
			<li><a class="app-menu__item haha" href="phan-mem-ban-hang.html"><i
					class='app-menu__icon bx bx-cart-alt'></i> <span
					class="app-menu__label">POS Bán Hàng</span></a></li>
			<li><a class="app-menu__item active" href="${base }/admin/"><i
					class='app-menu__icon bx bx-tachometer'></i><span
					class="app-menu__label">Bảng điều khiển</span></a></li>
			<li><a class="app-menu__item " href="${base }/admin/employee"><i
					class='app-menu__icon bx bx-id-card'></i> <span
					class="app-menu__label">Quản lý nhân viên</span></a></li>
			<li><a class="app-menu__item" href="${base }/admin/user"><i
					class='app-menu__icon bx bx-user-voice'></i><span
					class="app-menu__label">Quản lý khách hàng</span></a></li>
			<li><a class="app-menu__item" href="${base }/admin/product"><i
					class='app-menu__icon bx bx-purchase-tag-alt'></i><span
					class="app-menu__label">Quản lý sản phẩm</span></a></li>
			<li><a class="app-menu__item" href="${base }/admin/order"><i
					class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Quản
						lý đơn hàng</span></a></li>
			<li><a class="app-menu__item" href="${base }/admin/intestine"><i
					class='app-menu__icon bx bx-run'></i><span class="app-menu__label">Quản
						lý nội bộ </span></a></li>
			<li><a class="app-menu__item" href="${base }/admin/salary"><i
					class='app-menu__icon bx bx-dollar'></i><span
					class="app-menu__label">Bảng kê lương</span></a></li>
			<li><a class="app-menu__item" href="${base }/admin/report"><i
					class='app-menu__icon bx bx-pie-chart-alt-2'></i><span
					class="app-menu__label">Báo cáo doanh thu</span></a></li>
			<li><a class="app-menu__item" href="/admin/contact"><i
					class='app-menu__icon bx bx-calendar-check'></i><span
					class="app-menu__label">Liên hệ Khách hàng </span></a></li>
			<li><a class="app-menu__item" href="#"><i
					class='app-menu__icon bx bx-cog'></i><span class="app-menu__label">Cài
						đặt hệ thống</span></a></li>
		</ul>
	</aside>
	<main class="app-content">
		<div class="row">
			<div class="col-md-12">
				<div class="app-title">
					<ul class="app-breadcrumb breadcrumb">
						<li class="breadcrumb-item"><a href="#"><b>Bảng điều
									khiển</b></a>
									${userLogined.email }
						</li>
					</ul>
					<div id="clock"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<!--Left-->
			<div class="col-md-12 col-lg-6">
				<div class="row">
					<!-- col-6 -->
					<div class="col-md-6">
						<div class="widget-small primary coloured-icon">
							<i class='icon bx bxs-user-account fa-3x'></i>
							<div class="info">
								<h4>Tổng khách hàng</h4>
								<p>
									<b>${countUser}</b>
								</p>
								<p class="info-tong">Tổng số khách hàng được quản lý.</p>
							</div>
						</div>
					</div>
					<!-- col-6 -->
					<div class="col-md-6">
						<div class="widget-small info coloured-icon">
							<i class='icon bx bxs-data fa-3x'></i>
							<div class="info">
								<h4>Tổng sản phẩm</h4>
								<p>
									<b>${countProduct } sản phẩm</b>
								</p>
								<p class="info-tong">Tổng số sản phẩm được quản lý.</p>
							</div>
						</div>
					</div>
					<!-- col-6 -->
					<div class="col-md-6">
						<div class="widget-small warning coloured-icon">
							<i class='icon bx bxs-shopping-bags fa-3x'></i>
							<div class="info">
								<h4>Tổng đơn hàng</h4>
								<p>
									<b>${countOrder }</b>
								</p>
								<p class="info-tong">Tổng số hóa đơn bán hàng trong tháng.</p>
							</div>
						</div>
					</div>
					<!-- col-6 -->
					<div class="col-md-6">
						<div class="widget-small danger coloured-icon">
							<i class='icon bx bxs-error-alt fa-3x'></i>
							<div class="info">
								<h4>Sắp hết hàng</h4>
								<p>
									<b>${countProductOver } sản phẩm</b>
								</p>
								<p class="info-tong">Số sản phẩm cảnh báo hết cần nhập thêm.</p>
							</div>
						</div>
					</div>
					<!-- col-12 -->
					<div class="col-md-12">
						<div class="tile">
							<h3 class="tile-title">Tình trạng đơn hàng</h3>
							<div>
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>ID đơn hàng</th>
											<th>Tên khách hàng</th>
											<th>Tổng tiền</th>
											<th>Trạng thái</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="order" items="${newOrder }">
									
										<tr>
											<td>${order.id }</td>
											<td>${order.customer.name }</td>
											<td>${order.money } đ</td>
											<td><span class="badge bg-warning">${order.statusOfOrder }</span></td>
										</tr>
									</c:forEach>
										<!-- <tr>
											<td>AL3947</td>
											<td>Phạm Thị Ngọc</td>
											<td>19.770.000 đ</td>
											<td><span class="badge bg-info">Chờ xử lý</span></td>
										</tr>
										<tr>
											<td>ER3835</td>
											<td>Nguyễn Thị Mỹ Yến</td>
											<td>16.770.000 đ</td>
											<td><span class="badge bg-warning">Đang vận
													chuyển</span></td>
										</tr>
										<tr>
											<td>MD0837</td>
											<td>Triệu Thanh Phú</td>
											<td>9.400.000 đ</td>
											<td><span class="badge bg-success">Đã hoàn thành</span></td>
										</tr>
										<tr>
											<td>MT9835</td>
											<td>Đặng Hoàng Phúc</td>
											<td>40.650.000 đ</td>
											<td><span class="badge bg-danger">Đã hủy </span></td>
										</tr> -->
									</tbody>
								</table>
							</div>
							<!-- / div trống-->
						</div>
					</div>
					<!-- / col-12 -->
					<!-- col-12 -->
					<div class="col-md-12">
						<div class="tile">
							<h3 class="tile-title">Khách hàng mới</h3>
							<div>
								<table class="table table-hover">
									<thead>
										<tr>
											<th>ID</th>
											<th>Tên khách hàng</th>
											<th>Ngày đăng ký</th>
											<th>Số điện thoại</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="nearUser" items="${nearUsers }">
										
										<tr>
											<td>${nearUser.id }</td>
											<td>${nearUser.name }</td>
											<td>${nearUser.createdDate }</td>
											<td><span class="tag tag-warning">${nearUser.phone}</span></td>
										</tr>
									</c:forEach>
										<!-- <tr>
											<td>#183</td>
											<td>Hột vịt muối</td>
											<td>21/7/1992</td>
											<td><span class="tag tag-success">0921387221</span></td>
										</tr>
										<tr>
											<td>#219</td>
											<td>Bánh tráng trộn</td>
											<td>30/4/1975</td>
											<td><span class="tag tag-warning">0912376352</span></td>
										</tr>
										<tr>
											<td>#627</td>
											<td>Cút rang bơ</td>
											<td>12/3/1999</td>
											<td><span class="tag tag-primary">01287326654</span></td>
										</tr>
										<tr>
											<td>#175</td>
											<td>Hủ tiếu nam vang</td>
											<td>4/12/20000</td>
											<td><span class="tag tag-danger">0912376763</span></td>
										</tr> -->
									</tbody>
								</table>
							</div>

						</div>
					</div>
					<!-- / col-12 -->
				</div>
			</div>
			<!--END left-->
			<!--Right-->
			<div class="col-md-12 col-lg-6">
				<div class="row">
					<div class="col-md-12">
						<div class="tile">
							<h3 class="tile-title">Dữ liệu 6 tháng đầu vào</h3>
							<div class="embed-responsive embed-responsive-16by9">
								<canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="tile">
							<h3 class="tile-title">Thống kê 6 tháng doanh thu</h3>
							<div class="embed-responsive embed-responsive-16by9">
								<canvas class="embed-responsive-item" id="barChartDemo"></canvas>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!--END right-->
		</div>


		<!-- <div class="text-center" style="font-size: 13px">
			<p>
			
				<b>Copyright <script type="text/javascript">
					document.write(new Date().getFullYear());
				</script> Phần mềm quản lý bán hàng | Dev By Trường
				</b>
			</p>
		</div> -->
	</main>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<!-- <script src="manager/js/jquery-3.2.1.min.js"></script> -->
	<!--===============================================================================================-->
	<!-- <script src="manager/js/popper.min.js"></script> -->
	<!-- <script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script> -->
	<!--===============================================================================================-->
	<!-- <script src="manager/js/bootstrap.min.js"></script> -->
	<!--===============================================================================================-->
	<!-- <script src="manager/js/main.js"></script> -->
	<!--===============================================================================================-->
	<!-- <script src="manager/js/plugins/pace.min.js"></script> -->
	<!--===============================================================================================-->
	<!-- <script type="text/javascript" src="manager/js/plugins/chart.js"></script>  -->
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.js" integrity="sha512-U3hGSfg6tQWADDQL2TUZwdVSVDxUt2HZ6IMEIskuBizSDzoe65K3ZwEybo0JOcEjZWtWY3OJzouhmlGop+/dBg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.js" integrity="sha512-zO8oeHCxetPn1Hd9PdDleg5Tw1bAaP0YmNvPY8CwcRyUk7d7/+nyElmFrB6f7vg4f7Fv4sui1mcep8RIEShczg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<!--===============================================================================================-->
	<script type="text/javascript">
		var data = {
			labels : [ "Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5",
					"Tháng 6" ],
			datasets : [ {
				label : "Dữ liệu đầu tiên",
				fillColor : "rgba(255, 213, 59, 0.767), 212, 59)",
				strokeColor : "rgb(255, 212, 59)",
				pointColor : "rgb(255, 212, 59)",
				pointStrokeColor : "rgb(255, 212, 59)",
				pointHighlightFill : "rgb(255, 212, 59)",
				pointHighlightStroke : "rgb(255, 212, 59)",
				data : [ 20, 59, 90, 51, 56, 100 ]
			}, {
				label : "Dữ liệu kế tiếp",
				fillColor : "rgba(9, 109, 239, 0.651)  ",
				pointColor : "rgb(9, 109, 239)",
				strokeColor : "rgb(9, 109, 239)",
				pointStrokeColor : "rgb(9, 109, 239)",
				pointHighlightFill : "rgb(9, 109, 239)",
				pointHighlightStroke : "rgb(9, 109, 239)",
				data : [ 48, 48, 49, 39, 86, 10 ]
			} ]
		};
	/* 	var ctxl = $("#lineChartDemo").get(0).getContext("2d"); */
		/* var lineChart = new Chart(ctxl).Line(data); */
		var ctxl=document.getElementById("lineChartDemo").getContext("2d");
		var lineChart=new Chart(ctxl,{
			type:'line',
			data:{
			labels : [ "Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5",
					"Tháng 6" ],
			datasets : [ {
					label : "Dữ liệu kế tiếp",
					backgroundColor : "rgba(9, 109, 239, 0.651)  ",
					pointColor : "rgb(9, 109, 239)",
					strokeColor : "rgb(9, 109, 239)",
					pointStrokeColor : "rgb(9, 109, 239)",
					pointHighlightFill : "rgb(9, 109, 239)",
					pointHighlightStroke : "rgb(9, 109, 239)",
					data : [ 48, 48, 49, 39, 86, 10 ]
				},{
					label : "Dữ liệu đầu tiên",
					backgroundColor : "rgba(255, 213, 59, 0.767), 212, 59)",
					strokeColor : "rgb(255, 212, 59)",
					pointColor : "rgb(255, 212, 59)",
					pointStrokeColor : "rgb(255, 212, 59)",
					pointHighlightFill : "rgb(255, 212, 59)",
					pointHighlightStroke : "rgb(255, 212, 59)",
					data : [ 20, 59, 90, 51, 56, 100 ]
					} ],
			},
		});
		var ctxb = $("#barChartDemo").get(0).getContext("2d");
		var barChart=new Chart(ctxb,{
			type:'bar',
			data:{
			labels : [ "Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5",
					"Tháng 6" ],
			datasets : [ {
					label : "Dữ liệu kế tiếp",
					backgroundColor : "rgba(9, 109, 239, 0.651)  ",
					pointColor : "rgb(9, 109, 239)",
					strokeColor : "rgb(9, 109, 239)",
					pointStrokeColor : "rgb(9, 109, 239)",
					pointHighlightFill : "rgb(9, 109, 239)",
					pointHighlightStroke : "rgb(9, 109, 239)",
					data : [ 48, 48, 49, 39, 86, 10 ]
				},{
					label : "Dữ liệu đầu tiên",
					backgroundColor : "rgba(255, 213, 59, 0.767), 212, 59)",
					strokeColor : "rgb(255, 212, 59)",
					pointColor : "rgb(255, 212, 59)",
					pointStrokeColor : "rgb(255, 212, 59)",
					pointHighlightFill : "rgb(255, 212, 59)",
					pointHighlightStroke : "rgb(255, 212, 59)",
					data : [ 20, 59, 90, 51, 56, 100 ]
					} ],
			},
		});
		/* var barChart = new Chart(ctxb).Bar(data); */
	</script>
	
	
	<script type="text/javascript">
		//Thời Gian
		function time() {
			var today = new Date();
			var weekday = new Array(7);
			weekday[0] = "Chủ Nhật";
			weekday[1] = "Thứ Hai";
			weekday[2] = "Thứ Ba";
			weekday[3] = "Thứ Tư";
			weekday[4] = "Thứ Năm";
			weekday[5] = "Thứ Sáu";
			weekday[6] = "Thứ Bảy";
			var day = weekday[today.getDay()];
			var dd = today.getDate();
			var mm = today.getMonth() + 1;
			var yyyy = today.getFullYear();
			var h = today.getHours();
			var m = today.getMinutes();
			var s = today.getSeconds();
			m = checkTime(m);
			s = checkTime(s);
			nowTime = h + " giờ " + m + " phút " + s + " giây";
			if (dd < 10) {
				dd = '0' + dd
			}
			if (mm < 10) {
				mm = '0' + mm
			}
			today = day + ', ' + dd + '/' + mm + '/' + yyyy;
			tmp = '<span class="date"> ' + today + ' - ' + nowTime + '</span>';
			document.getElementById("clock").innerHTML = tmp;
			clocktime = setTimeout("time()", "1000", "Javascript");

			function checkTime(i) {
				if (i < 10) {
					i = "0" + i;
				}
				return i;
			}
		}
	</script>
	
	 <script type="text/javascript" src="js/plugins/chart.js"></script>
  <!--===============================================================================================-->
  <script type="text/javascript">
    var data = {
      labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6"],
      datasets: [{
        label: "Dữ liệu đầu tiên",
        fillColor: "rgba(255, 213, 59, 0.767), 212, 59)",
        strokeColor: "rgb(255, 212, 59)",
        pointColor: "rgb(255, 212, 59)",
        pointStrokeColor: "rgb(255, 212, 59)",
        pointHighlightFill: "rgb(255, 212, 59)",
        pointHighlightStroke: "rgb(255, 212, 59)",
        data: [20, 59, 90, 51, 56, 100]
      },
      {
        label: "Dữ liệu kế tiếp",
        fillColor: "rgba(9, 109, 239, 0.651)  ",
        pointColor: "rgb(9, 109, 239)",
        strokeColor: "rgb(9, 109, 239)",
        pointStrokeColor: "rgb(9, 109, 239)",
        pointHighlightFill: "rgb(9, 109, 239)",
        pointHighlightStroke: "rgb(9, 109, 239)",
        data: [48, 48, 49, 39, 86, 10]
      }
      ]
    };
   
    
  /*   var ctxl = $("#lineChartDemo").get(0).getContext("2d"); */
    var ctxl=document.getElementById("lineChartDemo").get(0).getContext("2d");
    var lineChart=new Chart(ctxl,{
        labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6"],
        datasets: [{
          label: "Dữ liệu đầu tiên",
          fillColor: "rgba(255, 213, 59, 0.767), 212, 59)",
          strokeColor: "rgb(255, 212, 59)",
          pointColor: "rgb(255, 212, 59)",
          pointStrokeColor: "rgb(255, 212, 59)",
          pointHighlightFill: "rgb(255, 212, 59)",
          pointHighlightStroke: "rgb(255, 212, 59)",
          data: [20, 59, 90, 51, 56, 100]
        });
    /* var lineChart = new Chart(ctxl).Line(data); */
    var ctxb = $("#barChartDemo").get(0).getContext("2d");
   /*  var barChart = new Chart(ctxb).Bar(data); */
</script>
</body>
<style>
.app-content {
	margin-left: 280px;
	margin-top: 80px;
	/* font-size: 50px; */
}

a {
	text-decoration: none;
}

.app-menu__item {
	position: relative;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	border-radius: 0.375rem;
	margin-bottom: 10px;
	padding: 15px 15px;
	font-size: 1.08em;
	border-left: 0px;
	box-shadow: none;
	-webkit-transition: border-left-color 0.3s ease, background-color 0.3s
		ease;
	-o-transition: border-left-color 0.3s ease, background-color 0.3s ease;
	transition: border-left-color 0.3s ease, background-color 0.3s ease;
	color: white;
	border: 1px solid transparent;
	/* border-bottom: 1px solid #ddd; */
}

.app-sidebar {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	padding-top: 20px;
	width: 250px;
	padding-left: 10px;
	padding-right: 10px;
	overflow: auto;
	z-index: 10;
	background: rgb(0, 28, 64);
}

.app-sidebar__user {
	display: block;
	display: -ms-flexbox;
	/* display: flex; */
	/* -webkit-box-align: center; */
	-ms-flex-align: center;
	align-items: center;
	padding: 10px;
	color: white;
	text-align: center;
}

li {
	display: list-item;
	text-align: -webkit-match-parent;
}

.haha {
	color: rgb(0, 28, 64) !important;
	background: #ffd43b !important;
	font-weight: 600;
	box-shadow: none !important;
	border: 1px solid;
}

.app-menu__item.active, .app-menu__item:hover, .app-menu__item:focus {
	background: #c6defd;
	text-decoration: none;
	color: rgb(22, 22, 72);
	box-shadow: none;
	border: 1px solid rgb(22, 22, 72);
}

.app-menu {
	padding: 5px;
}

::-webkit-scrollbar {
	display: none;
}

ul {
	display: block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

.app-header {
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	width: 100%;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	background-color: rgb(0, 28, 64);
	z-index: 1;
	padding-right: 15px;
	padding-left: 15px;
	justify-content: flex-end;
}

.app-nav {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	margin-bottom: 0;
	-webkit-box-pack: end;
	-ms-flex-pack: end;
	justify-content: flex-end;
	text-align: right;
	margin-right: 20px;
}

.app-nav__item {
	display: block;
	padding: 15px;
	line-height: 0px;
	color: rgb(0, 28, 64);
	background: rgb(255, 212, 59);
	-webkit-transition: background-color 0.3s ease;
	-o-transition: background-color 0.3s ease;
	transition: background-color 0.3s ease;
}

.app-sidebar__user-avatar {
	background: white;
	border-radius: 15px;
	width: 70px;
	border: 3px solid white;
	margin-bottom: 10px;
}

hr {
	margin-top: 10px;
	margin-bottom: 10px;
	border: 0;
	border-top: 1px solid rgb(255 255 255/ 26%);
}
</style>
<style>
.Choicefile {
	display: block;
	background: #14142B;
	border: 1px solid #fff;
	color: #fff;
	width: 150px;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
	padding: 5px 0px;
	border-radius: 5px;
	font-weight: 500;
	align-items: center;
	justify-content: center;
}

.Choicefile:hover {
	text-decoration: none;
	color: white;
}

#uploadfile, .removeimg {
	display: none;
}

#thumbbox {
	position: relative;
	width: 100%;
	margin-bottom: 20px;
}

.removeimg {
	height: 25px;
	position: absolute;
	background-repeat: no-repeat;
	top: 5px;
	left: 5px;
	background-size: 25px;
	width: 25px;
	/* border: 3px solid red; */
	border-radius: 50%;
}

.removeimg::before {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	content: '';
	border: 1px solid red;
	background: red;
	text-align: center;
	display: block;
	margin-top: 11px;
	transform: rotate(45deg);
}

.removeimg::after {
	/* color: #FFF; */
	/* background-color: #DC403B; */
	content: '';
	background: red;
	border: 1px solid red;
	text-align: center;
	display: block;
	transform: rotate(-45deg);
	margin-top: -2px;
}
</style>
</html>