<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
<body>
<div class="container">
	<div class="list-item">
		<div class="item-title">

		비밀번호 찾기
	
    	</div>
     <div class="item-content">
     
        <div class="itemss">
    		<div class="input-box">
            	<label for="uId" >아이디 &emsp;</label>
                <input type="text" id="uId" name="mem_id" placeholder="ID" required autofocus/>
            </div>
        </div>    
        
        <div class="itemss">
            <div class="input-box">
            	<label for="bir" >생년월일&nbsp;</label>
                <input type="text"  id="bir" name="mem_bir" placeholder="YY/MM/DD" required autofocus/>
            </div>
        </div>    
        
     </div>      
                
                
           <div class="item-bottom">	
                <label for="name" style="font-size: 1.0em;">*메일로 비밀번호가 전송됩니다.</label><br><br>
                <button type="button" class="save-btn" onclick="findPw()">확 인</button>
           </div>	
    </div>
<!--     <div id="login"> -->
<!--     		<a href="/member/login.do">로그인 </a>/ -->

<!--     </div> -->
 </div>



<script type="text/javascript">
	$(document).ready(function(){
		// 인터 키를 눌렀을 때 findPw 함수 호출
		$('#uId, #bir').keypress(function(event){
			if(event.which === 13){
				event.preventDefault(); // 폼 제출 방지
				findPw(); // findPw함수 호출
			}
		});
	});
	
    function findPw() {		// 입력값 가져오기
        var uId = $('#uId').val();
        var bir = $('#bir').val();
        
        console.log(uId, bir);
        
    	// 입력값 비어있는지 확인
    	if(uId.trim() === ''|| bir.trim() === '') {
    		alert('아이디와 주민번호를 입력해주세요.');
    		return
    	}
    	
        // 서블릿으로 AJAX 요청 보내기
        $.ajax({
            type: 'post',
            url: '<%=request.getContextPath() %>/member/findPw.do', // 비밀번호를 찾는 서블릿 경로
            data: {
                uId: uId,
                bir: bir
            },
            success: function(response) { // 서버로부터 받은 비밀번호를 표시
            	if(response.flag  == "ok"){
//             		alert('회원님의 임시 비밀번호는' + response.temp + '입니다');
            		alert('등록된 메일로 임시 비밀번호가 전송되었습니다');
            		$('#uId').val('');
            		$('#bir').val('');
             		location.href="http://localhost/university/login/login.jsp";
            	}else {
            		alert("erreor===" + response.flag);
            	} 
            },
            dataType : "json"
        });
        
    }
</script>
</body>
</html>