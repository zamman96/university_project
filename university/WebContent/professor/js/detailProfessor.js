/**
 * 
 */

const selectDetailPro = () =>{
	
	$.ajax({
		url : `${path}/detailProfessor.do`,
		data : JSON.stringity(data),
		type : 'POST',
		contentType : 'application/json; charset=UTF-8',
		dataType : 'JSON',
		success : function(res){
			
		},
		error : function(xhr){
			alert("조회에 실패하였습니다 : "+xhr.status);
		}
		
	})
}

//function listPerPage(){
//	
//	// 검색 대비
//	vtype = $('#stype option:selected').val().trim();
//	vword = $('#sword').val().trim();
//	
//	// 서버전송
//	$.ajax({
//		
//	url : `${mypath}/professorAllList.do`,
//	data : JSON.stringify({ // JSON.stringify : 스크립트형식을 JSON형식으로 바꿈
//		page : currentPage,
//		stype : vtype,
//		sword : vword
//	}),
//	type : 'POST',
//	dataType : 'JSON',
//	success : function(res){
//		// console.log(res);
//			// id=result인 곳에 출력
//			
//			// 출력내용
//			let code = `<div class="container mt-3">
//						 <div id="accordion">`
//			$.each(res.datas,function(i,v){
//				
//				// content의 내용을 줄바꿈처리 한다.
//				content = v.content; // 엔터기호가 포함되어있다.
//				
//				// 엔터기호를 <br>태그로 바꿔서 출력
//				content = content.replaceAll(/\n/g,"<br>")
//				
//				
//				
//				code +=`<div class="card">
//					      <div class="card-header">
//					        <a class="btn action" idx="${v.num}" name="title" data-bs-toggle="collapse" href="#collapse${v.num}">
//					         ${v.subject}
//					        </a>
//					      </div>
//					      <div id="collapse${v.num}" class="collapse" data-bs-parent="#accordion">
//					        <div class="card-body">
//					            <div class="p12">
//					               <p class="p1">
//					                             작성자:<span class="wr">${v.writer}</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
//					                          이메일:<span class="em">${v.mail}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
//					                          조회수:<span class="hi">${v.hit}</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
//					                          날짜 :<span class="da">${v.wdate}</span>         
//					               </p>
//					               <p class ="p2">`
//					               
//								if(uvo!=null && uvo.mem_name == v.writer){
//					               code += `<input idx="${v.num}" type="button"  value="수정" name="modify"  class="action">
//					               <input idx="${v.num}" type="button"  value="삭제" name="delete"  class="action">`
//									
//								}
//					               
//   							code += ` </p>
//					            </div>
//					            <p class="p3">
//					             ${content} <br>
//					            </p>
//					            <p class="p4">
//					            <textarea rows="" cols="60"></textarea>
//					            <input idx="${v.num}" type="button"  value="등록" name="reply"  class="action">
//					            </p>
//					            
//					        </div>
//					      </div>
//					    </div>`
//			}) // 반복문 끝
//			
//			code += `</div>
//					</div>`	
//					
//			// 게시글 3개씩 출력			
//			$('#result').html(code);
//			
//			// 페이징처리
//			pager = pageList(res.sp,res.ep,res.tp)	
//			$('#pageList').html(pager);
//	},
//	error : function(xhr){
//		alert("읽어오기 실패 : "+xhr.status);
//	}
//	
//	})
//		
//}

// 페이징처리 함수
//const pageList = (sp, ep, tp) =>{
//	
//	let pager=`<ul class="pagination">`;
//	
//	// 이전버튼 출력
//	if(sp >1){
//		pager += `<li class="page-item"><a id="prev" class="page-link" href="#">Previous</a></li>`
//	}
//	
//	// 페이지번호 출력
//	for(i=sp; i<=ep; i++){
//		
//		if(currentPage == i){
//			pager += `<li class="page-item active"><a class="page-link pageno" href="#">${i}</a></li>`
//		}else{
//			pager += `<li class="page-item"><a class="page-link pageno" href="#">${i}</a></li>`
//			
//		}
//	}
//	
//	// 다음버튼 출력
//	if(ep < tp){
//		pager += `<li class="page-item"><a id="next"class="page-link" href="#">Next</a></li>`
//		
//	}
//	pager += `<ul>`
//	
//	
//	
//	return pager;
//}