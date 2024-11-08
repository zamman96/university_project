<%@page import="com.google.gson.Gson"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="http://localhost/university/main/css/admin-main.css" />
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/main/js/timetable.js"></script>
<script src="http://localhost/university/main/js/board.js"></script>
<%
	MemberVO memVo = (MemberVO)session.getAttribute("login");
	
	Gson gson = new Gson();
	String json = gson.toJson(memVo);
	String mem_id = memVo.getMem_id();
%>
</head>
<script>

/* 전역변수 선언 위치 */
path = '<%=request.getContextPath()%>';
uvo = <%=json%>
/* js 호출 위치 */
$(function(){
	
	// 학적 변동 알림
	Alarm();
	
	// notification(공지), question(문의) 게시판 (240614 정기쁨 작성)
	MainNotiBoard();
	MainQuestBoard();
	
	//글쓰기 버튼
	$(document).on('click','.btn',function(){
		console.log("dd");
		if(uvo==null){
			alert("로그인후 사용가능합니다")
			return;	
		}else{
			location.href='http://localhost/university/board/board-insert.jsp?board_type=0';
		}
		
	})
})

const Alarm = () => {
	console.log('Alarm');
	$.ajax({
		url: "/university/alarm.do",
		type : 'post',
		success : function(res){
			//console.log(res);
			//reg_type = '휴학'
			//apply_type = 0
			hcnt=0;
			bcnt=0;
			jcnt=0;
			
			$.each(res, function(i, v){
				
				if(v.reg_type=="휴학" && v.apply_type==0){
					hcnt++;
				} else if(v.reg_type=="복학" && v.apply_type==0){
					bcnt++;
				} else if(v.reg_type=="자퇴" && v.apply_type==0){
					jcnt++;
				}
				
			});
			
			$('.h-list').text(hcnt);
			$('.b-list').text(bcnt);
			$('.j-list').text(jcnt);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

</script>
<body>
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
					<div class="section-top-left">
						<div class="user-img">
							<img src="<%=request.getContextPath() %>/userImgView.do?mem_id=<%=mem_id%>" alt="">
						</div>
						<div class="user-info">
							<div class="user-name"><b><%=memVo.getMem_name() %></b>님 환영합니다!</div>
							<div class="user-belong">
								<div>관리자</div>
							</div>
						</div>
					</div>
					<div class="section-top-right">
						<button class="btn" type="button">
							<img alt="버튼이미지" src="http://localhost/university/main/img/message2.png">
							공지등록
						</button>
					</div>
				</div>
				<!-- section-top 끝 -->
				
				<!-- section-center 시작 -->
				<div class="section-center">
					
					<!-- section-center-left 시작 -->
					<div class="section-center-left">
					
						<!-- 알림 시작 -->
						<div class="alarm">
							<div class="section-title">
								<div class="icon-section">
									<div class="alarm-img"><img alt="아이콘" src="http://localhost/university/main/img/notification.png"></div>
									알림
								</div>
							</div>
							<div class="alarm-items">
								<div class="alarm-item">
									<a href="<%=request.getContextPath()%>/reg_typeChangeList.do">
										휴학신청 <span class="h-list"></span>
									</a>
								</div>
								<div class="alarm-item">
									<a href="<%=request.getContextPath()%>/reg_typeChangeList2.do">
										복학신청 <span class="b-list"></span>
									</a>
								</div>
							</div>
						</div>
						<!-- 알림 끝 -->
					
						<!-- 학생관리 시작 -->
						<div class="student">
							<div class="section-title">
								<div class="icon-section">
									<div class="student-img"><img alt="아이콘" src="http://localhost/university/main/img/user-tag.png"></div>
									학생관리
								</div>
							</div>
							<div class="link-lists">
								<div class="link-list">
									<div class="link-box" onclick="">
										<div class="link-list-img img1">
											<img alt="수강신청관리이미지" src="http://localhost/university/main/img/book.png">
										</div>
										수강신청관리
									</div>
									<div class="link-box" onclick="location.href=''">
										<div class="link-list-img img2">
											<img alt="성적조회이미지" src="http://localhost/university/main/img/award.png">
										</div>
										성적조회
									</div>
								</div>
								<div class="link-list">
									<div class="link-box" onclick="location.href=''">
										<div class="link-list-img img3">
											<img alt="등록금조회이미지" src="http://localhost/university/main/img/wallet.png">
										</div>
										등록금조회
									</div>
									<div class="link-box" onclick="location.href='<%=request.getContextPath()%>/searchStuChangeList.do'">
										<div class="link-list-img img4">
											<img alt="학적관리이미지" src="http://localhost/university/main/img/file-user.png">
										</div>
										학적관리
									</div>
								</div>
							</div>
						</div>
						<!-- 학생관리 끝 -->
						
						<!-- 강의관리 시작 -->
						<div class="lecture">
							<div class="section-title">
								<div class="icon-section">
									<div class="lecture-img"><img alt="아이콘" src="http://localhost/university/main/img/book-saved.png"></div>
									강의관리
								</div>
							</div>
							<div class="link-lists">
								<div class="link-list">
									<div class="link-box" onclick="location.href='http://localhost/university/admin/lecture/subjectList.jsp'">
										<div class="link-list-img img5">
											<img alt="과목조회이미지" src="http://localhost/university/main/img/book2.png">
										</div>
										과목조회
									</div>
									<div class="link-box" onclick="location.href='http://localhost/university/admin/lecture/lectureList.jsp'">
										<div class="link-list-img img6">
											<img alt="강의조회이미지" src="http://localhost/university/main/img/pen.png">
										</div>
										강의조회
									</div>
								</div>
							</div>
						</div>
						<!-- 강의관리 끝 -->
						
					</div>
					<!-- section-center-left 끝 -->
					
					<!-- section-center-right 시작 -->
					<div class="section-center-right">
						<div class="board notification">
							<div class="section-title">
								<div class="icon-section">
									<div class="notification-img"><img alt="아이콘" src="http://localhost/university/main/img/message.png"></div>
									공지사항
								</div>
								<div class="plus-section">
									<a href="http://localhost/university/board/notice-board.jsp">더보기 <img alt="아이콘" src="http://localhost/university/main/img/plus.png"></a>
								</div>
							</div>
							<div class="content-items">
								
							</div>
						</div>
						<div class="board question">
							<div class="section-title">
								<div class="icon-section">
									<div class="question-img"><img alt="아이콘" src="http://localhost/university/main/img/message.png"></div>
									문의사항
								</div>
								<div class="plus-section">
									<a href="http://localhost/university/board/qa-board.jsp" id="qaboard">더보기 <img alt="아이콘" src="http://localhost/university/main/img/plus.png"></a>
								</div>
							</div>
							<div class="content-items">
								
							</div>
						</div>
					</div>
					<!-- section-center-right 끝 -->
					
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