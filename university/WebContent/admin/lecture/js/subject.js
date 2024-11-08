/**
 * 
 */
function listPerPage(){
	fdata = $('#subf').serializeJSON();
	fdata.page = currentPage;

	$.ajax({
		url : `${path}/subjectListPage.do`,
		type : "POST",
		data : JSON.stringify(fdata),
		content : "application/json; charset=utf-8",
		success : function(data){
//			console.log(data);
			let code = `<div class="table-wrap"><table border="1">
			<tr>
				<th>과목분류</th>
				<th>과목번호</th>
				<th>과목명</th>
				<th>학과명</th>
				<th>학년</th>
				<th>학점</th>
				<th>학기</th>
			</tr>`;
		
		$.each(data.datas,function(){
			code+=`<tr class="subjectSelect" idx="${this.subject_id}">
			<td id="type">${this.subject_type}</td>
			<td id="id">${this.subject_id}</td>
			<td id="name">${this.subject_name}</td>
			<td id="major" idx="${this.major_id}">${this.major_name}</td>
			<td id="grade">${this.subject_grade}</td>
			<td id="credit">${this.subject_credit}</td>
			<td id="term">${this.subject_term}</td>
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

function subjectDetail(){
	$.ajax({
		url : `${path}/subjectDetail.do`,
		type : "POST",
		data : {subject_id : subject_id},
		success : function(data){
			// 각 필드가 존재하는지 확인하여 기본값 설정
            let col_name = data.col_name || "";
            let subject_id = data.subject_id || "N/A";
            let subject_type = data.subject_type || "N/A";
            let major_name = data.major_name || "N/A";
            let subject_term = data.subject_term || "N/A";
            let subject_name = data.subject_name || "N/A";
            let subject_grade = data.subject_grade || "N/A";
            let subject_credit = data.subject_credit || "N/A";
            let subject_theory = data.subject_theory || 0;
            let subject_training = data.subject_training || 0;
            let subject_outline = data.subject_outline || "";
            let subject_target = data.subject_target || "";
            let subject_t_book = data.subject_t_book || "";
            let subject_s_book = data.subject_s_book || "";
            let subject_r_file = data.subject_r_file || "";
            let subject_p_file = data.subject_p_file || "";

            let code = `
            <form id="insertf">
				<div class="modal-wrap">
		            <div class="sel2-boxs">
		            	<div class="modal-wrap-title">과목 설정</div>
		            	<div class="sel2-box w-260">
		            		<div class="sel2-box-title">과목분류</div>
			        		<div class="sel2-box-result">${subject_type}</div>
		            	</div> 
		            	<div class="sel2-box w-260">
		            		<div class="sel2-box-title">단과대명</div>
			        		<div class="sel2-box-result">${col_name}</div>
		            	</div>
		            	<div class="sel2-box w-260">
		            		<div class="sel2-box-title">학과명</div>
			        		<div class="sel2-box-result">${major_name}</div>
		            	</div>
		            	<div class="sel2-zip">
			            	<div class="sel2-box">
			            		<div class="sel2-box-title">학기</div>
				        		<div class="sel2-box-result">${subject_term}</div>
			            	</div>
			            	<div class="sel2-box">
			            		<div class="sel2-box-title">학년</div>
				        		<div class="sel2-box-result">${subject_grade}</div>
			            	</div>
			            	<div class="sel2-box">
			            		<div class="sel2-box-title">학점</div>
				        		<div class="sel2-box-result">${subject_credit}</div>
			            	</div>
		            	</div>
		            	<div class="sel2-box">
			            		<div class="sel2-box-title">과목번호</div>
			            		<div class="sel2-box-result">${subject_id}</div>
			            	</div>
		            </div> <!-- sel-boxs/ -->
		            
		            <div class="item-boxs">
		            	<div class="modal-wrap-title">과목 상세</div>
		            	<div class="item-box-line">
			            	<div class="item-box">
			            		<div class="item-box-title">과목명</div>
				        		<div class="item-box-result subject_name">${subject_name}</div>
			            	</div>
			            	<div class="item-box">
			            		<div class="item-box-title">이론시간</div>
				        		<div class="item-box-result subject_theory">${subject_theory}</div>
			            	</div>
			            	<div class="item-box">
			            		<div class="item-box-title">실습시간</div>
				        		<div class="item-box-result subject_training">${subject_training}</div>
			            	</div>
		            	</div>
		            	<div class="item-box-block">
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
		            </div> <!-- item-boxs -->
	        	</div> <!-- modal-wrap/ -->
				<div class="modal-bottom">
					<button class="submit" id="delete" idx="${subject_id}" type="button">삭제</button>
					<button class="submit" id="updateList" idx="${subject_id}" type="button">수정</button>
				</div>
			</form>`;

//            console.log('생성된 HTML 코드:', code);

            $('#detail').html(code);
		
		},
		dataType : 'json',
		error : function(xhr, status, error){
			console.log(xhr, status, error);
		}
	})
}


function subjectUpdateDetail(){
	$.ajax({
		url : `${path}/subjectDetail.do`,
		type : "POST",
		data : {subject_id : subject_id},
		success : function(data){
			// 각 필드가 존재하는지 확인하여 기본값 설정
			console.log(data);
			
            let col_name = data.col_name || "";
            let subject_id = data.subject_id || "N/A";
            let subject_type = data.subject_type || "N/A";
            let major_name = data.major_name || "N/A";
            let subject_term = data.subject_term || "N/A";
            let subject_name = data.subject_name || "N/A";
            let subject_grade = data.subject_grade || "N/A";
            let subject_credit = data.subject_credit || "N/A";
            let subject_theory = data.subject_theory || 0;
            let subject_training = data.subject_training || 0;
            let subject_outline = data.subject_outline || "";
            let subject_target = data.subject_target || "";
            let subject_t_book = data.subject_t_book || "";
            let subject_s_book = data.subject_s_book || "";
            let subject_r_file = data.subject_r_file || "";
            let subject_p_file = data.subject_p_file || "";


			let gradeOption = [
				{ value:"1", label:"1학년"},
				{ value:"2", label:"2학년"},
				{ value:"3", label:"3학년"},
				{ value:"4", label:"4학년"},
				{ value:"5", label:"5학년"}
			]
			
			let optionGrade = gradeOption.map(option =>
				`<option value = "${option.value}" ${subject_grade == option.value ? 'selected' : ''}>${option.label}</option>`
			).join('');
			
			let typeOption = [
				{ value:"전공(필수)", label:"전공(필수)"},
				{ value:"전공(선택)", label:"전공(선택)"},
				{ value:"교양(필수)", label:"교양(필수)"},
				{ value:"교양(선택)", label:"교양(선택)"},
				{ value:"교직", label:"교직" }
			]
			
			let optionType = typeOption.map(option =>
				`<option value = "${option.value}" ${subject_type == option.value ? 'selected' : ''}>${option.label}</option>`
			).join('');
			
			let creditOption = [
				{ value:"1", label:"1"},
				{ value:"2", label:"2"},
				{ value:"3", label:"3"},
				{ value:"4", label:"4"}
			]
			let optionCredit = creditOption.map(option =>
				`<option value = "${option.value}" ${subject_credit == option.value ? 'selected' : ''}>${option.label}</option>`
			).join('');

            let code = `
			<form id="updatef">
				<div class="modal-wrap">
		            <div class="sel2-boxs">
		            	<div class="modal-wrap-title">과목 설정</div>
		            	<div class="sel2-box w-260">
		            		<div class="sel2-box-title">과목분류</div>
			        		<select name="subject_type">${optionType}</select>
		            	</div>
		            	<div class="sel2-box w-260">
		            		<div class="sel2-box-title">단과대명</div>
			        		<div class="sel2-box-result disabled">${col_name}</div>
		            	</div>
		            	<div class="sel2-box w-260">
		            		<div class="sel2-box-title">학과명</div>
			        		<div class="sel2-box-result disabled">${major_name}</div>
		            	</div>
		            	<div class="sel2-zip">
			            	<div class="sel2-box">
			            		<div class="sel2-box-title">학기</div>
				        		<select name="subject_term" id="insterm">`
								if(subject_term == '1학기'){
									code+=`<option value="1학기" selected>1학기</option>
									<option value="2학기">2학기</option>`
								} else {
									code+=`<option value="1학기">1학기</option>
									<option value="2학기" selected>2학기</option>`
								}
						code+=`</select>
			            	</div>
			            	<div class="sel2-box">
			            		<div class="sel2-box-title">학년</div>
				        		<select name="subject_grade" id="insgrade">
									${optionGrade}
								</select>
			            	</div>
			            	<div class="sel2-box">
			            		<div class="sel2-box-title">학점</div>
				        		<select name="subject_credit">
									${optionCredit}	
								</select>
			            	</div>
		            	</div>
		            	<div class="sel2-box">
			            		<div class="sel2-box-title">과목번호</div>
			            		<div class="sel2-box-result disabled">${subject_id}</div>
			            	</div>
		            </div> <!-- sel-boxs/ -->
		            
		            <div class="item-boxs">
		            	<div class="modal-wrap-title">과목 상세</div>
		            	<div class="item-box-line">
			            	<div class="item-box">
			            		<div class="item-box-title">과목명</div>
				        		<input class="subject_name" name="subject_name" type="text" value="${subject_name}">
			            	</div>
			            	<div class="item-box">
			            		<div class="item-box-title">이론시간</div>
				        		<input type="text" name="subject_theory" class="item-input" value="${subject_theory}">
			            	</div>
			            	<div class="item-box">
			            		<div class="item-box-title">실습시간</div>
				        		<input type="text" name="subject_training" class="item-input" value="${subject_training}">
			            	</div>
		            	</div>
		            	<div class="item-box-block">
				            <div class="item-box">
					        	<div class="item-box-title">개요</div>
				        		<textarea name="subject_outline" value="${subject_outline.replace(/\n/g, "<br>")}"></textarea>
				            </div>
				            <div class="item-box">
					        	<div class="item-box-title">목표</div>
				        		<textarea name="subject_target" value="${subject_target.replace(/\n/g, "<br>")}"></textarea>
				            </div>
				            <div class="item-box">
					        	<div class="item-box-title">주교재</div>
				        		<textarea name="subject_t_book" value="">${subject_t_book.replace(/\n/g, "<br>")}</textarea>
				            </div>
				            <div class="item-box">
					        	<div class="item-box-title">부교재</div>
				        		<textarea name="subject_s_book" value="${subject_s_book.replace(/\n/g, "<br>")}"></textarea>
				            </div>
				            <div class="item-box">
					        	<div class="item-box-title">참고자료</div>
				        		<textarea name="subject_r_file" value="${subject_r_file.replace(/\n/g, "<br>")}"></textarea>
				            </div>
				            <div class="item-box">
					        	<div class="item-box-title">선행학습자료</div>
				        		<textarea name="subject_p_file" value="${subject_p_file.replace(/\n/g, "<br>")}"></textarea>
			            </div>
			            </div>
		            </div> <!-- item-boxs -->
	        	</div> <!-- modal-wrap/ -->
				<div class="modal-bottom">
					<button class="submit" id="cancel" idx="${subject_id}" type="button">취소</button>
					<button class="submit" id="update" idx="${subject_id}" type="button">완료</button>
				</div>
			</form>			
			`;

				
//            console.log('생성된 HTML 코드:', code);

            $('#detail').html(code);
		
		},
		dataType : 'json',
		error : function(xhr, status, error){
			console.log(xhr, status, error);
		}
	})
}

function update(){
	udata = $('#updatef').serializeJSON();
	udata.subject_id = subject_id;
	$.ajax({
		url : `${path}/updateSubject.do`,
		type : "POST",
		data : JSON.stringify(udata),
		success : function(data){
			subjectDetail();
		}
	})
}

function insertSubject(){
	idata = $('#insertf').serializeJSON();
	idata.major_id = $('#imid').val();
	
	if(idata.subject_id==""){
		alert('과목번호를 입력해주세요');
		return;
	} else if(idata.subject_type==""||idata.subject_credit==""||idata.subject_name=="") {
		alert('반드시 필요한 정보 2줄을 작성해주세요');
	}
	
	console.log(idata);
	$.ajax({
		url : `${path}/insertSubject.do`,
		type : "POST",
		data : JSON.stringify(idata),
		success : function(data){
			location.reload();
		}
	});
}

function sub_id(){
	$.ajax({
		url : `${path}/createSubjectId.do`,
		type : "POST",
		data : idvo,
		success : function(data){
			
			$('#insid').val(data);
		}
	})
	
}

function padZero(num, size) {
  let numString = num.toString();
  while (numString.length < size) {
    numString = '0' + numString;
  }
  return numString;
}

function deleteSubject(){
        $.ajax({
                url : `${path}/deleteSubject.do`,
                type : "POST",
                data : {subject_id : subject_id},
                success : function(data){
				console.log(data);
                    if(data===""){
					Swal.fire({
  title: "삭제 실패",
  text: "해당 과목이 개설되어 삭제가 불가능합니다",
  icon: "error"
});
					} else{
						location.reload();
					}
                }
        })
}