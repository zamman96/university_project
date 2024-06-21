/**
 * 
 */
function buildList(tag, idName){
	$.ajax({
		url : `${path}/buildingListAll.do`,
		type : "get",
		success : function(data){
			let code = `<select name="room_id" id="${idName}">
			<option value="">건물(전체)</option>`;
			$.each(data, function(){
				code+=`<option value="${this.room_id}">${this.room_id}</option>`;
			})
			code+=`</select>`;
			
			tag.html(code);
		}
	})
}

function buildList2(){
	$.ajax({
		url : `${path}/buildingListAll.do`,
		type : "get",
		success : function(data){
			let code = `<input type="text" id="newId" placeholder="직접입력"><div class="sel-box"><select name="room_id" id="ibId">
			<option value="">직접입력</option>`;
			$.each(data, function(){
				code+=`<option value="${this.room_id}">${this.room_id}</option>`;
			})
			code+=`</select></div> `;
			
			$('#idI').html(code);
		}
	})
}

function numList(tag){
	$.ajax({
		url : `${path}/roomNumListAll.do`,
		data : { room_id : room_id },
		type : "get",
		success : function(data){
			let code = ``;
			$.each(data, function(){
				code+=`<option class='number' value="${this.room_num}">${this.room_num}</option>`;
			})
			$('#numval').append(code);
		}
	})
}

function listPerPage(){
	fdata = $('#roomf').serializeJSON();
	fdata.page = currentPage;

	$.ajax({
		url : `${path}/roomList.do`,
		type : "POST",
		data : JSON.stringify(fdata),
		content : "application/json; charset=utf-8",
		success : function(data){
//			console.log(data);

			let code = `<div class="table-wrap"><table border="1">
			<tr>
				<th>건물번호</th>
				<th>호수</th>
				<th>사용가능여부</th>
				<th>비고</th>
			</tr>`;
		
		$.each(data.datas,function(){
			let available = this.room_available;
			console.log(available);
			if(available=="0"){
				available = "사용불가능";
			}else{
				available = "사용가능";
			}
			
			let remark = this.room_remark;
			if(typeof remark=='undefined'){
				remark = '-';
			}
			code+=`
			<tr class="roomSelect" data-bs-toggle="modal" data-bs-target="#myModal">
			<td id="id">${this.room_id}</td>
			<td id="num">${this.room_num}</td>
			<td id="ava" idx="${this.room_available}">${available}</td>
			<td id="remark">${remark}</td>
			</tr>
			`;
		})	
		code+=`</table></div>`;
		$('#roomList').html(code);
		
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

function deleteRoom(){
	$.ajax({
		url : `${path}/deleteRoom.do`,
		data : { room_id : room_id,
				room_num : room_num },
		type : "post",
		success : function(data){
			console.log(data);
			currentPage = 1;
			listPerPage();
			if(data.trim()==='0'){
				Swal.fire({
  				title: "삭제 실패",
  				text: "사용 불가능한 강의실 입니다",
 				 icon: "error"
				});
			}
		},
		error : function(xhr){
			console.log(xhr.status);
		},
		dataType : "html"
	})
}

function updateList(){
	$('#idT').text(room_id);
	$('#numT').text(room_num);
	let code = `<div class="sel-box">
		<select name="room_available" id="availableT">`;
	if(room_available=='0'){
		code+=`<option value="0" selected>사용불가능</option>
			<option value="1">사용가능</option>`;
	}else{
		code+=`<option value="0">사용불가능</option>
			<option value="1" selected>사용가능</option>`;
	}	
	code+=`</select> 
	</div>`
	$('#avaT').html(code);
	
	$('#remarkT').val(room_remark.replace('-',''));
}

function update(){
	console.log("수정");
	room_available = $('#availableT').val();
	room_remark = $('#remarkT').val();
	$.ajax({
		url : `${path}/updateRoom.do`,
		data : { room_id : room_id,
				room_num : room_num,
				room_available : room_available,
				room_remark : room_remark },
		type : "post",
		success : function(data){
			$('#myModal').hide();
			currentPage = 1;
			listPerPage();
			Swal.fire({
  title: "수정완료",
  text: "변경 완료되었습니다",
  icon: "success"
});
		},
		error : function(xhr){
			console.log(xhr.status);
		}
	})
	
}

function insert(){
	$.ajax({
		url : `${path}/insertRoomnum.do`,
		data : { room_id : room_id,
				room_num : room_num},
		type : "post",
		success : function(data){
			console.log(data);
			$('#myModal2').hide();
			buildList(tag, "bid");
			currentPage = 1;
			listPerPage();
		if(data>0){
				
			Swal.fire({
  			title: "추가완료",
 			text: "추가 완료되었습니다",
 			icon: "success"
			});
		}else{
			Swal.fire({
  			title: "추가 실패",
  			text: "이미 존재하는 호실입니다",
 			 icon: "error"
			});
		}
		},
		error : function(xhr){
			console.log(xhr.status);
		}
	})
	
}
