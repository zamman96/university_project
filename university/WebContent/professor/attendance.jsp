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
	href="http://localhost/university/professor/css/attendance.css" />
<link rel="stylesheet"
	href="http://localhost/university/student/css/course_registration.css" />
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link rel="shortcut icon"
	href="http://localhost/university/global/img/favicon.png">
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/global/js/col_major.js"></script>
<script
	src="http://localhost/university/global/js/jquery.serializejson.min.js"></script>
<script src="http://localhost/university/professor/js/attendance.js"></script>
<script src="https://cdn.jsd<link rel="shortcut icon" href="http://localhost/university/global/img/favicon.png">elivr.net/npm/sweetalert2@10"></script>
<%
	String subject_id = request.getParameter("subject_id");
	String subject_name = request.getParameter("subject_name");
	String year = request.getParameter("year");
	String term = request.getParameter("term");
	
	MemberVO memVo = (MemberVO)session.getAttribute("login");
	
	Gson gson = new Gson();
	String json = gson.toJson(memVo);
	String mem_id = memVo.getMem_id();
%>
<script>
path = '<%=request.getContextPath()%>';
	pro_id = '<%=mem_id%>';
	year = '<%=year%>';
	term = '<%=term%>';
	subject_id = '<%=subject_id%>';
	subject_name = '<%=subject_name%>';
// 	attend_date = '2024-06-13';
 	attend_date = '';
	newAttend = "true";

	avo = {
		pro_id : pro_id,
		year : year,
		term : term,
		subject_id : subject_id
	}
	$(function() {
		$('#yearInfo').text(year);
		$('#termInfo').text(term);
		$('#subjectNo').text(subject_id);
		$('#subjectName').text(subject_name);

		// 만약 출석정보를 가져오지 않았을 경우엔 현재 날짜를 불러오며
		// 수강하고 있는 학생들의 정보를 보여준다
		if (attend_date == '') {
			today();
		} else { // 만약 존재한다면 그날에 출석한정보를 보여준다
			$('#today').val(attend_date);
		}
		avo.attend_date = attend_date;
		attendChkList();

		$('#today').on('change', function() {
			newAttend = "true";
			attend_date = $('#today').val();
			avo.attend_date = attend_date;
			attendChkList();
		})

		$(document).on('click', '#attendBtn', function() {
			const radios = document.querySelectorAll('.attend');
			radios.forEach(function(radio) {
				radio.checked = true;
			})
		})
		$(document).on('click', '#absentBtn', function() {
			const radios = document.querySelectorAll('.absent');
			radios.forEach(function(radio) {
				radio.checked = true;
			})
		})
		$(document).on('click', '#tardyBtn', function() {
			const radios = document.querySelectorAll('.tardy');
			radios.forEach(function(radio) {
				radio.checked = true;
			})
		})
		$('#chkOk').on('click', function() {
			const tr = document.querySelectorAll('.stud');
			let day = $('#today').val();
			tr.forEach(function(tr) {
				lvo = {
					year : year,
					term : term,
					subject_id : subject_id,
					attend_date : attend_date
				};

				let stu_id = tr.getAttribute('idx');
				lvo.stu_id = stu_id;

				let attend_type = $('.radioCk:checked', tr).val();
				let attend_remark = $('.remark', tr).val();

				if (typeof attend_type == 'undefined') {
					Swal.fire({
						title : "출석 실패",
						text : "선택하지 않은 학생이 있습니다",
						icon : "error"
					});

					return false;
				}
				lvo.attend_type = attend_type;
				lvo.attend_remark = attend_remark;
				if (newAttend == "true") {
					insertAttend();
				} else if (newAttend == "false") {
					updateAttend();
				}
			})
		})
		$('#deleteChk').on('click', function() {
			Swal.fire({
				title : "경고",
				text : "정말로 삭제하시겠습니까?",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "var(--lecture-6-border)",
				cancelButtonColor : "var(--primary-p-50)",
				confirmButtonText : "삭제",
				cancelButtonText : "취소"
			}).then(function(result) {
				if (result.isConfirmed) {
					deleteAttend();
				}
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
						출석부
					</div>
					<!-- section-top 끝 -->

					<!-- section-center 시작 -->
					<div class="section-center">
						<div class="section-list">
							<div class="table-wrap">
								<div class="sel2-boxs">
									<div class="modal1-wrap-title">과목 정보</div>
									<div class="sel-box-inline">
										<div class="sel2-box">
							        		<div class="sel2-box-title">년도</div>
							        		<div class="sel2-box-result" id="yearInfo"></div>
							        	</div> 
										<div class="sel2-box">
							        		<div class="sel2-box-title">학기</div>
							        		<div class="sel2-box-result" id="termInfo"></div>
							        	</div> 
										<div class="sel2-box">
							        		<div class="sel2-box-title">과목번호</div>
							        		<div class="sel2-box-result" id="subjectNo"></div>
							        	</div> 
										<div class="sel2-box">
							        		<div class="sel2-box-title">과목이름</div>
							        		<div class="sel2-box-result" id="subjectName"></div>
							        	</div> 
										<div class="sel2-box">
							        		<div class="sel2-box-title">날짜</div>
							        		<input class="sel2-box-result" id="today" type="date">
							        	</div> 
					        		</div> 
				        		</div> 
							</div>
				        		

							<div id="stuList"></div>
						</div>
						<div class="section-bottom">
							<button type="button" id="deleteChk">출석 삭제</button>
							<button type="button" id="chkOk">출석 체크 완료</button>
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