<%@page import="com.google.gson.Gson"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/university/global/img/favicon.png">
<link rel="stylesheet" href="http://localhost/university/global/global.css" />
<link rel="stylesheet" href="http://localhost/university/global/reset.css" />
<link rel="stylesheet" href="http://localhost/university/layout/common.css" />
<link rel="stylesheet" href="http://localhost/university/student/css/insertStuChange.css" />
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/global/js/jquery.serializejson.min.js"></script>
<script src="http://localhost/university/student/js/student.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<%
MemberVO memVo = (MemberVO)session.getAttribute("login");

Gson gson = new Gson();
String json = gson.toJson(memVo);
String mem_id = memVo.getMem_id();
%>
<script>
path = `<%=request.getContextPath() %>`;
uvo = <%=json%>
stu_id = uvo.stu_id;

$(function(){
	
	$('#send').on('click',function(){
		if($('#reg_type').val()==''){
			Swal.fire({
				  title: "신청 실패",
				  text: "신청 구분을 선택하세요",
				  icon: "error"
				});
		}
		data = $('#form').serializeJSON();
		data.stu_id = stu_id
// 		console.log(data);
		
		insertStuChange();
		
		$('#form .indata').val("");
		$('#Modal').modal('hide');
	})
	
	
})

</script>

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
						휴학 / 복학 신청
					</div>
					<!-- section-top 끝 -->

					<!-- section-center 시작 -->
					<div class="section-center">
						
					<!-- list-items 시작 -->
					<div class="list-items">
						
						<div class="list-item">
							<!-- item-title 시작 -->
							<div class="item-title">신청 서식</div>
	                	  	<!-- item-title 끝 -->
								<form id="form">
										<div class="select-boxs-left">
											<div class="sel-box">
												<select name="term" id="term">
                    								<option value="">학기</option>
                  									<option value="1학기" selected>1학기</option>
                   									<option value="2학기">2학기</option>
												</select> 
											</div>
											
											<div class="sel-box">
												<select name="reg_type" id="reg_type">
                   									 <option value="" selected>구분</option>
                   									 <option value="휴학">휴학</option>
                  									 <option value="복학">복학</option>
                								</select>
											</div>
										</div>
										
								</form>
						<div class="item-content">
							<textarea rows="5" cols="50" class="indata" name="reg_content" id="reg_content" placeholder="신청사유를 입력하세요"></textarea>
						</div>
						<div class="sel-button">
							<input type="button" class="indata" id="send" value="전송">
        					<input type="button" class="indata" id="reset" value="초기화">
						</div>
					
						</div> <!-- list-item 끝 -->
						
						<div class="list-item">
							<div class="caution">
							휴학 결재 처리 시 수강신청 자료를 삭제합니다 <span class="important">(수강신청 불가)</span><br>
							휴학 중 졸업대기 또는 졸업이 불가하며 휴학생은 복학신청 후에 해당 학기 등록과 수강 완료 후 수료(졸업대기) 또는 졸업 가능함
							</div>
							
	                	</div>
						
						
					</div><!-- list-items 끝 -->

					</div> <!-- section-center 끝 -->
				</div> <!-- section-content 끝 -->
			</section> <!-- section 끝 -->
		</div> <!-- container-right 끝 -->
	</div> <!-- container 끝 -->


</body>
</html>