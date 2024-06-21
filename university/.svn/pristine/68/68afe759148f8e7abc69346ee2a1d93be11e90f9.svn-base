/**
 * 
 */
function allSum(){
	$.ajax({
		url : `${path}/ScoreTableCal.do`,
		data : { stu_id : stu_id },
		dataType : "json",
		success : function(data){
						console.log(data);
			$('#agrs').text(data.grs);
			$('#agss').text(data.gss);
			$('#amrs').text(data.mrs);
			$('#amss').text(data.mss);
			$('#ates').text(data.tes);
			$('#acre').text(data.cre);
			$('#asum').text(data.sum);
			$('#aavg').text(data.avg);
		}
	})
}

function partSum(){
	$.ajax({
		url : `${path}/ScoreTableCal.do`,
		data : { stu_id : stu_id,
				year : year,
				term : term },
		dataType : "json",
		success : function(data){
			$('#grs').text(data.grs);
			$('#gss').text(data.gss);
			$('#mrs').text(data.mrs);
			$('#mss').text(data.mss);
			$('#tes').text(data.tes);
			$('#cre').text(data.cre);
			$('#sum').text(data.sum);
			$('#avg').text(data.avg);
		}
		
	})
}

function yearTerm(){
	$.ajax({
		url : `${path}/courseYearTerm.do`,
		data : { stu_id : stu_id,
				year : year,
				term : term },
		dataType : "json",
		success : function(data){
//			console.log(data);
			$.each(data, function(){
				yearterm.push(this);
			})
//			console.log(yearterm);
			num = yearterm.length-1;
			let text_term = yearterm[num].course_term;
			term = yearterm[num].term;
			year = yearterm[num].year;
			$('#year-term').text(text_term);
			
			partSum();
			scoreList();
		}
	})
}

function scoreList(){
	$.ajax({
		url : `${path}/scoreStuList.do`,
		data : { stu_id : stu_id,
				year : year,
				term : term },
		dataType : "json",
		success : function(data){
//			console.log(data);
			let code = `<table>
			<tr>
				<th>년도/학기</th>
				<th>과목코드</th>
				<th>강의명</th>
				<th>이수</th>
				<th>학점</th>
				<th>평점</th>
			</tr>
			`;
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


	for (let i = 0; i < scoreOptions.length; i++) {
    if (scoreOptions[i].value === this.all_score) {
        score = scoreOptions[i].label;
        break;
    }
}
				
				code+=`<tr>
				<td>${this.year}/${this.term}</td>
				<td>${this.subject_id}</td>
				<td>${this.subject_name}</td>
				<td>${this.subject_type}</td>
				<td>${this.subject_credit}</td>
				<td>${score}</td>
				</tr>`;
			})
			code+=`</table>`;
			$('.table-wrap').html(code);
		}
		
	})
}