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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/brands.min.css"
	integrity="sha512-+oRH6u1nDGSm3hH8poU85YFIVTdSnS2f+texdPGrURaJh8hzmhMiZrQth6l56P4ZQmxeZzd2DqVEMqQoJ8J89A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<body class="app sidebar-mini rtl">

	<div class="customer">
		<sf:form modelAttribute="user">
			<div class="col-lg-6">
				<sf:hidden path="id" name="id" value="${userLogined.id }" />
				<sf:hidden path="password" name="password"  value="${userLogined.password }"/>
				
				<div style="font-weight: bold; font-size: 30px;"
					class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Profile</div>
				<div class="p-4">
					<div class="form-group" style="margin-bottom: 5px;">
						<label for="customerPhone">Họ và tên khách hàng</label>
						<sf:input path="userName" type="text" class="form-control"
							id="customerFullName" name="userName"
							value="${userLogined.userName }" placeholder="Full name" />
					</div>
					<div class="form-group" style="margin-bottom: 5px;">
						<label for="customerEmail">Địa chỉ Email</label>
						<sf:input path="email" type="email" class="form-control"
							id="customerEmail" name="email" value="${userLogined.email }"
							placeholder="Enter email" />
					</div>
					<div class="form-group" style="margin-bottom: 5px;">
						<label for="customerPhone">Phone</label>
						<sf:input type="tel" path="phone" class="form-control"
							id="customerPhone" name="phone" value="${userLogined.phone }"
							placeholder="Phone" />
					</div>
					<div class="form-group" style="margin-bottom: 5px;">
						<label for="customerAddress">Giới tính</label>
						<sf:input type="text" path="gender" class="form-control"
							id="gender" name="gender" value="${userLogined.gender }"
							placeholder="Giới tính" />
					</div>
					<%-- <div class="form-group" style="margin-bottom: 5px;">
						<label for="customerAddress">Ngày sinh</label> 
						<sf:input
							type="datetime" class="form-control" id="dob" name="dob" path="dob"
							value="${userLogined.dob }" placeholder="Ngày sinh"/>
					</div> --%>
					<div class="form-group" style="margin-bottom: 5px;">
						<label for="customerAddress">Địa chỉ giao hàng</label>
						<sf:input type="text" class="form-control" id="customerAddress"
							path="shippingAddress" name="shippingAddress"
							value="${userLogined.shippingAddress }" placeholder="Address" />
					</div>

					
					<div class="form-group" style="margin: 20px 5px;">
						<button class="btn" type="submit" class="btn">Lưu lại</button>
					</div>

				</div>
			</div>
		</sf:form>
	</div>

	<style>
.btn {
	width: 100%;
	padding: 23px;
	/* background-color: #f15e2c; */
	background-color: black;
	color: white;
	border: none;
	font-size: 15px;
	cursor: pointer;
}

.customer {
	display: flex;
	padding: 40px;
	justify-content: center;
	/* border-top:1px solid grey;
	border-bottom: 1px solid grey; */
	line-height: 40px;
	font-size: 15px;
	background: #F2F2F2;
}

.customer input {
	width: 100%;
	padding: 10px 20px 10px 20px;
	border-radius: 8px;
	border: none;
}
</style>
</html>