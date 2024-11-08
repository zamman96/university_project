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
	
	int board_id = Integer.parseInt(request.getParameter("board_id"));
	String board_type = request.getParameter("board_type");
%>
<script type="text/javascript">
uvo = <%=json%>;
path='<%=request.getContextPath()%>';
board_id=<%=board_id%>;
board_type='<%=board_type%>';
file_chk = "false"; // 기존파일 삭제 체크
file_upload = "false"; // 업로드
function fileUpload(a){
	$("#filename").text(a.files[0].name);
	$("#filereset").css('display', 'inline');
	file_upload = "true";
}
function fileDelete(){
	$('#file').val('');
	$("#filename").text('');
	$("#filereset").css('display', 'none');
	file_chk = "true";
	if(file_upload=="true"){
		file_upload="false";
	}
}
$(function(){
	updateDetailBoard();
	
	$('.move-btn').on('click',function(){
		formData = new FormData();
		formData.append('board_id', board_id);
		formData.append('board_type', board_type);
		formData.append('board_title', $('#title').val());
		formData.append('board_content', $('#content').val());
		formData.append('fileChk', file_chk);
		formData.append('fileUpload', file_upload);
		formData.append('file_old',$('#filesave').text());
		if(file_chk=="true"&& $('#filename').text()!=''){
			formData.append('board_file', $('#file')[0].files[0]);
			formData.append('file_name', $('#filename').text());
		}
		console.log(formData);
		updateBoard();
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
				<a href="http://localhost/university/board/qd-board.jsp">문의게게시판</a>
		<%
	}
%>
					</div>
					<div class="section-top-right">
						<button class="btn" type="button">
							<img alt="버튼이미지" src="<%=request.getContextPath() %>/board/img/fen.png">글 수정
						</button>
						<button class="btn" type="button">
							<img alt="버튼이미지" src="<%=request.getContextPath() %>/board/img/trash.png">글 삭제
						</button>
					</div>
				</div>
				<!-- section-top 끝 -->
				
				<!-- section-center 시작 -->
				<div class="section-center">
					
					<!-- table-top 시작 -->
					<div class="table-top">
				  		수정하기 			
					</div>
                  	<!-- table-top 끝 -->
					
					<!-- table-container 시작 -->
					<div class="table-container">
					
					<!-- 수정시 삭제 됨 -->
						<table id="table">
							<tr>
								<th>제목</th>
								<td><input type="text" id="title" class="text-input" placeholder="입력해주세요"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea rows="5" id="content" cols="1" spellcheck="false"></textarea></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td>
									<form action="" 
											method="post" enctype="multipart/form-data">
										<label for="file" class="file-btn">파일선택</label>
										<input type="file" name="file" id="file" onchange="fileUpload(this)">
										<span id="filename"></span> <span id="filereset" onclick="fileDelete()">삭제</span>
									</form>
									<span id="filesave" hidden></span>
								</td>
							</tr>
						</table>
						
					</div>
					<!-- table-container 끝 -->
					
					<div class="table-bottom">	
						<button type="button" class="move-btn">완료</button>
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