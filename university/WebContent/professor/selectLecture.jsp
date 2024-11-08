<%@page import="com.google.gson.Gson"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학적프로그램</title>
<link rel="stylesheet"
	href="http://localhost/university/global/global.css" />
<link rel="stylesheet"
	href="http://localhost/university/global/reset.css" />
<link rel="stylesheet"
	href="http://localhost/university/layout/common.css" />
<link rel="stylesheet"
	href="http://localhost/university/professor/css/selectLecture.css" />
<link rel="stylesheet"
	href="http://localhost/university/student/css/course_registration.css" />
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link rel="shortcut icon"
	href="http://localhost/university/global/img/favicon.png">
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/global/js/col_major.js"></script>
<script src="http://localhost/university/professor/js/selectLecture.js"></script>
<script
	src="http://localhost/university/global/js/jquery.serializejson.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<%
	MemberVO memVo = (MemberVO)session.getAttribute("login");
	
	Gson gson = new Gson();
	String json = gson.toJson(memVo);
	String mem_id = memVo.getMem_id();
%>
<script>
path = '<%=request.getContextPath()%>';
	pro_id = '<%=mem_id%>';
	year = '2024';
	term = '1학기';

	$(function() {
		proList();
	})
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

				<!-- section-content 시작 -->
				<div class="section-content">

					<!-- section-top 시작 -->
					<div class="section-top">
						강의 과목
					</div>
					<!-- section-top 끝 -->

					<!-- section-center 시작 -->
					<div class="section-center">
						
						<div class="section-list">
							<div id="proList">
							</div>
						</div>
					</div>
					<!-- section-center 끝 -->
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