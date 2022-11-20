<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="${base}/manager/css/main.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script src="/manager/js/bootstrao.min.js"></script>
<script src="/manager/js/jquery-3.2.1.min.js"></script>
<script src="/manager/js/popper.min.js"></script>
<script src="/manager/js/bootstrap.min.js"></script>
</head>
<body>
	<header class="app-header">
		<!-- Sidebar toggle button-->
		<a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
			aria-label="Hide Sidebar"></a>
		<!-- Navbar Right Menu-->
		<ul class="app-nav">
			<!-- User Menu-->
			<li><a class="app-nav__item" href="/index.html"> <i
					class="fa-solid fa-arrow-right-from-bracket"></i>
			</a></li>
		</ul>
	</header>

	<div>
		<aside class="app-sidebar">
			<div class="app-sidebar__user">
				<!-- <img class="app-sidebar__user-avatar" src="/images/hay.jpg"
					width="50px" alt="User Image" /> -->
				<div>
					<p class="app-sidebar__user-name">
						<b>${userLogined.name }</b>
					</p>
					<p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
				</div>
			</div>
			<hr />
			<ul class="app-menu">
				<li><a class="app-menu__item haha"
					href="phan-mem-ban-hang.html"> <i
						class="app-menu__icon bx bx-cart-alt"></i> <span
						class="app-menu__label">POS Bán Hàng</span>
				</a></li>
				<li><a class="app-menu__item " href="${base }/admin"><i
						class='app-menu__icon bx bx-tachometer'></i><span
						class="app-menu__label">Bảng điều khiển</span></a></li>
				<li><a class="app-menu__item" href="${base }/admin/employee">
						<i class="app-menu__icon bx bx-id-card"></i> <span
						class="app-menu__label">Quản lý nhân viên</span>
				</a></li>
				<li><a class="app-menu__item" href="#"> <i
						class="app-menu__icon bx bx-user-voice"></i> <span
						class="app-menu__label">Quản lý khách hàng</span>
				</a></li>

				<li><a class="app-menu__item active"
					href="${base }/admin/product"><i
						class='app-menu__icon bx bx-purchase-tag-alt'></i><span
						class="app-menu__label">Quản lý sản phẩm</span></a></li>
				<li><a class="app-menu__item" href="${base }/admin/order">
						<i class="app-menu__icon bx bx-task"></i> <span
						class="app-menu__label">Quản lý đơn hàng</span>
				</a></li>
				<li><a class="app-menu__item" href="${base }/admin/intestine">
						<i class="app-menu__icon bx bx-run"></i> <span
						class="app-menu__label">Quản lý nội bộ</span>
				</a></li>
				<li><a class="app-menu__item" href="${base }/admin/salary">
						<i class="app-menu__icon bx bx-dollar"></i> <span
						class="app-menu__label">Bảng kê lương</span>
				</a></li>
				<li><a class="app-menu__item " href="${base }/admin/report">
						<i class="app-menu__icon bx bx-pie-chart-alt-2"></i> <span
						class="app-menu__label">Báo cáo doanh thu</span>
				</a></li>
				<li><a class="app-menu__item" href="/admin/contact"> <i
						class="app-menu__icon bx bx-calendar-check"></i> <span
						class="app-menu__label">Liên hệ Khách hàng</span>
				</a></li>
				<li><a class="app-menu__item" href="#"> <i
						class="app-menu__icon bx bx-cog"></i> <span
						class="app-menu__label">Cài đặt hệ thống</span>
				</a></li>
			</ul>
		</aside>


	</div>
	<main class="app-content">
		<div class="app-title">
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item">Danh sách sản phẩm</li>
				<li class="breadcrumb-item"><a href="#">Thêm sản phẩm</a></li>
			</ul>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<h3 class="tile-title">Tạo mới sản phẩm</h3>
					<div class="tile-body">
						<div class="row element-button">
							<!-- <div class="col-sm-2">
								<a class="btn btn-add btn-sm" data-toggle="modal"
									data-target="#exampleModalCenter"><i
									class="fas fa-folder-plus"></i> Thêm nhà cung cấp</a>
							</div> -->
							<div class="col-sm-2">
								<a class="btn btn-add btn-sm" data-toggle="modal"
									data-target="#adddanhmuc"><i class="fas fa-folder-plus"></i>
									Thêm danh mục</a>
							</div>

						</div>



						<sf:form class="row" action="${base }/admin/product/management"
							modelAttribute="newProduct" enctype="multipart/form-data"
							method="post">
							<%--  <div class="form-group col-md-3">
                    <label class="control-label">Mã sản phẩm </label>
                    <sf:hidden path="id" class="form-control"   placeholder=""/>
                  </div>  --%>
							<sf:hidden path="id" class="form-control" placeholder="" />

							<div class="form-group col-md-3">
								<label class="control-label">Tên sản phẩm</label>
								<sf:input path="name" class="form-control" type="text" />
							</div>
							<div class="form-group col-md-3">
								<label class="control-label">Số lượng</label>
								<sf:input path="amount" class="form-control" type="number" />
							</div>
							<div class="form-group col-md-3">
								<label for="exampleSelect1" class="control-label">Tình
									trạng</label>
								<sf:select path="status" class="form-control"
									id="exampleSelect1">
									<option>-- Chọn tình trạng --</option>
									<%-- <sf:option items="${status }" itemValue=1 itemLabel="name">Còn hàng</sf:option>
                      <sf:option item="${status }" itemValue=0 itemLabel="name">Hết hàng</sf:option> --%>
									<sf:option value="1">Còn hàng</sf:option>
									<sf:option value="0">Hết hàng</sf:option>
								</sf:select>
							</div>
							<div class="form-group col-md-3">
								<label for="exampleSelect1" class="control-label">Danh
									mục</label>
								<sf:select path="category.id" class="form-control"
									id="exampleSelect1">
									<option>-- Chọn danh mục --</option>
									<c:forEach var="category" items="${categories }">
										<sf:option value="${category.id}">${category.name }</sf:option>
									</c:forEach>

									<%-- <sf:option value="2">2</sf:option> --%>
									<!--    <option>Bàn ăn</option>
                      <option>Bàn thông minh</option>
                      <option>Tủ</option>
                      <option>Ghế gỗ</option>
                      <option>Ghế sắt</option>
                      <option>Giường người lớn</option>
                      <option>Giường trẻ em</option>
                      <option>Bàn trang điểm</option>
                      <option>Giá đỡ</option> -->
								</sf:select>
							</div>
							<%-- <div class="form-group col-md-3">
								<label for="exampleSelect1" class="control-label">Nhà
									cung cấp</label>
								<sf:select path="supplier" class="form-control"
									id="exampleSelect1">

									<sf:option value="100">-- Chọn nhà cung cấp --</sf:option>
									<sf:option value="1001">1001</sf:option>
								
								</sf:select>
							</div> --%>
							<div class="form-group col-md-3">
								<label class="control-label">Giá bán</label>
								<sf:input path="price" class="form-control" type="number" />
							</div>
							<div class="form-group col-md-3">
								<label class="control-label">Giá vốn</label>
								<sf:input path="costPrice" class="form-control" type="number" />
							</div>


							<%--   <div class="form-group col-md-12">
                    <label class="control-label">Ảnh sản phẩm</label>
                    <div id="myfileupload">
                      <sf:input path="img" id="uploadfile" name="ImageUpload" onchange="readURL(this);" />
                    </div>
                    <div id="thumbbox">
                      <img height="450" width="400" alt="Thumb image" id="thumbimage" style="display: none" />
                      <a class="removeimg" href="javascript:"></a>
                    </div>
                    <div id="boxchoice">
                      <a href="javascript:" class="Choicefile"><i class="fas fa-cloud-upload-alt"></i> Chọn ảnh</a>
                      <p style="clear:both"></p>
                    </div>
    
                  </div> --%>

							<div class="form-group col-md-12">
								<label class="control-label" for="fileProductAvatar">Avatar</label>
								<input id="fileProductAvatar" name="productAvatar" type="file"
									class="form-control">

								<div class="form-group">

									<img alt="" style="width: 100px; height: 100px"
										src="${base }/upload/${newProduct.avatar}">
								</div>
							</div>



							<div class="form-group col-md-12">
								<label class="control-label">Ảnh sản phẩm</label>

								<div id="myfileupload">
									<input class="form-control" id="uploadfile" type="file"
										name="productPictures" onchange="readURL(this);"
										multiple="multiple">
								</div>

								<div>
									<c:forEach var="productImage" items="${newProduct.imgs }">
										<img alt="" style="width: 100px; height: 100px"
											src="${base }/upload/${productImage.path}">
									</c:forEach>
								</div>

							</div>


							<!-- ------------------------------------------------------------------------------------------------------------- -->
							<%-- 						<div class="form-group col-md-12">
								<label class="control-label">Ảnh sản phẩm</label>
				<!-- <div id="myfileupload">
                  <input type="file" id="uploadfile" name="ImageUpload" onchange="readURL(this);" />
                </div> -->
								<div class="form-group">
									<img alt="" style="width: 100px; height: 100px;">
										src="${base }/upload/${newProduct.avatar}"
								</div>
							

								<div class="form-group">
									<label for="fileProductPictures" class="Choicefile">Picture(Multiple)</label>
									<input id="fileProductPictures" name="ImageUpload" type="file"
										class="form-control-file" multiple="multiple">
								</div>
								<!--  <div id="boxchoice">
                  <a href="javascript:" class="Choicefile"><i class="fas fa-cloud-upload-alt"></i> Chọn ảnh</a>
                  <p style="clear:both"></p>
                </div> -->

							</div>
 --%>


							<div class="form-group col-md-12">
								<label class="control-label">Mô tả sản phẩm</label>
								<sf:textarea path="description" class="form-control" name="mota"
									id="mota" />
								<script>
									CKEDITOR.replace('mota');
								</script>
							</div>
							<div class="form-group col-md-120">
								<button class="btn btn-save" type="submit">Lưu lại</button>
								<a class="btn btn-cancel" href="table-data-product.html">Hủy
									bỏ</a>
							</div>


						</sf:form>
					</div>

				</div>
			</div>
		</div>
	</main>

	<!--  THÊM NHÀ CUNG CẤP  -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-body">
					<div class="row">
						<div class="form-group  col-md-12">
							<span class="thong-tin-thanh-toan">
								<h5>Thêm mới nhà cung cấp</h5>
							</span>
						</div>
						<div class="form-group col-md-12">
							<label class="control-label">Nhập tên chức vụ mới</label> <input
								class="form-control" type="text" required>
						</div>
					</div>
					<BR>
					<button class="btn btn-save" type="button">Lưu lại</button>
					<a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
					<BR>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!--  THÊM DANH MỤC -->
	<div class="modal fade" id="adddanhmuc" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" data-backdrop="static"
		data-keyboard="false">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-body">
					<div class="row">
						<div class="form-group  col-md-12">
							<span class="thong-tin-thanh-toan">
								<h5>Thêm mới danh mục</h5>
							</span>
						</div>
						<div class="form-group col-md-12">
							<label class="control-label">Nhập tên danh mục mới</label> 
							<input class="form-control" type="text" id="category" name="name">
						</div>
						<div class="form-group col-md-12">
							<label class="control-label">Danh mục sản phẩm hiện đang
								có</label>
							<ul style="padding-left: 20px;">
								<c:forEach var="category" items="${categories }">
									<li>${category.name }</li>
								</c:forEach>

							</ul>
						</div>
					</div>
					<BR>
					<button class="btn btn-save" onclick="addPosition()" type="button">Lưu
						lại</button>
					<script type="text/javascript">
						function addPosition() {
							let data = {
								name : jQuery("#category").val(), // lay theo id

							};
							console.log(data);
							jQuery.ajax({
								url : "/admin/product/add-category",
								type : "post",
								contentType : "application/json",
								data : JSON.stringify(data),

								dataType : "json", // kieu du lieu tra ve tu controller la json
								success : function(jsonResult) {
									alert("Bạn đã thêm vị trí thành công "
										);
									location.reload();
								},
								error : function(jqXhr, textStatus,
										errorMessage) { // error callback 
									alert("error");
								}

							});
						}
					</script>
					<a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
					<BR>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

