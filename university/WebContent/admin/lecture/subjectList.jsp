<%@page import="com.google.gson.Gson"%>
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
<link rel="stylesheet" href="http://localhost/university/admin/lecture/css/subject.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="http://localhost/university/global/js/col_major.js"></script>
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/global/js/jquery.serializejson.min.js"></script>
<script src="http://localhost/university/admin/lecture/js/subject.js"></script>
<script src="http://localhost/university/global/js/col_major.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<%
MemberVO memVo = (MemberVO)session.getAttribute("login");

Gson gson = new Gson();
String json = gson.toJson(memVo);
String mem_id = memVo.getMem_id();
%>
<script>
path = `<%=request.getContextPath()%>`;
subject_id = "";
currentPage = 1;
totalPage = 0;
$(function() {
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
	$(document).on('change', '#icid', function() {
		let mlist = $('#majorListInsert');
		vcid = $('#icid').val();
		console.log(vcid);
		majorListTag(mlist, "imid");
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
	$(document).on('click','#first',function(){
		currentPage = 1;
		listPerPage();
	})
	$(document).on('click','#last',function(){
		currentPage = totalPage;
		listPerPage();
	})
	
	$(document).on('click','.subjectSelect',function(){
		subject_id = $(this).attr('idx');
		subjectDetail();
		openModal(modal1);
		
	})
	
	$(document).on('click','#search', function(){
		currentPage = 1;
		listPerPage();
	})

	$(document).on('click','#updateList',function(){
		subject_id = $(this).attr('idx');
		subjectUpdateDetail();
	})
	
	$(document).on('click','#update',function(){
		subject_id = $(this).attr('idx');
		update();
	})
	$(document).on('click','#cancel',function(){
		subject_id = $(this).attr('idx');
		subjectDetail();
	})
	
	$('#insertBtn').on('click',function(){
		openModal(modal2);
		let clist = $('#colleageListInsert');
		let mlist = $('#majorListInsert');
		colleageListTag(clist, "icid");
		majorListTag(mlist, "imid");
	})

	// 값이 변경될 때마다 이벤트 처리
	$('#imid, #insterm, #insgrade').on('change', function() {
    let major_id = $('#imid').val().trim();
    let subject_term = $('#insterm').val().trim();
    let subject_grade = $('#insgrade').val().trim();

    if (major_id !== '0' && subject_grade !== '0' && subject_term !== '') {
        $('#subIdCreate').prop('disabled', false);
    } else {
        $('#subIdCreate').prop('disabled', true);
    }
	});
	
	$('#subIdCreate').on('click',function(){
		let major_id = $('#imid').val().trim();
		let subject_term = $('#insterm').val().trim();
		let subject_grade = $('#insgrade').val().trim();
		
		
		idvo = {
					major_id : major_id,
					subject_term : subject_term,
					subject_grade : subject_grade
		}
		console.log(idvo);
		sub_id();
	});
	
	$('#insert').on('click',function(){
		insertSubject();
	});
	
	$(document).on('click','#delete',function(){
		subject_id = $(this).attr('idx');
		deleteSubject();
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
						과목 조회
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
										과목 리스트
										<button type="button" id="insertBtn"><span>&#43;</span> 과목 추가</button>
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
							
							<div id="subjectList"></div>
							<div id="pageList"></div>

					
						</div> <!-- section-list 끝 -->

					</div> <!-- section-center 끝 -->
				</div> <!-- section-content 끝 -->
			</section> <!-- section 끝 -->
		</div> <!-- container-right 끝 -->
	</div> <!-- container 끝 -->

	<!-- 모달 -->

	<dialog id="modal1">
	<div class="dialog__inner">
		<div class="dialog__inner__top">
			과목 조회
			<button class="button button-close close2" id="button1">╳</button>
		</div>
		<div class="dialog__content">
			<div id="detail"></div>

		<br>
		</div>
	</div>
	</dialog>
	
	
	<dialog id="modal2">
		<div class="dialog__inner">
			<div class="dialog__inner__top">
				과목 추가
				<button class="button button-close close2" id="button2">╳</button>
			</div>
			<div class="dialog__content">
				<div id="detail">
					<form id="insertf">
						<div class="modal-wrap">
				            <div class="sel2-boxs">
				            	<div class="modal-wrap-title">과목 설정</div>
				            	<div class="sel2-box w-260">
				            		<div class="sel2-box-title">과목분류</div>
					        		 <select name="subject_type">	
										<option value="">전체</option>
										<option value="전공(필수)">전공(필수)</option>
										<option value="전공(선택)">전공(선택)</option>
										<option value="교양(필수)">교양(필수)</option>
										<option value="교양(선택)">교양(선택)</option>
										<option value="교직">교직</option>
									</select>
				            	</div>
				            	<div class="sel2-box w-260">
				            		<div class="sel2-box-title">단과대명</div>
					        		<span id="colleageListInsert"></span>
				            	</div>
				            	<div class="sel2-box w-260">
				            		<div class="sel2-box-title">학과명</div>
					        		<span id="majorListInsert"></span>
				            	</div>
				            	<div class="sel2-zip">
					            	<div class="sel2-box">
					            		<div class="sel2-box-title">학기</div>
						        		<select name="subject_term" id="insterm">
											<option value="" selected>미선택</option>
											<option value="1학기">1학기</option>
											<option value="2학기">2학기</option>
										</select>
					            	</div>
					            	<div class="sel2-box">
					            		<div class="sel2-box-title">학년</div>
						        		<select name="subject_grade" id="insgrade">
											<option value="0">미선택</option>
											<option value="1">1학년</option>
											<option value="2">2학년</option>
											<option value="3">3학년</option>
											<option value="4">4학년</option>
											<option value="5">5학년</option>
										</select>
					            	</div>
					            	<div class="sel2-box">
					            		<div class="sel2-box-title">학점</div>
						        		<select name="subject_credit">
											<option value="0">미선택</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>	
										</select>
					            	</div>
				            	</div>
				            	<div class="sel2-box">
					            		<div class="sel2-box-title">과목번호</div>
					            		<div class="sel2-box-content">
						        			<input type="button" value="생성하기" id="subIdCreate" class="submit" disabled>
						        			<input readonly="readonly" name="subject_id" id="insid" type="text" class="submit-input">
					            		</div>
					            	</div>
				            </div> <!-- sel-boxs/ -->
				            
				            <div class="item-boxs">
				            	<div class="modal-wrap-title">과목 상세</div>
				            	<div class="item-box-line">
					            	<div class="item-box">
					            		<div class="item-box-title">과목명</div>
						        		<input class="subject_name" name="subject_name" type="text" placeholder="과목명을 입력해 주세요">
					            	</div>
					            	<div class="item-box">
					            		<div class="item-box-title">이론시간</div>
						        		<input type="text" name="subject_theory" value="0" class="item-input">
					            	</div>
					            	<div class="item-box">
					            		<div class="item-box-title">실습시간</div>
						        		<input type="text" name="subject_training" value="0" class="item-input">
					            	</div>
				            	</div>
				            	<div class="item-box-block">
						            <div class="item-box">
							        	<div class="item-box-title">개요</div>
						        		<textarea name="subject_outline" placeholder="개요를 입력해 주세요"></textarea>
						            </div>
						            <div class="item-box">
							        	<div class="item-box-title">목표</div>
						        		<textarea name="subject_target" placeholder="목표를 입력해 주세요"></textarea>
						            </div>
						            <div class="item-box">
							        	<div class="item-box-title">주교재</div>
						        		<textarea name="subject_t_book" placeholder="주교재를 입력해 주세요"></textarea>
						            </div>
						            <div class="item-box">
							        	<div class="item-box-title">부교재</div>
						        		<textarea name="subject_s_book" placeholder="부교재를 입력해 주세요"></textarea>
						            </div>
						            <div class="item-box">
							        	<div class="item-box-title">참고자료</div>
						        		<textarea name="subject_r_file" placeholder="참고자료를 입력해 주세요"></textarea>
						            </div>
						            <div class="item-box">
							        	<div class="item-box-title">선행학습자료</div>
						        		<textarea name="subject_p_file" placeholder="선행학습자료를 입력해 주세요"></textarea>
					            </div>
					            </div>
				            </div> <!-- item-boxs -->
		            	</div> <!-- modal-wrap/ -->
						<div class="modal-bottom">
							<button class="save-btn" id="insert" type="button">완료</button>
						</div>
					</form>                                                                          
				</div> <!-- detail/ -->
			</div> <!-- dialog__content/ -->
		</div> <!-- dialog__inner/ -->
	</dialog> <!-- modal2/ -->

</body>
</html>