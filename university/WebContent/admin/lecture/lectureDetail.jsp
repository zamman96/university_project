<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사프로그램</title>
<link rel="shortcut icon" href="http://localhost/university/global/img/favicon.png">
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link rel="stylesheet"
	href="http://localhost/university/global/global.css" />
<link rel="stylesheet"
	href="http://localhost/university/global/reset.css" />
<link rel="stylesheet"
	href="http://localhost/university/layout/common.css" />
	<!-- css -->
<link rel="stylesheet"
	href="http://localhost/university/admin/lecture/css/lectureDetail.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css"
	rel="stylesheet">
<script src="http://localhost/university/global/js/col_major.js"></script>
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/global/js/jquery.serializejson.min.js"></script>
<script
	src="http://localhost/university/admin/lecture/js/lectureList.js"></script>
<script src="http://localhost/university/global/js/col_major.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
<% 
String subject_id = request.getParameter("subject_id");
String major_id = request.getParameter("major_id");
String year = request.getParameter("year");
String term = request.getParameter("term");
%>
path = `<%=request.getContextPath()%>`;
subject_id = '<%=subject_id%>';
year = '<%=year%>';
term = '<%=term%>';
major_id = '<%=major_id%>';
time_id = "";
pro_id = "";
$(function() {
	dvo = {
		subject_id : subject_id,
		year : year,
		term : term
	}
	detailUpdateList();
	
	/* 모달 */
	const modal1 = document.querySelector('#modal1');
	const modal2 = document.querySelector('#modal2');
	
	const btnClose1 = document.querySelector('#button1');
	const btnClose2 = document.querySelector('#button2');
	
	btnClose1.addEventListener('click', function(){
	        closeModal(modal1);
	});
	
	btnClose2.addEventListener('click', function(){
	        closeModal(modal2);
	});
	
	modal1.addEventListener('click', (e) => detectBackdropClick(e, modal1));
	modal2.addEventListener('click', (e) => detectBackdropClick(e, modal2));
	
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
	
	$(document).on('click','#changeProf',function(){
		lvo = {
				subject_id : subject_id,
				year : year,
				term : term,
				major_id : major_id
			}
		openModal(modal1);
		proList();
	})
	
	$(document).on('click', '.professorSelect', function() {
				pro_id = $('#proId', this).text().trim();
				let pname = $('#proName', this).text().trim();
				
				$('#pro_name').val(pname);
				closeModal(modal1);
	})
	
	$(document).on('click', '#update', function() {
		let curcnt = $('#cur_cnt').text();
		let leccnt = $('#cnt').val();
		
		console.log(curcnt, leccnt);
		
		if(leccnt<curcnt){
			Swal.fire({
				  icon: "error",
				  title: "수정 실패",
				  text: "수강하는 인원 수 보다 낮게 설정할 수 없습니다",
				});
		return false;
		}
		
		dvo = {
			subject_id : subject_id,
			year : year,
			term : term,
			pro_id : pro_id,
			lec_count : leccnt
		}
		
		updateLecture();
	})
	
	$(document).on('click', '#cancel', function(){
		location.href = "http://localhost/university/admin/lecture/lectureList.jsp";
	})
	
});
// 끝
</script>
<style>
#lectureAdd {
	margin: 10px auto;
}
</style>
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
						개설 강의 상세 조회
					</div>
					<!-- section-top 끝 -->

					<!-- section-center 시작 -->
					<div class="section-center">
						<div id="lectureDetail"></div>
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


	<!-- 모달 -->

	<dialog id="modal1">
	<div class="dialog__inner">
		<div class="dialog__inner__top">
			교수 변경
			<button class="button button-close close2" id="button1">╳</button>
		</div>
		<div class="dialog__content">
			<div id="detail">
			</div>
		</div>
	</div>
	</dialog>
	
	
	<dialog id="modal2">
	<div class="dialog__inner">
		<div class="dialog__inner__top">
			교수 변경
			<button class="button button-close close2" id="button1">╳</button>
		</div>
		<button class="button button-close close2" id="button2">╳</button>
		<div class="dialog__content">
			<div id="detail">
			</div>
		<br>
		</div>
	</div>
	</dialog>

</body>
</html>