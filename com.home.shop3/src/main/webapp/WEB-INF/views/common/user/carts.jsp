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

<link rel='stylesheet' type='text/css' media='screen' href='cart.css'>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
	integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src='main.js'></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/brands.min.css"
	integrity="sha512-+oRH6u1nDGSm3hH8poU85YFIVTdSnS2f+texdPGrURaJh8hzmhMiZrQth6l56P4ZQmxeZzd2DqVEMqQoJ8J89A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
	<header class="header">
		<div class="function-bar">

			<c:choose>
				<c:when test="${isLogined }">
					<div style="margin-right: 70px;">
						<a href="${base }/logout"><i
							class="fa-solid fa-arrow-right-to-bracket"></i> Logout</a>
					</div>
				</c:when>

				<c:otherwise>
					<div style="margin-right: 70px;">
						<a href="${base }/login"><i
							class="fa-solid fa-arrow-right-to-bracket"></i> Login</a>
					</div>
				</c:otherwise>
			</c:choose>


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
	</header>



	<main>
		<%-- <sf:form action="/cart"> --%>
		<div class="main-cart">

			<div class="container">

				<div class="left">
					<div class="cart">
						<h2 class="title">
							<i class="fa-solid fa-cart-shopping"></i>Giỏ hàng
						</h2>
						<div class="list_product_cart">


							<c:forEach items="${cart.cartItems}" var="ci">

								<div class="item-product">
									<button class="remove-product"><i
										class="fa fa-window-close " onclick="DeleteItemCart('${base }', ${ci.productId}, -1)" aria-hidden="true"></i>
									</button>
									<div class="left">
										<div class="img">
											<img src="${base }/upload/${ci.avatar}" width="100%"
												style="width: 100px; height: 100px" alt="">
										</div>
										<!-- <a class="img_product"  href=""><img src="../img/item1.png" width="100%"  alt=""></a> -->
										<div class="info">
											<h2 class="proct_name">${ci.productName }</h2>
											<div class="origin">Mã sản phẩm: ${ci.productId }</div>
											
											<fmt:setLocale value="vi_VN" />
											<span class="text-muted text-decoration-line-through">
												<fmt:formatNumber value="${ci.priceUnit}" type="currency" />
												đ
											</span>
											<div id="totalPriceItem_${ci.productId}">Price:$ ${ci.toltalPriceItem } </div>
											<!-- <div class="price">$${ci.priceUnit }đ</div> -->
										</div>
									</div>
									<div class="right_t">
										<div class="input_slg">
											<button class="plus"
												onclick="UpdateQuanlityCart('${base }', ${ci.productId}, 1)"
												value="+">+</button>
											<strong><span id="quanlity_${ci.productId}">${ci.quanlity }</span></strong>

											<button class="mute"
												onclick="UpdateQuanlityCart('${base }', ${ci.productId}, -1)"
												value="-">-</button>
											<%-- 	<input type="number" name="sl" id="sl" value="${ci.quanlity }">
											<button type="button" data-price="${ci.priceUnit }"
												class="plus">+</button>
											<button type="button" data-price="${ci.priceUnit }"
												class="mute">-</button> --%>
												<%-- <span id="totalPriceItem_${ci.productId}"></span> --%>

										</div>
										<!-- <div class="total_1_sp">Tổng: $${ci.priceUnit }</div> -->
										<div class="total_1_sp" data-total-price="${ci.priceUnit }">
											<fmt:setLocale value="vi_VN" />
											<%-- <span class="text-muted text-decoration-line-through">
													Tổng: <fmt:formatNumber value="${ci.priceUnit}"
														type="currency" /> đ
												</span> --%>
										</div>
									</div>

								</div>
								<hr>
							</c:forEach>
							<div class="total_price">
								<span>Tổng tiền: </span> <span value="tongTien()"
									class="totalPrice" id="total_price_product">${cart.totalPrice } đ</span>
							</div>


						</div>
					</div>





				</div>
				<div class="right">
					<div class="form">
						<%-- <sf:form action="/cart"> --%>
						<label class="label" for=""><h1></h1> Đơn hàng</label>
						<hr>
						<div class="tt">


							<div>Tạm tính</div>
							<div id="tamTinh">${cart.totalPrice}đ</div>
						</div>
						<div class="bt">
							<!-- 	<button class="btn">Tiếp tục thanh toán</button> -->
							<!-- <button type="submit" class="btn">Tiếp tục thanh toán</button> -->
						</div>
						<%-- </sf:form> --%>

					</div>



				</div>
			</div>




			<div class="customer">
				<sf:form action="/cart">
					<div class="col-lg-6">

						<div style="font-weight: bold; font-size: 30px;"
							class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thông
							tin khách hàng</div>
						<div class="p-4">
							<div class="form-group" style="margin-bottom: 5px;">
								<label for="customerPhone">Họ và tên khách hàng</label> <input
									type="text" class="form-control" id="customerFullName"
									name="customerFullName" value="${userLogined.name }"
									placeholder="Full name">
							</div>
							<div class="form-group" style="margin-bottom: 5px;">
								<label for="customerEmail">Địa chỉ Email</label> <input
									type="email" class="form-control" id="customerEmail"
									name="customerEmail" value="${userLogined.email }"
									placeholder="Enter email"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group" style="margin-bottom: 5px;">
								<label for="customerPhone">Phone</label> <input type="tel"
									class="form-control" id="customerPhone" name="customerPhone"
									value="${userLogined.phone }" placeholder="Phone">
							</div>
							<div class="form-group" style="margin-bottom: 5px;">
								<label for="customerAddress">Địa chỉ giao hàng</label> <input
									type="text" class="form-control" id="customerAddress"
									name="customerAddress" value="${userLogined.address }"
									placeholder="Address">
							</div>
							<div class="form-group" style="margin: 20px 5px;">
								<button type="submit" class="btn">Mua hàng</button>
							</div>

						</div>
					</div>
				</sf:form>
			</div>
		</div>

		<%-- 	</sf:form> --%>
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

