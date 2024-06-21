<%@page import="com.google.gson.Gson"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학적프로그램</title>
<link rel="shortcut icon" href="http://localhost/university/global/img/favicon.png">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link rel="stylesheet" href="http://localhost/university/global/global.css" />
<link rel="stylesheet" href="http://localhost/university/global/reset.css" />
<link rel="stylesheet" href="http://localhost/university/layout/common.css" />
<link rel="stylesheet" href="http://localhost/university/student/css/course_registration.css" />
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/global/js/col_major.js"></script>
<script src="http://localhost/university/global/js/jquery.serializejson.min.js"></script>
<script src="http://localhost/university/student/js/courseReg.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<%
MemberVO memVo = (MemberVO)session.getAttribute("login");

Gson gson = new Gson();
String json = gson.toJson(memVo);
String mem_id = memVo.getMem_id();
%>
<script>
path = '<%=request.getContextPath()%>';
	stu_id = <%=mem_id %>
	year = '2024';
	term = '1학기';
	req = 'true';

	cvo = {
		stu_id : stu_id,
		year : year,
		term : term
	}
	$(function() {
		if(req!="true"){
			alert('수강신청 가능한 일자가 아닙니다.');
			location.href='http://localhost/university/main/student-main.jsp';
		}
		
		console.log(cvo);
		vcid = 0;
		
		colleageList();
		courseList();
		sumCredit();

		$(document).on('change', '#cid', function() {
			vcid = $('#cid').val();
			console.log(vcid);
			majorList();
		})

		recommendCourse();

		$(document).on('click', '.insertCourse', function() {
			credit = $(this).attr('idx');
			let subid = $(this).attr("name");
			cvo.subject_id = subid;
			dulTimeChk();
		})

		$(document).on('click', '.deleteCourse', function() {
			let subid = $(this).attr("name");
			cvo.subject_id = subid;
			deleteCourse();
		})
		$(document).on('click', '#search', function() {
			searchList();
			$('#smenu').css({
				"background" : "#eff5ff",
				"font-weight" : "bold"
			});
			$('#rmenu').css({
				"background" : "white",
				"font-weight" : "normal",
				"color" : "var(--gray-text-disabled)",
				"border" : "1px solid var(--gray-line-box)"
			});
		})
		$('#rmenu').on('click', function() {
			recommendCourse();
			$('#smenu').css({
				"background" : "white",
				"font-weight" : "normal"
			});
			$('#rmenu').css({
				"background" : "#f58d39",
				"font-weight" : "600",
				"color" : "white",
				"border" : "none"
			});
		})
		$(document).on('click','#smenu', function() {
			searchList();
			$('#smenu').css({
				"background" : "#eff5ff",
				"font-weight" : "bold"
			});
			$('#rmenu').css({
				"background" : "white",
				"font-weight" : "normal"
			});
		})
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
						수강신청
					</div>
					<!-- section-top 끝 -->

					<!-- section-center 시작 -->
					<div class="section-center">
						
						<!-- section-list 시작 -->
						<div class="section-list">
						
							<!-- section-search 시작 -->
							<div class="section-search">
								<form id="subf">
									<div class="list-title top">
										개강 강의 리스트
										<button type="button" id="rmenu">&#10004; 추천 받기</button>
									</div>
									
									<div class="select-boxs">
										<div class="select-boxs-left">
											<div class="sel-box">
												<select name="subject_grade">
													<option value="0">학년</option>
													<option value="1">1학년</option>
													<option value="2">2학년</option>
													<option value="3">3학년</option>
													<option value="4">4학년</option>
													<option value="5">5학년</option>
												</select> 
											</div>
											
											<div class="sel-box">
												<select name="subject_type">
													<option value="">과목</option>
													<option value="전공(필수)">전공(필수)</option>
													<option value="전공(선택)">전공(선택)</option>
													<option value="교양(필수)">교양(필수)</option>
													<option value="교양(선택)">교양(선택)</option>
													<option value="교직">교직</option>
												</select> 
											</div>
											
											<div class="sel-box">
												<select name="subject_credit">
													<option value="0">학점</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
												</select> 
											</div>
											
											<div class="sel-box">
												<span id="colleageList"></span> 
											</div>
											
											<div class="sel-box">
												<span id="majorList"></span>
											</div>
										</div>
										
										<div class="search-box">
											<input class="search-input" type="text" placeholder="과목명을 입력하세요" name="subject_name">
											<div class="search-btn">
										    	<img class="icon-20 search-btn" id="search" alt="search icon" src="http://localhost/university/board/student-list/img/solidinterfacesearch.svg"/> 
											</div>
										</div>
										
									</div>
								</form>
							</div> 
							<!-- section-search 끝 -->
							
							<!-- 개강강의리스트 시작 -->
							<div class="section-fliter">
								<div id="lectureList"></div>
							</div>
							<!-- 개강강의리스트 끝 -->
							
						</div>
						<!-- section-list 끝 -->
						
						<!-- 수강신청리스트 시작  -->
						<div class="section-list">
							<div class="list-title bottom">
								<div>수강 신청 리스트</div>
								<div class="number">총 <span id="credit"></span> 학점</div>
							</div>
							<div id="courseList"></div>
						</div>
						<!-- 수강신청리스트 끝 -->

					</div> <!-- section-center 끝 -->
				</div> <!-- section-content 끝 -->
			</section> <!-- section 끝 -->
		</div> <!-- container-right 끝 -->
	</div><!-- container 끝 -->
	
</body>
</html>