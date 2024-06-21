<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사프로그램</title>
<link rel="shortcut icon" href="http://localhost/university/global/img/favicon.png">
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link rel="stylesheet"
	href="http://localhost/university/global/global.css" />
<link rel="stylesheet"
	href="http://localhost/university/global/reset.css" />
<link rel="stylesheet"
	href="http://localhost/university/layout/common.css" />
	<!-- css -->
<link rel="stylesheet"
	href="http://localhost/university/admin/lecture/css/regPage.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css"
	rel="stylesheet">
<script src="http://localhost/university/global/js/col_major.js"></script>
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script
	src="http://localhost/university/admin/lecture/js/regPage.js"></script>
<script src="http://localhost/university/global/js/col_major.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
path = `<%=request.getContextPath()%>`;
$(function() {
	regChk();
	
	$('#subm').on('click',function(){
		lvo = {
			openDate : $('#openDate').val(),
			openTime : $('#openTime').val(),
			closeDate : $('#closeDate').val(),
			closeTime : $('#closeTime').val()
		}
		
		openReg();
	})
});
// 끝
</script>
</head>
<body>
	<!-- container 시작 -->
	<div id="container">

		<!-- container-left 시작 -->
		<div id="container-left">

			<!-- side-menu 시작 -->
						<jsp:include page="/layout/side-menu/side-menu.jsp" />
			<!-- side-menu 끝 -->

		</div>
		<!-- container-left 끝 -->

		<!-- container-right 시작 -->
		<div id="container-right">

			<!-- header 시작 -->
					<jsp:include page="/layout/header/header.jsp"/>
			<!-- header 끝 -->

			<!-- section 시작 -->
			<section>

					<!-- section-top 시작 -->
					<div class="section-top">
						수강신청 페이지 관리
					</div>
					<!-- section-top 끝 -->

					<!-- section-center 시작 -->
					<div class="section-center">
						<div class="section-list">
							<div class="sub-title">수강신청 날짜 조정</div>
							<div class="section-content">
								<div class="section-content-inner">
										<div class="s-flex">
											<label>시작일</label>
											<input id="openDate" type="date">
										</div>
										<div class="s-flex">
											<label>시작시간</label>
											<input id="openTime" type="text" placeholder="24시 기준" pattern="^(0?|1\d?|2[0-4]?)$" title="0부터 24까지의 숫자만 입력하세요.">
										</div>
										<div class="wave"> ~ </div>
										<div class="s-flex">
											<label>마감일</label>
											<input id="closeDate" type="date">
										</div>
										<div class="s-flex">
											<label>마감시간</label>
											<input id="closeTime" type="text" placeholder="24시 기준" pattern="^(0?|1\d?|2[0-4]?)$" title="0부터 24까지의 숫자만 입력하세요."> 
										</div>
								</div>
							</div>
						<!-- section-list 끝 -->
					</div>

					<!-- section-center 끝 -->
				</div>
				
				<div class="btn">
					<input id="subm" type="button" value="변경">
				</div>
				<!-- section-content 끝 -->
			</section>
			<!-- section 끝 -->

		</div>
		<!-- container-right 끝 -->

	</div>
	<!-- container 끝 -->

</body>
</html>