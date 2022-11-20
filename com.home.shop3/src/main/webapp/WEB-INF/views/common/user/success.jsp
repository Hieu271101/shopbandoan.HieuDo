<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div class="box-wrapping">
	<div class="img">
		<img width="100%" alt="" src="/user/images/Avatar-Gau.jpg" >
	</div>
	
	<a class="link" href="/home">ok, đơn của bạn được chuẩn bị rồi đấy, về trang chủ thôi </a>
</div>
<style>
	.img{
	width: 500px;
	height: 500px;
}
.box-wrapping{
	margin-top:10px;
	display: grid;
	justify-content: center;
}
.link{
	margin-top:10px;
	font-size:22px;
	text-decoration: none;
	
}
</style>
</body>
</html>