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
<link rel="stylesheet" href="<%=request.getContextPath() %>/global/global.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/global/reset.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/layout/common.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/board/css/board-1-detail.css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script src="http://localhost/university/board/js/board.js"></script>
<%
	MemberVO memVo = (MemberVO)session.getAttribute("login");
	
	Gson gson = new Gson();
	String json = gson.toJson(memVo);
	
 	request.setCharacterEncoding("UTF-8");
	int board_id = Integer.parseInt(request.getParameter("board_id"));
	String board_type = request.getParameter("board_type");
%>
<script type="text/javascript">
path='<%=request.getContextPath()%>';
uvo = <%=json%>;
board_id=<%=board_id%>;
board_type='<%=board_type%>';
reply_id = '';
$(function(){
	updateHit();
	replyView();
	$('#delete').on('click',function(){
		deleteBoard();
	})
	$('#update').on('click',function(){
		location.href="http://localhost/university/board/board-update.jsp?board_id="+board_id+"&board_type="+board_type;
	})
	
	// 삽입
	$('#replyInsert').on('click',function(){
		insertForm();
		$('#replyInsert').hide();
	})
	$(document).on('click','#replyInsertComplete',function(){
		insertReply();
	})
	$(document).on('click','#replyInsertCancel, #replyUpdateCancel',function(){
		replyView();
	})
	
	
	// 업데이트
	$('#replyUpdate').on('click',function(){
		$('#replyUpdate').hide();
		$('#replyDelete').hide();
		updateForm();
	})
	$(document).on('click', '#replyUpdateComplete',function(){
		updateReply();
	})
	$('#replyDelete').on('click',function(){
		deleteReply();
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
<% 
	if(board_type.equals("0")){// 공지
		%> 
				<a href="http://localhost/university/board/notice-board.jsp">공지게시판</a>
		<%
	} else {// 문의
		%>
				<a href="http://localhost/university/board/qa-board.jsp">문의게시판</a>
		<%
	}
%>
				</div>

					<div class="section-top-right">
						<button class="btn" id="update" type="button">
							<img alt="버튼이미지" src="<%=request.getContextPath() %>/board/img/fen.png">글 수정
						</button>
						<button class="btn" type="button" id="delete">
							<img alt="버튼이미지" src="<%=request.getContextPath() %>/board/img/trash.png">글 삭제
						</button>
					</div>
				</div>
				<!-- section-top 끝 -->
				
				<!-- section-center 시작 -->
				<div class="section-center">
					
					<!-- table-top 시작 -->
					<div class="table-top">
				  		게시글 조회		
					</div>
                  	<!-- table-top 끝 -->
					
					<!-- table-container 시작 -->
					<div class="table-container">
						<table id="table">
							<tr>
								<th>제목</th>
								<td id="title" colspan="5"></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td id="writer"></td>
								<th>조회수</th>
								<td id="hit"></td>
								<th>날짜</th>
								<td id="date"></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="5" id="file"></td>
							</tr>
							<tr>
								<td colspan="6" id="content"></td>
							</tr>
						</table>
						
					</div>
					<!-- table-container 끝 -->
					<br><br>
<%
	if(board_type.equals("1")){
%>
					<!-- 답변 -->
					<div id="reply">
						<!-- table-top 시작 -->
							<div class="table-top">
				  				<div id="replyTitle">답변</div>
<% if(memVo.getMem_grantno()==3){
	%>
	
				  	<div class="reply-admin">
						<button class="btn" id="replyInsert" type="button" class="reply-btn">
							<img alt="버튼이미지" src="<%=request.getContextPath() %>/board/img/fen.png">답변작성
						</button>
						<button class="btn" id="replyUpdate" type="button" class="reply-btn">
							<img alt="버튼이미지" src="<%=request.getContextPath() %>/board/img/fen.png">답변수정
						</button>
						<button class="btn" id="replyDelete" type="button" class="reply-btn">
							<img alt="버튼이미지" src="<%=request.getContextPath() %>/board/img/trash.png">답변삭제
						</button>
					</div> 		
	<%
}
 %>
						</div>
                  		<!-- table-top 끝 -->
					
						<!-- table-container 시작 -->
						<div class="table-container reply-container">
							<table id="table">
								<tr>
									<th>작성자</th>
									<td id="rwrite"></td>
									<th>날짜</th>
									<td id="rdate"></td>
								</tr>
								<tr>
									<td colspan="4" id="rcont"></td>
								</tr>
							</table>
							
					</div>
					<!-- table-container 끝 -->
					</div>
					<!-- 답변 종료 -->
<%
	}
%>
					
					<div class="table-bottom">	
<% 
	if(board_type.equals("0")){// 공지
		%> 
						<button type="button" class="move-btn" onclick="location.href='<%=request.getContextPath() %>/board/notice-board.jsp'">메인</button>
		<%
	} else {// 문의
		%>
						<button type="button" class="move-btn" onclick="location.href='<%=request.getContextPath() %>/board/qa-board.jsp'">메인</button>
		
		<%
	}
%>
					</div>
					<!-- table-bottem 끝 -->
					
				</div>
				<!-- section-center 끝 -->
				
			</div>
			<!-- section-content 끝 -->
			 
		</section>
		<!-- section 끝 -->
	</div>
	<!-- container-right 끝 -->
	<span hidden id="mem_id"></span>
</div>
<!-- container 끝 -->
</body>
</html>