<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <div class="header">
        <div class="function-bar">
           
            <div style="margin-right: 30px ;"><a href=""><i class="fa-solid fa-bell"></i>    Notification</a> </div>
            <div style="margin-right: 70px ;"><a href="login.html"><i class="fa-solid fa-arrow-right-to-bracket"></i>    Login</a> </div>
            
        </div>
        <div class="header-top">
            <div class="logo">
                <img src="../images/logo.png" alt="">
            </div>
            <div class="menu-bar">
                <ul>
                    <li><a href="home.html">Home</a></li>
                    <li><a href="../layout/menu.html">Product</a></li>
                    <li><a href="../layout/statistic.html">Promo</a></li>
                    <li><a href="../layout/about.html">About</a></li>
                    <li> <a href="../layout/contact.html">Contact</a></li>
                   
                </ul>
            </div>
            <div class="finding">
                <!-- <button type="submit" class="btn-search"><img src="../images/search.png" alt=""></button> -->
                <i class="fa-solid fa-cart-shopping" style="color: white; font-size: 25px; cursor: pointer;"></i>
            </div>
        </div>
    </div>
    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <div class="login100-pic js-tilt" data-tilt>
                    <img src="${base }/user/images/login.jpg" alt="IMG">
                </div>
                <!--=====TIÊU ĐỀ======-->
                <div class="login100-form validate-form">
                    <span class="login100-form-title">
                        <b>ĐĂNG KÝ </b>
                    </span>
                    <!--=====FORM INPUT TÀI KHOẢN VÀ PASSWORD======-->
                    <sf:form action="" modelAttribute="newAccount">
                        <div class="wrap-input100 validate-input">
                            <sf:input path="userName" class="input100" type="text" placeholder="Nhập Email Tài khoản" name="username"
                                id="username"/>
                            <span class="focus-input100"></span>
                          
                        </div>
                        <div class="wrap-input100 validate-input">
                            <sf:input path="password" autocomplete="off" class="input100" type="password" placeholder="Nhập Mật khẩu"
                                name="current-password" id="password-field"/>
                            <!-- <span toggle="#password-field" class="bx fa-fw bx-hide field-icon click-eye"></span>
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class='bx bx-key'></i>
                            </span> -->
                        </div>
                       <!--  <div class="wrap-input100 validate-input">
                            <input autocomplete="off" class="input100" type="password" placeholder="Nhập Lại Mật khẩu"
                                name="current-password" id="password-field">
                            
                        </div> -->
                         <div class="wrap-input100 validate-input">
                            <sf:input path="name" class="input100" type="text" placeholder="Nhập Họ Tên" name="username"
                                id="username"/>
                            <span class="focus-input100"></span>
                          
                        </div>
                        <div class="wrap-input100 validate-input">
                            <sf:input path="phone" class="input100" type="text" placeholder="Nhập số điện thoại" name="username"
                                id="username"/>
                            <span class="focus-input100"></span>
                          
                        </div>

                       

                        <div class="wrap-input100 validate-input">
                            <sf:input path="address" class="input100" type="text" placeholder="Nhập địa chỉ" name="username"
                                id="username"/>
                            <span class="focus-input100"></span>
                          
                        </div>
			
					
                        <!--=====ĐĂNG Ký======-->
                        <div class="container-login100-form-btn">
                          <!--   <input type="submit" value="Đăng ký" id="submit" onclick="validate()" /> -->
                          <button type="submit"> Đăng Kí</button>
                        </div>
                        <!--=====LINK TÌM MẬT KHẨU======-->
                        <!-- <div class="text-right p-t-12">
                            <a href="register.html">Bạn chưa có tài khoản</a>
                            <a class="txt2" href="/forgot.html">
                                Bạn quên mật khẩu?
                            </a>
                        </div> -->
                    </sf:form>
                    <!--=====FOOTER======-->
                   
                </div>
            </div>
        </div>
    </div>
</body>

<style>
    .limiter {
    width: 100%;
    margin: auto;
    margin-top: 50px;
    /* border: 1px solid black; */
    height: 100%;
}
    .wrap-login100 {
        align-items: center;
    width: 960px;
    background: rgb(255, 255, 255);
    border-radius: 10px;
    overflow: hidden;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    /* border: 1px solid black; */
    /* padding: var(--p_wrap_login); */
    /* box-shadow: var(--shadow-form); */
    padding: 50px;
    padding-top: 120px;
     box-shadow: 0px 5px 5px 5px #888888;
}
.login100-pic {
    width: 500px;
}
.container-login100 {
    height: 100%;
    width: 100%;
    min-height: 100px;
    display: flex;
    justify-content: center;
    align-items:center;
    padding: 15px;
    /* border: 1px solid black; */
    /* background: var(--login_bg); */
    /* border-bottom-left-radius: var(--onehundred_percent); */
    /* background-size: var(--bg-cover); */
}
.login100-form {
    width: 300px;
    /* border: 1px solid black; */
    padding: 0px 30px 0px 30px;
    line-height: 50px;
}
button[type=submit] {
    font-size: 17px;
    background: yellow;
    border: 1px solid black;
    color: black;
    font-weight: 500px;
    cursor: pointer;
    width: 100%;
    border-radius: 5px;
    padding: 10px 0;
    /* outline: var(--none); */
    /* font-family: var(--font_family); */
}
.input100 {
    /* font-family: var(--font_family); */
    font-size: 15px;
    line-height: 1.5;
    color: black;
    display: block;
    /* width: 100%; */
    background: #f5f5f5;
    height: 45px;
    border-radius: .375rem;
    padding: 0 30px 0 85px;
    border: 1px solid #d4d4d4;
    margin-bottom: 10px;
}


.login100-form-title {
    /* font-family: var(--font_family); */
    font-size: 22px;
    color: black;
    line-height: 1.9;
    text-align: center;
    font-weight: 900;
    width: 100%;
    display: block;
    padding-bottom: 30px;
    font-weight: bold;
}
.symbol-input100 {
    font-size: 15px;
    display: flex;
    align-items: center;
    position: absolute;
    border-radius: 25px;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 100%;
    padding-left: 25px;
    pointer-events: none;
    color: black;
    -webkit-transition: all 0.4s;
    -o-transition: all 0.4s;
    -moz-transition: all 0.4s;
    transition: all 0.4s;
}

*{
    margin: 0;
    padding: 0;
    /* background-color: #21243d; */
}
.function-bar{
    
    display: flex;
    /* float: right; */
    justify-content: right;
    padding: 20px 0px 20px 0px;
    
   /* align-items: center; */
    color: white;
    background-color: black;
    
    width: 100%;
}

.function-bar a{
    text-decoration: none;
    color: white;
    font-size: 20px;
}

.container{
    width: 100%;
    
}
.header{
    position: relative;
}
.header-top{
    position: relative;
    display: flex;
    justify-content: space-around;
    background-color: #21243d;
    width: 100%;
    height: 80px;
    align-items: center;
}
.header-top .menu-bar ul{
    list-style-type: none;
    display: flex;
}
.header-top .menu-bar ul li{
    font-size: 25px;
    margin-right: 70px;
}
.header-top .menu-bar ul li a{
    text-decoration: none;
    color: white;
}

.main-header{
    position: relative;
}
</style>
</html>