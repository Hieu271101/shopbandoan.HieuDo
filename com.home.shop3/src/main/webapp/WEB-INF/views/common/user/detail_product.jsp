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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/brands.min.css" integrity="sha512-+oRH6u1nDGSm3hH8poU85YFIVTdSnS2f+texdPGrURaJh8hzmhMiZrQth6l56P4ZQmxeZzd2DqVEMqQoJ8J89A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
	integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
	<header class="header">
		  <div class="function-bar">
           
           <!--  <div style="margin-right: 30px ;"><a href=""><i class="fa-solid fa-bell"></i>    Notification</a> </div> -->
            <div style="margin-right: 70px ;"><a href="${base }/login"><i class="fa-solid fa-arrow-right-to-bracket"></i>    Login</a> </div>
            
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
				
					
					<a href="/cart"><span class="count" id="totalCartItemId">  ${totalItems } </span> <i
							class="fa-solid fa-cart-shopping"
							style="color: white; font-size: 25px; cursor: pointer;"></i>
					</a>
					
			</div>
		</div>
	</header>
	<main>
		<div class="container">
			<div class="img">
				<img id="img" src="${base }/upload/${Product.avatar}" alt="" width="100%">
			</div>
			<div class="content">
				<sf:form class="row" action="${base }/cart/"
					modelAttribute="Product" method="post">
					<div class="title">${Product.name }</div>
					<div class="sp">
						<div class="msp">Mã sản phẩm:${Product.id }</div>
						<div class="status">Tình trạng: ${Product.status }</div>
					</div>
					<div class="price">
						<i><u>Price: ${Product.price } đ</u> </i>
					</div>
					<hr style="border-top: 1px dashed grey;">
					<!-- <div class="scl">
						<div class="size">
							<label for="">Size</label> <select name="" id="">
								<option value="">S</option>
								<option value="">M</option>
								<option value="">L</option>
								<option value="">XL</option>
							</select>

						</div>
						<div class="amount">
							<label for="count">Số lượng</label> <input type="number">
						</div>
					</div> -->

					<div class="add-cart">

						<button type="button" onclick="save(${Product.id},1)" class="add">Thêm
							vào giỏ hàng</button>
					<!-- 	<button type="submit" class="cart">Thanh toán</button> -->
					<a href="/cart" class="cart">Thanh toán</a>
					</div>
				</sf:form>
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
		var count=0;
	/* 	function cong(){
			count++;
			document.getElementById("count-product").value=count;
		}
		function tru(){
			if(count>0){
				count--;
			}
			
			document.getElementById("count-product").value=count;
		} */

 		save=function(productId, quanlity) {
	
			let data = {
					productId:productId,
					quanlity:quanlity,
					
					
				};
				
			
				// $ === jQuery
				// json == javascript object
				jQuery.ajax({
					url : "/product/{productId}",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify(data),
					
					
					dataType : "json", // kieu du lieu tra ve tu controller la json
					success : function(jsonResult) {
						let totalItems=jsonResult.totalItems;
					
						$("#totalCartItemId").html(totalItems);
						/* alert("Chuc mung! da luu thanh cong dang ki "+jsonResult.code + jsonResult.status + jsonResult.totalItems); */
					},
					error : function(jqXhr, textStatus, errorMessage) { // error callback 
						alert("error");
					}
				});
			}
	</script>
<style>
* {
	margin: 0;
	padding: 0;
}
a{
	text-decoration: none;
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
	background-color: #F2F2F2;
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

main {
	padding: 40px;
}

.container {
	display: flex;
	justify-content: space-around;
}
#img{
	width: 400px;
	height: 300px;
}
.img {
	padding-top:60px;
	width: 400px;
	/* border: 1px solid black; */
	height: 300px;
}

.content {
	width: 300px;
	/* border: 1px solid black; */
	padding: 10px;
	line-height: 45px;
}

.title {
	font-size: 25px;
}

.sp {
	display: flex;
	justify-content: space-between;
}

.scl {
	display: flex;
	justify-content: space-between;
}

.amount input {
	width: 100px;
}

.add-cart {
	display: flex;
	justify-content: space-between;
	margin-top: 10px;
}

.add {
	padding: 7px;
	border-radius: 7px;
	background-color: rgb(28, 19, 9);
	border: none;
	color: white;
}

.cart {
	padding: 5px 15px 5px 15px;
	border-radius: 7px;
	background-color: rgb(241, 172, 82);
	border: none;
}

button {
	cursor: pointer;
}
</style>
</html>