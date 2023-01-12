<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="${base}/manager/css/main.css">
<script type="text/javascript" src="${base }/manager/js/jquery.min.js"></script>
<link type="text/css" rel="stylesheet" href="${base }/manager/css/simplePagination.css"/>
<script src="${base }/manager/js/jquery.simplePagination.js"></script>
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
			<li><a class="app-nav__item" href="${base }/home"><i
					class='bx bx-log-out bx-rotate-180'></i> </a></li>
		</ul>
	</header>
	<!-- Sidebar menu-->
	<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
	<aside class="app-sidebar">
		<div class="app-sidebar__user">
			<!-- <img class="app-sidebar__user-avatar" src="/images/hay.jpg" width="50px" -->
			<!--  alt="User Image"> -->
			<div>
				<p class="app-sidebar__user-name">
					<b>${userLogined.name }</b>
				</p>
				<p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
			</div>
			<%--  <div>
          <p class="app-sidebar__user-name"><b>${userLogined.name }</b></p>
          <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
        </div> --%>
		</div>
		<hr>
		<ul class="app-menu">
			<li><a class="app-menu__item haha" href="phan-mem-ban-hang.html"><i
					class='app-menu__icon bx bx-cart-alt'></i> <span
					class="app-menu__label">POS Bán Hàng</span></a></li>
			<li><a class="app-menu__item " href="${base }/admin"><i
					class='app-menu__icon bx bx-tachometer'></i><span
					class="app-menu__label">Bảng điều khiển</span></a></li>
			<li><a class="app-menu__item " href="${base }/admin/employee"><i
					class='app-menu__icon bx bx-id-card'></i> <span
					class="app-menu__label">Quản lý nhân viên</span></a></li>
			<li><a class="app-menu__item"
				href="${base }/admin/admin1"><i
					class='app-menu__icon bx bx-id-card'></i> <span
					class="app-menu__label">Quản lý Admin</span></a></li>
			<li><a class="app-menu__item" href="/admin/user"><i
					class='app-menu__icon bx bx-user-voice'></i><span
					class="app-menu__label">Quản lý khách hàng</span></a></li>
			<li><a class="app-menu__item" href="${base }/admin/product"><i
					class='app-menu__icon bx bx-purchase-tag-alt'></i><span
					class="app-menu__label">Quản lý sản phẩm</span></a></li>
			<li><a class="app-menu__item active" href="${base }/admin/order"><i
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
		<div class="app-title">
			<ul class="app-breadcrumb breadcrumb side">
				<li class="breadcrumb-item active"><a href="#"><b>Danh
							sách đơn hàng</b></a></li>
			</ul>
			<div id="clock"></div>
		</div>

		<div>
			<form action="${base }/admin/order" method="get">
				<div style="display: flex; justify-content: space-between;">
					<div class="search">
						<input value=${searchModel.page } type="number" placeholder="page"
							style="display: none;" id="page" name="page" class="form-control">

						<input type="text" id="keyword" value="${searchModel.keyword }"
							name="keyword" class="form-control" placeholder="Tìm kiếm bằng mã đơn hàng hoặc tình trạng">

						<button type="submit" id="btnSearch" name="btnSearch"
							value="Search">Search</button>
					</div>

				</div>
			</form>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<div class="tile-body">
						<div class="row element-button">
							<div class="col-sm-2">

								<a class="btn btn-add btn-sm"
									href="${base }/admin/order/management" title="Thêm"><i
									class="fas fa-plus"></i> Tạo mới đơn hàng</a>
							</div>
							<div class="col-sm-2">
								<a class="btn btn-delete btn-sm nhap-tu-file" type="button"
									title="Nhập" onclick="myFunction(this)"><i
									class="fas fa-file-upload"></i> Tải từ file</a>
							</div>

							<div class="col-sm-2">
								<a class="btn btn-delete btn-sm print-file" type="button"
									title="In" onclick="myApp.printTable()"><i
									class="fas fa-print"></i> In dữ liệu</a>
							</div>
							<div class="col-sm-2">
								<a class="btn btn-delete btn-sm print-file js-textareacopybtn"
									type="button" title="Sao chép"><i class="fas fa-copy"></i>
									Sao chép</a>
							</div>

							<div class="col-sm-2">
								<a class="btn btn-excel btn-sm" href="" title="In"><i
									class="fas fa-file-excel"></i> Xuất Excel</a>
							</div>
							<div class="col-sm-2">
								<a class="btn btn-delete btn-sm pdf-file" type="button"
									title="In" onclick="myFunction(this)"><i
									class="fas fa-file-pdf"></i> Xuất PDF</a>
							</div>
							<div class="col-sm-2">
								<a class="btn btn-delete btn-sm" type="button" title="Xóa"
									onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
									Xóa tất cả </a>
							</div>
						</div>
						<table class="table table-hover table-bordered" id="sampleTable">
							<thead>
								<tr>
									<th width="10"><input type="checkbox" id="all"></th>
									<th>ID đơn hàng</th>
									<th>Khách hàng</th>
									<th>Đơn hàng</th>
									<th>Số lượng</th>
									<th>Tổng tiền</th>
									<th>Tình trạng</th>
									<th>Người nhận giao</th>
									<th>Tính năng</th>
									
								</tr>
							</thead>

							<tbody>
								<c:forEach var="order" items="${orders.data }">
									<tr>
										<td width="10"><input type="checkbox" name="check1"
											value="1"></td>
										<td>${order.code }</td>
										<td>${order.customerName }</td>
										<td><c:forEach items="${order.saleOrderProducts }"
												var="product"> ${product.products.name },  </c:forEach></td>
										<td><c:forEach items="${order.saleOrderProducts }"
												var="product"> ${product.quanlity } </c:forEach></td>
										<td>${order.total }</td>
										<td>${order.description }</td>
										<td> <div class="undertake_${order.id }"> ${order.undertake }</div> 
											
										</td>
										<td>
											<%-- <a class="btn btn-primary btn-sm trash" role="button" onclick="DeleteProduct(${product.id});">Đã giao/Hủy</a> --%>
											<!--  <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i class="fas fa-trash-alt"></i>Đã giao/Hủy </button> -->
											<a href="${base }/admin/order/${order.id}"><button
													class="btn btn-primary btn-sm edit" type="button"
													title="Sửa">
													<i class="fa fa-edit"></i> Chi tiết
												</button>
												</a>
										 <c:if test="${isAdmin1 }">
											 <button 
													
													onclick="undertakeBill('${base }','${order.id}', '${userLogined.name }')"
													class="btn btn-alert btn-sm edit" 
													type="button">
													 <i class="fa fa-edit"></i>
													 Nhận giao
												</button> 
											 </c:if>
											 
											
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						
					<div>
						<div>
							<div style="display: flex" id="paging"></div>
						</div>
					</div> 
						
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- Essential javascripts for application to work-->
	<!--  <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="src/jquery.table2excel.js"></script>
    <script src="js/main.js"></script>
    The javascript plugin to display page loading on top
    <script src="js/plugins/pace.min.js"></script>
    Page specific javascripts
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
    Data table plugin
    <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">$('#sampleTable').DataTable();</script> -->
	<script>
	$(function() {
	    $('#paging').pagination({
	    	currentPage:${orders.currentPage},
	        items: ${orders.totalItems},
	        itemsOnPage: ${orders.sizeOfPage},
	        cssStyle: 'light-theme',
	        onPageClick:function(pageNumber,event){
	        	$('#page').val(pageNumber);
	        	$('#btnSearch').trigger('click'); 
	        },   
	    });
	});
	
	
		function DeleteProduct(productId) {

			let data = {
				id : productId,
			};

			// $ === jQuery
			// json == javascript object
			jQuery
					.ajax({
						url : "/admin/product/management/delete",
						type : "post",
						contentType : "application/json",
						data : JSON.stringify(data),

						dataType : "json", // kieu du lieu tra ve tu controller la json
						success : function(jsonResult) {

							alert("Chuc mung! da luu thanh cong dang ki "
									+ jsonResult.statusCode
									+ jsonResult.statusMessage);
							location.reload();
						},
						error : function(jqXhr, textStatus, errorMessage) { // error callback 
							alert("error");
						}
					});
		}

		function UpdateQuanlityCart(baseUrl, productId, quanlity) {

			// javascript object.  data la du lieu ma day len action cua controller
			let data = {
				productId : productId, // lay theo id	
				quanlity : quanlity
			};

			// $ === jQuery
			// json == javascript object
			jQuery.ajax({
				url : baseUrl + "/ajax/updateQuanlityCart", //->action
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(data),

				dataType : "json", // kieu du lieu tra ve tu controller la json
				success : function(jsonResult) {
					// tăng số lượng sản phẩm trong giỏ hàng trong icon
					$("#quanlity_" + productId).html(
							jsonResult.currentProductQuality);
					$(".totalPrice").html(jsonResult.totalPrice);
				},
				error : function(jqXhr, textStatus, errorMessage) {

				}
			});
		}
		function undertakeBill(baseUrl, productId,name) {
			
			if (confirm('Are you sure you want to save this?')) {
				  // Save it!
				// javascript object.  data la du lieu ma day len action cua controller
				let data = {
					id: productId, // lay theo id	
					undertake: name
				};

				// $ === jQuery
				// json == javascript object
				jQuery.ajax({
					url : baseUrl + "/ajax/undertakeBill", //->action
					type : "post",
					contentType : "application/json",
					data : JSON.stringify(data),
					dataType : "json", // kieu du lieu tra ve tu controller la json
					success : function(jsonResult) {
						// sửa người nhận bill
						
						$(".undertake_"+productId).html(jsonResult.undertake);
					},
					error : function(jqXhr, textStatus, errorMessage) {

					}
				});
				} else {
				  // Do nothing!
				 
				}
			
			
			
			console.log(".undertake_"+productId);
		}

		function deleteRow(r) {
			var i = r.parentNode.parentNode.rowIndex;
			document.getElementById("myTable").deleteRow(i);
		}
		/* jQuery(function () {
		  jQuery(".trash").click(function () {
		    swal({
		      title: "Cảnh báo",
		     
		      text: "Bạn có chắc chắn là muốn xóa đơn hàng này?",
		      buttons: ["Hủy bỏ", "Đồng ý"],
		    })
		      .then((willDelete) => {
		        if (willDelete) {
		          swal("Đã xóa thành công.!", {
		            
		          });
		        }
		      });
		  });
		}); */
		/*   oTable = $('#sampleTable').dataTable();
		  $('#all').click(function (e) {
		    $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
		    e.stopImmediatePropagation();
		  }); */

		//EXCEL
		// $(document).ready(function () {
		//   $('#').DataTable({
		//     dom: 'Bfrtip',
		//     "buttons": [
		//       'excel'
		//     ]
		//   });
		// });

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
		//In dữ liệu
		var myApp = new function() {
			this.printTable = function() {
				var tab = document.getElementById('sampleTable');
				var win = window.open('', '', 'height=700,width=700');
				win.document.write(tab.outerHTML);
				win.document.close();
				win.print();
			}
		}
		//     //Sao chép dữ liệu
		//     var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

		// copyTextareaBtn.addEventListener('click', function(event) {
		//   var copyTextarea = document.querySelector('.js-copytextarea');
		//   copyTextarea.focus();
		//   copyTextarea.select();

		//   try {
		//     var successful = document.execCommand('copy');
		//     var msg = successful ? 'successful' : 'unsuccessful';
		//     console.log('Copying text command was ' + msg);
		//   } catch (err) {
		//     console.log('Oops, unable to copy');
		//   }
		// });

		//Modal
		/*   $("#show-emp").on("click", function () {
		    $("#ModalUP").modal({ backdrop: false, keyboard: false })
		  }); */

		/*    var soluong=4;
			var price=3;
			var tongtien=soluong*price;
			document.getElementById("tongtin").innerText= tongtien; */
	</script>
</body>
<style>
.search {
	display: flex;
	align-items: center;
	justify-content: space-around;
	width: 75%;
	margin-bottom: 15px;
}

.categoryId {
	padding: 10px;
	font-size: 15px;
	border: none;
	border-radius: 7px;
	cursor: pointer;
}

.search input {
	width: 700px;
	border: none;
}

#btnSearch {
	border-radius: 5px;
	background-color: #4a34ad;
	color: white;
	padding: 10px 20px;
	cursor: pointer;
	border: none;
}

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
</html>