<script>
function UpdateQuanlityCart(baseUrl, productId, quanlity) {
	
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // lay theo id	
		quanlity: quanlity
	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/updateQuanlityCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			// tăng số lượng sản phẩm trong giỏ hàng trong icon
			$( "#quanlity_" + productId ).html(jsonResult.currentProductQuality);
			$( ".totalPrice" ).html(jsonResult.totalPrice);
			$("#totalPriceItem_"+productId).html("Price:$"+jsonResult.currentPriceItem)+"đ";
			$( "#tamTinh" ).html(jsonResult.totalPrice);
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}


function DeleteItemCart(baseUrl, productId, quanlity) {
	
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // lay theo id	
		quanlity: quanlity
	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/deleteItemCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			// tăng số lượng sản phẩm trong giỏ hàng trong icon
			$( "#quanlity_" + productId ).html(jsonResult.currentProductQuality);
			$( ".totalPrice" ).html(jsonResult.totalPrice);
			
			$( "#tamTinh" ).html(jsonResult.totalPrice);
			location.reload(); 
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}

	// //Selecotr class name
	// $(".cart-title");
	// //selector id
	// $('#total_price_product');
	// //select tag name
	// $('input');
	// //select attribute
	// $('input[type="text"]');

	// // 
	// // thay đổi nội dung html
	// $(".title").text("giỏ hàng của bạn");
	// //lấy ra nội dung html nhưng chỉ có thể là text
	// var text_title = $('.title').text();
	// console.log(text_title);

	// //cash 2 thay đổi nội dung html có thẻ html trong nội dung
	// $('.title').html("<center>giỏ hàng căn giữa</center>");
	// // cách 2 lấy nội dung html thì được cả html con bên trong
	// var html_title = $('.title').html();
	// console.log(html_title);

	/*  $('.plus').on(
			'click',
			function() {
				
				slg = parseInt(slg) + 1;

				
				$(this).parent().find('input').val(slg);
				
				var price = $(this).attr('data-price');
			
				var total_1_sp = slg * price;
				
				$(this).parents('.right_t').find('.total_1_sp').text(
						'Tổng: ' + total_1_sp + 'đ');
				$(this).parents('.right_t').find('.total_1_sp').attr(
						'data-total-price', total_1_sp);
				var total = tongtien();

				console.log(total);
				$('#total_price_product').text(total);
				
				$(this).parents('.container').find('#tamTinh').text(total +" đ");
			});

	$('.mute').on(
			'click',
			function() {
				
				var slg = $(this).parent().find('input').val();
				if (slg > 1) {
					slg = parseInt(slg) - 1;
				}
				
				$(this).parent().find('input').val(slg);
			
				var price = $(this).attr('data-price');
				var total_1_sp = slg * price;
				
				$(this).parents('.right_t').find('.total_1_sp')
						.text('Tổng: ' + total_1_sp + 'đ');
				$(this).parents('.right_t').find('.total_1_sp').attr(
						'data-total-price', total_1_sp);
				var total = tongtien();
				$('#total_price_product').text(total);
				$(this).parents('.container').find('#tamTinh').text(total+" đ");
			});

	function tongtien() {
		var total = 0;
		$('.total_1_sp').each(function() {
			var price = $(this).attr('data-total-price');

			total += Number(price);
		});
		return total;
	}  */

	/* $('.remove-product').on('click', function() {
		// xóa đối tượng html đang được selector đến

		$(this).parent().remove();
	}); */
</script>


<style>
* {
	margin: 0;
	padding: 0;
}

.input_slg {
	display: flex;
	justify-content: space-around;
	width: 100px;
	align-items: center;
}
/* .plus{
	margin-right: 10px;
	margin-left: 20px;
} */
.customer {
	display: flex;
	margin-top: 30px;
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
	padding: 20px;
}

.container {
	display: flex;
	justify-content: space-around;
}

.left {
	/* border: 1px solid black; */
	width: 510px;
}

.right {
	/* border: 1px solid black; */
	width: 250px;
}

.label {
	font-size: 35px;
}

.form {
	height: 200px;
	width: 200px;
}

.tt {
	margin-top: 30px;
	display: flex;
	justify-content: space-between;
}

.btn {
	padding: 23px 35px;
	/* background-color: #f15e2c; */
	background-color: black;
	color: white;
	border: none;
	font-size: 15px;
	cursor: pointer;
}

.bt {
	margin-top: 15px;
	display: flex;
	justify-content: center;
}

.left {
	display: flex;
	justify-content: space-between;
	padding: 5px 0px;
}

.img {
	width: 100px;
	height: 100px;
	/* border: 1px solid black; */
}

.info {
	line-height: 35px;
}

.toptal_price {
	line-height: 35px;
}

.right_t {
	display: flex;
}

.right_t input {
	padding: 5px;
}

.right_t button {
	padding: 5px;
	/* margin-left: 25px; */
	background-color: black;
	color: white;
}

.total_1_sp {
	align-items: center;
	display: flex;
	margin-left: 10px;
	text-decoration: underline;
}

.item-product {
	margin-bottom: 20px;
}

.remove-product {
	cursor: pointer;
	background: none;
	border:none;
}
</style>

</html>