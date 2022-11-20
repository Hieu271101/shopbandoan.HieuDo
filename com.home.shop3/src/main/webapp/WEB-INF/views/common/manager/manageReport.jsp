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
<link rel="stylesheet" href="${base}/manager/css/main.css">

</head>
<body onload="time()" class="app sidebar-mini rtl">
    <!-- Navbar-->
    <header class="app-header">
      <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
        aria-label="Hide Sidebar"></a>
      <!-- Navbar Right Menu-->
      <ul class="app-nav">
  
  
        <!-- User Menu-->
        <li><a class="app-nav__item" href="/index.html"><i class='bx bx-log-out bx-rotate-180'></i> </a>
  
        </li>
      </ul>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><!-- <img class="app-sidebar__user-avatar" src="/images/hay.jpg" width="50px"
          alt="User Image"> -->
        <div>
          <p class="app-sidebar__user-name"><b>${userLogined.name }</b></p>
          <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
        </div>
      </div>
      <hr>
      <ul class="app-menu">
        <li><a class="app-menu__item haha" href="phan-mem-ban-hang.html"><i class='app-menu__icon bx bx-cart-alt'></i>
            <span class="app-menu__label">POS Bán Hàng</span></a></li>
        <li><a class="app-menu__item " href="${base }/admin"><i class='app-menu__icon bx bx-tachometer'></i><span
              class="app-menu__label">Bảng điều khiển</span></a></li>
        <li><a class="app-menu__item " href="${base }/admin/employee"><i class='app-menu__icon bx bx-id-card'></i> <span
              class="app-menu__label">Quản lý nhân viên</span></a></li>
        <li><a class="app-menu__item" href="${base }/admin/user"><i class='app-menu__icon bx bx-user-voice'></i><span
              class="app-menu__label">Quản lý khách hàng</span></a></li>
        <li><a class="app-menu__item" href="${base }/admin/product"><i
              class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
        </li>
        <li><a class="app-menu__item" href="${base }/admin/order"><i class='app-menu__icon bx bx-task'></i><span
              class="app-menu__label">Quản lý đơn hàng</span></a></li>
        <li><a class="app-menu__item" href="table-data-banned.html"><i class='app-menu__icon bx bx-run'></i><span
              class="app-menu__label">Quản lý nội bộ
            </span></a></li>
        <li><a class="app-menu__item" href="${base }/admin/salary"><i class='app-menu__icon bx bx-dollar'></i><span
              class="app-menu__label">Bảng kê lương</span></a></li>
        <li><a class="app-menu__item active" href="quan-ly-bao-cao.html"><i
              class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label">Báo cáo doanh thu</span></a>
        </li>
        <li><a class="app-menu__item" href="/admin/contact"><i class='app-menu__icon bx bx-calendar-check'></i><span
              class="app-menu__label">Liên hệ Khách hàng </span></a></li>
        <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-cog'></i><span class="app-menu__label">Cài
              đặt hệ thống</span></a></li>
      </ul>
    </aside>
    <main class="app-content">
      <div class="row">
        <div class="col-md-12">
          <div class="app-title">
            <ul class="app-breadcrumb breadcrumb">
              <li class="breadcrumb-item"><a href="#"><b>Báo cáo doanh thu    </b></a></li>
            </ul>
            <div id="clock"></div>
          </div>
        </div>
      </div>
          <div class="row">
              <div class="col-md-6 col-lg-3">
                  <div class="widget-small primary coloured-icon"><i class='icon  bx bxs-user fa-3x'></i>
                      <div class="info">
                          <h4>Tổng Nhân viên</h4>
                          <p><b>${activeEmployees.size() } nhân viên</b></p>
                      </div>
                  </div>
              </div>
              <div class="col-md-6 col-lg-3">
                  <div class="widget-small info coloured-icon"><i class='icon bx bxs-purchase-tag-alt fa-3x' ></i>
                      <div class="info">
                          <h4>Tổng sản phẩm</h4>
                          <p><b>${allActiveProduct.size() } sản phẩm</b></p>
                      </div>
                  </div>
              </div>
              <div class="col-md-6 col-lg-3">
                  <div class="widget-small warning coloured-icon"><i class='icon fa-3x bx bxs-shopping-bag-alt'></i>
                      <div class="info">
                          <h4>Tổng đơn hàng</h4>
                          <p><b>${listOrders.size() } đơn hàng</b></p>
                      </div>
                  </div>
              </div>
              <div class="col-md-6 col-lg-3">
                  <div class="widget-small danger coloured-icon"><i class='icon fa-3x bx bxs-info-circle' ></i>
                      <div class="info">
                          <h4>Bị cấm</h4>
                          <p><b>${noActiveEmployees.size() } nhân viên</b></p>
                      </div>
                  </div>
              </div>
          </div>
          <div class="row">
              <div class="col-md-6 col-lg-3">
                  <div class="widget-small primary coloured-icon"><i class='icon fa-3x bx bxs-chart' ></i>
                      <div class="info">
                          <h4>Tổng thu nhập</h4>
                          <p><b>104.890.000 đ</b></p>
                      </div>
                  </div>
              </div>
              <div class="col-md-6 col-lg-3">
                  <div class="widget-small info coloured-icon"><i class='icon fa-3x bx bxs-user-badge' ></i>
                      <div class="info">
                          <h4>Nhân viên mới</h4>
                          <p><b>${nearEmployees.size() } nhân viên</b></p>
                      </div>
                  </div>
              </div>
              <div class="col-md-6 col-lg-3">
                  <div class="widget-small warning coloured-icon"><i class='icon fa-3x bx bxs-tag-x' ></i>
                      <div class="info">
                          <h4>Hết hàng</h4>
                          <p><b>${overProducts.size() } sản phẩm</b></p>
                      </div>
                  </div>
              </div>
              <div class="col-md-6 col-lg-3">
                  <div class="widget-small danger coloured-icon"><i class='icon fa-3x bx bxs-receipt' ></i>
                      <div class="info">
                          <h4>Đơn hàng hủy</h4>
                          <p><b>${cancelOrders.size() } đơn hàng</b></p>
                      </div>
                  </div>
              </div>
          </div>
          <div class="row">
              <!-- <div class="col-md-12">
                  <div class="tile">
                      <div>
                          <h3 class="tile-title">SẢN PHẨM BÁN CHẠY</h3>
                      </div>
                      <div class="tile-body">
                          <table class="table table-hover table-bordered" id="sampleTable">
                              <thead>
                                  <tr>
                                      <th>Mã sản phẩm</th>
                                      <th>Tên sản phẩm</th>
                                      <th>Giá tiền</th>
                                      <th>Danh mục</th>
                                  </tr>
                              </thead>
                              <tbody>
                                  <tr>
                                      <td>71309005</td>
                                      <td>Bàn ăn gỗ Theresa</td>
                                      <td>5.600.000 đ</td>
                                      <td>Bàn ăn</td>
                                  </tr>
                                  <tr>
                                      <td>62304003</td>
                                      <td>Bàn ăn Vitali mặt đá</td>
                                      <td>33.235.000 đ</td>
                                      <td>Bàn ăn</td>
                                  </tr>
                                  <tr>
                                      <td>72109004</td>
                                      <td>Ghế làm việc Zuno</td>
                                      <td>3.800.000 đ</td>
                                      <td>Ghế gỗ</td>
                                  </tr>
                                  <tr>
                                      <td>83826226</td>
                                      <td>Tủ ly - tủ bát</td>
                                      <td>2.450.000 đ</td>
                                      <td>Tủ</td>
                                  </tr>
                                  <tr>
                                      <td>71304041</td>
                                      <td>Bàn ăn mở rộng Vegas</td>
                                      <td>21.550.000 đ</td>
                                      <td>Bàn thông minh</td>
                                  </tr>
                              </tbody>
                          </table>
                      </div>
                  </div>
              </div> -->
          </div>
         <!--  <div class="row">
                  <div class="col-md-12">
                      <div class="tile">
                          <div>
                              <h3 class="tile-title">TỔNG ĐƠN HÀNG</h3>
                          </div>
                          <div class="tile-body">
                              <table class="table table-hover table-bordered" id="sampleTable">
                                  <thead>
                                      <tr>
                                              <th>ID đơn hàng</th>
                                              <th>Khách hàng</th>
                                              <th>Đơn hàng</th>
                                              <th>Số lượng</th>
                                              <th>Tổng tiền</th>
                                      </tr>
                                  </thead>
                                  <tbody>
                                      <tr>
                                              <td>MD0837</td>
                                              <td>Triệu Thanh Phú</td>
                                              <td>Ghế làm việc Zuno, Bàn ăn gỗ Theresa</td>
                                              <td>2 sản phẩm</td>
                                              <td>9.400.000 đ</td>
                                      </tr>
                                      <tr>
                                              <td>MĐ8265</td>
                                              <td>Nguyễn Thị Ngọc Cẩm</td>
                                              <td>Ghế ăn gỗ Lucy màu trắng</td>
                                              <td>1 sản phẩm</td>
                                              <td>3.800.000 đ</td>   
                                      </tr>
                                      <tr>
                                              <td>MT9835</td>
                                              <td>Đặng Hoàng Phúc</td>
                                              <td>Giường ngủ Jimmy, Bàn ăn mở rộng cao cấp Dolas, Ghế làm việc Zuno</td>
                                              <td>3 sản phẩm</td>
                                              <td>40.650.000 đ</td>
                                      </tr>
                                      <tr>
                                              <td>ER3835</td>
                                              <td>Nguyễn Thị Mỹ Yến</td>
                                              <td>Bàn ăn mở rộng Gepa</td>
                                              <td>1 sản phẩm</td>
                                              <td>16.770.000 đ</td>
                                      </tr>
                                      <tr>
                                              <td>AL3947</td>
                                              <td>Phạm Thị Ngọc</td>
                                              <td>Bàn ăn Vitali mặt đá, Ghế ăn gỗ Lucy màu trắng</td>
                                              <td>2 sản phẩm</td>
                                              <td>19.770.000 đ</td>
                                      </tr>
                                      <tr>
                                              <td>QY8723</td>
                                              <td>Ngô Thái An</td>
                                              <td>Giường ngủ Kara 1.6x2m</td>
                                              <td>1 sản phẩm</td>
                                              <td>14.500.000 đ</td>
                                      </tr>
                                      <tr>
                                         <th colspan="4">Tổng cộng:</th>
                                          <td>104.890.000 đ</td>
                                      </tr>
                                  </tbody>
                              </table>
                          </div>
                      </div>
                  </div>
              </div> -->
          <div class="row">
                  <div class="col-md-12">
                      <div class="tile">
                          <div>
                              <h3 class="tile-title">SẢN PHẨM ĐÃ HẾT</h3>
                          </div>
                          <div class="tile-body">
                              <table class="table table-hover table-bordered" id="sampleTable">
                                  <thead>
                                      <tr>
                                              <th>Mã sản phẩm</th>
                                              <th>Tên sản phẩm</th>
                                              <th>Ảnh</th>
                                              <th>Số lượng</th>
                                              <th>Tình trạng</th>
                                              <th>Giá tiền</th>
                                              <th>Danh mục</th>
                                      </tr>
                                  </thead>
                                  <tbody>
                                  	<c:forEach var="over" items="${overProducts }">
                                  		 <tr>
                                              <td>${over.id }</td>
                                              <td>${over.name }</td>
                                              <td><img src="/img-sanpham/tu.jpg" alt="" width="100px;"></td>
                                              <td>${over.amount }</td>
                                              <td><span class="badge bg-danger">Hết hàng</span></td>
                                              <td>${over.price } đ</td>
                                              <td>${over.category.name }</td>
                                      	 </tr>
                                  	</c:forEach>
                                  </tbody>
                              </table>
                          </div>
                      </div>
                  </div>
              </div>
          <div class="row">
              <div class="col-md-12">
                  <div class="tile">
                      <div>
                          <h3 class="tile-title">NHÂN VIÊN MỚI</h3>
                      </div>
                      <div class="tile-body">
                          <table class="table table-hover table-bordered" id="sampleTable">
                              <thead>
                                  <tr>
                                      <th>Họ và tên</th>
                                      <th>Địa chỉ</th>
                                      <th>Ngày sinh</th>
                                      <th>Giới tính</th>
                                      <th>SĐT</th>
                                      <th>Chức vụ</th>
                                  </tr>
                              </thead>
                              <tbody>
                              	<c:forEach var="nearEmployee" items="${nearEmployees }">
                              		 <tr>
                                      <td>${nearEmployee.name }</td>
                                      <td>${nearEmployee.address }</td>
                                      <td>${nearEmployee.dob }</td>
                                      <td>${nearEmployee.gender }</td>
                                      <td>${nearEmployee.phone }</td>
                                      <td>${nearEmployee.position.name }</td>
                                 	 </tr>
                              	</c:forEach>
                                 <!--  <tr>
                                      <td>Hồ Thị Thanh Ngân</td>
                                      <td>155-157 Trần Quốc Thảo, Quận 3, Hồ Chí Minh </td>
                                      <td>12/02/1999</td>
                                      <td>Nữ</td>
                                      <td>0926737168</td>
                                      <td>Bán hàng</td>
                                  </tr>
                                  <tr>
                                      <td>Trần Khả Ái</td>
                                      <td>6 Nguyễn Lương Bằng, Tân Phú, Quận 7, Hồ Chí Minh</td>
                                      <td>22/12/1999</td>
                                      <td>Nữ</td>
                                      <td>0931342432</td>
                                      <td>Bán hàng</td>
                                  </tr>
                                  <tr>
                                      <td>Nguyễn Đặng Trọng Nhân</td>
                                      <td>59C Nguyễn Đình Chiểu, Quận 3, Hồ Chí Minh </td>
                                      <td>23/07/1996</td>
                                      <td>Nam</td>
                                      <td>0846881155</td>
                                      <td>Dịch vụ</td>
                                  </tr> -->
                              </tbody>
                          </table>
                      </div>
                  </div>
              </div>
          </div>
          <div class="row">
              <div class="col-md-6">
                  <div class="tile">
                      <h3 class="tile-title">DỮ LIỆU HÀNG THÁNG</h3>
                      <div class="embed-responsive embed-responsive-16by9">
                          <canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
                      </div>
                  </div>
              </div>
              <div class="col-md-6">
                  <div class="tile">
                      <h3 class="tile-title">THỐNG KÊ DOANH SỐ</h3>
                      <div class="embed-responsive embed-responsive-16by9">
                          <canvas class="embed-responsive-item" id="barChartDemo"></canvas>
                      </div>
                  </div>
              </div>
          </div>
  
          <div class="text-right" style="font-size: 12px">
              <p><b>Hệ thống quản lý V2.0 | Code by Trường</b></p>
          </div>
      </main>
      <!-- Essential javascripts for application to work-->
      <script src="js/jquery-3.2.1.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="js/main.js"></script>
      <!-- The javascript plugin to display page loading on top-->
      <script src="js/plugins/pace.min.js"></script>
      <!-- Page specific javascripts-->
      <script type="text/javascript" src="js/plugins/chart.js"></script>
      <script type="text/javascript">
      var data = {
        labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
        datasets: [{
            label: "Dữ liệu đầu tiên",
            fillColor: "rgba(255, 255, 255, 0.158)",
            strokeColor: "black",
            pointColor: "rgb(220, 64, 59)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "green",
            data: [20, 59, 90, 51, 56, 100, 40, 60, 78, 53, 33, 81]
          },
          {
            label: "Dữ liệu kế tiếp",
            fillColor: "rgba(255, 255, 255, 0.158)",
            strokeColor: "rgb(220, 64, 59)",
            pointColor: "black",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "green",
            data: [48, 48, 49, 39, 86, 10, 50, 70, 60, 70, 75, 90]
          }
        ]
      };
  
  
          var ctxl = $("#lineChartDemo").get(0).getContext("2d");
          var lineChart = new Chart(ctxl).Line(data);
  
          var ctxb = $("#barChartDemo").get(0).getContext("2d");
          var barChart = new Chart(ctxb).Bar(data);
      </script>
      <!-- Google analytics script-->
      <script type="text/javascript">
          if (document.location.hostname == 'pratikborsadiya.in') {
              (function (i, s, o, g, r, a, m) {
                  i['GoogleAnalyticsObject'] = r;
                  i[r] = i[r] || function () {
                      (i[r].q = i[r].q || []).push(arguments)
                  }, i[r].l = 1 * new Date();
                  a = s.createElement(o),
                      m = s.getElementsByTagName(o)[0];
                  a.async = 1;
                  a.src = g;
                  m.parentNode.insertBefore(a, m)
              })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
              ga('create', 'UA-72504830-1', 'auto');
              ga('send', 'pageview');
          }
      </script>
  </body>
  <style>
    .app-content {
      margin-left: 280px;
      margin-top: 80px;
      /* font-size: 50px; */
    }
    a{
        text-decoration: none;
    }
    
    .app-menu__item {
      position: relative;
      display: -webkit-box;
      display: -ms-flexbox;
      display: flex;
      -webkit-box-align: center;
      -ms-flex-align: center;
      align-items: center;
      border-radius: 0.375rem;
      margin-bottom: 10px;
      padding: 15px 15px;
      font-size: 1.08em;
      border-left: 0px;
      box-shadow: none;
      -webkit-transition: border-left-color 0.3s ease, background-color 0.3s ease;
      -o-transition: border-left-color 0.3s ease, background-color 0.3s ease;
      transition: border-left-color 0.3s ease, background-color 0.3s ease;
      color: white;
      border: 1px solid transparent;
      /* border-bottom: 1px solid #ddd; */
    }
    
    .app-sidebar {
      position: fixed;
      top: 0;
      bottom: 0;
      left: 0;
      padding-top: 20px;
      width: 250px;
      padding-left: 10px;
      padding-right: 10px;
      overflow: auto;
      z-index: 10;
      background: rgb(0, 28, 64);
    }
    
    .app-sidebar__user {
      display: block;
      display: -ms-flexbox;
    
      /* display: flex; */
      /* -webkit-box-align: center; */
      -ms-flex-align: center;
      align-items: center;
      padding: 10px;
      color: white;
      text-align: center;
    }
    
    li {
      display: list-item;
      text-align: -webkit-match-parent;
    }
    
    .haha {
      color: rgb(0, 28, 64) !important;
      background: #ffd43b !important;
      font-weight: 600;
      box-shadow: none !important;
      border: 1px solid;
    }
    
    .app-menu__item.active,
    .app-menu__item:hover,
    .app-menu__item:focus {
      background: #c6defd;
      text-decoration: none;
      color: rgb(22 22 72);
      box-shadow: none;
      border: 1px solid rgb(22 22 72);
    }
    
    .app-menu {
      padding: 5px;
    }
    
    ::-webkit-scrollbar {
      display: none;
    }
    
    ul {
      display: block;
      list-style-type: disc;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0px;
      margin-inline-end: 0px;
      padding-inline-start: 40px;
    }
    
    .app-header {
      position: fixed;
      left: 0;
      right: 0;
      top: 0;
      width: 100%;
      display: -webkit-box;
      display: -ms-flexbox;
      display: flex;
      background-color: rgb(0, 28, 64);
      z-index: 1;
      padding-right: 15px;
      padding-left: 15px;
      justify-content: flex-end;
    }
    
    .app-nav {
      display: -webkit-box;
      display: -ms-flexbox;
      display: flex;
      margin-bottom: 0;
      -webkit-box-pack: end;
      -ms-flex-pack: end;
      justify-content: flex-end;
      text-align: right;
      margin-right: 20px;
    }
    
    
    .app-nav__item {
    
      display: block;
      padding: 15px;
      line-height: 0px;
      color: rgb(0, 28, 64);
      background: rgb(255, 212, 59);
      -webkit-transition: background-color 0.3s ease;
      -o-transition: background-color 0.3s ease;
      transition: background-color 0.3s ease;
    }
    
    .app-sidebar__user-avatar {
    
      background: white;
      border-radius: 15px;
      width: 70px;
      border: 3px solid white;
      margin-bottom: 10px;
    }
    
    hr {
      margin-top: 10px;
      margin-bottom: 10px;
      border: 0;
      border-top: 1px solid rgb(255 255 255 / 26%);
    }
    
    </style>

</html>