<%@page import="com.google.gson.Gson"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="http://localhost/university/main/css/student-main.css" />
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/main/js/timetable.js"></script>
<script src="http://localhost/university/main/js/board.js"></script>
<%
	MemberVO memVo = (MemberVO)session.getAttribute("login");
	
	Gson gson = new Gson();
	String json = gson.toJson(memVo);
	
	String mem_id = memVo.getMem_id();
%>
</head>
<script>

/* 전역변수 선언 위치 */
uvo = <%=json%>
path = '<%=request.getContextPath()%>';
syear = '2024';
sterm = '1학기';

/* js 호출 위치 */
$(function(){
	
	// 수강시간표
	timetable();

	// notification(공지), question(문의) 게시판 (240614 정기쁨 작성)
	MainNotiBoard();
	MainQuestBoard();

})

</script>
<body>
<!-- container 시작 -->
<div id="container">
	
	<!-- container-left 시작 -->
	<div id="container-left">
		
		<!-- side-menu 시작 -->
		<jsp:include page="/layout/side-menu/side-menu.jsp"/>
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
					<div class="section-top-left">
						<div class="user-img">
							<img src="<%=request.getContextPath() %>/userImgView.do?mem_id=<%=mem_id%>" alt="">
						</div>
						<div class="user-info">
							<div class="user-name"><b><%=memVo.getMem_name() %></b>님 환영합니다!</div>
							<div class="user-belong">
								<div><%=memVo.getMajor_name() %></div>
								<div><%=memVo.getStu_grade() %>학년</div>
							</div>
						</div>
					</div>
					<div class="section-top-right">
						<button class="btn" type="button">
							<img alt="버튼이미지" src="http://localhost/university/main/img/book-square.png">
							강의자료
						</button>
						<button class="btn" type="button">
							<img alt="버튼이미지" src="http://localhost/university/main/img/edit.png">
							과제관리
						</button>
						<button class="btn" type="button">
							<img alt="버튼이미지" src="http://localhost/university/main/img/calendar.png">
							출결관리
						</button>
					</div>
				</div>
				<!-- section-top 끝 -->
				
				<!-- section-center 시작 -->
				<div class="section-center">
					
					<div class="section-center-left">
						<div class="section-title">
							<div class="icon-section">
								<div class="calendar-img"><img alt="아이콘" src="http://localhost/university/main/img/teacher.png"></div>
								수강시간표
							</div>
							<div class="plus-section">
								<a href="#none">더보기 <img alt="아이콘" src="http://localhost/university/main/img/plus.png"></a>
							</div>
						</div>
						
						<!-- lecture-calendar 시작 -->
						<div class="lecture-calendar">
							
							
							
						</div>
						<!-- lecture-calendar 끝 -->
					</div>
					
					<div class="section-center-right">
						<div class="board notification">
							<div class="section-title">
								<div class="icon-section">
									<div class="notification-img"><img alt="아이콘" src="http://localhost/university/main/img/message.png"></div>
									공지사항
								</div>
								<div class="plus-section">
									<a href="http://localhost/university/board/notice-board.jsp">더보기 <img alt="아이콘" src="http://localhost/university/main/img/plus.png"></a>
								</div>
							</div>
							<div class="content-items">
								
							</div>
						</div>
						<div class="board question">
							<div class="section-title">
								<div class="icon-section">
									<div class="question-img"><img alt="아이콘" src="http://localhost/university/main/img/message.png"></div>
									문의사항
								</div>
								<div class="plus-section">
									<a href="http://localhost/university/board/qa-board.jsp" id="qaboard">더보기 <img alt="아이콘" src="http://localhost/university/main/img/plus.png"></a>
								</div>
							</div>
							<div class="content-items">
								
							</div>
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