</body>



<style>
.app-content {
	margin-left: 250px;
	margin-top: 50px;
	padding: 100px;
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

.app-content {
	min-height: calc(100vh - 50px);
	padding: 10px;
	background-color: #f5f5f5;
	-webkit-transition: margin-left 0.3s ease;
	-o-transition: margin-left 0.3s ease;
	transition: margin-left 0.3s ease;
}

.app-title {
	display: block;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: justify;
	-ms-flex-pack: justify;
	justify-content: space-between;
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-ms-flex-direction: row;
	flex-direction: row;
	background-color: #FFF;
	border-radius: .375rem;
	padding: 10px 30px;
	-webkit-box-shadow: 0 1px 2px rgb(0 0 0/ 10%);
	box-shadow: 0 1px 2px rgb(0 0 0/ 10%);
	border-left: 6px solid #FFD43B;
	margin-bottom: 20px;
}

*, *::before, *::after {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

user agent stylesheet
div {
	display: block;
}

body {
	margin: 0;
	font-family: var(- -font-family-sarabun);
	font-size: 14px;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
	text-align: left;
	background-color: #FFF;
}

.row {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	margin-right: -15px;
	margin-left: -15px;
}

.col-md-12 {
	position: relative;
	width: 100%;
	min-height: 1px;
	padding-right: 15px;
	padding-left: 15px;
}

.tile {
	position: relative;
	background: #ffffff;
	border-radius: .375rem;
	padding: 20px;
	-webkit-box-shadow: 0 2px 2px 0 rgb(0 0 0/ 14%), 0 1px 5px 0
		rgb(0 0 0/ 12%), 0 3px 1px -2px rgb(0 0 0/ 20%);
	box-shadow: 0 2px 2px 0 rgb(0 0 0/ 14%), 0 1px 5px 0 rgb(0 0 0/ 12%), 0
		3px 1px -2px rgb(0 0 0/ 20%);
	margin-bottom: 30px;
	-webkit-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

.tile .tile-title {
	margin-top: 0;
	margin-bottom: 30px;
	font-size: 20px;
	border-bottom: 2px solid #FFD43B;
	padding-bottom: 10px;
	padding-left: 5px;
	color: black;
}

.element-button {
	position: relative;
	border-bottom: 1px solid #ddd;
	padding-bottom: 10px;
	margin-bottom: 10px;
}

.btn, button, html [type="button"], [type="reset"], [type="submit"] {
	-webkit-appearance: button;
	margin-bottom: 5px;
}

.btn:not(:disabled):not(.disabled) {
	cursor: pointer;
	margin-left: 20px;
}

.col-md-3 {
	margin-left: 20px;
}

.app-breadcrumb {
	margin-bottom: 0;
	text-align: right;
	font-weight: 500;
	font-size: 13px;
	text-transform: capitalize;
	padding: 0;
	text-align: left;
	padding: 0;
	background-color: transparent;
}

.form-control {
	display: block;
	width: 100%;
	padding: 0.375rem 0.75rem;
	font-size: 15px;
	line-height: 1.5;
	color: black;
	background-color: #f1f1f1;
	background-clip: padding-box;
	height: 45px;
	border: 1px solid #dadada;
	border-radius: .357rem;
	-webkit-transition: border-color 0.15s ease-in-out, -webkit-box-shadow
		0.15s ease-in-out;
	transition: border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s
		ease-in-out;
	-o-transition: border-color 0.15s ease-in-out, box-shadow 0.15s
		ease-in-out;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out,
		-webkit-box-shadow 0.15s ease-in-out;
}

.btn-save {
	background-color: rgb(166, 236, 171);
	color: rgb(1, 123, 10);
	/* width: 100px; */
	font-weight: 600;
	letter-spacing: 1px;
}

.btn-cancel {
	background-color: rgb(255, 197, 197);
	color: rgb(190, 40, 40);
	/* width: 100px; */
	font-weight: 600;
	letter-spacing: 1px;
}

.btn {
	display: inline-block;
	font-weight: 500;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border: 2px solid transparent;
	padding: 0.375rem 0.75rem;
	font-size: 0.875rem;
	line-height: 1.5;
	border-radius: .357rem;
}

.col-md-120 {
	margin-top: 20px;
}

.control-label {
	font-weight: 600;
	color: black;
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

input#fileProductPictures.form-control-file {
	/* display:none; */
	
}
</style>


</html>