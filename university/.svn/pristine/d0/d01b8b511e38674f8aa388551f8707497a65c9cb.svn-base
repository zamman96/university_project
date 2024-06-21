<%@page import="com.google.gson.Gson"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사 프로그램</title>
<link rel="shortcut icon" href="http://localhost/university/global/img/favicon.png">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link rel="stylesheet" href="http://localhost/university/global/global.css" />
<link rel="stylesheet" href="http://localhost/university/global/reset.css" />
<link rel="stylesheet" href="http://localhost/university/layout/common.css" />
<link rel="stylesheet" href="http://localhost/university/mypage/css/pwChange.css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%
	MemberVO memVo = (MemberVO)session.getAttribute("login");
%>
</head>

<script type="text/javascript">
mem_id = '<%=memVo.getMem_id()%>';
const data = {};
const newdata = {};

const pwChk = () => {
	data.mem_id = mem_id;
	data.mem_pass = $('#pw1').val();
	
	$.ajax({
	    url: `/university/member/pwChk.do`,
	    type: 'post',
	    data: JSON.stringify(data),
	    contentType: 'application/json; charset=utf-8',
	    success: function(res){
	    	
	    	if(res.flag=="실패"){
	    		Swal.fire({
	                text: "비밀번호를 잘못 입력하셨습니다",
	                icon: "warning"
	            });
	            $("#pw1").val('');
	            return;
	    	}
	    	
	    	// 인풋박스 활성화
	    	if(res.flag=="성공"){
		    	$('#pw2, #pw3').prop('disabled', false);
	    	}
	    	
	    	// 저장 버튼 클릭 시
	    	$('.save-btn').on('click', function(){
	    		oldPw = $('#pw1').val();
	    		newPw = $('#pw2').val();
	    		newChk = $('#pw3').val();
	    		
	    		if(newPw!=newChk){
	    			Swal.fire({
	    	            text: "비밀번호 확인이 틀렸습니다",
	    	            icon: "warning"
	    	        });
	    	        $("#pw2, #pw3").val('');
	    	        return;
	    		}
	    		
	    		if(oldPw==newPw){
	    			Swal.fire({
	    	            text: "기존 비밀번호와 다른 비밀번호를 입력하세요",
	    	            icon: "warning"
	    	        });
	    	        $("#pw2, #pw3").val('');
	    	        return;
	    		}
	    		
	    		// 변경된 비밀번호 저장 js 호출
	    		memPwChange();
	    	})
	    	
	    },
	    error: function(xhr){
	    	console.log("오류 : ", xhr.status);
	    	Swal.fire({
                text: "비밀번호를 입력하세요",
                icon: "warning"
            });
            $("#pw1").val('');
	    },
	    dataType: 'json' // 응답 데이터 타입 설정
	})	
};

const memPwChange = () => {
	newdata.mem_id = mem_id;
	newdata.mem_pass = $('#pw3').val();
	
	console.log(newdata);
	
	$.ajax({
	    url: `/university/member/memPwChange.do`,
	    type: 'post',
	    data: JSON.stringify(newdata),
	    contentType: 'application/json; charset=utf-8',
	    success: function(res){
	    	console.log(res);
	    	
	    	if(res.flag=="실패"){
	    		Swal.fire({
	                text: "비밀번호 수정에 실패했습니다",
	                icon: "warning"
	            })
	            $("#pw2").val('');
	            $("#pw3").val('');
	            return;
	    	}
    		
    		window.close();
	    },
	    error: function(xhr){
	        console.log(xhr.status);
	        Swal.fire({
                text: "비밀번호 수정에 실패했습니다",
                icon: "warning"
            })
            $("#pw2").val('');
            $("#pw3").val('');
            return;
	    },
	    dataType: 'text' // 응답 데이터 타입 설정
	});
	
};

</script>

<body>
<!-- list-item 시작 -->
<div class="list-item">
	<div class="item-title">
		비밀번호 변경
	</div>	
	<div class="item-content">
		<div class="item">
			<div class="input-box">
				<label>현재 비밀번호</label>
				<input type="password" name="pw1" id="pw1">
			</div>
			<div class="btns">
 			<button type="button" class="pwChk" onclick="pwChk()">
 				<img alt="비밀번호이미지" src="http://localhost/university/mypage/img/shield-tick.png">
 				비밀번호 확인
 			</button>
			</div>
		</div>
		<div class="item">
			<label>새로운 비밀번호</label>
			<input type="password" name="pw2" id="pw2" disabled>
		</div>
		<div class="item">
			<label>비밀번호 확인</label>
			<input type="password" name="pw3" id="pw3" disabled>
		</div>
	</div>	
	<div class="item-bottom">	
		<button type="button" class="save-btn">저장</button>
	</div>	
</div>
<!-- list-item 끝 -->
</body>
</html>