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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
	integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/brands.min.css"
	integrity="sha512-+oRH6u1nDGSm3hH8poU85YFIVTdSnS2f+texdPGrURaJh8hzmhMiZrQth6l56P4ZQmxeZzd2DqVEMqQoJ8J89A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
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
			<!-- <img class="app-sidebar__user-avatar" src="/images/hay.jpg"
				width="50px" alt="User Image"> -->
			<div>
				<p class="app-sidebar__user-name">
					<b>${userLogined.name }</b>
				</p>
				<p class="app-sidebar__user-designation">Ch??o m???ng b???n tr??? l???i</p>
			</div>
		</div>
		<hr>
		<ul class="app-menu">
			<li><a class="app-menu__item haha" href="phan-mem-ban-hang.html"><i
					class='app-menu__icon bx bx-cart-alt'></i> <span
					class="app-menu__label">POS B??n H??ng</span></a></li>
			<li><a class="app-menu__item " href="${base }/admin"><i
					class='app-menu__icon bx bx-tachometer'></i><span
					class="app-menu__label">B???ng ??i???u khi???n</span></a></li>
			<li><a class="app-menu__item " href="${base }/admin/employee"><i
					class='app-menu__icon bx bx-id-card'></i> <span
					class="app-menu__label">Qu???n l?? nh??n vi??n</span></a></li>
			<li><a class="app-menu__item" href="#"><i
					class='app-menu__icon bx bx-user-voice'></i><span
					class="app-menu__label">Qu???n l?? kh??ch h??ng</span></a></li>
			<li><a class="app-menu__item" href="${base }/admin/product"><i
					class='app-menu__icon bx bx-purchase-tag-alt'></i><span
					class="app-menu__label">Qu???n l?? s???n ph???m</span></a></li>
			<li><a class="app-menu__item active" href="${base }/admin/order"><i
					class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Qu???n
						l?? ????n h??ng</span></a></li>
			<li><a class="app-menu__item" href="${base }/admin/intestine"><i
					class='app-menu__icon bx bx-run'></i><span class="app-menu__label">Qu???n
						l?? n???i b??? </span></a></li>
			<li><a class="app-menu__item" href="${base }/admin/salary"><i
					class='app-menu__icon bx bx-dollar'></i><span
					class="app-menu__label">B???ng k?? l????ng</span></a></li>
			<li><a class="app-menu__item" href="${base }/admin/report"><i
					class='app-menu__icon bx bx-pie-chart-alt-2'></i><span
					class="app-menu__label">B??o c??o doanh thu</span></a></li>
			<li><a class="app-menu__item" href="/admin/contact"><i
					class='app-menu__icon bx bx-calendar-check'></i><span
					class="app-menu__label">Li??n h??? Kh??ch h??ng </span></a></li>
			<li><a class="app-menu__item" href="#"><i
					class='app-menu__icon bx bx-cog'></i><span class="app-menu__label">C??i
						?????t h??? th???ng</span></a></li>
		</ul>
	</aside>
	<main class="app-content">
		<div class="app-title">
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item">Danh s??ch ????n h??ng</li>
				<li class="breadcrumb-item"><a href="#">Th??m ????n h??ng</a></li>
			</ul>
		</div>
		<div class="row"></div>
		<div class="col-md-12"></div>
		<div class="tile">
			<h3 class="tile-title">T???o m???i ????n h??ng</h3>
			<div class="tile-body">
				<div class="row">
					<c:forEach items="${newOrder.saleOrderProducts}" var="product">

						<div class="form-group  col-md-4">
							<label class="control-label">T??n s???n ph???m c???n b??n</label> <input
								value="${product.products.name }" disabled="disabled"
								class="form-control" type="text">
						</div>
						<div class="form-group  col-md-4">
							<label class="control-label">Gi?? s???n ph???m </label> 
							<input
								value="${product.products.price }" disabled="disabled"
								class="form-control" type="text">
							
						</div>
						<div class="form-group  col-md-4">
							<label class="control-label">S??? l?????ng</label>
							 <%-- <input
								value="${product.quanlity }" disabled="disabled"
								class="form-control" type="number"> --%>
							<div class="btn-count" style="margin-top: 10px">
							
								<button type="button" class="plus"
									onclick="UpdateQuanlityCart('${base }', ${product.id}, 1)"
									value="+">+</button>
								
								<span id="quanlity_${product.id}">${product.quanlity }</span>

								<button type="button" class="mute"
									onclick="UpdateQuanlityCart('${base }', ${product.id}, -1)"
									value="-">-</button>
							</div>
							<%--  <sf:input path="saleOrderProducts.quality"  class="form-control" type="number"/>   --%>
						</div>
					</c:forEach>
				</div>

				<sf:form modelAttribute="newOrder" class="row" method="post"
					action="${base }/admin/order/management"
					enctype="multipart/form-data">
					<div style="display: none;" class="form-group  col-md-4">
						<label class="control-label">ID ????n h??ng ( N???u kh??ng nh???p
							s??? t??? ?????ng ph??t sinh )</label>
						<sf:input path="id" class="form-control" type="text" />
					</div>
					<div class="form-group  col-md-4">
						<label class="control-label">T??n kh??ch h??ng</label>
						<sf:input path="customerName" class="form-control" type="text" />
					</div>
					<div class="form-group  col-md-4">
						<label class="control-label">S??? ??i???n tho???i kh??ch h??ng</label>
						<sf:input path="customerPhone" class="form-control" type="number" />
					</div>
					<div class="form-group  col-md-4">
						<label class="control-label">?????a ch??? kh??ch h??ng</label>
						<sf:input path="customerAddress" class="form-control" type="text" />
					</div>
					<!-- <div class="form-group  col-md-4">
                  <label class="control-label">T??n ng?????i b??n</label>
                  <input class="form-control" type="text">
                </div> -->
					<!--  <div class="form-group  col-md-4">
                  <label class="control-label">S??? hi???u ng?????i b??n</label>
                  <input class="form-control" type="text">
                </div> -->
					<!-- <div class="form-group  col-md-4">
                  <label class="control-label">Ng??y l??m ????n h??ng</label>
                  <input class="form-control" type="date" >
                </div> -->

					<div class="form-group  col-md-12">
						<label class="control-label">M?? ????n h??ng</label>
						<sf:input path="code" class="form-control" type="text" />
					</div>

					<%-- 	<c:forEach items="${newOrder.saleOrderProducts}" var="product">

						<div class="form-group  col-md-6">
							<label class="control-label">T??n s???n ph???m c???n b??n</label> <input
								value="${product.products.name }" disabled="disabled"
								class="form-control" type="text">
						</div>
						<div class="form-group  col-md-6">
							<label class="control-label">S??? l?????ng</label> <input
								value="${product.quality }" class="form-control" type="number">
						
						</div>
					</c:forEach> --%>

					<!--  <div class="form-group  col-md-6">
                  <label class="control-label">T??n s???n ph???m c???n b??n</label>
                  <input disabled="disabled" class="form-control" type="text"> doi ti :<
                </div>
                <div class="form-group  col-md-6">
                  <label class="control-label">S??? l?????ng</label>
                  <input class="form-control" type="number"> ti tinh
                </div> -->
					<div class="form-group col-md-12">
						<label for="exampleSelect1" class="control-label">T??nh
							tr???ng</label>
						<sf:select path="description" class="form-control"
							id="exampleSelect1">
							<option>-- Ch???n t??nh tr???ng --</option>
							<sf:option value="???? x??? l??">???? x??? l??</sf:option>
							<sf:option value="??ang ch???">??ang ch???</sf:option>
							<sf:option value="??ang v???n chuy???n">??ang v???n chuy???n</sf:option>
							<sf:option value="??ang giao h??ng">??ang giao h??ng</sf:option>
							<sf:option value="???? giao h??ng">???? giao h??ng</sf:option>
							<sf:option value="???? h???y">???? h???y</sf:option>
						</sf:select>
					</div>
					<div class="form-group  col-md-12">
						<label class="control-label">Ghi ch?? ????n h??ng</label>
						<sf:textarea path="statusTransport" class="form-control" rows="4"></sf:textarea>
					</div>
					<button class="btn btn-save" type="submit">L??u l???i</button>
					<a class="btn btn-cancel" href="/doc/table-data-oder.html">H???y
						b???</a>
				</sf:form>
			</div>
			<!--   <button class="btn btn-save" type="submit">L??u l???i</button>
          <a class="btn btn-cancel" href="/doc/table-data-oder.html">H???y b???</a> -->
		</div>
	</main>
	<!-- Essential javascripts for application to work-->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- <script src="js/main.js"></script> -->
	<!-- The javascript plugin to display page loading on top-->
	<script src="js/plugins/pace.min.js"></script>
	<script>
	
	/* function UpdateQuanlityCart(baseUrl, productId, quanlity) {
		
		// javascript object.  data la du lieu ma day len action cua controller
		let data = {
			productId: productId, // lay theo id	
			quanlity: quanlity
		};
		
		// $ === jQuery
		// json == javascript object
		jQuery.ajax({
			url: "/ajax/updateQuanlitySaleOrder", //->action
			type: "post",
			contentType: "application/json",
			data: JSON.stringify(data),

			dataType: "json", // kieu du lieu tra ve tu controller la json
			success: function(jsonResult) {
				alert("Chuc mung! da luu thanh cong dang ki);
				// t??ng s??? l?????ng s???n ph???m trong gi??? h??ng trong icon
				$( "#quanlity_" + productId ).html(jsonResult.currentProductQuality);
				$( ".totalPrice" ).html(jsonResult.totalPrice);
				
				
			},
			error: function(jqXhr, textStatus, errorMessage) {
				alert("error");
			}
		});
	}
 */	

	function UpdateQuanlityCart(baseUrl, productId, quanlity) {
		
		// javascript object.  data la du lieu ma day len action cua controller
		let data = {
			id: productId, // lay theo id	
			quanlity: quanlity
		};
		console.log(data);
		// $ === jQuery
		// json == javascript object
		jQuery.ajax({
			url: "/ajax/updateQuanlitySaleOrder", //->action
			type: "post",
			contentType: "application/json",
			data: JSON.stringify(data),

			dataType: "json", // kieu du lieu tra ve tu controller la json
			success: function(jsonResult) {
				// t??ng s??? l?????ng s???n ph???m trong gi??? h??ng trong icon
				$( "#quanlity_" + productId ).html(jsonResult.currentProductQuanlity);
				/* $( ".totalPrice" ).html(jsonResult.totalPrice);
				
				$( "#tamTinh" ).html(jsonResult.totalPrice); */
			},
			error: function(jqXhr, textStatus, errorMessage) {
				alert("error");
			}
		});
	}
	</script>
</body>
</html>