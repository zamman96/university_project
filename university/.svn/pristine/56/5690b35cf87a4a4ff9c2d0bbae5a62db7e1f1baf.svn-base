/**
 * 
 */
/* 수강 추천 리스트 */
function recommendCourse(){
	$.ajax({
		url : `${path}/recommendList.do`,
		data : JSON.stringify(cvo),
		type : "post",
		dataType : "json",
		success : function(data){
//			console.log(data);

			let code = `<div class="table-wrap"><table border="1">
			<thead>
			<tr>
				<th>수강신청</th>
				<th>과목번호</th>
				<th>과목분류</th>
				<th>과목명</th>
				<th>교수</th>
				<th>시간</th>
				<th>강의실</th>
				<th>수강 가능인원</th>
				<th>현재 수강 인원</th>
				<th>학과명</th>
				<th>학년</th>
				<th>학점</th>
			</tr></thead><tbody>`;
			
			$.each(data, function(){
			if(this.current_count==this.lec_count){
			code+=`<tr>
				<td><input type="button" value="마감" class="disableCourse" name="${this.subject_id}" disabled></td>`;
			} else{
			code+=`<tr>
				<td><input type="button" value="신청" class="insertCourse" idx="${this.subject_credit}" name="${this.subject_id}"></td>`;
			}
			
			code+=`
			<td>${this.subject_type}</td>
			<td>${this.subject_id}</td>
			<td>${this.subject_name}</td>
			<td>${this.mem_name}</td>
			<td>${this.time_name}</td>
			<td>${this.room_id} ${this.room_num}호</td>
			<td>${this.lec_count}</td>
			<td>${this.current_count}</td>
			<td>${this.major_name}</td>
			<td>${this.subject_grade}학년</td>
			<td>${this.subject_credit}</td>
			</tr>`;
			})
			code+=`</tbody></table></div>`;
			$('#lectureList').html(code);
		}
	})
}

/* 수강 검색 리스트 */
function searchList(){
	fdata = $('#subf').serializeJSON();
		fdata.year = year;
		fdata.term = term;
	$.ajax({
		url : `${path}/searchList.do`,
		data : JSON.stringify(fdata),
		type : "post",
		dataType : "json",
		success : function(data){
//			console.log(data);

			let code = `<div class="table-wrap"><table border="1">
			<thead><tr>
				<th>수강신청</th>
				<th>과목번호</th>
				<th>과목분류</th>
				<th>과목명</th>
				<th>교수</th>
				<th>시간</th>
				<th>강의실</th>
				<th>수강 가능인원</th>
				<th>현재 수강 인원</th>
				<th>학과명</th>
				<th>학년</th>
				<th>학점</th>
			</tr></thead><tbody>`;
			
			$.each(data, function(){
			if(this.current_count==this.lec_count){
			code+=`<tr>
				<td><input type="button" value="마감" class="disableCourse" name="${this.subject_id}" disabled></td>`;
			} else{
			code+=`<tr>
				<td><input type="button" value="신청" class="insertCourse" idx="${this.subject_credit}" name="${this.subject_id}"></td>`;
			}
			
			code+=`
			<td>${this.subject_type}</td>
			<td>${this.subject_id}</td>
			<td>${this.subject_name}</td>
			<td>${this.mem_name}</td>
			<td>${this.time_name}</td>
			<td>${this.room_id} ${this.room_num}호</td>
			<td>${this.lec_count}</td>
			<td>${this.current_count}</td>
			<td>${this.major_name}</td>
			<td>${this.subject_grade}학년</td>
			<td>${this.subject_credit}</td>
			</tr>`;
			})
			code+=`</tbody></table></div>`;
			$('#lectureList').html(code);
		}
	})
}

/* 수강 내역 리스트 */
function courseList(){
		$.ajax({
		url : `${path}/regCourseList.do`,
		data : JSON.stringify(cvo),
		type : "post",
		dataType : "json",
		success : function(data){
//			console.log(data);

			let code = `<div class="table-wrap"><table border="1">
			<thead>
			<tr>
				<th>수강신청</th>
				<th>과목번호</th>
				<th>과목분류</th>
				<th>과목명</th>
				<th>교수</th>
				<th>시간</th>
				<th>강의실</th>
				<th>학과명</th>
				<th>학년</th>
				<th>학점</th>
			</tr>
			</thead>
			<tbody>`;
			
			$.each(data, function(){
			code+=`<tr>
			<td><input type="button" value="취소" class="deleteCourse" name="${this.subject_id}"></td>
			<td>${this.subject_id}</td>
			<td>${this.subject_type}</td>
			<td>${this.subject_name}</td>
			<td>${this.mem_name}</td>
			<td>${this.time_name}</td>
			<td>${this.room_id} ${this.room_num}호</td>
			<td>${this.major_name}</td>
			<td>${this.subject_grade}학년</td>
			<td>${this.subject_credit}</td>
			</tr>`;
			})
			code+=`</tbody></table></div>`;
			$('#courseList').html(code);
		}
	})
}

/* 신청한 총 학점 계산 */
function sumCredit(){
	$.ajax({
		url : `${path}/sumCredit.do`,
		data : JSON.stringify(cvo),
		type : "post",
		dataType : "json",
		success : function(data){
			let code=`${data}`
			$('#credit').html(code);
		}
	})
}

/* 수강 취소 */
function deleteCourse(){
		$.ajax({
		url : `${path}/deleteCourse.do`,
		data : JSON.stringify(cvo),
		type : "post",
		dataType : "json",
		success : function(data){
//			console.log(data);
			if(data==1){
				console.log("수강신청 취소 완료")
				courseList();
				sumCredit();
			}
		}
	})
}

/* 수강 신청 
총 학점+신청할 학점이 21점 초과할 경우 신청 불가 메세지
겹치는 시간이 있을 경우 불가능
*/

function insertCourse(){
	$.ajax({
		url : `${path}/insertCourse.do`,
		data : JSON.stringify(cvo),
		type : "post",
		dataType : "json",
		success : function(data){
//			console.log(data);
			if(data==1){
				console.log("수강신청 완료")
				courseList();
				sumCredit();
			}
		}
	})
}

/* 신청하려는 것이
시간표가 겹치지 않는지 확인
*/
function dulTimeChk(){
	/*신청하고난 학점이 21학점을 초과하는 경우 */
	let csum = $('#credit').text();
	let sum = parseInt(csum)+parseInt(credit);
	console.log(sum);
	if(sum>=22){
			Swal.fire({
  				title: "수강취소 실패",
  				text: "신청가능한 학점을 넘어섰습니다",
 			 	icon: "error"
			});
		return false;
	}
	$.ajax({
		url : `${path}/dulTimeCourse.do`,
		data : JSON.stringify(cvo),
		type : "post",
		dataType : "json",
		success : function(data){
			if(data>0){
				Swal.fire({
  				title: "수강취소 실패",
  				text: "겹치는 시간이 있습니다",
 			 	icon: "error"
			});
			} else{
				insertCourse();
			}
			
		}
	})
}