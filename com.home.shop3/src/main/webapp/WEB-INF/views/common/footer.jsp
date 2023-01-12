<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

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
	
	<style>
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
</style>
</body>
</html>