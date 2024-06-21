<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="member.vo.MemberVO"%>
<%@page import="com.google.gson.Gson"%>
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
<link rel="stylesheet" href="http://localhost/university/board/css/board-1.css" />
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/global/js/jquery.serializejson.min.js"></script>
<script src="http://localhost/university/board/js/board.js"></script>

<%
	MemberVO memVo = (MemberVO)session.getAttribute("login");
	
	Gson gson = new Gson();
	String json = gson.toJson(memVo);
	
	
%>
<script type="text/javascript">
uvo = <%=json%>
path='<%=request.getContextPath()%>';
board_type = '0';	// 공지사항
currentPage=1;
let num = 1;

$(function(){
	listPerPage();
	//검색
	$('#search').on('click',function(){
		let name = $('#selected').val();
		$('#search-text').attr('name', name);
		currentPage=1;
		listPerPage();
	})
	
	//페이지번호 클릭이벤트
	$(document).on('click','.pageno',function(){
		currentPage=parseInt($(this).text());
		num = 8*(currentPage-1)+1;
		listPerPage();
	})
	
	
	//다음버튼 클릭이벤트
	$(document).on('click','#next',function(){
		currentPage=parseInt($('.pageno').last().text())+1;
		num = 8*(currentPage-1)+1;
		listPerPage();
	})
		
	
	//이전버튼 클릭이벤트
	$(document).on('click','#prev',function(){
		currentPage=parseInt($('.pageno').first().text())-1;
		num = 8*(currentPage-1)+1;
		listPerPage();
	})
	
	//글쓰기 버튼
	$(document).on('click','.btn',function(){
		console.log("dd");
		if(uvo==null){
			alert("로그인후 사용가능합니다")
			return;	
		}else{
			location.href='http://localhost/university/board/board-insert.jsp?board_type='+board_type;
		}
		
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
						<a href="http://localhost/university/board/notice-board.jsp">공지게시판</a>
					</div>
					<div class="section-top-right">
					<%if(memVo.getMem_grantno()==3){ %>
						<button class="btn" type="button">
							<img alt="버튼이미지" src="http://localhost/university/board/img/fen.png">글 작성
						</button>
					<% }%>
					</div>
				</div>
				<!-- section-top 끝 -->
				
				<!-- section-center 시작 -->
				<div class="section-center">
					
					<!-- list-top 시작 -->
					<div class="list-top">

						<div class="list-top-left"></div>
						
  
						<form id="searchf">
						<div class="list-top-right">
							<div class="select-box">
								<!-- 전체 <img class="icon-20" alt="select icon" src="http://localhost/university/board/student-list/img/img/vuesaxoutlinearrowdown.svg"/> -->
									<select id="selected" class="search-select" name="search-select" size="1">
 									<option value="board_title">제목</option>
 									<option value="board_content">내용</option>
 									<option value="mem_name">작성자</option>
									</select>
							</div>
					    	<!-- <div class="text6">검색어를 입력하세요</div> -->
							<div class="search-box">
								<input class="search-input" type="text" placeholder="검색어를 입력하세요" id="search-text">
							    <img class="icon-20 search-btn" id="search" alt="search icon" src="http://localhost/university/board/student-list/img/solidinterfacesearch.svg"/> 
							</div>
						
						</div>
						</form>
  					
					</div>
                  	<!-- list-top 끝 -->
					
					<!-- list-container 시작 -->
					<!-- 게시판 출력될곳 -->
					<div id="result"></div>
					<!-- list-container 끝 -->
				
					<!-- 페이지네이션 시작 -->
					<div class="pagination-wrap">
					</div>
					<!-- 페이지네이션 끝 -->
				
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