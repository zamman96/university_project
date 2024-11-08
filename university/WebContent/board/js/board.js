/**
 * 
 */



const listPerPage = () => {
	fdata = $('#searchf').serializeJSON();
	fdata.page = currentPage;
	fdata.board_type = board_type;
//	console.log('test');
	
	// 서버전송
	$.ajax({
		
		url : `${path}/BoardList.do`,
		data : JSON.stringify(fdata),
		contentType : 'application/json; charset=utf-8',
		type : 'POST',
		success : function(res){
//			console.log(res);
			let code = `<div class="list-container">`;
			
			// 요소 한개
			// res.sp
			
			// 배열 요소
			$.each(res.datas, function(i, v){
				
				code += `<div class="list-box">
					      <div class="list-num">${num++}</div>
							<div class="list-subject">
								<div class="list-subject-title">
									<a href="http://localhost/university/board/board-detail.jsp?board_id=${v.board_id}&board_type=${board_type}">${v.board_title}</a>
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
			
			$('#result').html(code);
			
			
			// 페이징 처리
			let pageCode = pageList(res.sp, res.ep, res.tp);
			
			$('.pagination-wrap').html(pageCode);
			
			
		}, // success
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'	
	}) // ajax
	
} // function

const pageList = (sp, ep, tp) => {
	let pageCode = `<div class="pagination">`;
	
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
	pageCode += `</div>`;
	
	return pageCode;
}

function updateHit(){
	$.ajax({
		url : `${path}/UpdateHit.do`,
		data : {
			board_id : board_id,
			board_type : board_type	
		},
		type : 'POST',
		success : function(res){
//			console.log(res);
			detailBoard();
		}
	})
}

function detailBoard(){
	$.ajax({
		url : `${path}/DetailBoard.do`,
		data : {
			board_id : board_id,
			board_type : board_type	
		},
		type : 'POST',
		success : function(res){
			console.log(res);
			let writer = res.mem_name;
			if(board_type=='0'){
				writer = '관리자';
			}
			console.log(res);
			$('#title').text(res.board_title);
			$('#writer').text(writer);
			$('#hit').text(res.board_hit);
			$('#date').text(res.board_date);
			$('#content').html(res.board_content.replace(/\n/g, "<br>"));
			let code = '';
			file = res.file_origin_name;
			if(typeof res.file_origin_name=='undefined'){
				file = '';
			}
			if(file!=''){
				code=`<a href="${path}/FileDownload.do?save_file=${res.file_save_name}&origin_file=${file}">${file}</a>`;
				$('#file').html(code);
			} 
			
			let idm = res.mem_id;
			if(board_type=='0'){// 공지
				if(uvo.mem_grantno!=3){
					$('.section-top-right').html('');
				}
			} else{
				if(uvo.mem_grantno!=3){
					$('.reply-admin').html('');	// 댓글 수정 삭제 삭제
				}
				if(uvo.mem_id!=idm){
				$('.section-top-right').html('');
			} 
	}
		}
	})
}
	
function updateDetailBoard(){
	$.ajax({
		url : `${path}/DetailBoard.do`,
		data : {
			board_id : board_id,
			board_type : board_type	
		},
		type : 'POST',
		success : function(res){
			if(board_type=='0'){
				writer = '관리자';
			}
			console.log(res);
			$('#title').val(res.board_title);
			$('#content').val(res.board_content);
			let code = '';
			file = res.file_origin_name;
			if(typeof res.file_origin_name=='undefined'){
				file = '';
			}
			if(file!=''){
				code=`<a href="${path}/FileDownload.do?save_file=${res.file_save_name}&origin_file=${file}">${file}</a>`;
				$('#filename').html(code);
				$('#filereset').css('display', 'inline');
				$('#filesave').text(res.file_save_name);
			} 
		}
	})
}

const writeBoard =()=>{
	$.ajax({
		url : `${path}/BoardFileupload.do`,
		data : formData,
		type : 'post',
		processData: false, // 파일 데이터를 전송할 때 필요
        contentType: false, // 파일 데이터를 전송할 때 필요
		success : function(res){
			// 글쓰기 성공 시 게시판 출력 함수를 콜백으로 실행
			if(board_type=='0'){
				location.href='http://localhost/university/board/notice-board.jsp';
			} else{
				location.href='http://localhost/university/board/qa-board.jsp';
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}

function deleteBoard(){
	$.ajax({
		url : `${path}/DeleteBoard.do`,
		data : {board_id: board_id,
				board_type},
		type : 'get',
		success : function(res){
			if(board_type=='0'){
				location.href='http://localhost/university/board/notice-board.jsp';
			} else{
				location.href='http://localhost/university/board/qa-board.jsp';
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}

function updateBoard(){
	$.ajax({
		url : `${path}/BoardUpdate.do`,
		data : formData,
		type : 'post',
		processData: false, // 파일 데이터를 전송할 때 필요
        contentType: false, // 파일 데이터를 전송할 때 필요
		success : function(res){
			location.href=`http://localhost/university/board/board-detail.jsp?board_id=${board_id}&board_type=${board_type}`;
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}

function replyView(){
	$.ajax({
		url : `${path}/selectReply.do`,
		data : {board_id: board_id,
				board_type : board_type},
		type : 'post',
		success : function(res){
				let code = `<table id="table">`;
				if(res.length==0){
					$('#replyInsert').show();
					$('#replyUpdate').hide();
					$('#replyDelete').hide();
				} else if(res.length==1){
					$('#replyUpdate').show();
					$('#replyDelete').show();
					$('#replyInsert').hide();
				}
									
				$.each(res, function(){

					let date = this.reply_date.substr(0,11);

					let rewriter = this.mem_name;
					if(uvo.mem_grantno!=3){
						rewriter = '관리자';
					}
						code+=`<tr>
									<th>작성자</th>
									<td id="rwrite">${rewriter}</td>
									<th>날짜</th>
									<td id="rdate">${date}</td>
								</tr>
								<tr>
									<td colspan="4" id="rcont">${this.reply_content.replace(/\n/g, "<br>")}</td>
								</tr>
							</table>`;
					reply_id = this.reply_id;
				})
				$('.reply-container').html(code);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}

function insertReply(){
	let reply_content = $('#newRCont').val();
	$.ajax({
		url : `${path}/insertReply.do`,
		data : {board_id: board_id,
				board_type : board_type,
				mem_id : uvo.mem_id,
				reply_content : reply_content},
		type : 'post',
		success : function(res){
			replyView();
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}

function insertForm(){
	$('#replyTitle').text('답변 작성');
	let code = `<table id="table">
								<tr>
									<th colspan="4">내용</th>
								</tr>
								<tr>
									<td colspan="4" class="rcont">
									<div class="reply-content"><textarea id="newRCont" class="reply-content-text"></textarea></div>
									<div class="reply-button">
										<input type="button" id="replyInsertComplete" value="완료">
										<input type="button" id="replyInsertCancel" value="취소">
									</div>
										
									</td>
								</tr>
							</table>`;
	$('.reply-container').html(code);
}

function updateForm(){
		$.ajax({
		url : `${path}/selectReply.do`,
		data : {board_id: board_id,
				board_type : board_type},
		type : 'post',
		success : function(res){
				let code = `<table id="table">`;
				$.each(res, function(){
								code+=`<tr>
									<th colspan="4">내용</th>
								</tr>
								<tr>
									<td colspan="4" class="rcont">
									<div class="reply-content"><textarea id="upRCont" class="reply-content-text">${this.reply_content}</textarea></div>
									<div class="reply-button">
										<input type="button" id="replyUpdateComplete" value="완료">
										<input type="button" id="replyUpdateCancel" value="취소">
									</div>
										
									</td>
								</tr>
							</table>`;
				})
			$('.reply-container').html(code);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}

function updateReply(){
	let reply_content = $('#upRCont').val();
	$.ajax({
		url : `${path}/updateReply.do`,
		data : {board_id: board_id,
				board_type : board_type,
				reply_id : reply_id,
				mem_id : uvo.mem_id,
				reply_content : reply_content},
		type : 'post',
		success : function(res){
			replyView();
		}
	})
		
}

function deleteReply(){
	$.ajax({
		url : `${path}/deleteReply.do`,
		data : {board_id: board_id,
				board_type : board_type,
				reply_id : reply_id},
		type : 'post',
		success : function(res){
			replyView();
		}
	})
		
}
