/**
 * 
 */

// 로그인 공지게시판 출력
const LoginNotiBoard = () => {
	console.log('MainNotiBoard');
	
	$.ajax({
		url: `${path}/mainNotiBoard.do`,
		type: 'get',
		success: function(res){
			//console.log('res >> ', res);
			
			code = "";
			
			for(let i = 0; i < 5 && i < res.length; i++){
				title = res[i].board_title;
				date = new Date(res[i].board_date);
				
				code += `<div class="notice-item">
				<span class="notice-bage">학사공지</span>
				<a href="#none">${res[i].board_title}</a>
				<span>${date.toLocaleDateString()}</span>
			</div>`
			};
			
			$('.notice-items').html(code);
			
		},
		error: function(xhr){
			alert('오류메세지'+xhr.status);
		},
		dataType: 'json'
	})
}


// 공지게시판 출력
const MainNotiBoard = () => {
	console.log('MainNotiBoard');
	
	$.ajax({
		url: `${path}/mainNotiBoard.do`,
		type: 'get',
		success: function(res){
			//console.log('res >> ', res);
			
			code = "";
			
			for(let i = 0; i < 8 && i < res.length; i++){
				title = res[i].board_title;
				date = new Date(res[i].board_date);
				
				code += `<div class="content-item">
					<div class="link"><a href="http://localhost/university/board/board-detail.jsp?board_id=${res[i].board_id}&board_type=${res[i].board_type}">${title}</a></div>
					<div class="data">
						<div class="date"><img alt="아이콘" src="http://localhost/university/main/img/clock.png">${date.toLocaleDateString()}</div>
					</div>
				</div>`
			};
			
			$('.notification .content-items').html(code);
			
		},
		error: function(xhr){
			alert('오류메세지'+xhr.status);
		},
		dataType: 'json'
	})
}

// 문의사항 출력
const MainQuestBoard = () => {
	console.log('MainNotiBoard');
	
	$.ajax({
		url: `${path}/mainQuestBoard.do`,
		type: 'get',
		success: function(res){
			//console.log('res >> ', res);
			
			code = "";
			
			for(let i = 0; i < 8 && i < res.length; i++){
				title = res[i].board_title;
				date = new Date(res[i].board_date);
				
				code += `<div class="content-item">
					<div class="link"><a href="http://localhost/university/board/board-detail.jsp?board_id=${res[i].board_id}&board_type=${res[i].board_type}">${title}</a></div>
					<div class="data">
						<div class="date"><img alt="아이콘" src="http://localhost/university/main/img/clock.png">${date.toLocaleDateString()}</div>
					</div>
				</div>`
			};
			
			$('.question .content-items').html(code);
			
		},
		error: function(xhr){
			alert('오류메세지'+xhr.status);
		},
		dataType: 'json'
	})
}