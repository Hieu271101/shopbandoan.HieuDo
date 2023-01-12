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
<script src="/manager/js/bootstrao.min.js"></script>
<script src="/manager/js/jquery-3.2.1.min.js"></script>
<script src="/manager/js/popper.min.js"></script>
<script src="/manager/js/bootstrap.min.js"></script>
</head>
<body class="app sidebar-mini rtl">

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
			<!-- <img class="app-sidebar__user-avatar" src="/images/hay.jpg" width="50px" alt="User Image"> -->
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
			<li><a class="app-menu__item " href="${base }/admin"><i
					class='app-menu__icon bx bx-tachometer'></i><span
					class="app-menu__label">Bảng điều khiển</span></a></li>
			<li><a class="app-menu__item active"
				href="${base }/admin/employee"><i
					class='app-menu__icon bx bx-id-card'></i> <span
					class="app-menu__label">Quản lý nhân viên</span></a></li>
			<li><a class="app-menu__item"
				href="${base }/admin/admin1"><i
					class='app-menu__icon bx bx-id-card'></i> <span
					class="app-menu__label">Quản lý Admin</span></a></li>
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


		<div class="app-title">
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item">Danh sách nhân viên</li>
				<li class="breadcrumb-item"><a href="#">Thêm nhân viên</a></li>
			</ul>
		</div>

		<div class="row">
			<div class="col-md-12">

				<div class="tile">

					<h3 class="tile-title">Tạo mới nhân viên</h3>
					<div class="tile-body">
						<div class="row element-button">
							<div class="col-sm-2">
								<a class="btn btn-add btn-sm" data-toggle="modal"
									data-target="#exampleModalCenter"><b><i
										class="fas fa-folder-plus"></i> Tạo chức vụ mới</b></a>
							</div>
							<%-- <c:if test="${isAdmin }">
								<div class="col-sm-2">
									<a href="${base }/admin/register" 
									class="btn btn-warning btn-sm" 
									>
										<b><i
											class="fas fa-folder-plus"></i> Tạo Tài khoản cho nhân viên</b></a>
								</div>
							</c:if> --%>

						</div>

						<sf:form modelAttribute="newEmployee" class="row"
							action="${base }/admin/employee/management" method="post"
							enctype="multipart/form-data">
							<!--  <div class="form-group col-md-4">
                  <label class="control-label">ID nhân viên</label>
                 </div> -->
							<sf:hidden path="id" class="form-control" />
							<div class="form-group col-md-4">
								<label class="control-label">Họ và tên</label>
								<sf:input path="name" class="form-control" type="text" />
							</div>
							<div class="form-group col-md-4">
								<label class="control-label">Địa chỉ email</label>
								<sf:input path="email" class="form-control" type="text" />
							</div>

							<div class="form-group col-md-4">
								<label class="control-label">Ngày sinh</label>
								<sf:input path="dob" id="dob" class="form-control" type="date" />
							</div>
							<div class="form-group  col-md-4">
								<label class="control-label">Số điện thoại</label>
								<sf:input path="phone" class="form-control" type="number" />
							</div>
							<div class="form-group col-md-4">
								<label class="control-label">Địa chỉ thường trú</label>
								<sf:input path="address" class="form-control" type="text" />
							</div>
							<div class="form-group  col-md-4">
								<label class="control-label">Nơi sinh</label>
								<sf:input path="pob" class="form-control" type="text" />
							</div>
							<div class="form-group col-md-3">
								<label class="control-label">Số CMND</label>
								<sf:input path="citizenId" class="form-control" />
							</div>
							<div class="form-group col-md-3">
								<label class="control-label">Ngày cấp</label>
								<sf:input path="dateC" class="form-control" type="date" />
							</div>
							<div class="form-group col-md-3">
								<label class="control-label">Nơi cấp</label>
								<sf:input path="placeC" class="form-control" type="text" />
							</div>
							<div class="form-group col-md-3">
								<label class="control-label">Giới tính</label>
								<sf:select path="gender" class="form-control"
									id="exampleSelect2">
									<option value="">-- Chọn giới tính --</option>
									<sf:option value="Nam">Nam</sf:option>
									<sf:option value="Nữ">Nữ</sf:option>
									<sf:option value="Chuyển giới Nam">Chuyển giới Nam</sf:option>
									<sf:option value="Chuyển giới Nữ">Chuyển Giới Nữ</sf:option>
									<sf:option value="Khác">Khác</sf:option>
								</sf:select>
							</div>


							<div class="form-group  col-md-3">
								<label for="exampleSelect1" class="control-label">Chức
									vụ</label>
									<select  name="position.id" class="form-control"
									id="exampleSelect1">
									<option>-- Chọn chức vụ --</option>
								
									
									<c:forEach var="positionItem" items="${positionItems }">
									
										<option value="${ positionItem.id}">${positionItem.name}</option>
									</c:forEach>
									

								</select>
							</div>
							
							
							<div class="form-group col-md-6">
								<label class="control-label">Bằng cấp</label>
								<sf:select path="degree" class="form-control"
									id="exampleSelect3">
									<option>-- Chọn bằng cấp --</option>
									<sf:option value="Tốt nghiệp đại học">Tốt nghiệp Đại Học</sf:option>
									<sf:option value="Tốt nghiệp cao đẳng">Tốt nghiệp Cao Đẳng</sf:option>
									<sf:option value="Tốt nghiệp phổ thông">Tốt nghiệp Phổ Thông</sf:option>
									<sf:option value="Chưa tốt nghiệp">Chưa tốt nghiệp</sf:option>
									<sf:option value="Không bằng cấp">Không bằng cấp</sf:option>
								</sf:select>
							</div>
							<div class="form-group col-md-6">
								<label class="control-label">Tình trạng hôn nhân</label>
								<sf:select path="maritalStatus" class="form-control"
									id="exampleSelect2">
									<option>-- Chọn tình trạng hôn nhân --</option>
									<sf:option value="Độc thân">Độc thân</sf:option>
									<sf:option value="Đã kết hôn">Đã kết hôn</sf:option>
									<sf:option value="Góa">Góa</sf:option>
									<sf:option value="Khác">Khác</sf:option>
								</sf:select>
							</div>


							<div class="form-group col-md-12">
								<label class="control-label">Ảnh 3x4 nhân viên</label>
								<div id="myfileupload">
									<input type="file" id="uploadfile" name="imgEmployee"
										onchange="readURL(this);" />
								</div>
								<div id="thumbbox">
									<img src="${base }/upload/${newEmployee.avatar}" height="300"
										width="300" alt="Thumb image" id="thumbimage" />
									<!--  <a class="removeimg" href="javascript:"></a> -->
								</div>
								<div id="boxchoice">
									<a href="javascript:" class="Choicefile"><i
										class='bx bx-upload'></i></a>
									<p style="clear: both"></p>
								</div>

							</div>



							<div class="form-group col-md-12">
								<button class="btn btn-save" onclick="validate()" type="submit">Lưu
									lại</button>
								<a class="btn btn-cancel" href="/doc/table-data-table.htm++l">Hủy
									bỏ</a>
							</div>


						</sf:form>

					</div>

				</div>



				<div class="modal fade" id="exampleModalCenter" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<!-- cái này dùng ajaxx  nhé cưng <33333333333333333333333 -->


							<form>
								<div class="modal-body">
									<div class="row">
										<div class="form-group  col-md-12">
											<span class="thong-tin-thanh-toan"> <!--  <h4>Tạo chức vụ mới</h4> -->
												Tạo chức vụ mới
											</span>
										</div>


										<div class="form-group col-md-12">
											<label class="control-label">Nhập tên chức vụ mới</label> <input
												id="name_pos" name="name" class="form-control" type="text">
										</div>
									</div>
									<BR>
									<button class="btn btn-save" onclick="save()" type="button">Lưu
										lại</button>
									<a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy
										bỏ</a> <BR>
								</div>

							</form>

						</div>
					</div>
				</div>



			</div>
		</div>
		<c:forEach var="position" items="${newPositionhehe }">
       	    	${position.id }
      </c:forEach>

	</main>


	<!--
    MODAL
  -->

	<!--
    MODAL
  -->


	<!-- Essential javascripts for application to work-->


