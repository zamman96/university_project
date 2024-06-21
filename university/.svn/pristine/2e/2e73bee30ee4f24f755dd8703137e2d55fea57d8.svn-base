/**
 * 
 */

const insertStuChange = () =>{
	
	$.ajax({
		url : `${path}/stuChange.do`,
		data : JSON.stringify(data),
		type : 'POST',
		contentType : 'application/json; charset=UTF-8',
		dataType : 'JSON',
		success : function(res){
//			alert(res.flag);
			location.href=`${path}/student/student-recode.jsp`;
		},
		error : function(xhr){
			alert("신청에 실패하였습니다 : "+xhr.status);
		}
		
	})
}

const updateStuChange = () =>{
	
	$.ajax({
		url : `<%=request.getContextPath() %>/updateStuChange.do`,
		data : JSON.stringify(data),
		type : 'POST',
		contentType : 'application/json; charset=UTF-8',
		dataType : 'JSON',
		success : function(res){
			alert(res.flag);
			location.href=`${path}/student/student-recode.jsp`;
		},
		error : function(xhr){
			alert("실패하였습니다" + xhr.status);
		}
	})
}

/* 학적 조회 리스트 출력하는 이벤트 */
const selectStuChange = () => {
	$.ajax({
		url : `${path}/selectStuChange.do`,
		type : 'get',
		data : {stu_id : stu_id},
		contentType : 'application/json; charset=UTF-8',
		success : function(res){
			
		let code1 = "";	
		let code2 = "";	
		let code3 = "";	
		
		year1 = ""; year2 = ""; year3 = "";
		term1 = ""; term2 = ""; term3 = "";
		reg_date1 = ""; reg_date2 = ""; reg_date3 = "";
		reg_content1 = ""; reg_content2 = ""; reg_content3 = "";
		apply_type1 = ""; apply_type2 = ""; apply_type3 = "";
		process_date1 = ""; process_date2 = ""; process_date3 = "";
		
		type1 = false; // 휴학 여부
		type2 = false; // 복학 여부
		type3 = false; // 자퇴 여부
			
		/* 반복문 시작 */	
		$.each(res, function(i, v){
			
			// 학적구분(REG_TYPE)이 휴학이고, 내역이 있을 때
			if(res[i].reg_type=="휴학"){
				
				type1 = true;
				
				// 초기화
				date = new Date(res[i].reg_date);
				apply_type = res[i].apply_type;
				if(apply_type==0){
					apply_type = "-"	
				}
				process_date = res[i].process_date;
				if(process_date==undefined){
					process_date = "-"	
				}
				
				// 코드 담기
				year1 += `<div class="list-colum">${res[i].year}</div>`;
				term1 += `<div class="list-colum">${res[i].term}</div>`;
				reg_date1 += `<div class="list-colum">${date.toLocaleDateString()}</div>`;
				reg_content1 += `<div class="list-colum">${res[i].reg_content}</div>`;
				apply_type1 += `<div class="list-colum">${apply_type}</div>`;
				process_date1 += `<div class="list-colum">${process_date}</div>`;
			
			} // 휴학 if문 끝
		
			// 학적구분(REG_TYPE)이 복학이고, 내역이 있을 때
			if(res[i].reg_type=="복학"){
			
				type2 = true;
				
				// 초기화
				date = new Date(res[i].reg_date);
				apply_type = res[i].apply_type;
				if(apply_type==0){
					apply_type = "-"	
				}
				process_date = res[i].process_date;
				if(process_date==undefined){
					process_date = "-"	
				}
				
				// 코드 담기
				year2 += `<div class="list-colum">${res[i].year}</div>`;
				term2 += `<div class="list-colum">${res[i].term}</div>`;
				reg_date2 += `<div class="list-colum">${date.toLocaleDateString()}</div>`;
				reg_content2 += `<div class="list-colum">${res[i].reg_content}</div>`;
				apply_type2 += `<div class="list-colum">${apply_type}</div>`;
				process_date2 += `<div class="list-colum">${process_date}</div>`;
			
			} // 복학 if문 끝
			
			// 학적구분(REG_TYPE)이 자퇴이고, 내역이 있을 때
			if(res[i].reg_type=="자퇴"){
			
				type3 = true;
				
				// 초기화
				date = new Date(res[i].reg_date);
				apply_type = res[i].apply_type;
				if(apply_type==0){
					apply_type = "-"	
				}
				process_date = res[i].process_date;
				if(process_date==undefined){
					process_date = "-"	
				}
				
				// 코드 담기
				year3 += `<div class="list-colum">${res[i].year}</div>`;
				term3 += `<div class="list-colum">${res[i].term}</div>`;
				reg_date3 += `<div class="list-colum">${date.toLocaleDateString()}</div>`;
				reg_content3 += `<div class="list-colum">${res[i].reg_content}</div>`;
				apply_type3 += `<div class="list-colum">${apply_type}</div>`;
				process_date3 += `<div class="list-colum">${process_date}</div>`;
			
			} // 복학 if문 끝
		
		}) /* 반복문 끝 */

		
		// 휴학 출력 if문
		if(type1){
			code1 += `  
				<div class="item-lists">
					<div class="item-list">
						<div class="list-row">년도</div>
						<div class="list-colums">
							${year1}
						</div>
					</div>
					<div class="item-list">
						<div class="list-row">학기</div>
						<div class="list-colums">
							${term1}
						</div>
					</div>
					<div class="item-list">
						<div class="list-row">신청 일자</div>
						<div class="list-colums">
							${reg_date1}
						</div>
					</div>
					<div class="item-list">
						<div class="list-row">신청 사유</div>
						<div class="list-colums">
							${reg_content1}
						</div>
					</div>
					<div class="item-list">
						<div class="list-row">승인 여부</div>
						<div class="list-colums">
							${apply_type1}
						</div>
					</div>
					<div class="item-list">
						<div class="list-row">승인 일자</div>
						<div class="list-colums">
							${process_date1}
						</div>
					</div>
				</div>				
			`;
		} else if (!type1) {
			code1 += `
				<div class="item-lists">
					<div class="item-list">
						<div class="list-row">년도</div>
					</div>
					<div class="item-list">
						<div class="list-row">학기</div>
					</div>
					<div class="item-list">
						<div class="list-row">신청 일자</div>
					</div>
					<div class="item-list">
						<div class="list-row">신청 사유</div>
					</div>
					<div class="item-list">
						<div class="list-row">승인 여부</div>
					</div>
					<div class="item-list">
						<div class="list-row">승인 일자</div>
					</div>
				</div>
				<div class="list-null">내역이 없습니다</div>
			`;
		}
		
		// 복학 출력 if문
		if(type2){
			code2 += `  
				<div class="item-lists">
					<div class="item-list">
						<div class="list-row">년도</div>
						<div class="list-colums">
							${year2}
						</div>
					</div>
					<div class="item-list">
						<div class="list-row">학기</div>
						<div class="list-colums">
							${term2}
						</div>
					</div>
					<div class="item-list">
						<div class="list-row">신청 일자</div>
						<div class="list-colums">
							${reg_date2}
						</div>
					</div>
					<div class="item-list">
						<div class="list-row">신청 사유</div>
						<div class="list-colums">
							${reg_content2}
						</div>
					</div>
					<div class="item-list">
						<div class="list-row">승인 여부</div>
						<div class="list-colums">
							${apply_type2}
						</div>
					</div>
					<div class="item-list">
						<div class="list-row">승인 일자</div>
						<div class="list-colums">
							${process_date2}
						</div>
					</div>
				</div>				
			`;
		} else if (!type2) {
			code2 += `
				<div class="item-lists">
					<div class="item-list">
						<div class="list-row">년도</div>
					</div>
					<div class="item-list">
						<div class="list-row">학기</div>
					</div>
					<div class="item-list">
						<div class="list-row">신청 일자</div>
					</div>
					<div class="item-list">
						<div class="list-row">신청 사유</div>
					</div>
					<div class="item-list">
						<div class="list-row">승인 여부</div>
					</div>
					<div class="item-list">
						<div class="list-row">승인 일자</div>
					</div>
				</div>
				<div class="list-null">내역이 없습니다</div>
			`;
		}
		
		// 자퇴 출력 if문
		if(type3){
			code3 += `  
				<div class="item-lists">
					<div class="item-list">
						<div class="list-row">년도</div>
						<div class="list-colums">
							${year3}
						</div>
					</div>
					<div class="item-list">
						<div class="list-row">학기</div>
						<div class="list-colums">
							${term3}
						</div>
					</div>
					<div class="item-list">
						<div class="list-row">신청 일자</div>
						<div class="list-colums">
							${reg_date3}
						</div>
					</div>
					<div class="item-list">
						<div class="list-row">신청 사유</div>
						<div class="list-colums" title="${reg_content3}">
							${reg_content3}
						</div>
					</div>
					<div class="item-list">
						<div class="list-row">승인 여부</div>
						<div class="list-colums">
							${apply_type3}
						</div>
					</div>
					<div class="item-list">
						<div class="list-row">승인 일자</div>
						<div class="list-colums">
							${process_date3}
						</div>
					</div>
				</div>				
			`;
		} else if (!type3) {
			code3 += `
				<div class="item-lists">
					<div class="item-list">
						<div class="list-row">년도</div>
					</div>
					<div class="item-list">
						<div class="list-row">학기</div>
					</div>
					<div class="item-list">
						<div class="list-row">신청 일자</div>
					</div>
					<div class="item-list">
						<div class="list-row">신청 사유</div>
					</div>
					<div class="item-list">
						<div class="list-row">승인 여부</div>
					</div>
					<div class="item-list">
						<div class="list-row">승인 일자</div>
					</div>
				</div>
				<div class="list-null">내역이 없습니다</div>
			`;
		}
		
		// 실제 출력 위치
		$('.h-list').append(code1);
		$('.b-list').append(code2);
		$('.j-list').append(code3);
			
		}, /* success 끝 */
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}
