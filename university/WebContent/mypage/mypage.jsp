<%@page import="com.google.gson.Gson"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학적프로그램</title>
<link rel="shortcut icon" href="http://localhost/university/global/img/favicon.png">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link rel="stylesheet" href="http://localhost/university/global/global.css" />
<link rel="stylesheet" href="http://localhost/university/global/reset.css" />
<link rel="stylesheet" href="http://localhost/university/layout/common.css" />
<link rel="stylesheet" href="http://localhost/university/mypage/css/mypage.css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="http://localhost/university/mypage/js/mypage.js"></script>
<%
	MemberVO memVo = (MemberVO)session.getAttribute("login");
	
	Gson gson = new Gson();
	String json = gson.toJson(memVo);
	
 	String mem_id = memVo.getMem_id();
%>
</head>
<script>

/* 전역변수 선언 위치 */
uvo = <%=json%>
path = '<%=request.getContextPath()%>';
mem_id = '<%=memVo.getMem_id()%>';
const inputData = {}; // 개인정보 변경 가능한 인풋값

</script>
</head>
<!-- <body> -->
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
			
			<!-- section-content 시작 -->
			<div class="section-content">
				
				<!-- section-top 시작 -->
				<div class="section-top">
					나의 정보 관리
				</div>
				<!-- section-top 끝 -->
				
				<!-- section-center 시작 -->
				<div class="section-center">
					
					<div class="left">
						<div class="user-name"><b><%=memVo.getMem_name() %></b> 님</div>
						<div class="user-img">
  							<img src="<%=request.getContextPath()%>/userImgView.do?mem_id=<%=mem_id%>" alt="">
						</div>
						<div class="set-btn">
							<form id="uploadForm">
								<label id="uploadLabel" class="img-insert">등록</label>
								<input type="file" name="file" id="file" accept="image/*">
							</form>
							<button type="button" id="deleteImg" class="img-trash">
								<img alt="사진삭제이미지" src="http://localhost/university/mypage/img/trash.png">
							  	삭제
 							</button>
						</div>
						<div class="img-info">사진파일을 등록해주세요</div>
					</div>
					
					<div class="right">
						
						<!-- list-item 시작 -->
						<div class="list-item">
					  		<div class="item-title">
					  			회원정보
					  		</div>	
					  		<div class="item-content">
					  			<div class="item">
						  			<label>아이디</label>
						  			<input type="text" name="id" id="id" disabled>
					  			</div>
					  			<div class="item">
					  				<label>비밀번호</label>
					  				<div class="btns">
							  			<button type="button" class="searchPw" id="pwBtn">
							  				<img alt="비밀번호변경이미지" src="http://localhost/university/mypage/img/lock.png">
							  				비밀번호 변경
							  			</button>
						  			</div>
					  			</div>
					  		</div>		
						</div>
	                  	<!-- list-item 끝 -->
						
						<!-- list-item 시작 -->
						<div class="list-item">
					  		<div class="item-title">
					  			개인정보
					  		</div>	
					  		<div class="item-content">
					  			<div class="item">
						  			<label>이름</label>
						  			<input type="text" name="name" id="name" disabled>
					  			</div>
					  			<div class="item">
						  			<label>생년월일</label>
						  			<input type="text" name="bir" id="bir" disabled>
					  			</div>
					  			<div class="item">
						  			<label>성별</label>
						  			<input type="text" name="gen" id="gen" disabled>
					  			</div>
					  			<div class="item">
						  			<label>휴대폰</label>
						  			<input type="text" name="tel" id="tel">
					  			</div>
					  			<div class="item">
						  			<label>이메일</label>
						  			<input type="email" name="email" id="email">
					  			</div>
					  			<div class="item">
						  			<label>주소</label>
						  			<input type="text" name="zip" id="zip">
					  			</div>
					  		</div>
						</div>
	                  	<!-- list-item 끝 -->
						
						<!-- list-item 학사정보 시작 -->
						<div class="list-item">
					  		<div class="item-title">
					  			학사정보
					  		</div>	
					  		<div class="item-content">
					  		<!-- 학 -->
					  		<% if(memVo.getMem_grantno()==1){ %>
					  			<div class="item">
						  			<label>학과</label>
						  			<input type="text" name="stu_major" id="stu_major" disabled>
					  			</div>
					  			<div class="item">
						  			<label>학년</label>
						  			<input type="text" name="stu_grade" id="stu_grade" disabled>
					  			</div>
					  			<div class="item">
						  			<label>학과번호</label>
						  			<input type="text" name="stu_id" id="stu_id" disabled>
					  			</div>
					  			<div class="item">
						  			<label>입학일</label>
						  			<input type="text" name="enter_date" id="enter_date" disabled>
					  			</div>
					  			<div class="item">
						  			<label>졸업일</label>
						  			<input type="text" name="graduate_date" id="graduate_date" disabled>
					  			</div>
					  		<!--  교수 -->	
					  		<% } else if(memVo.getMem_grantno()==2){ %>
					  			<div class="item">
						  			<label>학과</label>
						  			<input type="text" name="pro_major" id="pro_major" disabled>
					  			</div>
					  			<div class="item">
						  			<label>고용상태</label>
						  			<input type="text" name="pro_type" id="pro_type" disabled>
					  			</div>
					  		<!-- 관리자 -->
					  		<% } else if(memVo.getMem_grantno()==3){ %>
					  			<div class="item">
						  			<label>고용상태</label>
						  			<input type="text" name="adm_type" id="adm_type" disabled>
					  			</div>					  		
					  		<% } %>	
					  		
					  		</div> 
						</div>
	                  	<!-- list-item 끝 -->
						
					</div>
					
				</div>					
				<!-- section-center 끝 -->
				
			</div>
			<!-- section-content 끝 -->

			<div class="table-bottom">	
				<button type="button" class="save-btn" onclick="saveBtn()">저장</button>
			</div>
			 
		</section>
		<!-- section 끝 -->
		
	</div>
	<!-- container-right 끝 -->
	
</div>
<!-- container 끝 -->
</body>
</html>
</html>