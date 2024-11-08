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
	href="http://localhost/university/professor/css/score.css" />
<!-- <link rel="stylesheet"
	href="http://localhost/university/student/css/course_registration.css" /> -->
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link rel="shortcut icon"
	href="http://localhost/university/global/img/favicon.png">
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/global/js/col_major.js"></script>
<script
	src="http://localhost/university/global/js/jquery.serializejson.min.js"></script>
<script src="http://localhost/university/professor/js/score.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
	
	insertChk = "false";

	lvo = {
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
		scoreList();
		chk();
		
		$('#cal').on('click',function(){
			sumScore();
			rvoList = [];
			const tr = document.querySelectorAll('.stud');
			tr.forEach(function(tr) {
				let stu_id = tr.getAttribute('idx');
				let major_name = $('.major', tr).text();
				let mem_name = $('.memname', tr).text();
				let stu_grade = $('.grade', tr).text();
				let mem_gender = $('.gender', tr).text();
				let mem_bir = $('.bir', tr).text();
				let mid_score = $('.mid', tr).val();
				let final_score = $('.final', tr).val();
				let attend_score = $('.attend', tr).val();
				let assign_score = $('.assign', tr).val();
				let sum_score = $('.sum', tr).val();
				rvo = {
					year : year,
					term : term,
					major_name : major_name,
					mem_name : mem_name,
					stu_grade : stu_grade,
					mem_gender : mem_gender,
					mem_bir : mem_bir,
					subject_id : subject_id,
					stu_id : stu_id,
					mid_score : mid_score,
					final_score : final_score,
					attend_score : attend_score,
					assign_score : assign_score,
					sum_score : sum_score
				};

				rvoList.push(rvo);
			})
			rankScore();
		})
		
		$('#chkOk').on('click', function() {
			const tr = document.querySelectorAll('.stud');
			tr.forEach(function(tr) {
				let stu_id = tr.getAttribute('idx');
				let mid_score = $('.mid', tr).val();
				let final_score = $('.final', tr).val();
				let attend_score = $('.attend', tr).val();
				let all_score = $('.all', tr).val();
				let assign_score = $('.assign', tr).val();
				lvo = {
					year : year,
					term : term,
					subject_id : subject_id,
					stu_id : stu_id,
					all_score : all_score,
					mid_score : mid_score,
					final_score : final_score,
					attend_score : attend_score,
					assign_score : assign_score
				};
				if(insertChk=="true"){
					updateScore();
				} else {
					insertScore();
				}

			})
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
						성적 입력
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
					        		</div> 
				        		</div> 
							</div>
							
							<div class="table-wrap">
								<div class="sel2-boxs">
									<div class="modal1-wrap-title">성적 비율</div>
									<div class="sel-box-inline">
										<div class="sel2-box">
							        		<div class="sel2-box-title">중간</div>
							        		<input id="midper" type="text" value="30">
							        	</div> 
										<div class="sel2-box">
							        		<div class="sel2-box-title">기말</div>
							        		<input id="finper" type="text" value="30">
							        	</div> 
										<div class="sel2-box">
							        		<div class="sel2-box-title">과제</div>
							        		<input id="assper" type="text" value="20">
							        	</div> 
										<div class="sel2-box">
							        		<div class="sel2-box-title">출석</div>
							        		<input id="attper" type="text" value="20">
							        	</div> 
					        		</div> 
				        		</div> 
							</div>

							<div id="stuList"></div>	
							
						</div>
						
						<div class="section-bottom">
							<button type="button" id="cal">계산</button>
							<button type="button" id="chkOk">성적 입력</button>
						</div>
						
					</div>
					<!-- section-center 끝 -->

				
				</div>

			</section>
			<!-- section 끝 -->
			
		</div>
		<!-- container-right 끝 -->

	</div>
	<!-- container 끝 -->

</body>
</html>