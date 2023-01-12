<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>San pham</title>
    <link rel="stylesheet" href="${base}/user/product/css/main.css">
     <link rel="stylesheet" href="${base}/user/product/css/base.css" />
     <link rel="stylesheet" href="${base}/user/product/css/main.css" />
     <link rel="stylesheet" href="${base}/user/product/css/grid.css" />
    <link rel="stylesheet" href="./assets/css/responsive.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Roboto&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link type="text/css" rel="stylesheet"
	href="${base }/manager/css/simplePagination.css" />
	<script src="${base }/manager/js/jquery.simplePagination.js"></script>
  </head>
  <body>
    <div class="app">
      
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
            
            
          
        
        <ul class="header__sort-bar">
          <li class="header__sort-item">
            <a href="" class="header__sort-link">Liên Quan</a>
          </li>
          <li class="header__sort-item header__sort-item--active">
            <a href="" class="header__sort-link">Mới Nhất</a>
          </li>
          <li class="header__sort-item">
            <a href="" class="header__sort-link">Bán chạy</a>
          </li>
          <li class="header__sort-item">
            <a href="" class="header__sort-link">Giá</a>
          </li>
        </ul>
     
      <div class="app__container">
        <div class="grid wide">
          <div class="row sm-gutter app__content">
            <!-- Category -->
            <div class="col l-2 m-0 c-0">
              <nav class="category">
                <h3 class="category__heading">
                  Danh mục
                </h3>
                <ul class="category-list">
                	<c:forEach items="${categories }" var="category">
                	<%--  <li class="category-item category-item--active">
                  		  <a href="#" class="category-item__link">${category.name }</a>
               		   </li>  --%>
               		   <form action="" method="get">
						<input hidden="true" id="banhkem" value="${category.id }" name="banhkem">
						<%-- <button class="category-item category-item--active" id="btnsearchbanh"
						 style="background: none; border: none; font-size: 17px; cursor: pointer" type="submit">${category.name }</button> --%>
						 <li class="category-item category-item--active">
                  		  <button style="background: none; border: none; cursor: pointer;" href="#" type="submit" class="category-item__link">${category.name }</a>
               		   </li>
					</form> 
                	</c:forEach>
                  
                </ul>
               
                <script >
                
                $(document).ready(function(){
             	  
                	$(function() {
             		   $('#banhkem').val();
                  	   $('#banhkemsearch').trigger('click'); 
             		
             });
                </script>
              </nav>
            </div>
            <div class="col l-10 m-12 c-12">
              <!-- Filter -->
              <div class="home-filter hide-on-mobile-tablet">
                <span class="home-filter__label">Sắp xếp theo</span>
                <button class="home-filter__btn btn">Phổ biến</button>
                <button class="home-filter__btn btn btn--primary">
                  Mới nhất
                </button>
                <button class="home-filter__btn btn">Bán chạy</button>
                <div class="select-input">
                  <span class="select-input__label">Giá</span>
                  <i class="select-input__icon fas fa-angle-down"></i>
                  <!-- List option -->
                  <ul class="select-input__list">
                    <li class="select-input__item">
                      <a href="#" class="select-input__link"
                        >Giá: Thấp đến Cao</a
                      >
                    </li>
                    <li class="select-input__item">
                      <a href="#" class="select-input__link"
                        >Giá: Cao đến Thấp</a
                      >
                    </li>
                  </ul>
                </div>
                <div class="home-filter__page">
                  <span class="home-filter__page-num">
                    <span class="home-filter__page-current">1</span>/14
                  </span>

                  <div class="home-filter__page-control">
                    <a
                      href=""
                      class="home-filter__page-btn home-filter__page-btn--disabled"
                    >
                      <i class="home-filter__page-icon fas fa-angle-left"></i>
                    </a>
                    <a href="" class="home-filter__page-btn">
                      <i class="home-filter__page-icon fas fa-angle-right"></i>
                    </a>
                  </div>
                </div>
              </div>

              <!-- Mobile Category -->
              <nav class="mobile-category">
                <ul class="mobile-category__list">
                  <li class="mobile-category__item">
                    <a href="#" class="mobile-category__link">Dụng cụ & Thiết bị tiện ích Dụng cụ & Thiết bị tiện ích</a>
                  </li>
                  <li class="mobile-category__item">
                    <a href="#" class="mobile-category__link">Dụng cụ & Thiết bị tiện ích</a>
                  </li>
                  <li class="mobile-category__item">
                    <a href="#" class="mobile-category__link">Dụng cụ & Thiết bị tiện ích</a>
                  </li>
                  <li class="mobile-category__item">
                    <a href="#" class="mobile-category__link">Dụng cụ & Thiết bị tiện ích</a>
                  </li>
                  <li class="mobile-category__item">
                    <a href="#" class="mobile-category__link">Dụng cụ & Thiết bị tiện ích</a>
                  </li>
                  <li class="mobile-category__item">
                    <a href="#" class="mobile-category__link">Dụng cụ & Thiết bị tiện ích</a>
                  </li>
                  <li class="mobile-category__item">
                    <a href="#" class="mobile-category__link">Dụng cụ & Thiết bị tiện ích</a>
                  </li>
                  <li class="mobile-category__item">
                    <a href="#" class="mobile-category__link">Dụng cụ & Thiết bị tiện ích</a>
                  </li>
                  <li class="mobile-category__item">
                    <a href="#" class="mobile-category__link">Dụng cụ & Thiết bị tiện ích</a>
                  </li>
                  <li class="mobile-category__item">
                    <a href="#" class="mobile-category__link">Dụng cụ & Thiết bị tiện ích</a>
                  </li>
                  <li class="mobile-category__item">
                    <a href="#" class="mobile-category__link">Dụng cụ & Thiết bị tiện ích</a>
                  </li>
                  <li class="mobile-category__item">
                    <a href="#" class="mobile-category__link">Dụng cụ & Thiết bị tiện ích</a>
                  </li>
                </ul>
              </nav>
              <!-- Product -->
            
              <div class="home-product">
                <div class="row sm-gutter">
                  <!-- Product item -->
                   <c:forEach var="product" items="${ products.data}">
             <div class="col l-2-4 m-4 c-6">
                    <a href="${base }product/${product.id}" class="home-product-item">
                      <div
                        class="home-product-item__img"
                        style="background-image: url('${base }/upload/${product.avatar}');"
                      ></div>
                      <h4 class="home-product-item__name">
                       ${product.name }
                      </h4>
                      <div class="home-product-item__price">
                        <span class="home-product-item__price-old"
                          >2.300.000đ</span
                        >
                        <span class="home-product-item__price-current"
                          >${product.price }đ</span
                        >
                      </div>
                      <div class="home-product-item__action">
                        <span
                          class="home-product-item__like home-product-item__like--liked"
                        >
                          <i
                            class="home-product-item__like-icon-empty far fa-heart"
                          ></i>
                          <i
                            class="home-product-item__like-icon-fill fas fa-heart"
                          ></i>
                        </span>
                        <div class="home-product-item__rating">
                          <i
                            class="home-product-item__star--gold fas fa-star"
                          ></i>
                          <i
                            class="home-product-item__star--gold fas fa-star"
                          ></i>
                          <i
                            class="home-product-item__star--gold fas fa-star"
                          ></i>
                          <i
                            class="home-product-item__star--gold fas fa-star"
                          ></i>
                          <i class="fas fa-star"></i>
                        </div>
                        <div class="home-product-item__sold">88 Đã bán</div>
                      </div>
                      <div class="home-product-item__origin">
                        <span class="home-product-item__brand">Whoo</span>
                        <span class="home-product-item__origin-name"
                          >Hàn Quắc</span
                        >
                      </div>
                      <div class="home-product-item__favourite">
                        <i class="fas fa-check "></i>
                        <span>Yêu thích</span>
                      </div>
                      <div class="home-product-item__sale-off">
                        <span class="home-product-item__sale-off-percent"
                          >43%</span
                        >
                        <span class="home-product-item__sale-off-label"
                          >GIẢM</span
                        >
                      </div>
                    </a>
                  </div>
            	   </c:forEach>
                </div>
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
              
              <ul class="pagination home-product__pagination">
                <li class="pagination-item">
                  <a href="" class="pagination-item__link">
                    <i class="pagination-item__icon fas fa-angle-left"></i>
                  </a>
                </li>
                <li class="pagination-item pagination-item--active">
                  <a href="" class="pagination-item__link">1</a>
                </li>
                <li class="pagination-item">
                  <a href="" class="pagination-item__link">2</a>
                </li>
                <li class="pagination-item">
                  <a href="" class="pagination-item__link">3</a>
                </li>
                <li class="pagination-item">
                  <a href="" class="pagination-item__link">4</a>
                </li>
                <li class="pagination-item">
                  <a href="" class="pagination-item__link">5</a>
                </li>
                <li class="pagination-item">
                  <a href="" class="pagination-item__link">...</a>
                </li>
                <li class="pagination-item">
                  <a href="" class="pagination-item__link">14</a>
                </li>
                <li class="pagination-item">
                  <a href="" class="pagination-item__link">
                    <i class="pagination-item__icon fas fa-angle-right"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
 
  <script type="text/javascript">
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
  </script>
  <style>
.paging {
	padding-left: 20px;
	padding-top: 40px;
}
#page {
	display: none;
}
</style>
</html>
