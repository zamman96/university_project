function listPerPage(){
	fdata = $('#searchf').serializeJSON();
	fdata.page = currentPage;
	fdata.major_id = major_id;

	$.ajax({
		url : `${path}/majorStudentList.do`,
		type : "POST",
		data : JSON.stringify(fdata),
		content : "application/json; charset=utf-8",
		success : function(data){
			gra = this.graduate_date;
			if(typeof gra=='undefined'){
				gra = "-";
			}
//			console.log(data);
			let code = `<table>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학과</th>
				<th>학년</th>
				<th>생년월일</th>
				<th>졸업일</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>주소</th>
			</tr>`;
			let grade
		
		$.each(data.datas,function(){
			code+=`<tr>
			<td>${this.mem_id}</td>
			<td>${this.mem_name}</td>
			<td>${this.major_name}</td>
			<td>${this.stu_grade}</td>
			<td>${this.mem_bir}</td>
			<td>${gra}</td>
			<td>${this.mem_tel}</td>
			<td>${this.mem_mail}</td>
			<td>${this.mem_add}</td>
			</tr>
			`;
		})	
		code+=`</table>`;
		$('#table').html(code);
		
		totalPage = data.tp;
//		console.log(totalPage);
		
			// 페이지 번호
			let pageCode = pageList(data.sp, data.ep, data.tp);
			$('#pageList').html(pageCode);
		},
		dataType : 'json'
	})
}

function listPerPageLecture(){
	fdata = $('#searchf').serializeJSON();
	fdata.page = currentPage;
	fdata.year = year;
	fdata.term = term;
	fdata.pro_id = pro_id;

	$.ajax({
		url : `${path}/allCourseListPage.do`,
		type : "POST",
		data : JSON.stringify(fdata),
		content : "application/json; charset=utf-8",
		success : function(data){
			gra = this.graduate_date;
			if(typeof gra=='undefined'){
				gra = "-";
			}
			console.log(data);
			let code = `<table>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학과</th>
				<th>학년</th>
				<th>생년월일</th>
				<th>졸업일</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>주소</th>
			</tr>`;
			let grade
		
		$.each(data.datas,function(){
			code+=`<tr>
			<td>${this.mem_id}</td>
			<td>${this.mem_name}</td>
			<td>${this.major_name}</td>
			<td>${this.stu_grade}</td>
			<td>${this.mem_bir}</td>
			<td>${gra}</td>
			<td>${this.mem_tel}</td>
			<td>${this.mem_mail}</td>
			<td>${this.mem_add}</td>
			</tr>
			`;
		})	
		code+=`</table>`;
		$('#table').html(code);
		
		totalPage = data.tp;
//		console.log(totalPage);
		
			// 페이지 번호
			let pageCode = pageList(data.sp, data.ep, data.tp);
			$('#pageList').html(pageCode);
		},
		dataType : 'json'
	})
}

// 게시판 번호 출력
function pageList(sp, ep, tp){
	let pageCode = `<div class="pagination-wrap"><div class="pagination">`;
	// 이전버튼 출력
	if(sp>1){
			pageCode +=`<a href="#none" id="prev">&laquo;</a>`;
	}
	// 페이지 버튼 출력
	for(var i=sp; i<=ep; i++){
		if(currentPage==i){
 			pageCode+=`<a href="#none" class="active pageno">${i}</a>`;
		} else{
  			pageCode+=`<a href="#none" class="pageno">${i}</a>`;
		}
	}
	// 다음버튼 출력
	if(ep < tp){
  		pageCode+=`<a href="#none">&raquo;</a>`;
	}
	pageCode+= `</div>
				</div>`;
	return pageCode;
}

/* 강의하는 강좌정보받기 */
function proList(){
	pvo = {
		pro_id : pro_id,
		year : year,
		term : term
	};
	$.ajax({
		url : `${path}/professorLectureList.do`,
		data : pvo,
		dataType : "json",
		type : "post",
		success : function(data){
//			console.log(data);
			let code =``;
			$.each(data, function(){
			code+=`<option value="${this.subject_id}">${this.subject_name}</option>
  			`;
			})
			
			$('#lecList').append(code);
		}
	})
}
