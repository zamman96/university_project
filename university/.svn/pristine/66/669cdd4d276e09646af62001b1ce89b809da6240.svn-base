/**
 * 
 */
function listPerPage(){
	fdata = $('#subf').serializeJSON();
	fdata.page = currentPage;
	fdata.major_id = $('#mid').val();
	fdata.col_id =$('#cid').val();
//	console.log(fdata);

	$.ajax({
		url : `${path}/lectureListPage.do`,
		type : "POST",
		data : JSON.stringify(fdata),
		content : "application/json; charset=utf-8",
		success : function(data){
//			console.log(data);
			let code = `<div class="table-wrap"><table border="1">
			<tr>
				<th>과목분류</th>
				<th>과목번호</th>
				<th>년도</th>
				<th>학기</th>
				<th>과목명</th>
				<th>교수명</th>				
				<th>학과명</th>
				<th>수강 인원</th>
				<th>시간</th>
				<th>강의실</th>
				<th>학년</th>
				<th>학점</th>
			</tr>`;
		
		$.each(data.datas,function(){
			code+=`
			<tr class="lectureSelect" idx="${this.subject_id}" idy="${this.year}" idz="${this.term}" idt="${this.time_id}">
			<td id="type">${this.subject_type}</td>
			<td id="id">${this.subject_id}</td>
			<td id="year">${this.year}</td>
			<td id="term">${this.term}</td>
			<td id="name">${this.subject_name}</td>
			<td id="pro_name">${this.mem_name}</td>
			<td id="major" idx="${this.major_id}">${this.major_name}</td>
			<td>${this.current_count} / ${this.lec_count}</td>
			<td id="time">${this.time_name}</td>
			<td id="room">${this.room_id} ${this.room_num}호</td>
			<td id="grade">${this.subject_grade}</td>
			<td id="credit">${this.subject_credit}</td>
			</tr>
			`;
		})	
		code+=`</table></div>`;
		$('#subjectList').html(code);
		
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

function deleteLecture(){
	$.ajax({
		url : `${path}/deleteLecture.do`,
		type : "POST",
		data : dvo,
		content : "application/json; charset=utf-8",
		success : function(data){
			location.href = `${path}/admin/lecture/lectureList.jsp`;
		},
		error : function(xhr){
			console.log(xhr.status);
		}
	})
}

function detail(){
	$.ajax({
		url : `${path}/detailLecture.do`,
		type : "POST",
		data : dvo,
		content : "application/json; charset=utf-8",
		success : function(data){
//			console.log(data)
			print(data);
			major_id=data.major_id;
		},
		error : function(xhr){
			console.log(xhr.status);
		}
	})
}

function detailUpdate(){
	location.href = `http://localhost/university/admin/lecture/lectureDetail.jsp?year=${year}&subject_id=${subject_id}&term=${term}&major_id=${major_id}`;
}

function print(data){
	let subject_outline = data.subject_outline || "";
    let subject_target = data.subject_target || "";
    let subject_t_book = data.subject_t_book || "";
    let subject_s_book = data.subject_s_book || "";
    let subject_r_file = data.subject_r_file || "";
    let subject_p_file = data.subject_p_file || "";
	
	let code = `
	<div class="modal-wrap">
		<div class="sel2-boxs">
			<div class="modal-wrap-title">학기 설정</div>
			<div class="sel-box-inline">
				<div class="sel2-box">
	        		<div class="sel2-box-title">년도</div>
	        		<div class="sel2-box-result" id="year">${data.year}</div>
	        	</div> 
				<div class="sel2-box">
	        		<div class="sel2-box-title">학기</div>
	        		<div class="sel2-box-result" id="term">${data.term}</div>
        		</div> 
        	</div>
			<div class="sel-box-inline">
				<div class="sel2-box">
	        		<div class="sel2-box-title">학년</div>
	        		<div class="sel2-box-result" id="grade">${data.subject_grade}</div>
	        	</div> 
				<div class="sel2-box">
	        		<div class="sel2-box-title">학점</div>
	        		<div class="sel2-box-result" id="grade">${data.subject_credit}</div>
	        	</div> 
			</div> 
			<div class="sel2-box">
        		<div class="sel2-box-title">과목분류</div>
        		<div class="sel2-box-result w-260" id="type">${data.subject_type}</div>
        	</div>
			<div class="sel-box-inline"> 
				<div class="sel2-box">
	        		<div class="sel2-box-title">이론시간</div>
	        		<div class="sel2-box-result" id="type">${data.subject_theory}</div>
	        	</div> 
				<div class="sel2-box">
	        		<div class="sel2-box-title">실습시간</div>
	        		<div class="sel2-box-result" id="type">${data.subject_training}</div>
	        	</div> 
        	</div> 
			<div class="sel2-box">
        		<div class="sel2-box-title">수강인원</div>
        		<div class="sel2-box-result  w-260" id="lec_cnt">
					<span id="cur_cnt">${data.current_count}</span> / ${data.lec_count}
				</div>
        	</div> 
		</div>
		
		<div class="sel2-boxs">
			<div class="modal-wrap-title">과목 설정</div>
			<div class="sel2-box">
        		<div class="sel2-box-title">과목명</div>
        		<div class="sel2-box-result  w-260" id="name">${data.subject_name}</div>
        	</div> 
			<div class="sel2-box">
        		<div class="sel2-box-title">교수명</div>
        		<div class="sel2-box-result  w-260" id="pro_name">${data.mem_name}</div>
        	</div> 
			<div class="sel2-box">
        		<div class="sel2-box-title">학과명</div>
        		<div class="sel2-box-result  w-260" id="major" idx="${data.major_id}">${data.major_name}</div>
        	</div> 
			<div class="sel2-box">
        		<div class="sel2-box-title">과목번호</div>
        		<div class="sel2-box-result  w-260" id="id">${data.subject_id}</div>
        	</div> 
			<div class="sel2-box">
        		<div class="sel2-box-title">시간</div>
        		<div class="sel2-box-result  w-260" id="time">${data.time_name}</div>
        	</div> 
			<div class="sel2-box">
        		<div class="sel2-box-title">강의실</div>
        		<div class="sel2-box-result w-260" id="room">${data.room_id} ${data.room_num}호</div>
        	</div> 
		</div>
		
		<div class="item-boxs">
			<div class="modal-wrap-title">과목 상세</div>
				<div class="item-box">
		        	<div class="item-box-title">개요</div>
	        		<div class="item-box-text">${subject_outline.replace(/\n/g, "<br>")}</div>
	            </div>
	            <div class="item-box">
		        	<div class="item-box-title">목표</div>
	        		<div class="item-box-text">${subject_outline.replace(/\n/g, "<br>")}</div>
	            </div>
	            <div class="item-box">
		        	<div class="item-box-title">주교재</div>
	        		<div class="item-box-text">${subject_t_book.replace(/\n/g, "<br>")}</div>
	            </div>
	            <div class="item-box">
		        	<div class="item-box-title">부교재</div>
	        		<div class="item-box-text">${subject_s_book.replace(/\n/g, "<br>")}</div>
	            </div>
	            <div class="item-box">
		        	<div class="item-box-title">참고자료</div>
	        		<div class="item-box-text">${subject_r_file.replace(/\n/g, "<br>")}</div>
	            </div>
	            <div class="item-box">
		        	<div class="item-box-title">선행학습자료</div>
	        		<div class="item-box-text">${subject_p_file.replace(/\n/g, "<br>")}</div>
	            </div>								
			</div>
		</div>	
	`;
		
		if(grant==3){
			
		code+=`
		<div class="modal-bottom">
			<button class="submit" id="updateList" type="button">교수/인원 수 변경</button>
			<button class="submit" id="delete" type="button">삭제</button>
		</div>`;
		}
		
		$('#detail').html(code);
}

function detailUpdateList(){
	$.ajax({
		url : `${path}/detailLecture.do`,
		type : "POST",
		data : dvo,
		content : "application/json; charset=utf-8",
		success : function(data){
			pro_id=data.pro_id;
			let subject_outline = data.subject_outline || "";
		    let subject_target = data.subject_target || "";
		    let subject_t_book = data.subject_t_book || "";
		    let subject_s_book = data.subject_s_book || "";
		    let subject_r_file = data.subject_r_file || "";
		    let subject_p_file = data.subject_p_file || "";
			
			let code = `
			<div class="modal1-wrap">
				<div class="sel2-boxs">
					<div class="modal1-wrap-title">학기 설정</div>
					<div class="sel-box-inline">
						<div class="sel2-box">
			        		<div class="sel2-box-title">년도</div>
			        		<div class="sel2-box-result" id="year">${data.year}</div>
			        	</div> 
						<div class="sel2-box">
			        		<div class="sel2-box-title">학기</div>
			        		<div class="sel2-box-result" id="term">${data.term}</div>
		        		</div> 
		        	</div>
					<div class="sel-box-inline">
						<div class="sel2-box">
			        		<div class="sel2-box-title">학년</div>
			        		<div class="sel2-box-result" id="grade">${data.subject_grade}</div>
			        	</div> 
						<div class="sel2-box">
			        		<div class="sel2-box-title">학점</div>
			        		<div class="sel2-box-result" id="grade">${data.subject_credit}</div>
			        	</div> 
					</div> 
					<div class="sel2-box">
		        		<div class="sel2-box-title">과목분류</div>
		        		<div class="sel2-box-result w-260" id="type">${data.subject_type}</div>
		        	</div>
					<div class="sel-box-inline"> 
						<div class="sel2-box">
			        		<div class="sel2-box-title">이론시간</div>
			        		<div class="sel2-box-result" id="type">${data.subject_theory}</div>
			        	</div> 
						<div class="sel2-box">
			        		<div class="sel2-box-title">실습시간</div>
			        		<div class="sel2-box-result" id="type">${data.subject_training}</div>
			        	</div> 
		        	</div> 
					<div class="sel2-box">
		        		<div class="sel2-box-title">수강인원</div>
						<div class="sel2-box-result2">
							<span id="cur_cnt">${data.current_count}</span> / <input value="${data.lec_count}" id="cnt">
		        		</div>
					</div> 
				</div>
				
				<div class="sel2-boxs">
					<div class="modal1-wrap-title">과목 설정</div>
					<div class="sel2-box">
		        		<div class="sel2-box-title">과목명</div>
		        		<div class="sel2-box-result  w-260" id="name">${data.subject_name}</div>
		        	</div> 
					<div class="sel2-box">
		        		<div class="sel2-box-title">교수명</div>
		        		<div class="sel2-box-result2">
							<input value="${data.mem_name}" class="w-170" id="pro_name">
							<input type="button" value="교수 변경" id="changeProf">
						</div>
		        	</div> 
					<div class="sel2-box">
		        		<div class="sel2-box-title">학과명</div>
		        		<div class="sel2-box-result  w-260" id="major" idx="${data.major_id}">${data.major_name}</div>
		        	</div> 
					<div class="sel2-box">
		        		<div class="sel2-box-title">과목번호</div>
		        		<div class="sel2-box-result  w-260" id="id">${data.subject_id}</div>
		        	</div> 
					<div class="sel2-box">
		        		<div class="sel2-box-title">시간</div>
		        		<div class="sel2-box-result  w-260" id="time">${data.time_name}</div>
		        	</div> 
					<div class="sel2-box">
		        		<div class="sel2-box-title">강의실</div>
		        		<div class="sel2-box-result w-260" id="room">${data.room_id} ${data.room_num}호</div>
		        	</div> 
				</div>
				
				<div class="item-boxs">
					<div class="modal1-wrap-title">과목 상세</div>
						<div class="item-box">
				        	<div class="item-box-title">개요</div>
			        		<div class="item-box-text">${subject_outline.replace(/\n/g, "<br>")}</div>
			            </div>
			            <div class="item-box">
				        	<div class="item-box-title">목표</div>
			        		<div class="item-box-text">${subject_outline.replace(/\n/g, "<br>")}</div>
			            </div>
			            <div class="item-box">
				        	<div class="item-box-title">주교재</div>
			        		<div class="item-box-text">${subject_t_book.replace(/\n/g, "<br>")}</div>
			            </div>
			            <div class="item-box">
				        	<div class="item-box-title">부교재</div>
			        		<div class="item-box-text">${subject_s_book.replace(/\n/g, "<br>")}</div>
			            </div>
			            <div class="item-box">
				        	<div class="item-box-title">참고자료</div>
			        		<div class="item-box-text">${subject_r_file.replace(/\n/g, "<br>")}</div>
			            </div>
			            <div class="item-box">
				        	<div class="item-box-title">선행학습자료</div>
			        		<div class="item-box-text">${subject_p_file.replace(/\n/g, "<br>")}</div>
			            </div>								
					</div>
				</div>	
				<footer class="dialog__footer">
					<button class="submit" id="update" type="button">수정</button>
					<button class="submit" id="cancel" type="button">취소</button>
				</footer>
				`;
			
			$('#lectureDetail').html(code);
			
		},
		error : function(xhr){
			console.log(xhr.status);
		}
	})
	
}

function proList(){
	 let pvo = {
				year : year,
				term : term,
				time_id : time_id,
				major_id : lvo.major_id
			}
	$.ajax({
		url : `${path}/profTimeList.do`,
		type : "POST",
		data : pvo,
		content : "application/json; charset=utf-8",
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
		$('#detail').html(code);
		},
		dataType : "json"
	})
}

function updateLecture(){
	$.ajax({
		url : `${path}/updateLecture.do`,
		type : "POST",
		data : dvo,
		content : "application/json; charset=utf-8",
		success : function(data){
			location.href = `http://localhost/university/admin/lecture/lectureList.jsp`;
		},
		error : function(xhr){
			console.log(xhr.status);
		}
	})
}