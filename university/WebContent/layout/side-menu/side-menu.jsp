<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학적프로그램</title>
<link rel="shortcut icon" href="http://localhost/university/global/img/favicon.png">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/global/global.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/global/reset.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/layout/side-menu/css/side-menu.css" />
<script src="http://localhost/university/layout/side-menu/js/regChk.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script src="http://localhost/university/global/js/jquery.serializejson.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<script type="text/javascript">

let isClickInProgress = false; // menuClick() 중복 방지를 위해 boolean 추가
const menuClick = param => {
	
	if (isClickInProgress) { // 기존에 menuClick() 이벤트를 초기화
    	$('.menu1').removeClass('click');
    	$('.menu1 .bottom-box').addClass('hide');
    }

	isClickInProgress = true;
	
    // 새로운 클릭 이벤트 처리
    $(param).toggleClass('click');
    $('.bottom-box', param).toggleClass('hide');
}

$(function(){
    $('#reg').on('click', function(){
	    regChkStu();
    })
})
</script>
<%
	// 세션에서 로그인 정보 가져오기
	MemberVO vo = (MemberVO) session.getAttribute("login");

	// 회원 번호로 구분
	if(vo.getMem_grantno()==1){
%>	
<body>

	<!-- 학생 -->
	<div class="side-menu student">
		<div class="logo" onclick="location.href='http://localhost/university/main/student-main.jsp'">
			<div class="logo-img">
			  <img class="dummy-icon" alt="로고" src="http://localhost/university/layout/side-menu/img/dummy.svg" />
			</div>
			<div class="logo-title">학사시스템</div>
		</div>
		<div class="side-items">
			
			<!-- 마이페이지 시작 -->
			<div class="menu1" onclick="menuClick(this)">
				<div class="top-box">
					<img class="menu1-img" alt="마이페이지" src="http://localhost/university/layout/side-menu/img/user.png"/>
					<div class="menu1-text">마이페이지</div>
				</div>
			  	<div class="bottom-box hide">
			  		<div class="link"><a href="http://localhost/university/mypage/mypage.jsp">나의 정보 관리</a></div>
					<div class="link"><a href="http://localhost/university/student/student-recode.jsp">학적 관리</a></div>
					<div class="link"><a href="#none">등록금 관리</a></div>
			  	</div>
			</div>
			<!-- 마이페이지 끝 -->
			
			<!-- 성적 시작 -->
			<div class="menu2" onclick="location.href='http://localhost/university/student/student-score.jsp'">
				<div class="top-box">
					<img class="menu2-img" alt="성적" src="http://localhost/university/layout/side-menu/img/award.png"/>
					<div class="menu2-text">성적</div>
				</div>
			</div>
			<!-- 성적 끝 -->
	
			<!-- 수업 시작 -->
			<div class="menu1" onclick="menuClick(this)">
				<div class="top-box">
					<img class="menu1-img" alt="수업" src="http://localhost/university/layout/side-menu/img/university.svg"/>
					<div class="menu1-text">수업</div>
				</div>
				<div class="bottom-box hide">
					<div class="link"><a href="http://localhost/university/admin/lecture/lectureList.jsp">강의 조회</a></div>
<!-- 					<div class="link"><a href="#none">시간표 조회</a></div> -->
			  	</div>
			</div>
			<!-- 수업 끝 -->
			
			<!-- CLASS 시작 -->
<%--			<div class="menu2" onclick="location.href='http://localhost/university/main/student-main.jsp'">
				<div class="top-box">
					<img class="menu2-img" alt="class" src="http://localhost/university/layout/side-menu/img/class.png"/>
					<div class="menu2-text">CLASS</div>
				</div>
			</div>
 --%>			<!-- CLASS 끝 -->
			
			<!-- 수강신청 시작 -->
			<div class="menu2" id="reg">
				<div class="top-box">
					<img class="menu2-img" alt="수강신청" src="http://localhost/university/layout/side-menu/img/class-apply.png"/>
					<div class="menu2-text">수강신청</div>
				</div>
			</div>
			<!-- 수강신청 끝 -->
			
			<!-- 자유게시판 시작 -->
<%--			<div class="menu2" onclick="location.href='http://localhost/university/main/student-main.jsp'">
				<div class="top-box">
					<img class="menu2-img" alt="자유게시판" src="http://localhost/university/layout/side-menu/img/invoice.png"/>
					<div class="menu2-text">자유게시판</div>
				</div>
			</div>
--%>
			<!-- 자유게시판 끝 -->
	
	    </div>
	</div>


<% } else if(vo.getMem_grantno()==2){ %>	
	
	<!-- 교수 -->
	<div class="side-menu professor">
		<div class="logo" onclick="location.href='http://localhost/university/main/professor-main.jsp'">
			<div class="logo-img">
			  <img class="dummy-icon" alt="로고" src="http://localhost/university/layout/side-menu/img/dummy.svg" />
			</div>
			<div class="logo-title">학사시스템</div>
		</div>
		<div class="side-items">
		
			<!-- 마이페이지 시작 -->
			<div class="menu2" onclick="location.href='http://localhost/university/mypage/mypage.jsp'">
				<div class="top-box">
					<img class="menu2-img" alt="마이페이지" src="http://localhost/university/layout/side-menu/img/user.png"/>
					<div class="menu2-text">마이페이지</div>
				</div>
			</div>
			<!-- 마이페이지 끝 -->

			<!-- 수업 시작 -->
			<div class="menu1" onclick="menuClick(this)">
				<div class="top-box">
					<img class="menu1-img" alt="수업" src="http://localhost/university/layout/side-menu/img/university.svg"/>
					<div class="menu1-text">수업</div>
				</div>
				<div class="bottom-box hide">
					<div class="link"><a href="http://localhost/university/admin/lecture/lectureList.jsp">강의 조회</a></div>
					<div class="link"><a href="http://localhost/university/professor/selectLecture.jsp">강의 관리</a></div>
<!-- 					<div class="link"><a href="#none">출결 관리</a></div> -->
<!-- 					<div class="link"><a href="#none">성적 관리</a></div> -->
			  	</div>
			</div>
			<!-- 수업 끝 -->
			
			<!-- CLASS 시작 -->
<%--			<div class="menu1" onclick="menuClick(this)">
				<div class="top-box">
					<img class="menu1-img" alt="CLASS" src="http://localhost/university/layout/side-menu/img/class.png"/>
					<div class="menu1-text">CLASS</div>
				</div>
				<div class="bottom-box hide">
					<div class="link"><a href="#none">수강학생 조회</a></div>
			  	</div>
			</div>
 --%>
			<!-- CLASS 끝 -->		
			
			<!-- 학과학생 시작 -->
			<div class="menu2" onclick="location.href='http://localhost/university/professor/student-list.jsp'">
				<div class="top-box">
					<img class="menu2-img" alt="학과학생" src="http://localhost/university/layout/side-menu/img/user-set.png"/>
					<div class="menu2-text">학과학생</div>
				</div>
			</div>
			<!-- 학과학생 끝 -->

	    </div>
	</div>
	
<% } else if(vo.getMem_grantno()==3){ %>

	<!-- 관리자 -->
	<div class="side-menu admin">
		<div class="logo" onclick="location.href='http://localhost/university/main/admin-main.jsp'">
			<div class="logo-img">
			  <img class="dummy-icon" alt="로고" src="http://localhost/university/layout/side-menu/img/dummy.svg" />
			</div>
			<div class="logo-title">학사시스템</div>
		</div>
		<div class="side-items">
		
			<!-- 마이페이지 시작 -->
			<div class="menu2" onclick="location.href='http://localhost/university/mypage/mypage.jsp'">
				<div class="top-box">
					<img class="menu2-img" alt="마이페이지" src="http://localhost/university/layout/side-menu/img/user.png"/>
					<div class="menu2-text">마이페이지</div>
				</div>
			</div>
			<!-- 마이페이지 끝 -->
			
			<!-- 회원 시작 -->
			<div class="menu1" onclick="menuClick(this)">
				<div class="top-box">
					<img class="menu1-img" alt="회원" src="http://localhost/university/layout/side-menu/img/user-set.png"/>
					<div class="menu1-text">회원</div>
				</div>
			  	<div class="bottom-box hide">
					<div class="link"><a href="http://localhost/university/admin/member/insertMember.jsp">회원 추가</a></div>
					<div class="link"><a href="<%=request.getContextPath()%>/getAllStudent.do">학생 조회</a></div>
					<div class="link"><a href="<%=request.getContextPath()%>/professorAllList.do">교수 조회</a></div>
			  	</div>
			</div>
			<!-- 회원 끝 -->
			
			<!-- 수업 시작 -->
			<div class="menu1" onclick="menuClick(this)">
				<div class="top-box">
					<img class="menu1-img" alt="수업" src="http://localhost/university/layout/side-menu/img/solidstatusuniversity.svg"/>
					<div class="menu1-text">수업</div>
				</div>
			  	<div class="bottom-box hide">
			  		<div class="link"><a href="http://localhost/university/admin/lecture/regPage.jsp">수강신청 관리</a></div>
					<div class="link"><a href="http://localhost/university/admin/lecture/lectureList.jsp">강의 개설</a></div>
					<div class="link"><a href="http://localhost/university/admin/lecture/subjectList.jsp">과목 관리</a></div>
			  	</div>
			</div>
			<!-- 수업 끝 -->
			
			<!-- 강의실 시작 -->
			<div class="menu2" onclick="location.href='http://localhost/university/admin/room/room.jsp'">
				<div class="top-box">
					<img class="menu2-img" alt="수업" src="http://localhost/university/layout/side-menu/img/home.png"/>
					<div class="menu2-text">강의실</div>
				</div>
			</div>
			<!-- 강의실 끝 -->
	
	    </div>
	</div>

<% } %>

</body>
</html>