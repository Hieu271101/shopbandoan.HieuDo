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
<link href="manager/css/font-awesome/css/font-awesome.css">
<link href="manager/css/font-awesome.min.css">
<script src="/manager/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
                    <li><a href="../layout/product.html">Product</a></li>
                    <li><a href="../layout/statistic.html">Promo</a></li>
                    <li><a href="../layout/about.html">About</a></li>
                    <li> <a href="../layout/contact.html">Contact</a></li>
                   
                </ul>
            </div>
            <div class="finding">
                        <!-- <button type="button" class="btn-search"><img src="../images/search.png" alt=""></button> -->
                       <span class="count" id="totalCartItemId">0 </span>
                        <i class="fa-solid fa-cart-shopping" style="color: white; font-size: 25px; cursor: pointer;"></i>
            </div>
        </div>
    </div>

    <div>
        <div class="wrap-product">
           	<c:forEach var="product" items="${ products}" >
           		
           		  <div class="card" style="width: 18rem;">
                    <img class="card-img-top" width="100%" src="../images/item1.png" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title" id="card-title">${product.name }</h5>
                      <p class="card-text" id="card-text">${product.description}</p>
                     <%--  <p class="card-price" id="card-price" value="${product.price }" >${product.price}</p>  --%>
                      
                      <fmt:setLocale value="vi_VN"/>
							<span class="text-muted text-decoration-line-through">
	                        	<fmt:formatNumber value="${product.price}" type="currency"/>
                            </span>
	                  
                      
                 <%--   	${product } --%>
                    </div>
                   
                    <div class="bar">
                        <input class="count-product" id="count-product" type="number" value="0">
                        <button class="plus" onclick="cong()">+</button>
                        <button class="minor" onclick="tru()">-</button>
                    </div>
                    <div class="addcart">
                        <button>See more</button>
                        <button type="button"  onclick="save(${product.id},1)">Add Cart</button>
                    </div>
                  </div> 
           	</c:forEach>
               
                  
                  
                <!--   <div class="card" style="width: 18rem;">
                    <img class="card-img-top" width="100%" src="../images/item1.png" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                   
                    <div class="bar">
                        <input type="number" value="0">
                        <button class="plus">+</button>
                        <button class="minor">-</button>
                    </div>
                    <div class="addcart">
                        <button>Buy Now</button>
                        <button>Add</button>
                    </div>
                  </div>
                  <div class="card" style="width: 18rem;">
                    <img class="card-img-top" width="100%" src="../images/item1.png" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                   
                    <div class="bar">
                        <input type="number" value="0">
                        <button class="plus">+</button>
                        <button class="minor">-</button>
                    </div>
                    <div class="addcart">
                        <button>Buy Now</button>
                        <button>Add</button>
                    </div>
                  </div>
                  <div class="card" style="width: 18rem;">
                    <img class="card-img-top" width="100%" src="../images/item1.png" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                   
                    <div class="bar">
                        <input type="number" value="0">
                        <button class="plus">+</button>
                        <button class="minor">-</button>
                    </div>
                    <div class="addcart">
                        <button>Buy Now</button>
                        <button>Add</button>
                    </div>
                  </div>
                  <div class="card" style="width: 18rem;">
                    <img class="card-img-top" width="100%" src="../images/item1.png" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                   
                    <div class="bar">
                        <input type="number" value="0">
                        <button class="plus">+</button>
                        <button class="minor">-</button>
                    </div>
                    <div class="addcart">
                        <button>Buy Now</button>
                        <button>Add</button>
                    </div>
                  </div> -->
            

        </div>
    </div>
    <footer>
        <div class="containerr">
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
<script type="text/javascript">
		var count=0;
		function cong(){
			count++;
			document.getElementById("count-product").value=count;
		}
		function tru(){
			if(count>0){
				count--;
			}
			
			document.getElementById("count-product").value=count;
		}

 		save=	function(productId, quanlity) {
	
			let data = {
					productId:productId,
					quanlity:quanlity,
					
					
				};
				
				// $ === jQuery
				// json == javascript object
				jQuery.ajax({
					url : "/product",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify(data),
					
					
					dataType : "json", // kieu du lieu tra ve tu controller la json
					success : function(jsonResult) {
						let totalItems=jsonResult.totalItems;
					
						$("#totalCartItemId").html(totalItems);
						alert("Chuc mung! da luu thanh cong dang ki "+jsonResult.code + jsonResult.status + jsonResult.totalItems);
					},
					error : function(jqXhr, textStatus, errorMessage) { // error callback 
						alert("error");
					}
				});
			}
	</script>
	
<style  scoped>

*{
	margin: 0;
	padding: 0;
}

.finding{
    position: relative;
}
.count{
    position: absolute;
    right: -30%;
    top: -60%;
    color: white;
    font-size: 15px;
    background: red;
    padding: 5px;
    border-radius: 45px;
}
    .wrap-product{
        max-width: 1280px;
        height: 100%;
        /* border: 1px solid black; */
        margin: auto;
        margin-top: 100px;
        display: flex;
        flex-wrap: wrap;
        padding: 30px;
        display: flex;
        
    }
    .card{
        padding: 20px;
        margin-right: 10px;
        margin-bottom: 40px;
    }

    .bar{
    display: flex;
    width: 250px;
    height: 30px;
    justify-content: space-between;
    
}
input{
    color: black;
    /* padding-left: 10px; */
}
.card{
    border: 1px solid black;
}
.bar input{
    width: 150px;
    background-color: white;
    padding-left: 13px ;
    border-radius: 5px;
    margin-left: 20px;
}
.bar button {
    background-color: white;
    width: 30px;
    
    font-size: 16px;
    background-color: chartreuse;
    border-radius: 5px;
}

.addcart{
    display: flex;
    justify-content: space-around;
    width: 200px;
    margin-top: 30px;
    margin-left: 15px;
}
.addcart button{
    height: 40px;
    width: 90px;
    border-radius: 5px;
    background-color: chartreuse;
    color: #21243d;
    font-size: 13px;
    font-weight: bold;
}

.addcart  :hover{
    background-color: black;
    color: white;
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
footer .containerr{
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