/**
 * 반드시 스크립트에 아래를 추가할것
path = '<%=request.getContextPath()%>'; 
 */
function colleageList(){
	$.ajax({
		url : `${path}/colleageList.do`,
		datatype : "json",
		success : function(data){
			let code = `<select id="cid" name="col_id">
			<option value="0">단과대 </option>`;
			$.each(data, function(){
				code += `<option value="${this.col_id}">${this.col_name}</option>`
			})
			code += `</select>`;	
			
			$('#colleageList').html(code);	
			majorList();	
		}
	})
}



function majorList(){
	$.ajax({
		url : `${path}/majorList.do`,
		data : { col_id : vcid },
		datatype : "json",
		success : function(data){
//			console.log(data);
			let code = `<select id="mid" name="major_id">
			<option value="0">학과 </option>`;
			$.each(data, function(){
				code += `<option value="${this.major_id}">${this.major_name}</option>`
			})
			code += `</select>`;		
			$('#majorList').html(code);		
		}
	})
}


/* 태그 전달 */
function colleageListTag(tag, name){
	$.ajax({
		url : `${path}/colleageList.do`,
		datatype : "json",
		success : function(data){
			let code = `<select id="${name}" name="col_id">
			<option value="0">전체 </option>`;
			$.each(data, function(){
				code += `<option value="${this.col_id}">${this.col_name}</option>`
			})
			code += `</select>`;	
			
			tag.html(code);	
			majorList();	
		}
	})
}


function majorListTag(tag, name){
	$.ajax({
		url : `${path}/majorList.do`,
		data : { col_id : vcid },
		datatype : "json",
		success : function(data){
			let code = `<select id="${name}" name="major_id">
			<option value="0">미선택 </option>`;
			$.each(data, function(){
				code += `<option value="${this.major_id}">${this.major_name}</option>`
			})
			code += `</select>`;		
			tag.html(code);		
		}
	})
}
