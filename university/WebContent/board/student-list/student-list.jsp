<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사프로그램</title>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link rel="stylesheet" href="http://localhost/university/global/global.css" />
<link rel="stylesheet" href="http://localhost/university/global/reset.css" />
<link rel="stylesheet" href="http://localhost/university/layout/common.css" />
<link rel="stylesheet" href="http://localhost/university/board/student-list/css/student-list.css" />

</head>
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
<%--		<jsp:include page="/layout/header/header.jsp"/> --%>
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
					<div class="tap-item active">
						<b>01 재학</b>
					</div>
					<div class="tap-item">
						02 휴학
					</div>
					<div class="tap-item">
						03 복학
					</div>
					<div class="tap-item">
						04 제적
					</div>
					<div class="tap-item">
						05 자퇴
					</div>
				</div>
				
				<!-- section-center 시작 -->
				<div class="section-center">
				
					<!-- table-top 시작 -->
					<div class="table-top">

						<div class="table-top-left">총 <b>12303</b>명</div>
  
						<div class="table-top-right">
							<div class="select-box">
								<!-- 전체 <img class="icon-20" alt="select icon" src="http://localhost/university/board/student-list/img/img/vuesaxoutlinearrowdown.svg"/> -->
 									<select class="search-select" name="search-select" size="1">
  									<option value="선택">선택</option>
  									<option value="이름">이름</option>
  									<option value="학번">학번</option>
  									<option value="학과">학과</option>
  									<option value="학과번호">학과번호</option>
 									</select>
							</div>
					    	<!-- <div class="text6">검색어를 입력하세요</div> -->
							<div class="search-box">
								<input class="search-input" type="text" placeholder="검색어를 입력하세요" name="search-text">
							    <img class="icon-20 search-btn" alt="search icon" src="http://localhost/university/board/student-list/img/solidinterfacesearch.svg"/> 
							</div>
						
						</div>
  					
					</div>
                  	<!-- table-top 끝 -->
                  	
                  	<!-- table 시작 -->
					<div class="table-wrap">
						<table>
							<tr>
								<th>번호</th>
								<th>아이디</th>
								<th>이름</th>
								<th>학과</th>
								<th>학과번호</th>
								<th>입학일</th>
								<th>휴학일</th>
								<th>복학일</th>
								<th>이메일</th>
								<th>주소</th>
							</tr>
							<tr>
								<td>1</td>
								<td>dkci9911kd</td>
								<td>홍길동</td>
								<td>멀티미디어학부</td>
								<td>2300004212</td>
								<td>2020.03.01</td>
								<td>2024.03.01</td>
								<td>-</td>
								<td>djivke001@naver.com</td>
								<td>대전시 오류동 중구 294 하나빌딩 102대전시 오류동 중구 294</td>
							</tr>
							<tr>
								<td>2</td>
								<td>dkci9911kd</td>
								<td>홍길동</td>
								<td>멀티미디어학부</td>
								<td>2300004212</td>
								<td>2020.03.01</td>
								<td>2024.03.01</td>
								<td>-</td>
								<td>djivke001@naver.com</td>
								<td>대전시 오류동 중구 294 하나빌딩 102대전시 오류동 중구 294</td>
							</tr>
							<tr>
								<td>3</td>
								<td>dkci9911kd</td>
								<td>홍길동</td>
								<td>멀티미디어학부</td>
								<td>2300004212</td>
								<td>2020.03.01</td>
								<td>2024.03.01</td>
								<td>-</td>
								<td>djivke001@naver.com</td>
								<td>대전시 오류동 중구 294 하나빌딩 102대전시 오류동 중구 294</td>
							</tr>
							<tr>
								<td>4</td>
								<td>dkci9911kd</td>
								<td>홍길동</td>
								<td>멀티미디어학부</td>
								<td>2300004212</td>
								<td>2020.03.01</td>
								<td>2024.03.01</td>
								<td>-</td>
								<td>djivke001@naver.com</td>
								<td>대전시 오류동 중구 294 하나빌딩 102대전시 오류동 중구 294</td>
							</tr>
							<tr>
								<td>5</td>
								<td>dkci9911kd</td>
								<td>홍길동</td>
								<td>멀티미디어학부</td>
								<td>2300004212</td>
								<td>2020.03.01</td>
								<td>2024.03.01</td>
								<td>-</td>
								<td>djivke001@naver.com</td>
								<td>대전시 오류동 중구 294 하나빌딩 102대전시 오류동 중구 294</td>
							</tr>
							<tr>
								<td>6</td>
								<td>dkci9911kd</td>
								<td>홍길동</td>
								<td>멀티미디어학부</td>
								<td>2300004212</td>
								<td>2020.03.01</td>
								<td>2024.03.01</td>
								<td>-</td>
								<td>djivke001@naver.com</td>
								<td>대전시 오류동 중구 294 하나빌딩 102대전시 오류동 중구 294</td>
							</tr>
							<tr>
								<td>7</td>
								<td>dkci9911kd</td>
								<td>홍길동</td>
								<td>멀티미디어학부</td>
								<td>2300004212</td>
								<td>2020.03.01</td>
								<td>2024.03.01</td>
								<td>-</td>
								<td>djivke001@naver.com</td>
								<td>대전시 오류동 중구 294 하나빌딩 102대전시 오류동 중구 294</td>
							</tr>
							<tr>
								<td>8</td>
								<td>dkci9911kd</td>
								<td>홍길동</td>
								<td>멀티미디어학부</td>
								<td>2300004212</td>
								<td>2020.03.01</td>
								<td>2024.03.01</td>
								<td>-</td>
								<td>djivke001@naver.com</td>
								<td>대전시 오류동 중구 294 하나빌딩 102대전시 오류동 중구 294</td>
							</tr>
							<tr>
								<td>9</td>
								<td>dkci9911kd</td>
								<td>홍길동</td>
								<td>멀티미디어학부</td>
								<td>2300004212</td>
								<td>2020.03.01</td>
								<td>2024.03.01</td>
								<td>-</td>
								<td>djivke001@naver.com</td>
								<td>대전시 오류동 중구 294 하나빌딩 102대전시 오류동 중구 294</td>
							</tr>
							<tr>
								<td>10</td>
								<td>dkci9911kd</td>
								<td>홍길동</td>
								<td>멀티미디어학부</td>
								<td>2300004212</td>
								<td>2020.03.01</td>
								<td>2024.03.01</td>
								<td>-</td>
								<td>djivke001@naver.com</td>
								<td>대전시 오류동 중구 294 하나빌딩 102대전시 오류동 중구 294</td>
							</tr>
						</table>
					</div>
					<!-- table  -->
					
					<!-- 페이지네이션 시작 -->
					<div class="pagination-wrap">
						<div class="pagination">
						<a href="#none">&laquo;</a>
						<a href="#none">1</a>
						<a href="#none" class="active">2</a>
						<a href="#none">3</a>
						<a href="#none">4</a>
						<a href="#none">5</a>
						<a href="#none">&raquo;</a>
						</div>
					</div>
					<!-- 페이지네이션 끝 -->
				
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
















