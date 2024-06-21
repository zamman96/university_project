/**
 * 
 */


function subjectList(){
	fdata = $('#subf').serializeJSON();
	fdata.subject_term = vterm;
	fdata.year = vyear;
	fdata.page = currentPage;
		
	$.ajax({
		url : `${path}/lecture/subjectList.do`,
		data : JSON.stringify(fdata),
		type : "POST",
		content : "application/json; charset=utf-8",
		success : function(data){
			console.log(data);
			let code = `<div class="table-wrap"><table border="1">
			<tr>
				<th>과목분류</th>
				<th>학년</th>
				<th>과목번호</th>
				<th>과목명</th>
				<th>학과명</th>
				<th>학점</th>
			</tr>`;
		
		$.each(data.datas,function(){
			code+=`<tr class="subjectSelect select-result" data-bs-dismiss="modal">
			<td id="type">${this.subject_type}</td>
			<td id="grade">${this.subject_grade}</td>
			<td id="id">${this.subject_id}</td>
			<td id="name">${this.subject_name}</td>
			<td id="major" idx="${this.major_id}">${this.major_name}</td>
			<td id="credit">${this.subject_credit}</td>
			</tr>
			`;
		})	
		code+=`</table></div>`;
		$('#search-result').html(code);

		
		totalPage = data.tp;
//		console.log(totalPage);
		
			// 페이지 번호
			let pageCode = pageList(data.sp, data.ep, data.tp);
			$('#pageList').html(pageCode);
		},
		error : function(xhr){
			console.log(xhr.status);
		},
		dataType : "json"
	})
}

// 게시판 번호 출력
function pageList(sp, ep, tp){
	let pageCode = `<div class="pagination-wrap">
						<div class="pagination">`;
	// 이전버튼 출력
	if(sp>1){
			pageCode +=`<a href="#none" id="prev">&laquo;</a>`;
	}
	// 페이지 버튼 출력
	for(var i=sp; i<=ep; i++){
		if(currentPage==i){
 			pageCode+=`<a href="#none" class="pageno active">${i}</a>`;
		} else{
  			pageCode+=`<a href="#none"  class="pageno">${i}</a>`;
		}
	}
	// 다음버튼 출력
	if(ep < tp){
  		pageCode+=`<a href="#none" id="next">&raquo;</a>`;
	}
	pageCode+= `</div></div>`;
	return pageCode;
}

function professorList(){
	majorid = $('#smajorid').text();
	$.ajax({
		url : `${path}/lecture/professorList.do`,
		data : { major_id : majorid },
		type : "POST",
		success : function(data){
			let code = `<div class="table-wrap"><table border="1">
			<tr>
										<th>아이디</th>
										<th>학과번호</th>
										<th>학과이름</th>
										<th>이름</th>
										<th>생년월일</th>
										<th>성별</th>
										<th>전화번호</th>
			</tr>`;
		
		$.each(data,function(){
			let bir = this.mem_bir.substr(0,11);
			code+=`<tr class="professorSelect select-result" data-bs-dismiss="modal">
			<td id="proId">${this.pro_id}</td>
			<td id="majorId">${this.major_id}</td>
			<td id="majorName">${this.major_name}</td>
			<td id="proName">${this.mem_name}</td>
			<td id="proBir">${bir}</td>
			<td id="proGender">${this.mem_gender}</td>
			<td id="proTel">${this.mem_tel}</td>
			</tr>
			`;
		})	
		code+=`</table></div>`;
		$('#result-professor').html(code);
		},
		error : function(xhr){
			console.log(xhr.status);
		},
		dataType : "json"
	})
}

function building(){
	$.ajax({
		url : `${path}/lecture/buildingList.do`,
		success : function(data){
//			console.log(data);
			
			let code = `<div class="rr">건물 선택</div><div class="table-wrap"><table border="1"><tr>`;
		
		$.each(data,function(i, v){
			if(i%10==0){
				code+=`<tr>`;
			}
			code+=`
				<td class="buildingSelect select-result" id="v.room_id" name="v.room_id">${v.room_id}</td>`;
			if((i+1)%10==0){
				code+=`</tr>`;
			}
		})	
		code+=`</table></div>`;
		$('#result-room').html(code);
		},
		error : function(xhr){
			console.log(xhr.status);
		},
		dataType : "json"
	})
}

function roomnum(){
	$.ajax({
		url : `${path}/lecture/roomNumList.do`,
		data : { room_id : room_id },
		type : "POST",
		success : function(data){
//			console.log(data);
			let code = `<div class="rr">호수 선택</div>
			<div class="table-wrap"><table border="1"><tr>`;
		$.each(data,function(i, v){
			if(i%10==0){
				code+=`<tr>`;
			}
			code+=`
				<td class="roomnumSelect select-result" name="v.room_num" data-bs-dismiss="modal">${v.room_num}</td>`;
			if((i+1)%10==0){
				code+=`</tr>`;
			}
		})	
		code+=`</table></div>`;
		$('#result-roomnum').html(code);
		},
		error : function(xhr){
			console.log(xhr.status);
		},
		dataType : "json"
	})
}

function timeList(){
	$.ajax({
		url : `${path}/lecture/timeList.do`,
		data : JSON.stringify(tdata),
		type : "POST",
		success : function(data){
			console.log(data)
			let code = `<div class="table-wrap"><table border="1">
			<tr>
										<th>시간번호</th>
										<th>요일/교시</th>
			</tr>`;
		
		$.each(data,function(){
			code+=`<tr class="timeSelect select-result" id="${this.time_id}" data-bs-dismiss="modal">
			<td id="stid">${this.time_id}</td>
			<td id="stweek">${this.time_str}</td>
			</tr>
			`;
		})	
		code+=`</table></div>`;
		$('#result-time').html(code);
		},
		error : function(xhr){
			console.log(xhr.status);
		},
		dataType : "json"
	})
}

function insert(){
	$.ajax({
		url : `${path}/lecture/insertLecture.do`,
		data : JSON.stringify(idata),
		type : "POST",
		success : function(data){
			if(data>0){
				
		Swal.fire({
 			 title: "강의 개설 완료",
 			 text: "해당 강의 개설이 완료 되었습니다!",
  			icon: "success"
		});
		location.href = `${path}/admin/lecture/lectureList.jsp`;
		
			} else{
		Swal.fire({
 			 title: "강의 개설 실패",
 			 text: "이미 개설된 강의입니다",
  			icon: "error"
		});
	}
		},
		error : function(xhr){
			console.log(xhr.status);
		}
	})
	
}
