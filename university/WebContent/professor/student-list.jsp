<%@page import="com.google.gson.Gson"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학적프로그램</title>
<link rel="shortcut icon"
	href="http://localhost/university/global/img/favicon.png">
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link rel="stylesheet"
	href="http://localhost/university/global/global.css" />
<link rel="stylesheet"
	href="http://localhost/university/global/reset.css" />
<link rel="stylesheet"
	href="http://localhost/university/layout/common.css" />
<link rel="stylesheet"
	href="http://localhost/university/professor/css/student-list.css" />
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/global/js/jquery.serializejson.min.js"></script>
<script src="http://localhost/university/professor/js/student-list.js"></script>
<%
	MemberVO memVo = (MemberVO)session.getAttribute("login");
	
	Gson gson = new Gson();
	String json = gson.toJson(memVo);
	String mem_name = memVo.getMem_pass();
%>
</head>
<script>

/* 전역변수 선언 위치 */
path = '<%=request.getContextPath()%>';
uvo = <%=json%>
currentPage = 1;
major_id = uvo.major_id;
/* js 호출 위치 */
$(function(){
	listPerPage();
	$('#search').on('click',function(){
		let name = $('#seleted').val();
		$('#search-text').attr('name', name);
		
		currentPage=1;
		listPerPage();
		
	})
	// 페이지 번호 클릭이벤트
	$(document).on('click','.pageno',function(){
		let page = parseInt($(this).text().trim());
		currentPage = page;
		listPerPage();
	})
	
	// 다음버튼 클릭 이벤트
	$(document).on('click','#next',function(){
		currentPage = parseInt($('.pageno').last().text() )+1;
		listPerPage();
	})
	// 이전버튼 클릭 이벤트
	$(document).on('click','#prev',function(){
		currentPage = parseInt($('.pageno').first().text() )-1;
		listPerPage();
	})


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
			
			<!-- section-subject 시작 -->        
			<div class="section-subject">학적 조회</div>
			<!-- section-subject 시작 -->
			
			<!-- section-content 시작 -->
			<div class="section-content">
				<!-- section-tap 시작 -->
				<div class="section-tap">
					<div class="tap-item active" onclick="location.href='http://localhost/university/professor/student-list.jsp'">
						<b>01 학과별</b>
					</div>
					<div class="tap-item" onclick="location.href='http://localhost/university/professor/student-list-lecture.jsp'">
						02 과목별
					</div>
				</div>
				
				<!-- section-center 시작 -->
				<div class="section-center">
				
					<!-- table-top 시작 -->
					<div class="table-top">

						<div class="table-top-left">
<!-- 						총 <b>12303</b>명 -->
						</div>
  						<form id='searchf'>
						<div class="table-top-right">
							<div class="select-box">
								<!-- 전체 <img class="icon-20" alt="select icon" src="http://localhost/svnTest/board/student-list/img/img/vuesaxoutlinearrowdown.svg"/> -->
 									<select class="search-select" name="search-select" size="1" id="seleted">
  									<option value="선택">선택</option>
  									<option value="mem_name">이름</option>
  									<option value="major_id">학과</option>
  									<option value="mem_id">학번</option>
 									</select>
							</div>
					    	<!-- <div class="text6">검색어를 입력하세요</div> -->
							<div class="search-box">
								<input class="search-input" type="text" placeholder="검색어를 입력하세요" id="search-text">
							    <img class="icon-20 search-btn" alt="search icon" id="search" src="http://localhost/svnTest/board/student-list/img/solidinterfacesearch.svg"/> 
							</div>
						
						</div>
  						</form>
  					
					</div>
                  	<!-- table-top 끝 -->
                  	
                  	<!-- table -->
					<div class="table-wrap" id="table"></div>
					<!-- 페이지네이션 시작 -->
					<div id='pageList'></div>
					<!-- 페이지네이션 끝 -->
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