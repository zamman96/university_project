/**
 * 
 */

/*수강하는 학생 정보 받기 */
function scoreList(){
	$.ajax({
		url : `${path}/scoreList.do`,
		data : JSON.stringify(lvo),
		dataType : "json",
		type : "post",
		success : function(data){
//			console.log(data);
			let code = `
			<div class="modal1-wrap-title">성적 입력</div>
			<div class="table-wrap"><table border="1">
			<thead>
			<tr>
				<th colspan="6">개인 정보</th>
				<th colspan="6">점 수</th>
			</th>
			<tr>
				<th>학번</th>
				<th>힉과이름</th>
				<th>이름</th>
				<th>학년</th>
				<th>성별</th>
				<th>생년월일</th>
				<th>중간점수</th>
				<th>기말점수</th>
				<th>과제점수</th>
				<th>출석점수</th>
				<th>총 점수</th>
				<th>환산점수</th>
			</tr></thead><tbody>`;
			
			$.each(data, function(){
			let bir = this.mem_bir.substr(0,11);
			let all_score = this.all_score;
			if (this.attend_score == 0) {
 			   all_score = 0;
			} else if(all_score==0){
				all_score="";
			}

   	let scoreOptions = [
        { value: "4.5", label: "A+" },
        { value: "4", label: "A" },
        { value: "3.5", label: "B+" },
        { value: "3", label: "B" },
        { value: "2.5", label: "C+" },
        { value: "2", label: "C" },
        { value: "1.5", label: "D+" },
        { value: "1", label: "D" },
        { value: "0", label: "F" }
    ];

    let optionsHtml = scoreOptions.map(option => 
        `<option value="${option.value}" ${all_score == option.value ? 'selected' : ''}>${option.label}</option>`
    ).join('');
			code+=`<tr class="stud" idx="${this.stu_id}">
			<td>${this.stu_id}</td>
			<td class="major">${this.major_name}</td>
			<td class="memname">${this.mem_name}</td>
			<td class="grade">${this.stu_grade}</td>
			<td class="gender">${this.mem_gender}</td>
			<td class="bir">${bir}</td>
			<td class="textbox"><input class="mid" value="${this.mid_score}" type="text"></td>
			<td class="textbox"><input class="final" value="${this.final_score}" type="text"></td>
			<td class="textbox"><input class="assign" value="${this.assign_score}" type="text"></td>
			<td class="textbox"><input class="attend" value="${this.attend_score}" disabled type="text"></td>
			<td class="textbox">
			<select class="all">`;
			code+=`
				${optionsHtml}
			</select>
			</td>
			<td class="textbox"><input class="sum" value="0" type="text" disabled></td>
			</tr>`;
			})
			code+=`</tbody></table>`;
			$('#stuList').html(code);
		}
	})

}

/* 환산 점수 */
function sumScore(){
	let mid = $('#midper').val();
	let fin = $('#finper').val();
	let ass = $('#assper').val();
	let att = $('#attper').val();
	
	let allper = parseInt(mid)+parseInt(fin)+parseInt(ass)+parseInt(att);
	
	mid = mid/allper;
	fin = fin/allper;
	ass = fin/allper;
	att = fin/allper;
	
	const tr = document.querySelectorAll('.stud');
	tr.forEach(function(tr){
		let mids = $('.mid', tr).val();
		let fins = $('.final', tr).val();
		let asss = $('.assign', tr).val();
		let atts = $('.attend', tr).val();
		let sumscore = 0;
		if(atts!=0){
			sumscore = mids*mid + fin*fins + asss*ass + att*atts;
		}
		$('.sum',tr).val(sumscore);		
	})
}

function insertScore(){
	$.ajax({
		url : `${path}/insertScore.do`,
		data : JSON.stringify(lvo),
		dataType : "json",
		type : "post",
		success : function(data){
			location.href =`http://localhost/university/lectureMain.do?subject_id=${subject_id}&year=${year}&term=${term}`;
		},
		error : function(xhr){
			console.log(xhr.status);
		}
	})
}

function updateScore(){
	$.ajax({
		url : `${path}/updateScore.do`,
		data : JSON.stringify(lvo),
		dataType : "json",
		type : "post",
		success : function(data){
			location.href =`http://localhost/university/lectureMain.do?subject_id=${subject_id}&year=${year}&term=${term}`;
		},
		error : function(xhr){
			console.log(xhr.status);
		}
	})
}

function chk(){
	$.ajax({
		url : `${path}/scoreListChk.do`,
		data : JSON.stringify(lvo),
		dataType : "json",
		type : "post",
		success : function(data){
			if(data==1){
				insertChk = "true";
			}
		},
		error : function(xhr){
			console.log(xhr.status);
		}
	})
}
 
function rankScore(){
		$.ajax({
		url : `${path}/rankScore.do`,
		data : JSON.stringify(rvoList),
		dataType : "json",
		type : "post",
		success : function(data){
			console.log(data);
			let code = `<div class="table-wrap"><table border="1">
			<thead>
			<tr>
				<th colspan="6">개인 정보</th>
				<th colspan="6">점 수</th>
			</th>
			<tr>
				<th>학번</th>
				<th>힉과이름</th>
				<th>이름</th>
				<th>학년</th>
				<th>성별</th>
				<th>생년월일</th>
				<th>중간점수</th>
				<th>기말점수</th>
				<th>과제점수</th>
				<th>출석점수</th>
				<th>총 점수</th>
				<th>환산점수</th>
			</tr></thead><tbody>`;
			
			$.each(data, function(){
   	let scoreOptions = [
        { value: "", label: "미선택" },
        { value: "4.5", label: "A+" },
        { value: "4", label: "A" },
        { value: "3.5", label: "B+" },
        { value: "3", label: "B" },
        { value: "2.5", label: "C+" },
        { value: "2", label: "C" },
        { value: "1.5", label: "D+" },
        { value: "1", label: "D" },
        { value: "0", label: "F" }
    ];
	let all_score = this.all_score;
	
	if(this.attend_score==0){
		all_score=0;
	}
	
    let optionsHtml = scoreOptions.map(option => 
        `<option value="${option.value}" ${all_score == option.value ? 'selected' : ''}>${option.label}</option>`
    ).join('');
			code+=`<tr class="stud" idx="${this.stu_id}">
			<td>${this.stu_id}</td>
			<td class="major">${this.major_name}</td>
			<td class="memname">${this.mem_name}</td>
			<td class="grade">${this.stu_grade}</td>
			<td class="gender">${this.mem_gender}</td>
			<td class="bir">${this.mem_bir}</td>
			<td class="textbox"><input class="mid" value="${this.mid_score}" type="text"></td>
			<td class="textbox"><input class="final" value="${this.final_score}" type="text"></td>
			<td class="textbox"><input class="assign" value="${this.assign_score}" type="text"></td>
			<td class="textbox"><input class="attend" value="${this.attend_score}" disabled type="text"></td>
			<td class="textbox">
			<select class="all">`;
			code+=`
				${optionsHtml}
			</select>
			</td>
			<td class="textbox"><input class="sum" value="${this.sum_score}" type="text" disabled></td>
			</tr>`;
			})
			code+=`</tbody></table>`;
			$('#stuList').html(code);
		}
	})
}