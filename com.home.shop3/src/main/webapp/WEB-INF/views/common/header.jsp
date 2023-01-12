<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/brands.min.css"
	integrity="sha512-+oRH6u1nDGSm3hH8poU85YFIVTdSnS2f+texdPGrURaJh8hzmhMiZrQth6l56P4ZQmxeZzd2DqVEMqQoJ8J89A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Insert title here</title>
</head>
<body>
	<header>
		<div class="containerr">
			<div class="header">

				<div class="function-bar">


					<c:choose>
						<c:when test="${isLogined }">
							<c:choose>
								<c:when test="${existIsAdmin }">
									<div style="margin-right: 30px;">

										<a href="${base }/admin"><i class="fa fa-user"
											aria-hidden="true"></i> Trang chủ admin </a>
									</div>
								</c:when>
							</c:choose>
							<%-- <c:choose>
								<c:when test="${isAdmin1 }">
									<div style="margin-right: 30px;">

										<a href="${base }/admin"><i class="fa fa-user"
											aria-hidden="true"></i> Trang chủ admin </a>
									</div>
								</c:when>
							</c:choose> --%>

							<div style="margin-right: 30px;">

								<a href="${base }/profile"><i class="fa fa-user"
									aria-hidden="true"></i> Trang cá nhân </a>
							</div>

							<div style="margin-right: 70px;">
								<a href="${base }/logout"><i
									class="fa-solid fa-arrow-right-to-bracket"></i> Logout</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="login" style="margin-right: 70px;">
								<a href="${base }/login">Login</a>
							</div>
						</c:otherwise>
					</c:choose>

					<!--  <div style="margin-right: 30px ;"><a href=""><i class="fa-solid fa-bell"></i>    Notification</a> </div> -->

					<%-- <div style="margin-right: 70px;">
						<a href="${base }/login"><i
							class="fa-solid fa-arrow-right-to-bracket"></i> Login</a>
					</div> --%>

				</div>
				<div class="header-top">
					<div class="logo">
						<img src="../images/logo.png" alt="">
					</div>
					<div class="menu-bar">
						<ul>
							<li><a href="${base }/home">Home</a></li>
							<li><a href="${base }/product">Product</a></li>
							<!-- <li><a href="">Promo</a></li> -->
							<li><a href="">About</a></li>
							<li><a href="${base }/contact">Contact</a></li>

						</ul>
					</div>
					<div class="finding">
						<!-- <button type="button" class="btn-search"><img src="../images/search.png" alt=""></button> -->
						<a href="/cart">
						<span class="count" id="totalCartItemId">
								${totalItems } </span>
								 <i class="fa-solid fa-cart-shopping"
							style="color: white; font-size: 25px; cursor: pointer;"></i>
						
						</a>
					</div>
				</div>
			</div>

		</div>
	</header>

</body>

<style>
	* {
	margin: 0;
	padding: 0;
	/* background-color: #21243d; */
}
.login{
	border:3px solid white;
	padding: 0px 10px;
	border-radius: 7px;
}
.function-bar {
	display: flex;
	/* float: right; */
	justify-content: right;
	padding: 20px 0px 20px 0px;
	/* align-items: center; */
	color: white;
	background-color: black;
	width: 100%;
}

.function-bar a {
	text-decoration: none;
	color: white;
	font-size: 20px;
}

.containerr {
	width: 100%;
}

.header {
	position: relative;
}

.header-top {
	position: relative;
	display: flex;
	justify-content: space-around;
	background-color: #21243d;
	width: 100%;
	height: 80px;
	align-items: center;
}

.header-top .menu-bar ul {
	list-style-type: none;
	display: flex;
}

.header-top .menu-bar ul li {
	font-size: 25px;
	margin-right: 70px;
}

.header-top .menu-bar ul li :last-child a {
	font-size: 25px;
	margin-right: 0px;
	border: 5px solid black;
}

.header-top .menu-bar ul li a {
	text-decoration: none;
	color: white;
}

.main-header {
	position: relative;
}

.btn-search {
	background-color: #21243d;
	cursor: pointer;
}

.main-header .title {
	position: absolute;
	top: 300px;
	left: 50px;
	font-size: 100px;
	color: white;
}
.finding {
	position: relative;
}
.count {
	position: absolute;
	right: -30%;
	top: -60%;
	color: white;
	font-size: 15px;
	background: red;
	padding: 5px;
	border-radius: 45px;
}

</style>
</html>