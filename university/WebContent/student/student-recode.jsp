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
<link rel="stylesheet" href="http://localhost/university/student/css/student-recode.css" />
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/student/js/student.js"></script>
<%
	MemberVO memVo = (MemberVO)session.getAttribute("login");
	
	Gson gson = new Gson();
	String json = gson.toJson(memVo);
	String stu_id = memVo.getMem_id();
	String mem_name = memVo.getMem_pass();
%>
</head>
<script>

/* 전역변수 선언 위치 */
uvo = <%=json%>
path = '<%=request.getContextPath()%>';
stu_id = <%=stu_id%>

/* js 호출 위치 */
$(function(){
	
	// 학적조회 이벤트 호출
	selectStuChange();
	
	

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
					학적 관리
				</div>
				<!-- section-top 끝 -->
				
				<!-- section-center 시작 -->
				<div class="section-center">
					
					<!-- list-items 시작 -->
					<div class="list-items">
						
						<!-- 신청 버튼 시작 -->
						<div class="list-item">
							<!-- item-title 시작 -->
							<div class="item-title">항목명</div>
	                	  	<!-- item-title 끝 -->
							
							<!-- item-content 시작 -->
							<div class="item-content">
								<button type="button" class="item-btn" onclick="location.href='http://localhost/university/student/jsp/insertStuChange.jsp '">휴학 신청</button>
								<button type="button" class="item-btn">자퇴 신청</button>
								<button type="button" class="item-btn">납부내역서 출력</button>
							</div>						
							<!-- item-content 끝 -->
						</div>
						<!-- 신청 버튼 끝 -->
						
						<!-- 휴학 시작 -->
						<div class="list-item">
							<!-- item-title 시작 -->
							<div class="item-title">휴학 내역</div>
	                	  	<!-- item-title 끝 -->
							
							<!-- item-content 시작 -->
							<div class="item-content h-list">
								
							</div>						
							<!-- item-content 끝 -->
						</div>
						<!-- 휴학 끝 -->
						
						<!-- 복학 시작 -->
						<div class="list-item">
							<!-- item-title 시작 -->
							<div class="item-title">복학 내역</div>
	                	  	<!-- item-title 끝 -->
							
							<!-- item-content 시작 -->
							<div class="item-content b-list">
								
							</div>						
							<!-- item-content 끝 -->
						</div>
						<!-- 복학 끝 -->
						
						<!-- 자퇴 시작 -->
						<div class="list-item">
							<!-- item-title 시작 -->
							<div class="item-title">자퇴 내역</div>
	                	  	<!-- item-title 끝 -->
							
							<!-- item-content 시작 -->
							<div class="item-content j-list">
								
							</div>						
							<!-- item-content 끝 -->
						</div>
						<!-- 자퇴 끝 -->
						
					</div>
					<!-- list-items 끝 -->
					
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