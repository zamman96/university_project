/**
 * 
 */

function today(){
	const today = new Date();
	
	const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더합니다.
    const day = String(today.getDate()).padStart(2, '0'); // 일이 한 자리수일 때 앞에 0을 추가합니다.

	// YYYY-MM-DD 형식으로 문자열을 만듭니다.
    attend_date = `${year}-${month}-${day}`;
	$('#today').val(attend_date);
}

/* 수강하는 학생정보받기 */
function stuList(){
	$.ajax({
		url : `${path}/attendList.do`,
		data : JSON.stringify(avo),
		dataType : "json",
		type : "post",
		success : function(data){
			let code = `
			<div class="modal1-wrap-title">출석 정보</div>
			<div class="table-wrap"><table border="1">
			<thead>
			<tr>
				<th>학번</th>
				<th>힉과이름</th>
				<th>이름</th>
				<th>학년</th>
				<th>성별</th>
				<th>생년월일</th>
				<th>전화번호</th>
				<th><button type="button" id="attendBtn">출석</button></th>
				<th><button type="button" id="tardyBtn">지각</button></th>
				<th><button type="button" id="absentBtn">결석</button></th>
				<th>비고</th>
			</tr></thead><tbody>`;
			
			$.each(data, function(){
			let bir = this.mem_bir.substr(0,11);
			code+=`<tr class="stud" idx="${this.stu_id}">
			<td>${this.stu_id}</td>
			<td>${this.major_name}</td>
			<td>${this.mem_name}</td>
			<td>${this.stu_grade}</td>
			<td>${this.mem_gender}</td>
			<td>${bir}</td>
			<td>${this.mem_tel}</td>
			<td class="radioCkbox"><input type="radio" name="${this.stu_id}" class="attend radioCk" value="1"></td>
			<td class="radioCkbox"><input type="radio" name="${this.stu_id}" class="tardy radioCk" value="2"></td>
			<td class="radioCkbox"><input type="radio" name="${this.stu_id}" class="absent radioCk" value="0"></td>
			<td><input class="remark"></td>
			</tr>`;
			})
			code+=`</tbody></table>`;
			$('#stuList').html(code);
		}
	})
}

/* 이미 출석한 날짜의 수강하는 학생정보받기 */
function stuUpdateList(){
	$.ajax({
		url : `${path}/attendUpdateList.do`,
		data : JSON.stringify(avo),
		dataType : "json",
		type : "post",
		success : function(data){
			let code = `<div class="table-wrap"><table border="1">
			<thead>
			<tr>
				<th>학번</th>
				<th>힉과이름</th>
				<th>이름</th>
				<th>학년</th>
				<th>성별</th>
				<th>생년월일</th>
				<th>전화번호</th>
				<th><button type="button" id="attendBtn">출석</button></th>
				<th><button type="button" id="tardyBtn">지각</button></th>
				<th><button type="button" id="absentBtn">결석</button></th>
				<th>비고</th>
			</tr></thead><tbody>`;
			
			$.each(data, function(){
			let type = this.attend_type;
			let remarktext = this.attend_remark;
			if(typeof remarktext =='undefined'){
				remarktext = '';
			}
			let bir = this.mem_bir.substr(0,11);
			code+=`<tr class="stud ${this.stu_id}tr" idx="${this.stu_id}">
			<td>${this.stu_id}</td>
			<td>${this.major_name}</td>
			<td>${this.mem_name}</td>
			<td>${this.stu_grade}</td>
			<td>${this.mem_gender}</td>
			<td>${bir}</td>
			<td>${this.mem_tel}</td>`;
			if(type==1){
				code+=`<td class="radioCkbox"><input type="radio" name="${this.stu_id}" checked class="attend radioCk" value="1"></td>`;
			} else{
				code+=`<td class="radioCkbox"><input type="radio" name="${this.stu_id}" class="attend radioCk" value="1"></td>`;
			}
			if(type==2){
			code+=`<td class="radioCkbox"><input type="radio" name="${this.stu_id}" checked class="tardy radioCk" value="2"></td>`;
			} else{
			code+=`<td class="radioCkbox"><input type="radio" name="${this.stu_id}" class="tardy radioCk" value="2"></td>`;
			}
			if(type==0){
			code+=`<td class="radioCkbox"><input type="radio" name="${this.stu_id}" checked class="absent radioCk" value="0"></td>`;
			} else{
			code+=`<td class="radioCkbox"><input type="radio" name="${this.stu_id}" class="absent radioCk" value="0"></td>`;
			}
			code+=`<td><input class="remark" value="${remarktext}"></td>
			</tr>`;
			})
			code+=`</tbody></table></div>`;
			$('#stuList').html(code);
		}
	})
}

/* insert */
function insertAttend(){
	$.ajax({
		url : `${path}/insertAttend.do`,
		data : JSON.stringify(lvo),
		dataType : "json",
		type : "post",
		success : function(data){
			if(data>0){
				console.log("출석완료")
			}
			location.href =`http://localhost/university/lectureMain.do?subject_id=${subject_id}&year=${year}&term=${term}`;
		},
		error : function(xhr){
			console.log(xhr);
		}
	})
}

/* update */
function updateAttend(){
	$.ajax({
		url : `${path}/updateAttend.do`,
		data : JSON.stringify(lvo),
		dataType : "json",
		type : "post",
		success : function(data){
			if(data>0){
				console.log("수정완료")
			}
			location.href =`http://localhost/university/lectureMain.do?subject_id=${subject_id}&year=${year}&term=${term}`;
		},
		error : function(xhr){
			console.log(xhr);
		}
	})
	
}

/* 그날 출석부 존재 확인 후 리스트 출력 */
function attendChkList(){
	$.ajax({
		url : `${path}/attendDate.do`,
		data : JSON.stringify(avo),
		dataType : "json",
		type : "post",
		success : function(data){
			if(data==1){
				stuUpdateList();
				newAttend = "false";
				console.log(newAttend);
			} else{
				stuList();
				console.log(newAttend);
			}
		},
		error : function(xhr){
			console.log(xhr.status);
		}
	})
}

function deleteAttend(){
	$.ajax({
		url : `${path}/deleteAttend.do`,
		data : JSON.stringify(avo),
		dataType : "json",
		type : "post",
		success : function(data){
			if(data>0){
Swal.fire({
  title: "삭제 완료",
  text: "해당 날짜의 출석이 삭제되었습니다.",
  icon: "success"
});
			stuList()
			}
		},
		error : function(xhr){
			console.log(xhr);
		}
	})
}

