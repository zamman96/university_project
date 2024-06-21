<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사프로그램</title>
<link rel="shortcut icon" href="http://localhost/university/global/img/favicon.png">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link rel="stylesheet" href="http://localhost/university/global/global.css" />
<link rel="stylesheet" href="http://localhost/university/global/reset.css" />
<link rel="stylesheet" href="http://localhost/university/layout/common.css" />
<!-- css -->
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/global/js/jquery.serializejson.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="http://localhost/university/admin/lecture/css/lectureList.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="http://localhost/university/global/js/col_major.js"></script>
<script src="http://localhost/university/admin/lecture/js/lectureList.js"></script>
<script src="http://localhost/university/global/js/col_major.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<%
	// 세션에서 로그인 정보 가져오기
	MemberVO vo = (MemberVO) session.getAttribute("login");

%>	
<script>
path = `<%=request.getContextPath()%>`;
grant = '<%=vo.getMem_grantno()%>';
currentPage = 1;
totalPage = 0;
subject_id = "";
major_id = "";
year = "";
term = "";
time_id = "";
$(function() {
	/* 모달 */
	const modal1 = document.querySelector('#modal1');

	const btnClose1 = document.querySelector('#button1');
	
	btnClose1.addEventListener('click', function(){
	        closeModal(modal1);
	});
	
	modal1.addEventListener('click', (e) => detectBackdropClick(e, modal1));
	
	function openModal(modal) {
	        modal.showModal();
	}                       
	
	function closeModal(modal) {
	        modal.close(); // 모달 닫기
	}
	
	function handleClose(modal) {
	        modal.classList.remove("dialog__animate-out");
	        modal.removeEventListener('animationend', handleClose, false);
	        modal.close();
	}
	
	function detectBackdropClick(event, modal) {
	        if(event.target === modal) {
	                closeModal(modal);
	        }
	}
	/* 모달 끝 */
	
	vcid = 0;
	colleageList();
	majorList();
	listPerPage();
	// 단과대학 변경 이벤트
	$(document).on('change', '#cid', function() {
		vcid = $('#cid').val();
		console.log(vcid);
		majorList();
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
	$(document).on('click','#next',function(){
		currentPage = 1;
		listPerPage();
	})
	$(document).on('click','#prev',function(){
		currentPage = totalPage;
		listPerPage();
	})
	
	$(document).on('click','#search', function(){
		currentPage = 1;
		listPerPage();
	})
	
	$(document).on('click',"#updateList",function(){
		detailUpdate();
	})

	$(document).on('click', '#delete', function() {
	
	let curcnt = $('#cur_cnt').text();
	
	if(curcnt>0){
		closeModal(modal1);
		
		Swal.fire({
			  icon: "error",
			  title: "삭제 실패",
			  text: "이미 수강하고 있는 학생이 있어 삭제할 수 없습니다",
			});
		return false;
	}
	
	dvo = {
			subject_id : subject_id,
			year : year,
			term : term,
		}
	deleteLecture();
	})
	
	// 과목 선택시
	$(document).on('click',".lectureSelect",function(){
		subject_id = $(this).attr('idx');
		year = $(this).attr('idy');
		term = $(this).attr('idz');
		time_id = $(this).attr('idt');
		
		dvo = {
			subject_id : subject_id,
			year : year,
			term : term
		}
		
		openModal(modal1);
		detail();
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

				<!-- section-content 시작 -->
				<div class="section-content">

					<!-- section-top 시작 -->
					<div class="section-top">
						개설 강의 조회
					</div>
					<!-- section-top 끝 -->

					<!-- section-center 시작 -->
					<div class="section-center">
						<div class="section-list">
<%
//회원 번호로 구분
	if(vo.getMem_grantno()==3){
%>
							<div class="list-title top">
								개강 강의 리스트
								<a href="<%=request.getContextPath() %>/admin/lecture/lectureAdd.jsp" class="lectureAdd"><span>+</span> 강의 추가</a>
							</div>
<%
	}
%>
							<div class="section-search">
								<form id="subf">
							
									<div class="select-boxs">
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
											<select name="subject_term">
												<option value="">학기</option>
												<option value="1학기">1학기</option>
												<option value="2학기">2학기</option>
											</select> 
										</div>
										
										<!-- 년도 스타일 수정 -->
										<div class="sel-box">
											<select name="year">
												<option value="">년도</option>
												<option value="2024">2024</option>
												<option value="2023">2023</option>
												<option value="2022">2022</option>
												<option value="2021">2021</option>
												<option value="2020">2020</option>
											</select> 
										</div>
										
										<div class="sel-box">
											<span id="colleageList"></span>
										</div>
										
										<div class="sel-box">
											<span id="majorList"></span>
										</div>
									</div>
									<div class="select-boxs">	
										<div class="search-box">
											<input class="search-input" type="text" placeholder="과목명을 입력하세요" name="subject_name">
											<div class="search-btn">
										    	<img class="icon-20 search-btn" id="search" alt="search icon" src="http://localhost/university/board/student-list/img/solidinterfacesearch.svg"/> 
											</div>
										</div>
									</div>
									
								</form>
							</div>
							
							<div id="subjectList"></div>
							<div id="pageList"></div>
						</div>
						<!-- section-list 끝 -->
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
	
	
		<!-- detail/수정 모달 -->

	<dialog id="modal1">
	<div class="dialog__inner">
		<div class="dialog__inner__top">
			개설 강의 조회
			<button class="button button-close close2" id="button1">╳</button>
		</div>
		<div class="dialog__content">
			<div id="detail"></div>
		</div>
	</div>
	
	</dialog>
</body>
</html>