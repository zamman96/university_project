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
<link rel="stylesheet" href="http://localhost/university/login/css/login.css" />
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/login/js/login.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="http://localhost/university/main/js/board.js"></script>
<script>
path = "<%=request.getContextPath()%>";

$(function(){
 	LoginNotiBoard();
	$('#login-a').on('click',function(){
		console.log('login');
		vid = $('#id').val().trim();
		vpw = $('#pw').val().trim();
		
		if(vid==""){
	        Swal.fire({
	            icon: 'error',
	            title: '로그인 실패.',
	            text: '아이디를 입력해주세요.', 
	        });
	        
		}
		
		if(vpw==""){
	        Swal.fire({
	            icon: 'error',
	            title: '로그인 실패.',
	            text: '비밀번호를 입력해주세요.',
	        });
		}
		
		login();
	});	
});

</script>
</head>
<body>


<!-- container 시작 -->
<div id="container">
	
	<!-- left 시작 -->
	<div class="left">
		<img class="logo" alt="로고이미지" src="http://localhost/university/login/img/logo.png">
		<div class="map">
			<img alt="로고이미지" src="http://localhost/university/login/img/map.png">캠퍼스맵 
		</div>
		<div class="call">
			<img alt="전화번호" src="http://localhost/university/login/img/call.png">전화번호
		</div>
		<div class="instar">
			<img alt="인스타그램" src="http://localhost/university/login/img/instagram.png">인스타그램
		</div>
		<div class="youtube">
			<img alt="유투브" src="http://localhost/university/login/img/youtube.png">유투브
		</div>
	</div>
	<!-- left 끝 -->
	
	<!-- center 시작 -->
	<div class="center">
		<div class="notice-title">NOTICE</div>
		<div class="notice-items">
			
		</div>
	</div>
	<!-- center 끝 -->
		
	<!-- right 시작 -->
	<div class="right">
		<div class="login-title">LOGIN</div>
		<form id="login-input">
			<input type="text" id="id" name="id" placeholder="아이디 입력">
			<input type="password" id="pw" name="pw" placeholder="패스워드 입력">
		</form>
		<div class="login-btn">
			<a href="#" id="login-a"><img alt="로그인이미지" src="http://localhost/university/login/img/login.png"></a>
		</div>
		<div class="login-find">
			로그인 정보를 잊으셨나요?
			<a href="http://localhost/university/login/findpw.jsp" id="findpw" class="link" href="#none">패스워드 찾기</a>
		</div>
	</div>
	<!-- right 끝 -->
	

</div>
<!-- container 끝 -->

</body>
</html>