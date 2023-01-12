<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
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
<script type="text/javascript" src="${base }/manager/js/jquery.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="${base }/manager/css/simplePagination.css" />
<script src="${base }/manager/js/jquery.simplePagination.js"></script>
</head>
<body>
	<%-- 	<header class="header">
		<div class="function-bar">

			<div style="margin-right: 30px;">
				<a href=""><i class="fa-solid fa-bell"></i> Notification</a>
			</div>
			<div style="margin-right: 70px;">
				<a href="${base }/login"><i
					class="fa-solid fa-arrow-right-to-bracket"></i> Login</a>
			</div>

		</div>
		<div class="header-top">
			<div class="logo">
				<img src="../images/logo.png" alt="">
			</div>
			<div class="menu-bar">
				<ul>
					<li><a href="${base }/home">Home</a></li>
					<li><a href="${base }/product">Product</a></li>
					<li><a href="">Promo</a></li>
					<li><a href="">About</a></li>
					<li><a href="${base }/contact">Contact</a></li>

				</ul>
			</div>
			<div class="finding">
				<!-- <button type="button" class="btn-search"><img src="../images/search.png" alt=""></button> -->
				<a href="/cart"><span class="count" id="totalCartItemId">
						${totalItems } </span> <i class="fa-solid fa-cart-shopping"
					style="color: white; font-size: 25px; cursor: pointer;"></i></a>
			</div>
		</div>
	</header> --%>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="aside">







		<ul class="categories">

			<li><a href="">Đồ ăn</a></li>
			<li>
				<div id="banh">
					<form action="" method="get">
						<input hidden="true" id="banhkem" name="banhkem">
						<button id="btnsearchbanh" style="background: none; border: none; font-size: 17px; cursor: pointer" type="submit">Bánh kem</button>
					</form>
				</div>
			</li>
			<li><a href="">Vỉa hè</a></li>
			<li><a href="">Món lẩu</a></li>
			<li><a href="">Cơm hộp</a></li>
			<li><a href="">Đồ uống</a></li>
			<li><a href="">Tráng miệng</a>
			<li><a href="">Đồ chay</a></li>
			<li><a href="">Đồ uống</a></li>

		</ul>
	</div>
	<main>
		<form action="${base }/product" method="get">
			<div class="search">
				<input id="keyword" value="${searchModel.keyword }" name="keyword"
					type="text" placeholder="Enter what you want to search">
				<button>search</button>
			</div>
		</form>

		<hr>

		<div class="main">
			<div class="wrap">
				<c:forEach var="product" items="${ products.data}">
					<a href="${base }product/${product.id}">
						<div class="card">
							<div class="img">
								<img id="img" src="${base }/upload/${product.avatar}"
									width="100%" alt="">
							</div>
							<div style="margin-left: 5px;" class="title">${product.name }
							</div>
							<!-- <div  <div style="margin-top: 7px; "  class="location">142 Ba đình </div> -->
							<div
								style="margin-top: 7px; overflow: hidden; text-overflow: ellipsis; width: 140px; height: 16px; margin-left: 5px;"
								class="location">${product.description }</div>
							<hr>
							<div style="margin-top: 7px; margin-left: 5px;" class="price">${product.price}
								đ</div>
						</div>
					</a>

				</c:forEach>




			</div>
			<div class="paging">
				<form action="${base }/product" method="get">

					<input id="page" name="page" class="form-control" />
					<button id="btnSearch" type="submit"></button>

				</form>
				<div>
					<div style="display: flex" id="paging"></div>
				</div>
			</div>

		</div>

	</main>

	<footer>
		<div class="containerr">
			<div class="footer">
				<div class="col1">
					<div class="title-col">Title Here</div>
					<br>
					<div class="content-col1">Nullam sit amet turpis ornare,
						pulvinar lectus in, cursus mi. Duis et nunc eu ligula imperdiet
						vulputate in mattis elit. Duis sodales tempor pulvinar. Quisque
						quis mi egestas turpis dignissim tincidunt sed vel neque. Quisque
						nec facilisis sem. In at commodo velit. Aliquam tempor volutpat
						laoreet.</div>
				</div>
				<div class="col2">
					<div class="title-col">About</div>
					<div class="content-col">
						<ul>
							<li><a href=""> History </a></li>
							<li><a href=""> Our Team </a></li>
							<li><a href=""> Brand Guidelines </a></li>
							<li><a href=""> Term & Condition </a></li>
							<li><a href=""> Privacy& Condition </a></li>

						</ul>
					</div>
				</div>
				<div class="col3">
					<div class="title-col">Services</div>
					<div class="content-col">
						<ul>
							<li><a href=""> How to Order </a></li>
							<li><a href=""> Our Product </a></li>
							<li><a href=""> Order Status </a></li>
							<li><a href=""> Promo </a></li>
							<li><a href=""> Payment Method </a></li>
						</ul>
					</div>
				</div>
				<div class="col4">
					<div class="title-col">Other</div>
					<div class="content-col">
						<ul>
							<li><a href=""> Contact Us </a></li>
							<li><a href=""> Help </a></li>
							<li><a href=""> Privacy </a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
