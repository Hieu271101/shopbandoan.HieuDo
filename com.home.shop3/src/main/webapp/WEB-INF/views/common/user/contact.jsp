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
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<main>
		<div class="content">
			<div class="left">
				<sf:form modelAttribute="newContact" action="" class="form">
					<div class="title">
						<h1>Contact Form</h1>
					</div>

					<div class="row">
						<label for="">Enter Name: </label>
						<sf:input path="name" class="name" type="text" />
						<div class="err-name"></div>
					</div>
					<div class="row">
						<label for="">Enter Email: </label>
						<sf:input path="email" type="email" />
						<div class="err"></div>
					</div>
					<div class="row">
						<label for="">Enter Phone Number: </label>
						<sf:input path="phone" type="text" />
						<div class="err"></div>
					</div>
					<div class="row1">
						<label for="">Note: </label> <br>
						<sf:textarea path="note" name="" id="textarea" cols="30" rows="10" />
						<div class="err"></div>
					</div>
					<div class="row2">
						<button class="send" type="submit">Send</button>

					</div>
				</sf:form>



			</div>
			<div class="right">
				<!-- <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.091160955085!2d105.79248951475442!3d20.988982594511402!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135adb29ed54487%3A0xbe22035eae87b5d7!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBIw6AgTuG7mWk!5e0!3m2!1svi!2s!4v1650885714163!5m2!1svi!2s"
                    width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"></iframe> -->
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d251690.17375265883!2d105.5205607234707!3d9.710119732699376!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1662528609966!5m2!1svi!2s"
					width="400" height="300" style="border: 0;" allowfullscreen=""
					loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
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
	<!-- <script src="../js/jquery.min.js"></script> -->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
	<style>
* {
	margin: 0;
	padding: 0;
}

nav {
	background-color: #ffd17e;
}

main {
	background-color: #ffd17e;
}

.content {
	display: flex;
	justify-content: center;
	width: 100%;
	padding-top: 100px;
	align-items: center;
	background-color: #ffd17e;
	padding-bottom: 100px;
}

.content form {
	padding: 15px;
}

.row {
	width: 300px;
	height: 50px;
	/* border: 1px solid black; */
	display: flex;
	flex-wrap: wrap;
	/* justify-content: space-between; */
}

.row input {
	width: 100%;
	border-radius: 5px;
}

.left {
	border: 1px solid black;
	width: 400px;
	height: 450px;
	margin-right: 30px;
	border-radius: 3px;
	box-shadow: 0 0 2px 2px black;
}

.right {
	border: 1px solid black;
	box-shadow: 0 0 2px 2px black;
	border-radius: 3px;
}

.input {
	display: block;
	justify-content: space-between;
}

footer {
	background-color: #21243d;
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
	background-color: #21243d;
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

.row input {
	transition: 0;
	background-color: antiquewhite;
}

.row textarea {
	background-color: antiquewhite;
}

.row :hover {
	background-color: white;
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
	/* overflow-x: scroll; */
	/* min-width: 100px; */
}

.header-top .menu-bar ul {
	list-style-type: none;
	display: flex;
}

.header-top .menu-bar ul li {
	font-size: 25px;
	margin-right: 70px;
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

input {
	padding-left: 10px;
}

textarea {
	padding-top: 10px;
	padding-left: 10px;
}

.row1 {
	width: 300px;
	height: 160px;
	/* border: 1px solid black; */
	display: flex;
	flex-wrap: wrap;
}

.row2 {
	margin-top: 10px;
	width: 100%;
	/* border: 1px solid black; */
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.row2 button {
	padding: 10px 50px 10px 50px;
	font-size: 15px;
	box-shadow: 0 0 2px 2px rgb(114, 61, 61);
	background-color: rgb(213, 213, 91);
	border: none;
	border-radius: 5px;
	cursor: pointer;
	color: white;
}

textarea {
	width: 100%;
	height: 50%;
	border-radius: 7px;
}

@media ( min-width :100px) and (max-width: 979px) {
	.right {
		display: none;
	}
	.logo {
		display: none;
	}
	.col1 {
		display: none;
	}
	.header-top .menu-bar ul li {
		font-size: 25px;
		margin-right: 25px;
	}
	.promo {
		display: none;
	}
}
</style>
</body>
</html>