<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 추가</title>
<link rel="shortcut icon" href="http://localhost/university/global/img/favicon.png">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link rel="stylesheet" href="http://localhost/university/global/global.css" />
<link rel="stylesheet" href="http://localhost/university/global/reset.css" />
<link rel="stylesheet" href="http://localhost/university/layout/common.css" />
<link rel="stylesheet" href="http://localhost/university/admin/member/css/insertMember.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="http://localhost/university/global/js/col_major.js"></script>
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/global/js/jquery.serializejson.min.js"></script>
<script src="http://localhost/university/admin/member/js/insertMember.js"></script>
<script src="http://localhost/university/global/js/col_major.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
mem_grantno = "";
path = `<%=request.getContextPath()%>`;
vcid=0;

$(function() {
	
	
		const modal = document.querySelector('dialog');
		const btn = document.querySelector('button');
		const btnClose = document.querySelectorAll('.close');
		majorList();
		$('#list').hide();
		btnClose.forEach((elm) => elm.addEventListener('click', () => closeModal()));
		modal.addEventListener('click', (e) => detectBackdropClick(e));

		var collapseInstance = new bootstrap.Collapse($('#flush-collapseOne'), {
			toggle: true // 초기에는 열림
		});
		
		$('#mul').hide();
		$('#single').hide();
		
		$('#stu').on('click',function(){
			col2();
			mem_grantno = 1;
			$('#memSel').text('학생');
			$('#list').show();
			$('.stu-pro-form').show();
			$('.stu-form').show();
			$('.admin-form').hide();
			$('.pro-form').hide();
		})
		$('#prof').on('click',function(){
			col2();
			mem_grantno = 2;
			$('#list').hide();
			$('#list').hide();
			$('#memSel').text('교수');
			$('.stu-pro-form').show();
			$('.stu-form').hide();
			$('.admin-form').hide();
			$('.pro-form').show();
		})
		$('#admin').on('click',function(){
			col2();
			mem_grantno = 3;
			$('#list').hide();
			$('#memSel').text('관리자');
			$('.stu-pro-form').hide();
			$('.admin-form').show();
		})
		$('#one').on('click',function(){
			col2();
			$('#type').text('단일');
			$('#single').show();
			$('.fileadd').hide();
			$('#mul-stu-list').hide();
			col3();
			console.log(mem_grantno);
		})
		$('#list').on('click',function(){
			col2();
			$('#type').text('다량');
			$('#single').hide();
			$('.fileadd').show();
			col3();
		});
		$('#add').on('click',function(){
			openModal();
		})
		
		$('#stu-mul-add').on('click',function(){
			if(mem_grantno==1){
			if($('#type').text()=='다량'){//다량
			const tr = document.querySelectorAll('.studentlist');
			tr.forEach(function(tr) {
				let mem_id = $('#id', tr).val();
				let mem_pass = $('#pw', tr).val();
				let mem_name = $('#name', tr).val();
				let mem_bir = $('#bir', tr).val();
				let mem_gender = $('#gender', tr).val();
				let mem_add = $('#add', tr).val();
				let mem_tel = $('#tel', tr).val();
				let mem_mail = $('#mail', tr).val();
				let major_id = $('#mid').val();
				let enter_date = $('#enter').val();
				svo = {
					mem_id : mem_id,
					mem_pass : mem_pass,
					mem_name : mem_name,
					mem_bir : mem_bir,
					mem_gender : mem_gender,
					mem_add : mem_add,
					mem_tel : mem_tel,
					mem_mail : mem_mail,
					mem_grantno : mem_grantno,
					major_id : major_id,
					enter_date : enter_date
				};
				console.log(svo);
				insertStudent();
				})// each문 끝
			} else {// 단일
				svo = $('#singlef').serializeJSON();
				let major_id = $('#mid').val();
				let enter_date = $('#enter').val();
				svo.enter_date = enter_date;
				svo.major_id = major_id;
				svo.mem_grantno = mem_grantno;
				console.log(svo);
				insertStudent();
			}
			} else if(mem_grantno==2){// 교수
				pvo = $('#singlef').serializeJSON();
				pvo.major_id=$('#mid').val();
				pvo.mem_grantno = mem_grantno;
				insertProfessor();
			} else if(mem_grantno==3){// 관리자
				avo = $('#singlef').serializeJSON();
				avo.admin_position = $('#position').val();
				avo.mem_grantno = mem_grantno;
				insertAdmin();
			}
			
		});

		$(document).on('change','#mid', function(){
			if($('#type').text()=='단일'){
				if(mem_grantno==1){
					stu_id();
				} else if(mem_grantno==2){// 교수
					pro_id();
				} 
			}
		});
		
		$('#single_mail').on('input',function(){
			if(mem_grantno==3){// 관리자
			imail = $('#single_mail').val();
				adm_id();
			} 
		})
		
		$('#single_bir').on('change',function(){
			var formattedDate = formatDate($(this).val()); // 형식 변환된 날짜 값
            $('#single_pw').val(formattedDate); // 결과 값 설정
		});
		
		$('.memType').on('click',function(){
			$('#single_id').val("");
		})


		function openModal(){
			fileDelete();
			if($('#mid').val()==0){
	        	  Swal.fire({
	        		  title: "파일 추가 실패",
	        		  text: "학과를 먼저 선택해주세요",
	        		  icon: "error"
	        		});
	        	  return false;
	          }
		  	modal.showModal();
		}			

		function closeModal(){
		  modal.classList.add("dialog__animate-out");
		  modal.addEventListener('animationend', handleClose, false);
		  formData = new FormData();
          var fileInput = document.getElementById('excel');
          var file = fileInput.files[0];
		  if(file==null){
			  return false;
		  }
		  
          formData.append('file', file);
          formData.append('year', $('#year').val());
          formData.append('major', $('#mid').val());
          formData.append('mem_grantno', mem_grantno);
//           console.log(formData);
		  excel();
		  
		  $('#mul-stu-list').show();
		  $('#mul-stu-list').css('border-top', '1px solid var(--table-th)')
		} 

		function handleClose(){
		  modal.classList.remove("dialog__animate-out");
		  modal.removeEventListener('animationend', handleClose, false);
		  modal.close();
		}

		function detectBackdropClick(event){
		  if(event.target === modal) {
		    closeModal();
		  }
		}
});
// 끝

