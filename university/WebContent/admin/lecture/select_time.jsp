<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목 선택</title>
<link rel="shortcut icon" href="http://localhost/university/global/img/favicon.png">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link rel="stylesheet" href="http://localhost/university/global/global.css" />
<link rel="stylesheet"
	href="http://localhost/university/global/reset.css" />
<link rel="stylesheet"
	href="http://localhost/university/layout/common.css" />
<link rel="stylesheet"
	href="http://localhost/university/admin/lecture/css/admin_lecture.css" />
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script
	src="http://localhost/university/global/js/jquery.serializejson.min.js"></script>
<script src="http://localhost/university/admin/lecture/js/select.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
path = '<%=request.getContextPath()%>';
$(function(){
	
})
</script>
</head>
<body>
	<!-- Modal Header -->
	<div class="modal-header">
		 수강 가능한 시간
		<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	</div>

	<!-- Modal body -->
	<div class="modal-body">
		<div class="section-content">
			<div id="result-time" class="result"></div>
		</div>
	</div>

	<!-- Modal footer -->
	<div class="modal-footer">
		<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	</div>
</body>
</html>