<script type="text/javascript">
$(document).ready(function(){
	   $(function() {
		   $('#banhkem').val("1");
     	   $('#banhkemsearch').trigger('click'); 
		
});
 
	
	$(function() {
	    $('#paging').pagination({
	    	currentPage:${products.currentPage},
	        items: ${products.totalItems},
	        itemsOnPage: 5,
	        cssStyle: 'light-theme',
	        onPageClick:function(pageNumber,event){
	        	$('#page').val(pageNumber);
	        	$('#btnSearch').trigger('click'); 
	        },   
	    });
	});
});

</script>

<style>
* {
	margin: 0;
	padding: 0;
}

.categoryId {
	padding: 10px;
}

#page {
	display: none;
}

#btnSearch {
	display: none;
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

.container {
	width: 100%;
}

.header {
	/* position: relative; */
	/* margin-bottom: 10px; */
	
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
	margin-right: 50px;
}

.header-top .menu-bar ul li a {
	text-decoration: none;
	color: white;
}

.main-header {
	position: relative;
}

footer {
	/* margin-top: 20px; */
	/* background-color: #21243d; */
	color: white;
	display: block;
}

footer .containerr {
	background-color: #21243d;
}

.footer {
	padding-top: 100px;
	padding-bottom: 100px;
	display: flex;
	justify-content: space-around;
}

.footer .col1 .content-col1 {
	width: 300px;
}

.content-col ul {
	list-style-type: none;
	line-height: 40px;
}

.title-col {
	font-size: 30px;
}

.content-col ul li a {
	color: white;
	text-decoration: none;
}

.aside {
	/* margin-top: 10px; */
	width: 20%;
	/* padding-left: 15px; */
	/* margin-left: 15px; */
	float: left;
	/* font-style: italic; */
	/* background-color: lightgray; */
	display: block;
	height: 100vh;
	display: block;
	background-color: #21243d;
}

body {
	position: relative;
}

main {
	margin-left: 20%;
	display: block;
	height: 100vh;
	padding-left: 20px;
	/* border: 1px solid black; */
	background-color: #F2F2F2;
}

.paging {
	padding-left: 20px;
	padding-top: 40px;
}

a {
	text-decoration: none;
	color: black;
}

.card {
	/* padding: 10px; */
	width: 150px;
	height: 170px;
	border: 1px solid black;
	margin: 20px;
	border-radius: 7px;
	box-shadow: 0px 0px 15px 1px #888888;
	/* margin-left: 100px; */
}
/* .card :hover{
  box-shadow: 0px 0px 15px 1px #888888;
} */
#img {
	height: 100px;
	width: 150px;
	border-radius: 5px 5px 0px 0px;
}

.img {
	/* margin-left: 500px; */
	width: 100%;
	/*  border: 1px solid black;  */
	height: 100px;
	display: block;
}

.wrap {
	max-width: 100%;
	display: flex;
	/* width: calc(100%/4); */
	flex-wrap: wrap;
}

.categories {
	/* line-height: 50px; */
	padding: 10px;
}

.categories ul {
	
}

.categories li {
	display: flex;
	justify-content: center;
	padding: 10px;
	font-size: 20px;
	border: 1px solid black;
	border-radius: 7px;
	margin-bottom: 9px;
	background-color: #c6defd;
}

.categories li:hover {
	background-color: #ffd43b !important;
}

.search {
	display: flex;
	padding-top: 20px;
	margin-left: 20px;
	margin-bottom: 20px;
}

.search input {
	padding: 10px 10px 10px 10px;
	margin-right: 20px;
	width: 320px;
	border-radius: 7px;
}

hr {
	margin-left: 3%;
}

.search button {
	background-color: #ffd43b;
	padding: 10px;
	border-radius: 7px;
}

.item {
	/* box-shadow: 0px 0px 15px 1px #888888; */
	
}
</style>




</html>