function formatDate(dateString) {
	var dateParts = dateString.split('-'); // YYYY-MM-DD를 '-'로 분리
	var year = dateParts[0].substring(2); // 연도의 마지막 두 자리 (95)
	var month = dateParts[1]; // 월 (04)
	var day = dateParts[2]; // 일 (21)
	return year + month + day; // 950421 형식으로 결합
}

function col2(){
	var collapseInstance = new bootstrap.Collapse($('#flush-collapseTwo'), {
		toggle: true // 초기에는 열림
	});
}
function col3(){
	var collapseInstance = new bootstrap.Collapse($('#flush-collapseThree'), {
		toggle: true // 초기에는 열림
	});
}

/* 파일 첨부 */
function fileUpload(){
	fileid = document.getElementById('excel');
	console.log(fileid.files[0].name);
	$("#filename").text(fileid.files[0].name);
	$("#filereset").css('display', 'inline');
}
function fileDelete(){
	$('#excel').val('');
	$("#filename").text('');
	$("#filereset").css('display', 'none');
}
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
						회원 추가
					</div> <!-- section-top 끝 -->
					

					<!-- section-center 시작 -->
					<div class="section-center">
						
						<!-- section-list 시작 -->
						<div class="section-list">
							<div class="accordion accordion-flush" id="accordionFlushExample">
								
								<!-- accordion-item -->
								<div class="accordion-item">
									<div class="accordion-header" id="flush-headingOne">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
											<table>
												<tr>
													<th class="tabletitle"><img class="pen" alt="이미지" src="http://localhost/university/admin/lecture/img/pencil.svg">
													회원 분류 선택
													</th>
													<td id="memSel"></td>
												</tr>
											</table>
										</button>
									</div>
									<div id="flush-collapseOne" class="accordion-collapse collapse"
										aria-labelledby="flush-headingOne"
										data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											<div class="section-select">
												<button type="button" id="stu" class="memType section-select-btn">학생</button>
												<button type="button" id="prof" class="memType section-select-btn">교수</button>
												<button type="button" id="admin" class="memType section-select-btn">관리자</button>
											</div>
										</div>
									</div>
								</div>
								
								<!-- accordion-item -->
								<div class="accordion-item">
									<div class="accordion-header" id="flush-headingTwo">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
											aria-expanded="false" aria-controls="flush-collapseTwo">
											<table>
												<tr>
													<th class="tabletitle"><img class="pen" alt="이미지" src="http://localhost/university/admin/lecture/img/pencil.svg">
														추가 유형
													</th>
													<td id="type"></td>
												</tr>
											</table>
										</button>
									</div>
									<div id="flush-collapseTwo" class="accordion-collapse collapse"
										aria-labelledby="flush-headingTwo"
										data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											<div class="section-select">
												<button type="button" id="one" class="section-select-btn">단일</button>
												<button type="button" id="list" class="section-select-btn">다량</button>
											</div>
										</div>
									</div>
								</div>
								
								<!-- accordion-item -->
								<div class="accordion-item">
									<div class="accordion-header" id="flush-headingThree">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse"
											data-bs-target="#flush-collapseThree" aria-expanded="false"
											aria-controls="flush-collapseThree">
											<table>
												<tr>
													<th class="tabletitle"><img class="pen" alt="이미지" src="http://localhost/university/admin/lecture/img/pencil.svg">
													추가
													</th>
													<td></td>
												</tr>
											</table>
										</button>
									</div>
									
									<!-- 아코디언 내부 -->
									<div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											<div class="section-select plus">
												
												<!-- mul-stu -->
												<div id="mul-stu">
													
													<!-- 학생/교수 추가 -->
													<div class="list-item stu-pro-form">
														<div class="item-title">
												  			학적정보
												  		</div>
												  		<div class="item-content">
															<div class="item">
																<div class="stu-form">
																	<label>학과</label>
																</div>
																<div id="majorList"></div>
															</div>

												  			<div class="item">
																<div class="stu-form">입학년도</div>
																<div class="stu-form">
																	<input type="text" id="year"value="2024">
																</div>
															</div>
															
															<div class="item">
																<div class="stu-form">
																	<label>입학일</label>
																</div>
																<div class="stu-form">
																	<input type="date" id="enter" value="2024-03-01">
																</div>
															</div>
															
															<div class="item">
																<div class="fileadd stu-form">
																	<label>파일</label>
																</div>
																<div class="fileadd stu-form">
																	<input type="button" id="add" value="&#43; 파일 추가">
																</div>
															</div>
														</div>
													</div>
													
													<!-- 관리자 추가 -->				
													<div class="list-item admin-form">
														<div class="item-title">
												  			학적정보
												  		</div>
												  		<div class="item-content">
															<div class="item">
																<div class="item">
																	<label>권한</label>
																</div>
																<div>
																	<select id="position">
																	<option value="1">일반관리자</option>
																	<option value="2">상위관리자</option>
																</select>
																</div>
															</div>
														</div>
													</div>

													<div id="mul-stu-list"></div>
													<!-- mul form end -->

													<div id="single">
														<form id="singlef">
															<div class="list-item">
																<div class="item-title">
														  			회원정보
														  		</div>
														  		<div class="item-content">
																	<div class="item">
																		<div>이름</div>
																		<div>
																			<input type="text" id="single_name" name="mem_name">
																		</div>
																	</div>
																	<div class="item">
																		<div>생일</div>
																		<div>
																			<input type="date" id="single_bir" name="mem_bir">
																		</div>
																	</div>
																	<div class="item">
																		<div>성별</div>
																		<div>
																			<select id="single_gender" name="mem_gender">
																				<option value="여" selected>여</option>	
																				<option value="남">남</option>
																			</select>
																		</div>	
																	</div>
																	<div class="item">
																		<div>주소</div>
																		<div>
																			<input type="text" id="single_add" name="mem_add">
																		</div>
																	</div>
																	<div class="item">
																		<div>전화번호</div>
																		<div>
																			<input type="text" id="single_tel" name="mem_tel">
																		</div>
																	</div>
																	<div class="item">
																		<div>이메일</div>
																		<div>
																			<input type="text" id="single_mail" name="mem_mail">
																		</div>
																	</div>
																</div>
															</div> <!-- list-item -->
															
															<div class="item-title">
													  			필수정보
													  		</div>
													  		<div class="item-content">
													  			<div class="item">
																	<div>아이디</div>
																	<div>
																		<input type="text" id="single_id" name="mem_id" disabled readonly="readonly" title="학과나 이메일 입력시 출력">
																	</div>
																</div>
																<div class="item">
																	<div>비밀번호</div>
																	<div>
																		<input type="text" id="single_pw" name="mem_pass" disabled readonly="readonly" title="생년월일을 입력시 출력">
																	</div>
																</div>
													  		</div>
														</form>
														
													</div>
													<!-- single form end -->
																			
												</div> <!-- mul-stu -->
												
												<div class="section-bottom">
													<button type="button" class="submit save-btn" id="stu-mul-add">회원 추가</button>
												</div>

											</div> <!-- section-select -->
											
										</div>
									</div> <!-- flush-collapseThree -->
								</div> <!-- accordion-item -->
							</div> <!-- accordion -->
						</div> <!-- section-list -->
					
					</div> <!--section-center 끝 -->
					
				</div> <!-- section-content 끝 -->
			</section> <!-- section 끝 -->
		</div> <!-- container-right 끝 -->
	</div> <!-- container 끝 -->

	<!-- 모달 -->
	<dialog>
		<div class="dialog__inner">
			<div class="dialog__inner__top">
				파일 추가
				<button class="button button-close close" id="button">╳</button>
			</div>
			<div class="dialog__content">
				<div class="modal-wrap">
					<div class="modal-wrap-title">아래와 같이 순서대로 작성되어있는 엑셀 파일(.xlsx)만 정상 출력됩니다</div>
					<div class="sel2-boxs">
						<div class="sel2-box">
		            		<div class="sel2-box-title">이름</div>
		            		<div class="sel2-box-content">홍길동</div>
		            	</div>
						<div class="sel2-box">
		            		<div class="sel2-box-title">생일</div>
		            		<div class="sel2-box-content">2000-01-01</div>
		            	</div>
						<div class="sel2-box">
		            		<div class="sel2-box-title">성별</div>
		            		<div class="sel2-box-content">남</div>
		            	</div>
						<div class="sel2-box">
		            		<div class="sel2-box-title">주소</div>
		            		<div class="sel2-box-content">서울</div>
		            	</div>
						<div class="sel2-box">
		            		<div class="sel2-box-title">전화번호</div>
		            		<div class="sel2-box-content">010-0000-0000</div>
		            	</div>
						<div class="sel2-box">
		            		<div class="sel2-box-title">이메일</div>
		            		<div class="sel2-box-content">email@mail</div>
		            	</div>
	            	</div>
	            	<div class="sel-boxs">
						<input type="file" id="excel" accept=".xlsx" onchange="fileUpload()">
						<label for="excel" class="file-btn">파일선택</label>
						<span id="filename"></span> <span id="filereset" onclick="fileDelete()">삭제</span>
	            	</div>	
				</div> <!-- modal-wrap -->
				<div class="modal-bottom">
					<button class="save-btn close" id="insert" type="button">제출</button>
				</div> <!-- modal-bottom -->
			</div> <!-- dialog__content -->
		</div> <!-- dialog__inner -->
	</dialog>
	<!-- 모달 -->
</body>
</html>

















