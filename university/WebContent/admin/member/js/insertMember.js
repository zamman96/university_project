/**
 * 
 */
/* 파일 받는 메서드 */
function excel(){
	 $.ajax({
        url: `${path}/excelMember.do`, // 서블릿 URL
        type: 'POST',
        data: formData,
        processData: false, // 파일 데이터를 전송할 때 필요
        contentType: false, // 파일 데이터를 전송할 때 필요
		dataType : "json",
        success: function(data) {

		let code = `<div class="table-wrap"><table border="1">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>생일</th>
			<th>성별</th>
			<th>주소</th>
			<th>전화번호</th>
			<th>이메일</th>
		</tr>`;
		
		$.each(data,function(){
			code+=`<tr class='studentlist'>
			<td><input type="text" id="id" value="${this.mem_id}"></td>
			<td><input type="text" id="pw" value="${this.mem_pass}"></td>
			<td><input type="text" id="name" value="${this.mem_name}"></td>
			<td><input type="date" id="bir" value="${this.mem_bir}"></td><td>`;
			code+=`<select id="gender">`;
			if(this.mem_gender=='여'){
				code+=`<option value="여" selected>여</option>`;
				code+=`<option value="남">남</option>`;
			}else{
				code+=`<option value="여">여</option>`;
				code+=`<option value="남" selected>남</option>`;
			}
			code+=`</select></td>
			<td><input type="text" id="add" value="${this.mem_add}"></td>
			<td><input type="text" id="tel" value="${this.mem_tel}"></td>
			<td><input type="text" id="mail" value="${this.mem_mail}"></td>
			</tr>
			`;
		})	
		code+=`</table></div>`;
		$('#mul-stu-list').html(code);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                alert('파일 업로드 실패: ' + textStatus);
            }
        });
}

function insertStudent(){
	$.ajax({
		url : `${path}/insertStudent.do`,
		type : "post",
		data : JSON.stringify(svo),
		success : function(data){
//			console.log(data);
			Swal.fire({
  title: "회원 추가 완료",
  text: "데이터를 추가 완료 했습니다",
  icon: "success"
});
document.getElementById("singlef").reset();
		}
	})
}
function insertProfessor(){
	$.ajax({
		url : `${path}/insertProfessor.do`,
		type : "post",
		data : JSON.stringify(pvo),
		success : function(data){
//			console.log(data);
			Swal.fire({
  title: "회원 추가 완료",
  text: "데이터를 추가 완료 했습니다",
  icon: "success"
});
document.getElementById("singlef").reset();
		}
	})
}
function insertAdmin(){
	$.ajax({
		url : `${path}/insertAdmin.do`,
		type : "post",
		data : JSON.stringify(avo),
		success : function(data){
//			console.log(data);
			Swal.fire({
  title: "회원 추가 완료",
  text: "데이터를 추가 완료 했습니다",
  icon: "success"
});
document.getElementById("singlef").reset();
		}
	})
}

function stu_id(){
	let stu = {
		year : $('#year').val(),
		major_id : $('#mid').val()
	}
//	console.log(stu);
	$.ajax({
		url : `${path}/createStuId.do`,
		type : "post",
		data : stu,
		success : function(data){
//			console.log(data);
			$('#single_id').val(data);
		},
		dataType : "html"
	})
}
function pro_id(){
	let imajor = $('#mid').val();
	$.ajax({
		url : `${path}/createProId.do`,
		type : "post",
		data : {major_id : imajor},
		success : function(data){
			console.log(data);
			$('#single_id').val(data);
		},
		dataType : "html"
	})
}
function adm_id(){
	let imail = $('#single_mail').val().trim();
	$.ajax({
		url : `${path}/createAdmId.do`,
		type : "post",
		data : {mem_mail : imail},
		success : function(data){
//			console.log(data);
			$('#single_id').val(data);
		},
		dataType : "html"
	})
}