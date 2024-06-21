/**
 * 
 */

function login(){
	$.ajax({
		url : `${path}/member/login.do`,
		type : "POST",
		data : { id : vid,
				pw : vpw },
		success : function(data){
			if(data==1){
				location.href = `${path}/main/student-main.jsp`;
				return false;
			}else if(data==2){
				location.href = `${path}/main/professor-main.jsp`;
				return false;
			}else if(data==3){
				location.href = `${path}/main/admin-main.jsp`;
				return false;
			}
			Swal.fire({
	            icon: 'error',
	            title: '로그인 실패.',
	            text: data,
	        });
		},
		error : function(xhr){
			console.log("오류 코드 : "+xhr.status);
		},
		dataType : "html"
	})
}