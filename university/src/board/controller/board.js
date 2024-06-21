/**
 * 
 */



const listPerPage = () => {
	vtype = $('.search-select option:selected').val().trim();
	vword = $('.search-input').val().trim();
//	console.log('test');
	
	// 서버전송
	$.ajax({
		
		url : `${mypath}/BoardList.do`,
//		url : `/university/BoardList.do`,
		data : JSON.stringify({ // json 형태로 직렬화
			page : currentPage, // board.jsp에서 정한 초기화 값 (1)
			stype : vtype,
			sword : vword
		}),
		contentType : 'application/json; charset=utf-8',
		type : 'POST',
		success : function(res){
			console.log('test2');
			console.log(res);
			
			
			// 실제 출력 id=result
			let code = `<div class="list-container">`;
			
			// 요소 한개
			// res.sp
			
			// 배열 요소
			$.each(res.datas, function(i, v){
				
				
				code += `<div class="list-box">
					      <div class="list-num">${v.board_id}</div>
							<div class="list-subject">
								<div class="list-subject-title">
									<a href="board-1-detail.jsp?bonum='${v.board_id}'">${v.board_title}</a>
								</div>
								<div class="list-subject-sub">
									${v.board_content}
								</div>
							</div>
							<div class="list-data">
								<div class="hit">
									<img alt="조회수아이콘" src="http://localhost/university/board/img/eye.png"> ${v.board_hit}
								</div>
								<div class="date">
									<img alt="날짜아이콘" src="http://localhost/university/board/img/clock.png">${v.board_date}
								</div>
							</div>
					      
					    </div>`;
			}) // 반복문
			
			code += `</div>`;
			
			// 게시글 3개씩 출력
			$('#result').html(code);
			
			
			// 페이징 처리
			pager = pageList(res.sp, res.ep, res.tp);
			
			$('.pagination-wrap').html(pager);
			
			
		}, // success
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'	
	}) // ajax
	
} // function

const pageList = (sp, ep, tp) => {
	console.log('test3');
	console.log(sp);//1
	console.log(ep);//4
	console.log(tp);//4
	let pager = `<div class="pagination">`;
	
	// 이전 버튼 출력 (1일 때는 이전 페이지가 없기 때문에 if문 사용)
	
	pager += `<a id="prev" class="pageno" href="#">&laquo</a>`;
	
	
	// 페이지 번호 출력 (i는 현재 페이지 숫자)
	for(i=sp; i<=ep; i++){
		// board.js에서 초기화 한 현재페이지
		if(currentPage == i){
			pager += `<a class="active pageno" href="#">${i}</a>`;
		} else{
			pager += `<a class="pageno" href="#">${i}</a>`;
		}
	}	
	
	// 다음 버튼 출력
	
	pager += `<a id="next" class="pageno " href="#">&raquo</a>`;
	
	
	pager += `</div>`;
	
	return pager;
}
