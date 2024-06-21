/**
 * 
 */

/* 수강하는 학생정보받기 */
function stuList(){
	$.ajax({
		url : `${path}/attendList.do`,
		data : JSON.stringify(avo),
		dataType : "json",
		type : "post",
		success : function(data){
			let code = `
			<div class="modal1-wrap-title">학생 정보</div>
			<div class="table-wrap" style="text-align: center;"><table border="1">
			<thead>
			<tr>
				<th>학번</th>
				<th>힉과이름</th>
				<th>이름</th>
				<th>학년</th>
				<th>성별</th>
				<th>생년월일</th>
				<th>전화번호</th>
				<th>출석</th>
				<th>지각</th>
				<th>결석</th>
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
			<td>${this.attend_cnt}</td>
			<td>${this.tardy_cnt}</td>
			<td>${this.absent_cnt}</td>
			</tr>`;
			})
			code+=`</tbody></table>`;
			$('#stuList').html(code);
		}
	})
}