</body>

<script type="text/javascript">
  function validate() {
	  alert("da vao validate");
      console.log("da vao validate");
      if( ${'#dob'} == "" ) {
         alert( "Please provide your date of birth!" );
       
         return false;
      }
  }
  
  function save() {
		
		//with upload file
		// Get form
	    //var form = $('#fileUploadForm')[0];
	    //var data = new FormData(form);
		
		// javascript object.
		// data la du lieu ma day len action cua controller
		let data = {
				name: jQuery("#name_pos").val(), // lay theo id
		
		};
		console.log(data);
		
		// $ === jQuery
		// json == javascript object
		jQuery.ajax({
			url : "/admin/manageEmployee/add-position",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),
			
			
			dataType : "json", // kieu du lieu tra ve tu controller la json
			success : function(jsonResult) {
				alert("Bạn đã thêm vị trí thành công "+jsonResult.statusCode + jsonResult.statusMessage);
			 location.reload(); 
			},
			error : function(jqXhr, textStatus, errorMessage) { // error callback 
				alert("error");
			}
		
		});
	}
  </script>
<!-- <style>
.app-content {
  margin-left: 280px;
  margin-top: 80px;
  /* font-size: 50px; */
}
a{
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
  -webkit-transition: border-left-color 0.3s ease, background-color 0.3s ease;
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

.app-menu__item.active,
.app-menu__item:hover,
.app-menu__item:focus {
  background: #c6defd;
  text-decoration: none;
  color: rgb(22 22 72);
  box-shadow: none;
  border: 1px solid rgb(22 22 72);
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
  border-top: 1px solid rgb(255 255 255 / 26%);
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
  
      #uploadfile,
      .removeimg {
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
    </style> -->


</html>