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
           
           <!--  <div style="margin-right: 30px ;"><a href=""><i class="fa-solid fa-bell"></i>    Notification</a> </div> -->
            <div class="login" style="margin-right: 70px ;"><a href="${base }/login">Login</a> </div>
            
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
                            <li> <a href="${base }/contact">Contact</a></li>
                           
               </ul>
            </div>
            <div class="finding">
                <!-- <button type="button" class="btn-search"><img src="../images/search.png" alt=""></button> -->
                <i class="fa-solid fa-cart-shopping" style="color: white; font-size: 25px; cursor: pointer;"></i>
            </div>
        </div>
    </div>
    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <div class="login100-pic js-tilt" data-tilt  >
                    <img src="${base }/user/images/login.jpg" width="100%" alt="IMG">
                </div>
                <!--=====TIÊU ĐỀ======-->
                <form class="login100-form validate-form" method="POST" action="${base }/login_processing_url">
                    <span class="login100-form-title">
                        <b>ĐĂNG NHẬP </b>
                    </span>
                    <c:if test="${not empty param.login_error }">
                    	<div class="alert alert-danger" role="alert">
                    		Login attempt was not successful, try again
                    	</div>
                    </c:if>
                    <!--=====FORM INPUT TÀI KHOẢN VÀ PASSWORD======-->
              
                        <div class="wrap-input100 validate-input">
                            <input class="input100" type="text" placeholder=" Tài khoản" name="username"
                                id="username">
                            <span class="focus-input100"></span>
                          
                        </div>
                       
                        <div class="wrap-input100 validate-input">
                            <input autocomplete="off" class="input100" type="password" placeholder="Mật khẩu"
                                name="password" id="password-field">
                            <span toggle="#password-field" class="bx fa-fw bx-hide field-icon click-eye"></span>
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class='bx bx-key'></i>
                            </span>
                        </div>
 						<div>
                        	<input type="checkbox" name="remember-me" /> Remember me
                        </div>
                        <!--=====ĐĂNG NHẬP======-->
                        <div class="container-login100-form-btn">
                        	<button class="btn_login" id="submit" type="submit">Đăng nhập</button>
                           <!--  <input type="button" value="Đăng nhập" id="submit" onclick="validate()" /> -->
                        </div>
                        <!--=====LINK TÌM MẬT KHẨU======-->
                        <div class="text-right p-t-12">
                            <a href="${base }/register">Bạn chưa có tài khoản</a>
                            <a class="txt2" href="/forgot.html">
                                Bạn quên mật khẩu?
                            </a>
                            
                        </div>
                       
                  
                    <!--=====FOOTER======-->
                   
                </form>
            </div>
        </div>
    </div>
    <footer>
        <div class="container">
            <div class="footer">
                <div class="col1">
                    <div class="title-col">Title Here</div>
         <br>           <div class="content-col1">Nullam sit amet turpis ornare, pulvinar lectus in, cursus mi. Duis et nunc eu ligula
                        imperdiet vulputate in mattis elit. Duis sodales tempor pulvinar. Quisque quis mi egestas
                        turpis dignissim tincidunt sed vel neque. Quisque nec facilisis sem. In at commodo velit.
                        Aliquam tempor volutpat laoreet.</div>
                </div>
                <div class="col2">
                    <div class="title-col">About</div>
                    <div class="content-col">
                        <ul>
                            <li> <a href="">        History         </a> </li>
                            <li> <a href="">        Our Team         </a> </li>
                            <li> <a href="">        Brand Guidelines         </a> </li>
                            <li> <a href="">        Term & Condition         </a> </li>
                            <li> <a href="">        Privacy& Condition         </a> </li>
                           
                        </ul>
                    </div>
                </div>
                <div class="col3">
                    <div class="title-col">Services</div>
                    <div class="content-col">
                        <ul>
                            <li> <a href="">        How to Order         </a> </li>
                            <li> <a href="">        Our Product         </a> </li>
                            <li> <a href="">        Order Status          </a> </li>
                            <li> <a href="">        Promo         </a> </li>
                            <li> <a href="">        Payment Method         </a> </li>
                        </ul>
                    </div>
                </div>
                <div class="col4">
                    <div class="title-col">Other</div>
                    <div class="content-col">
                        <ul>
                            <li> <a href="">        Contact Us         </a> </li>
                            <li> <a href="">        Help         </a> </li>
                            <li> <a href="">        Privacy         </a> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>

<style>
    .limiter {
    width: 100%;
    margin: auto;
    margin-top: 50px;
    /* border: 1px solid black; */
    height: 100%;
}

.login{
	border:3px solid white;
	padding: 0px 10px;
	border-radius: 7px;
}
    .wrap-login100 {
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
    line-height: 30px;
}
.btn_login {
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
    align-items: center;
    font-size: 22px;
    color: black;
    line-height: 1.9;
    text-align: center;
    font-weight: 900;
    width: 100%;
    display: block;
    padding-bottom: 10px;
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

footer{
    margin-top: 200px;
    /* background-color: #21243d; */
    color: white;
}
footer .container{
    background-color: #21243d;
}
.footer{
    padding-top: 100px;
    padding-bottom: 100px;
    display: flex;
    justify-content: space-around;
}

.footer .col1 .content-col1{
    width: 300px;
}
.content-col ul{
    list-style-type: none;
    line-height: 40px;
}

.title-col{
font-size: 30px;
}
.content-col ul li a{
    color: white;
    text-decoration: none;
} 

.view-more{
    opacity: 200%;
    cursor: pointer;
    background-color: black;
}
</style>

</html>