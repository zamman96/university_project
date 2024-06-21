/**
 * 1. 회원 정보에 맞는 input 값을 출력
 * 2. 회원 이미지를 등록 및 삭제 하는 이벤트를 담당
 */

$(function(){
	// 인풋에 값 넣기 이벤트 시작
	// 날짜 형식
	bir = uvo.mem_bir.substring(0, 10);
	
	if(uvo.enter_date==undefined){
		enter_date = "";
	} else {
		enter_date = uvo.enter_date.substring(0, 10);
	}
	
	if(uvo.graduate_date==undefined){
		graduate_date = "";
	} else {
		graduate_date = uvo.graduate_date.substring(0, 10);
	}
	
	// 교수 및 관리자 재직상태
	type = "";
	if(uvo.pro_type==1 || uvo.adm_type==1) {
		type+="재직"
	} else {
		type+="퇴직"
	}

	// 회원정보 값 넣기
	$('#id').val(uvo.mem_id);

	// 개인정보 값 넣기
	$('#name').val(uvo.mem_name);
	$('#bir').val(bir);
	$('#gen').val(uvo.mem_gender);
	$('#tel').val(uvo.mem_tel);
	$('#email').val(uvo.mem_mail);
	$('#zip').val(uvo.mem_add);
	
	// 학사정보 값 넣기
	// 1. 학생
	$('#stu_major').val(uvo.major_name);
	$('#stu_grade').val(uvo.stu_grade);
	$('#stu_id').val(uvo.stu_id);
	$('#enter_date').val(enter_date);
	$('#graduate_date').val(graduate_date);
	
	// 2. 교수
	$('#pro_major').val(uvo.major_name);
	$('#pro_type').val(type);
	
	// 3. 관리자
	$('#adm_type').val(type);
	// 인풋에 값 넣기 이벤트 
	
	// 이미지 등록 이벤트 시작
	$("#uploadLabel").click(function() {
	    $("#file").click();
	});

	// 등록 버튼 클릭
	$("#file").change(function() {
		
		fileName = $('#file').val();

//		if(fileName.indexOf(uvo.mem_id)==-1){
//			Swal.fire({
//	                text: "파일명에 ID를 포함하여 작성해 주세요",
//	                icon: "warning"
//            })
//			return;
//		}

		var formData = new FormData($("#uploadForm")[0]);
		formData.append('mem_id', mem_id);

		$.ajax({
	        url: `${path}/file/fileupload.do`,
	        type: 'POST',
	        data: formData,
	        processData: false, // 필수: FormData를 사용할 때는 false로 설정
	        contentType: false, // 필수: FormData를 사용할 때는 false로 설정
	        success: function() {
	        	Swal.fire({
	                text: "이미지가 등록 되었습니다",
	                icon: "success"
	            }).then(function() {
	                location.reload(); // 성공 후 페이지 새로고침
	            });
	        },
	        error: function(xhr) {
	        	if (xhr.status === 409) { // 409 Conflict 에러인 경우
	                Swal.fire({
	                    text: "이미 등록된 파일입니다! 이미지 삭제 후 등록해주세요",
	                    icon: "warning"
	                });
	                $("#file").val(''); // 선택된 파일 초기화
	            } else {
	                console.error('업로드 오류:', xhr.statusText);
	            }
	        }
	    });
	});


	// 삭제 버튼 클릭
	$("#deleteImg").click(function(){
		$.ajax({
		    url: `${path}/file/filedelete.do`,
		    type: 'post',
		    data: JSON.stringify({ mem_id : mem_id }),
		    contentType: 'application/json; charset=utf-8',
		    success: function(){
		    	$(".user-img").empty();
		    },
		    error: function(xhr){
		        console.log('오류발생! >>> ' + xhr.status);
		    },
		    dataType: 'text' // 응답 데이터 타입 설정
		})	
	}); 
	
	// 비밀번호 변경 버튼 클릭
	const width = 500;
	const height = 500;
	
	let left = (document.body.offsetWidth / 2) - (width / 2);
	let tops = (document.body.offsetHeight / 2) - (height / 2);
	
	left += window.screenLeft;
	
	$('#pwBtn').click(function(){
		window.open("pwChange.jsp", "비밀변호 변경", `width=${width}, height=${height}, left=${left}, top=${tops}`);
	})

})

const saveBtn = () => {
	// 개인정보 변경 가능한 인풋값
	inputData.mem_add = $('#zip').val();
	inputData.mem_tel = $('#tel').val();
	inputData.mem_mail = $('#email').val();
	inputData.mem_id = $('#id').val();
	
	$.ajax({
	    url: `${path}/member/memInfoChange.do`,
	    type: 'post',
	    data: JSON.stringify(inputData),
	    contentType: 'application/json; charset=utf-8',
	    success: function(){
	    	Swal.fire({
	                text: "정보가 수정 되었습니다",
	                icon: "success"
            })
			
			$('#zip').val(inputData.mem_add);
			$('#tel').val(inputData.mem_tel);
			$('#email').val(inputData.mem_mail);
			
			console.log("inputData.mem_add >> ", inputData.mem_add);
			console.log("inputData.mem_tel >> ", inputData.mem_tel);
			console.log("inputData.mem_mail >> ", inputData.mem_mail);
			
	    },
	    error: function(){
	        Swal.fire({
	                text: "정보 수정에 실패했습니다",
	                icon: "warnning"
	            }).then(function() {
	                location.reload();
            });
	    },
	    dataType: 'text' // 응답 데이터 타입 설정
	})	
}

