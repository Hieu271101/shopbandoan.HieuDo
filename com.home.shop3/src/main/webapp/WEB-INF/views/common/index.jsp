<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<body>

	<header>
		<div class="container">
			<div class="header">
				<%-- <div class="function-bar">
                   <div>  ${userLogined.userName }</div>
                    <div style="margin-right: 30px ;"><a href=""><i class="fa-solid fa-bell"></i>    Notification</a> </div>
                    <div style="margin-right: 70px ;"><a href="login.html"><i class="fa-solid fa-arrow-right-to-bracket"></i>    Login</a> </div>
                    
                </div> --%>
				<div class="function-bar">

					<!--  <div style="margin-right: 30px ;"><a href=""><i class="fa-solid fa-bell"></i>    Notification</a> </div> -->
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
			</div>


			<div class="main-header">
				<img src="user/images/background.png" width="100%" alt="">
				<div class="title">TITLE HERE</div>
				<div class="content">Body Text Body Text Body Text Body Text
					Body Text Body Text Body Text Body Text Body Text Body Text Body
					Text Body Text Body Text Body Text Body Text Body Text</div>
				<div class="btn-order">
					<button>
						<a href="../layout/order.html">ORDER NOW</a>
					</button>
				</div>
			</div>
		</div>
	</header>


	<main>
		<div class="container">
			<div class="page1">
				<div class="content-main">
					<div class="left">
						<div class="img">
							<img src="user/images/1567218793-2083973916-custom.png" alt="">
						</div>

					</div>
					<div class="right">
						<div class="title">Pet</div>
						<br>
						<div class="slogan">Nullam sit amet turpis ornare, pulvinar
							lectus in, cursus mi. Duis et nunc eu ligula imperdiet vulputate
							in mattis elit. Duis sodales tempor pulvinar. Quisque quis mi
							egestas turpis dignissim tincidunt sed vel neque. Quisque nec
							facilisis sem. In at commodo velit. Aliquam tempor volutpat
							laoreet.</div>
						<div class="idea">
							<div class="item">
								<div class="item-page1">
									<img src="user/images/veget.jpg" width="100%" alt="">
								</div>
								<div class="title-item">Vegetable</div>
							</div>
							<div class="item">
								<div class="item-page1">
									<img src="user/images/chuoi.jpg" width="100%" alt="">
								</div>
								<div class="title-item">Fruit</div>
							</div>
							<div class="item">
								<div class="item-page1">
									<img src="user/images/banh.jpg" width="100%" alt="">
								</div>
								<div class="title-item">Meat</div>
							</div>
							<div class="item">
								<div class="item-page1">
									<img src="user/images/banh-jj.jpg" width="100%" alt="">
								</div>
								<div class="title-item">Foods</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="page2">

				<div class="content-main">

					<div class="left">
						<div class="img-page2">
							<img src="user/images/rauhoaqua.png" width="100%" alt="">
						</div>

					</div>
					<div class="right">
						<div class="title-page2">
							<h2>Who We Are</h2>
						</div>
						<div class="main-page2">Aliquam tempus ultricies tincidunt.
							Donec nunc felis, egestas eu pellentesque a, ultricies non
							lectus. Ut lacinia erat ut diam volutpat, at mattis lacus
							placerat. Phasellus eget aliquet urna. Nullam sit amet turpis
							ornare, pulvinar lectus in, cursus mi. Duis et nunc eu ligula
							imperdiet vulputate in mattis elit. Duis sodales tempor pulvinar.




						</div>
						<button>Shop now</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="page3">
				<div class="left-page3">
					<div class="title-page3">
						<h1>Last News</h1>
					</div>
					<div class="item-page3">
						<div class="item-details">
							<div class="img-item3">
								<img src="user/images/cha.jpg" width="100%" alt="">
							</div>
							<div class="content-item3">
								<div class="titiecontent3">Nanoparticles from Cellulose</div>
								<div class="content-main3">Lorem ipsum dolor sit amet,
									consectetur adipiscing elit, sed do eiusmod tempor incididunt
									ut labore et dolore magna aliqua. Ut enim ad minim veniam,...</div>
							</div>
						</div>

					</div>
					<div class="item-page3">
						<div class="item-details">
							<div class="img-item3">
								<img src="user/images/cha.jpg" width="100%" alt="">
							</div>
							<div class="content-item3">
								<div class="titiecontent3">Nanoparticles from Cellulose</div>
								<div class="content-main3">Lorem ipsum dolor sit amet,
									consectetur adipiscing elit, sed do eiusmod tempor incididunt
									ut labore et dolore magna aliqua. Ut enim ad minim veniam,...</div>
							</div>
						</div>

					</div>
					<div class="item-page3">
						<div class="item-details">
							<div class="img-item3">
								<img src="user/images/cha.jpg" width="100%" alt="">
							</div>
							<div class="content-item3">
								<div class="titiecontent3">Nanoparticles from Cellulose</div>
								<div class="content-main3">Lorem ipsum dolor sit amet,
									consectetur adipiscing elit, sed do eiusmod tempor incididunt
									ut labore et dolore magna aliqua. Ut enim ad minim veniam,...</div>
							</div>
						</div>

					</div>
				</div>

				<div class="right-page3">
					<div class="img-right-page3">
						<img src="user/images/cherry.jpg" style="border-radius: 5px;"
							width="100%" alt="">
						<div class="right-content-page3">
							Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
							eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
							enim ad minim veniam, quis nstrud exercitation ullamco laboris
							nisi ut aliquip It has survived not only five centuries, but
							<button class="view-more">View More</button>
						</div>
					</div>
				</div>



			</div>
		</div>
		</div>
	</main>
	<footer>
		<div class="container">
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
<style>
* {
	margin: 0;
	padding: 0;
	/* background-color: #21243d; */
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

.page {
	position: relative;
	display: block;
}

.page .page1 {
	position: relative;
	display: flex;
	height: 800px;
	top: 800px;
	background-color: #21243d;
	justify-content: center;
	color: wheat;
}

.page .page1 .title-page1 {
	margin: 50px;
	font-size: 70px;
}

.content-page {
	margin: 50px;
	height: 60px;
	width: 450px;
}

.list-page1 {
	position: absolute;
	top: 200px;
}

.list-page1 ul {
	display: flex;
	list-style-type: none;
	text-decoration: none;
}

.list-page1 ul li {
	margin-right: 100px;
}

.item .title-item {
	margin-top: 40px;
	margin-left: 50px;
	font-size: 30px;
}

.btn-order {
	position: absolute;
	top: 500px;
	left: 100px;
	font-size: 100px;
	color: white;
}

.btn-order button {
	height: 70px;
	width: 250px;
	border-radius: 30px;
	background-color: #21243d;
	cursor: pointer;
}

.btn-order  :hover {
	height: 70px;
	width: 250px;
	border-radius: 30px;
	background-color: black;
}

.btn-order button a {
	text-decoration: none;
	font-size: 20px;
	color: white;
}

.content {
	position: absolute;
	top: 450px;
	left: 50px;
	font-size: 15px;
	color: white;
	width: 550px;
	line-height: 35px;
}

main {
	margin: 0;
	padding: 0;
}

.page {
	position: relative;
}

.page1 .content-main {
	display: flex;
	width: 100%;
	height: 700px;
	border: 1px solid black;
	margin-top: 1000px;
	position: absolute;
	justify-content: space-around;
	/* width:  calc(100%/2); */
	align-items: center;
	flex-wrap: wrap;
}

.left {
	width: 500px;
	height: 450px;
	margin: 50px;
	border: 1px solid #94c347;
	position: relative;
	justify-content: center;
}

.left img {
	position: absolute;
	/* top: -60px; */
	left: 0;
}

.right {
	position: relative;
	border: 1px solid #94c347;
	width: 500px;
	height: 500px;
	display: block;
	justify-content: center;
	padding: 20px;
	text-align: center;
	justify-items: center;
	align-items: center;
}

.slogan {
	color: black;
	text-align: center;
}

.idea {
	/* margin: 10px; */
	display: flex;
	width: calc(100%/ 2);
	justify-content: space-between;
	width: 100%;
	height: 300px;
	/* border: 1px solid black; */
	flex-wrap: wrap;
	align-items: flex-end;
}

.idea .item {
	margin: 40px;
	width: 100px;
	height: 100px;
	/* border: 1px solid black; */
}

.idea .item .title-item {
	color: #94c347;
	font-weight: bold;
	font-size: 20px;
}

.page1 .content-main .left {
	background-color: #94c347;
}

.item .title-item {
	margin: 0;
	margin-top: 40px;
	font-size: 15px;
}

.page2 .content-main {
	margin-top: 2300px;
	display: flex;
	width: 100%;
	height: 700px;
	border: 1px solid black;
	margin-top: 1700px;
	position: absolute;
	justify-content: space-around;
	/* width:  calc(100%/2); */
	align-items: center;
	flex-wrap: wrap;
}

.page2 .content-main .right {
	display: flex;
	justify-content: flex-start;
	width: 500px;
	height: 300px;
	border: 1px solid #94c347;
	flex-wrap: wrap;
	/* align-items: center; */
}

.page1 .right .title {
	color: #94c347;
	font-size: 30px;
}

.page2 .content-main .left .img-page2 {
	/* position: absolute; */
	
}

.page2 .content-main .right .title-page2 h2 {
	color: #94c347;
}

.page2 .content-main .right .main-page2 {
	
}

.right button {
	padding: 15px 50px;
	cursor: pointer;
	background-color: #94c347;
	border-radius: 5px;
}

.page3 {
	width: 700px;
	height: 1000px;
	margin-top: 000px;
	position: relative;
	display: flex;
	justify-content: space-around;
	width: 100%;
	align-items: center;
	border: 1px solid brown;
}

.page3 .left-page3 {
	width: 500px;
	height: 900px;
	/* border: 1px solid black; */
}

.left-page3 .title-page3 {
	width: 200px;
	height: 50px;
	/* border: 1px solid black; */
}

.item-page3 {
	margin-bottom: 50px;
}

.left-page3 .item-details {
	width: 500px;
	height: 200px;
	/* border: 1px solid black; */
	display: flex;
	align-items: center;
}

.left-page3 .item-details .img-item3 {
	width: 175px;
	height: 175px;
	border-radius: 5px;
}

.left-page3 .item-details .img-item3 img {
	width: 175px;
	height: 175px;
	border: 1px solid black;
	border-radius: 5px;
}

.content-item3 {
	display: flex;
	justify-content: space-between;
	width: 300px;
	height: 200px;
	color: black;
	flex-wrap: wrap;
	padding-top: 50px;
	margin-left: 20px;
}

/* .img-item3{
    width: 50px;
    height: 50px;
} */
.content-item3 .titiecontent3 {
	width: 200px;
	height: 50px;
	font-size: 14px;
}

.content-item3 .content-main3 {
	width: 1000px;
	height: 500px;
}

.page3 .right-page3 {
	position: relative;
	width: 500px;
	height: 500px;
	border-radius: 5px;
}

.right-content-page3 {
	position: absolute;
	top: 0;
	margin-top: 0px;
	padding: 40px;
	color: floralwhite;
	line-height: 30px;
}

.img-right-page3 img {
	opacity: 80%;
}

.right-content-page3 button {
	margin-top: 30px;
	width: 200px;
	height: 40px;
	background-color: black;
	border-radius: 5px;
	border: none;
	color: white;
	cursor: pointer;
}

footer {
	margin-top: 1400px;
	/* background-color: #21243d; */
	color: white;
}

footer .container {
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

.content-col ul li {
	
}

.title-col {
	font-size: 30px;
}

.content-col ul li a {
	color: white;
	text-decoration: none;
}

.view-more {
	opacity: 200%;
	cursor: pointer;
	background-color: black;
}
/* @media  (min-width:100px)  and (max-width:960px){
        .header-top {
    position: relative;
   display: block;
    justify-content: space-around;
    background-color: #21243d;
    width: 100%;
    height: 160px;
    align-items: center;
    }
     } */
@media ( min-width :600px) and (max-width:920px) {
	.header-top .menu-bar ul {
		list-style-type: none;
		display: block;
	}
	.header-top {
		position: relative;
		display: flex;
		justify-content: space-around;
		background-color: #21243d;
		width: 100%;
		height: 160px;
		align-items: center;
	}
	/* .header-top .menu-bar ul li{
    font-size: 15px;
    margin-right: 70px;
    } */
	.page3 .right-page3 {
		position: relative;
		width: 100px;
		height: 500px;
		border-radius: 5px;
	}
	.content-item3 .content-main3 {
		width: 500px;
		height: 500px;
	}
	.right-content-page3 {
		position: absolute;
		top: 0;
		margin-top: 0px;
		padding: 0px;
		color: floralwhite;
		line-height: 30px;
	}
	.right-content-page3 button {
		margin-top: 30px;
		width: 100px;
		height: 40px;
		background-color: black;
		border-radius: 5px;
		border: none;
		color: white;
		cursor: pointer;
	}
}

@media ( min-width :585px) and (max-width:1150px) {
	.btn-order {
		position: absolute;
		top: 200px;
		left: 100px;
		font-size: 100px;
		color: white;
	}
	.content {
		position: absolute;
		top: 150px;
		left: 50px;
		font-size: 15px;
		color: white;
		width: 550px;
		line-height: 35px;
	}
	.main-header .title {
		position: absolute;
		top: 0px;
		left: 20px;
		font-size: 100px;
		color: white;
	}
}

@media ( min-width :500px) and (max-width:584px) {
	.page3 {
		width: 700px;
		height: 1000px;
		margin-top: 000px;
		position: relative;
		/* display: flex; */
		/* justify-content: space-around; */
		width: 100%;
		align-items: center;
		border: 1px solid brown;
	}
	.btn-order {
		position: absolute;
		top: 200px;
		left: 20px;
		font-size: 50px;
		color: white;
	}
	.content {
		position: absolute;
		top: 75px;
		left: 20px;
		font-size: 7.5px;
		color: white;
		width: 400px;
		line-height: 35px;
	}
	.main-header .title {
		position: absolute;
		top: 0px;
		left: 20px;
		font-size: 50px;
		color: white;
	}
}
/* @media(min-width:10px) and (max-width:740px){
    
   
    .btn-order{
        
        position: absolute;
    top: 70px;
    left: 0px;
    font-size: 50px;
    color: white;
    }
    .btn-order button{
    height: 40px;
    width: 142px;
    border-radius: 30px;
    background-color: #21243d;
    cursor: pointer;
    
}
*{
    margin: 0;
    padding: 0;
    /* background-color: #21243d; */
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

.page {
	position: relative;
	display: block;
}

.page .page1 {
	position: relative;
	display: flex;
	height: 800px;
	top: 800px;
	background-color: #21243d;
	justify-content: center;
	color: wheat;
}

.page .page1 .title-page1 {
	margin: 50px;
	font-size: 70px;
}

.content-page {
	margin: 50px;
	height: 60px;
	width: 450px;
}

.list-page1 {
	position: absolute;
	top: 200px;
}

.list-page1 ul {
	display: flex;
	list-style-type: none;
	text-decoration: none;
}

.list-page1 ul li {
	margin-right: 100px;
}

.item .title-item {
	margin-top: 40px;
	margin-left: 50px;
	font-size: 30px;
}

.btn-order {
	position: absolute;
	top: 500px;
	left: 100px;
	font-size: 100px;
	color: white;
}

.btn-order button {
	height: 70px;
	width: 250px;
	border-radius: 30px;
	background-color: #21243d;
	cursor: pointer;
}

.btn-order  :hover {
	height: 70px;
	width: 250px;
	border-radius: 30px;
	background-color: black;
}

.btn-order button a {
	text-decoration: none;
	font-size: 20px;
	color: white;
}

.content {
	position: absolute;
	top: 450px;
	left: 50px;
	font-size: 15px;
	color: white;
	width: 550px;
	line-height: 35px;
}

main {
	margin: 0;
	padding: 0;
}

.page {
	position: relative;
}

.page1 .content-main {
	display: flex;
	width: 100%;
	height: 700px;
	border: 1px solid black;
	margin-top: 1000px;
	position: absolute;
	justify-content: space-around;
	/* width:  calc(100%/2); */
	align-items: center;
	flex-wrap: wrap;
}

.left {
	width: 500px;
	height: 450px;
	margin: 50px;
	border: 1px solid #94c347;
	position: relative;
	justify-content: center;
}

.left img {
	position: absolute;
	/* top: -60px; */
	left: 0;
}

.right {
	position: relative;
	border: 1px solid #94c347;
	width: 500px;
	height: 500px;
	display: block;
	justify-content: center;
	padding: 20px;
	text-align: center;
	justify-items: center;
	align-items: center;
}

.slogan {
	color: black;
	text-align: center;
}

.idea {
	/* margin: 10px; */
	display: flex;
	width: calc(100%/ 2);
	justify-content: space-between;
	width: 100%;
	height: 300px;
	/* border: 1px solid black; */
	flex-wrap: wrap;
	align-items: flex-end;
}

.idea .item {
	margin: 40px;
	width: 100px;
	height: 100px;
	/* border: 1px solid black; */
}

.idea .item .title-item {
	color: #94c347;
	font-weight: bold;
	font-size: 20px;
}

.page1 .content-main .left {
	background-color: #94c347;
}

.item .title-item {
	margin: 0;
	margin-top: 40px;
	font-size: 15px;
}

.page2 .content-main {
	margin-top: 2300px;
	display: flex;
	width: 100%;
	height: 700px;
	border: 1px solid black;
	margin-top: 1700px;
	position: absolute;
	justify-content: space-around;
	/* width:  calc(100%/2); */
	align-items: center;
	flex-wrap: wrap;
}

.page2 .content-main .right {
	display: flex;
	justify-content: flex-start;
	width: 500px;
	height: 300px;
	border: 1px solid #94c347;
	flex-wrap: wrap;
	/* align-items: center; */
}

.page1 .right .title {
	color: #94c347;
	font-size: 30px;
}

.page2 .content-main .left .img-page2 {
	/* position: absolute; */
	
}

.page2 .content-main .right .title-page2 h2 {
	color: #94c347;
}

.page2 .content-main .right .main-page2 {
	
}

.right button {
	padding: 15px 50px;
	cursor: pointer;
	background-color: #94c347;
	border-radius: 5px;
}

.page3 {
	width: 700px;
	height: 1000px;
	margin-top: 000px;
	position: relative;
	display: flex;
	justify-content: space-around;
	width: 100%;
	align-items: center;
	border: 1px solid brown;
}

.page3 .left-page3 {
	width: 500px;
	height: 900px;
	/* border: 1px solid black; */
}

.left-page3 .title-page3 {
	width: 200px;
	height: 50px;
	/* border: 1px solid black; */
}

.item-page3 {
	margin-bottom: 50px;
}

.left-page3 .item-details {
	width: 500px;
	height: 200px;
	/* border: 1px solid black; */
	display: flex;
	align-items: center;
}

.left-page3 .item-details .img-item3 {
	width: 175px;
	height: 175px;
	border-radius: 5px;
}

.left-page3 .item-details .img-item3 img {
	width: 175px;
	height: 175px;
	border: 1px solid black;
	border-radius: 5px;
}

.content-item3 {
	display: flex;
	justify-content: space-between;
	width: 300px;
	height: 200px;
	color: black;
	flex-wrap: wrap;
	padding-top: 50px;
	margin-left: 20px;
}

/* .img-item3{
    width: 50px;
    height: 50px;
} */
.content-item3 .titiecontent3 {
	width: 200px;
	height: 50px;
	font-size: 14px;
}

.content-item3 .content-main3 {
	width: 1000px;
	height: 500px;
}

.page3 .right-page3 {
	position: relative;
	width: 500px;
	height: 500px;
	border-radius: 5px;
}

.right-content-page3 {
	position: absolute;
	top: 0;
	margin-top: 0px;
	padding: 40px;
	color: floralwhite;
	line-height: 30px;
}

.img-right-page3 img {
	opacity: 80%;
}

.right-content-page3 button {
	margin-top: 30px;
	width: 200px;
	height: 40px;
	background-color: black;
	border-radius: 5px;
	border: none;
	color: white;
	cursor: pointer;
}

footer {
	margin-top: 1400px;
	/* background-color: #21243d; */
	color: white;
}

footer .container {
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

.content-col ul li {
	
}

.title-col {
	font-size: 30px;
}

.content-col ul li a {
	color: white;
	text-decoration: none;
}

.view-more {
	opacity: 200%;
	cursor: pointer;
	background-color: black;
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