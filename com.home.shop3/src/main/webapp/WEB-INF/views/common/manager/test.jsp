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
<script src="/manager/js/bootstrao.min.js"></script>
<script src="/manager/js/jquery-3.2.1.min.js"></script>
<script src="/manager/js/popper.min.js"></script>
<script src="/manager/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="chart">
		
	</div>
	<form>
		<div class="modal-body">
			<div class="row">
				<div class="form-group  col-md-12">
					<span class="thong-tin-thanh-toan"> <!--  <h4>Tạo chức vụ mới</h4> -->
						Tạo chức vụ mới
					</span>
				</div>




				<div class="form-group col-md-12">
					<label class="control-label">Nhập tên chức vụ mới</label> <input
						id="name_pos" name="name" class="form-control" type="text">
				</div>
			</div>
			<BR>
			<button class="btn btn-save" onclick="save()" type="button">Lưu lại</button>
			
		</div>

	</form>
</body>
<script type="text/javascript">
	function save() {

		//with upload file
		// Get form
		//var form = $('#fileUploadForm')[0];
		//var data = new FormData(form);

		// javascript object.
		
		let data = {
			name : jQuery("#name_pos").val(), // lay theo id

		};
		console.log(data);

		// $ === jQuery
		// json == javascript object
		jQuery.ajax({
			url : "/test",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),

			dataType : "json", // kieu du lieu tra ve tu controller la json
			success : function(jsonResult) {
				alert("Bạn đã thêm vị trí thành công " + jsonResult.statusCode
						+ jsonResult.statusMessage);
				/* location.reload(); */
			},
			error : function(jqXhr, textStatus, errorMessage) { // error callback 
				alert("error");
			}

		});
	}
</script>
</html>