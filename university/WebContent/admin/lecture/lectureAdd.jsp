<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사프로그</title>
<link rel="shortcut icon" href="http://localhost/university/global/img/favicon.png">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link rel="stylesheet" href="http://localhost/university/global/global.css" />
<link rel="stylesheet" href="http://localhost/university/global/reset.css" />
<link rel="stylesheet" href="http://localhost/university/layout/common.css" />
<link rel="stylesheet" href="http://localhost/university/admin/lecture/css/admin_lecture.css" />

<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://localhost/university/global/js/col_major.js"></script>

<script>
	hoverTime = $();
	currentPage = 1;
	totalPage = 0;
	$(function() {
		$('#professorModal .modal-content').load("./select_professor.jsp");
		$('#roomModal .modal-content').load("./select_room.jsp");
		$('#timeModal .modal-content').load("./select_time.jsp");

		vterm = $('#term').val();
		$('#term').on('change', function() {
			vterm = $('#term').val();
		})

		vyear = $('#year').val();
		$('#year').on('change', function() {
			vyear = $('#year').val();
		})

		$('#subject').on('click', function() {
			vcid = 0;
			colleageList();
			subjectList();
		})

		$(document).on('click', '.subjectSelect', function() {
			let rtype = $('#type', this).text().trim();
			let rgrade = $('#grade', this).text().trim();
			let rid = $('#id', this).text().trim();
			let rname = $('#name', this).text().trim();
			let rmajorid = $('#major', this).attr("idx");
			let rmajorname = $('#major', this).text().trim();
			let rcredit = $('#credit', this).text().trim();

			$('#stype').text(rtype);
			$('#sid').text(rid);
			$('#sname').text(rname);
			$('#smajor').text(rmajorname);
			$('#smajorid').text(rmajorid);
			$('#scredit').text(rcredit);
			$('#sgrade').text(rgrade);

			$('#professor').attr("disabled", false);
		})
		$('#professor').on('click', function() {
			vmajorname = $('#smajor').text();
			console.log(vmajorname);
			$('#pro_major').text(vmajorname + " 교수 조회");
			professorList();
		})
		$(document).on('click', '.professorSelect', function() {
			let pid1 = $('#proId', this).text().trim();
			let pmajorid1 = $('#majorId', this).text().trim();
			let pmajorname1 = $('#majorName', this).text().trim();
			let pname1 = $('#proName', this).text().trim();
			let pbir1 = $('#proBir', this).text().trim();
			let pgender1 = $('#proGender', this).text().trim();
			let ptel1 = $('#proTel', this).text().trim();
			console.log(pbir1);
			$('#pid').text(pid1);
			$('#pmajorid').text(pmajorid1);
			$('#pmajorname').text(pmajorname1);
			$('#pname').text(pname1);
			$('#pbir').text(pbir1);
			$('#pgender').text(pgender1);
			$('#ptel').text(ptel1);

			$('#room').attr("disabled", false);
		})

		$('#room').on('click', function() {
			$('#result-roomnum').html("");
			building();
		})
		$(document).on('click', '.buildingSelect', function() {
			activeButton.css({
				"background" : "none",
				"color" : "black",
				"font-weight" : "normal"
			});
			room_id = $(this).text().trim();
			activeButton = $(this);

			activeButton.css({
				"background" : "#246BEB",
				"color" : "white",
				"font-weight" : "bold"
			});

			roomnum();
		})
		$(document).on('click', '.roomnumSelect', function() {
			let snum = $(this).text().trim();
			$('#rid').text(room_id);
			$('#rnum').text(snum);

			$('#time').attr("disabled", false);
		})

		$('#time').on('click', function() {
			tdata = {};
			tdata.subject_credit = $('#scredit').text().trim();
			tdata.room_id = room_id;
			tdata.room_num = $('#rnum').text().trim();
			tdata.pro_id = $('#pid').text().trim();
			timeList();
		})

		$(document).on('click', '.timeSelect', function() {
			timeId = $('#stid', this).text().trim();
			timeStr = $('#stweek', this).text().trim();
			$('#tid').text(timeId);
			$('#twclass').text(timeStr);
			$('#insertLecture').attr("disabled", false);
		})

		$('#insertLecture').on('click', function() {
			Swal.fire({
				title : "현재 선택한 강의를 <br>개설하시겠습니까?",
				text : "개설된 강의는 인원 수 외에 수정이 불가능합니다.",
				type : "warning",
				showCancelButton : true,
				confirmButtonText : "강의 개설",
				cancelButtonText : "취소",
				confirmButtonColor : "var(--primary-p-50)",
				cancelButtonColor : "var(--lecture-6-border)"
			}).then(function(result) {
				if (result.isConfirmed) {
					idata = {};
					idata.year = $('#year').val().trim();
					idata.term = $('#term').val().trim();
					idata.subject_id = $('#sid').text().trim();
					idata.room_id = $('#rid').text().trim();
					idata.room_num = $('#rnum').text().trim();
					idata.time_id = $('#tid').text().trim();
					idata.pro_id = $('#pid').text().trim();
					idata.lec_count = $('#count').val().trim();
					console.log(idata);
					insert();
				}
			});
		})

		$('#search').on('click', function() {
			currentPage = 1;
			subjectList();
		})

		$(document).on('change', '#cid', function() {
			vcid = $('#cid').val();
			console.log(vcid);
			majorList();
		})

		// 페이지 번호 클릭이벤트
		$(document).on('click', '.pageno', function() {
			let page = parseInt($(this).text().trim());
			currentPage = page;
			subjectList();
		})

		// 다음버튼 클릭 이벤트
		$(document).on('click', '#next', function() {
			currentPage = parseInt($('.pageno').last().text()) + 1;
			subjectList();
		})
		// 이전버튼 클릭 이벤트
		$(document).on('click', '#prev', function() {
			currentPage = parseInt($('.pageno').first().text()) - 1;
			subjectList();
		})
		$(document).on('click', '#first', function() {
			currentPage = 1;
			subjectList();
		})
		$(document).on('click', '#last', function() {
			currentPage = totalPage;
			subjectList();
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
			<jsp:include page="/layout/header/header.jsp" />
			<!-- header 끝 -->

			<!-- section 시작 -->
			<section>

				<!-- s-content 시작 -->
				<div class="s-content">

					<!-- section-top 시작 -->
					<div class="section-top">강의개설</div> 
					<!-- section-top 끝 -->

					<!-- section-center 시작 -->
					<div class="section-center">
						<form id="lectureAdd">
							<div class="section-term">
								<div class="section-term-title">조건 설정</div>
								<select id="year" name="year">
									<option value="2024">2024</option>
									<option value="2023">2023</option>
									<option value="2022">2022</option>
									<option value="2021">2021</option>
									<option value="2020">2020</option>
								</select>
								<select id="term" name="term">
									<option value="1학기">1학기</option>
									<option value="2학기">2학기</option>
								</select>
								<input id="count" name="lec_count" placeholder="수강신청 인원 수 검색">
							</div>
							
							<!-- menu-zip 시작 -->
							<div class="menu-zip">
								
								<!-- menu -->
								<div class="menu">
									<div class="menu-top">
										<div class="menu-title">Step.1 과목</div>
										<button id="subject" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#subjectModal">선택하기</button>
									</div>
									<div class="menu-content">
										<div class="item">
											<div class="item-title">과목분류</div>
											<div class="item-result" id="stype"></div>
										</div>
										<div class="item">
											<div class="item-title">과목번호</div>
											<div class="item-result" id="sid"></div>
										</div>
										<div class="item">
											<div class="item-title">과목명</div>
											<div class="item-result" id="sname"></div>
										</div>
										<div class="item">
											<div class="item-title">학년</div>
											<div class="item-result" id="sgrade"></div>
										</div>
										<div class="item">
											<div class="item-title">학과명</div>
											<div class="item-result" id="smajor"></div>
										</div>
										<div class="item">
											<div class="item-title">학과번호</div>
											<div class="item-result" id="smajorid"></div>
										</div>
										<div class="item">
											<div class="item-title">학점</div>
											<div class="item-result" id=scredit></div>
										</div>
									</div>
								</div> 
								<!-- menu -->
								
								<!-- menu -->
								<div class="menu">
									<div class="menu-top">
										<div class="menu-title">Step.2 교수</div>
										<button id="professor" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#professorModal" disabled>선택하기</button>
									</div>
									<div class="menu-content">
										<div class="item">
											<div class="item-title">아이디</div>
											<div class="item-result" id="pid"></div>
										</div>
										<div class="item">
											<div class="item-title">학과번호</div>
											<div class="item-result" id="pmajorid"></div>
										</div>
										<div class="item">
											<div class="item-title">학과이름</div>
											<div class="item-result" id="pmajorname"></div>
										</div>
										<div class="item">
											<div class="item-title">이름</div>
											<div class="item-result" id="pname"></div>
										</div>
										<div class="item">
											<div class="item-title">생년월일</div>
											<div class="item-result" id="pbir"></div>
										</div>
										<div class="item">
											<div class="item-title">성별</div>
											<div class="item-result" id="pgender"></div>
										</div>
										<div class="item">
											<div class="item-title">전화번호</div>
											<div class="item-result" id="ptel"></div>
										</div>
									</div>
								</div> 
								<!-- menu -->
								
								<div class="menu-line-box">
									<!-- menu -->
									<div class="menu">
										<div class="menu-top">
											<div class="menu-title">Step.3 강의실</div>
											<button id="room" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#roomModal" disabled>선택하기</button>
										</div>
										<div class="menu-content">
											<div class="item">
												<div class="item-title">건물 이름</div>
												<div class="item-result" id="rid"></div>
											</div>
											<div class="item">
												<div class="item-title">호수</div>
												<div class="item-result" id="rnum"></div>
											</div>
										</div>
									</div> 
									<!-- menu -->
	
									<!-- menu -->
									<div class="menu">
										<div class="menu-top">
											<div class="menu-title">Step.4 시간</div>
											<button id="time" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#timeModal" disabled>선택하기</button>
										</div>
										<div class="menu-content">
											<div class="item">
												<div class="item-title">시간번호</div>
												<div class="item-result" id="tid"></div>
											</div>
											<div class="item">
												<div class="item-title">요일/교시</div>
												<div class="item-result" id="twclass"></div>
											</div>
										</div>
									</div> 
									<!-- menu -->
								</div>
								<!-- menu-line-box -->
							
							</div> <!-- section-menu-zip -->
							
						</form> <!-- lectureAdd -->
					</div> <!-- section-center 끝 -->

					<div class="section-bottom">
						<input id="insertLecture" type="button" value="강의 추가" disabled="disabled">
					</div> <!-- section-bottom -->
				
				</div> <!-- s-content 끝 -->
			</section> <!-- section 끝 -->
		</div> <!-- container-right 끝 -->
	</div> <!-- container 끝 -->

	<!-- The Modal 과목 -->
	<div class="modal" id="subjectModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					조회
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="section-content">
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
										<span id="colleageList"></span>
									</div>

									<div class="sel-box">
										<span id="majorList"></span>
									</div>
									<div class="sel-box search-box">
										<input class="search-input" type="text"
											placeholder="과목명을 입력하세요" name="subject_name">
										<div class="search-btn">
											<img class="icon-20 search-btn" id="search" alt="search icon"
												src="http://localhost/university/board/student-list/img/solidinterfacesearch.svg" />
										</div>
									</div>
								</div>
							</form>
						</div>
						<div id="search-result" class="result"></div>
						<div id="pageList"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- The Modal 교수 -->
	<div class="modal" id="professorModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<!-- 외부 JSP -->
			</div>
		</div>
	</div>

	<!-- The Modal 강의실 -->
	<div class="modal" id="roomModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<!-- 외부 JSP -->
			</div>
		</div>
	</div>

	<!-- The Modal 시간 -->
	<div class="modal" id="timeModal">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<!-- 외부 JSP -->
			</div>
		</div>
	</div>
</body>
</html>