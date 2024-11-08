/**
 * selectLecture, lectureMain, subject_Update 에서 사용
 */
/* 강의하는 강좌정보받기 */
function proList(){
	pvo = {
		pro_id : pro_id,
		year : year,
		term : term
	};
	$.ajax({
		url : `${path}/professorLectureList.do`,
		data : pvo,
		dataType : "json",
		type : "post",
		success : function(data){
//			console.log(data);
			let num = 1;
			let code =`
			<div class="row">`;
			$.each(data, function(){
			code+=`
  			<div class="column" onclick="location.href ='http://localhost/university/lectureMain.do?subject_id=${this.subject_id}&year=${year}&term=${term}'">
   				 <div class="card">
   				 <div class="lecture-${num++}">
				${this.subject_id}
  		  </div>
  		  	<div class="card-title">
 		     <h3>${this.subject_name}</h3>
 			</div>
			
  		    <div class="card-info">${this.mem_name}<br>${this.time_name}<br>
   		   ${this.room_id} ${this.room_num}호</div>
   			 </div>
 			 </div>`;
			})
 			code+=`</div>`;
			
			$('#proList').html(code);
		}
	})
}

function main(data){
	$('.title').text(data.subject_name);
	
	let infoCode = `<div class="table-wrap"><table border="1">
			<tr>
				<th>년도</th>
			<td id="year">${data.year}</td>
				<th>학기</th>
			<td id="term">${data.term}</td>
				<th>학년</th>
			<td id="grade">${data.subject_grade}</td>
				<th>학점</th>
			<td id="credit">${data.subject_credit}</td>
			</tr>
			<tr>
				<th colspan="2">과목분류</th>
			<td colspan="2" id="type">${data.subject_type}</td>
				<th>교수</th>				
			<td id="pro_name">${data.mem_name}</td>
				<th>학과명</th>
			<td id="major" idx="${data.major_id}">${data.major_name}</td>
			</tr>
			<tr>
				<th colspan="2">과목명</th>
			<td id="name" colspan="2">${data.subject_name}</td>
				<th>수강가능인원</th>
			<td id="lec_cnt">${data.lec_count}</td>
				<th>수강 인원</th>
			<td id="cur_cnt">${data.current_count}</td>
			</tr>
			<tr>
				<th colspan="2">과목번호</th>
			<td colspan="2" id="id">${data.subject_id}</td>
				<th>시간</th>
			<td id="time">${data.time_name}</td>
				<th>강의실</th>
			<td id="room">${data.room_id} ${data.room_num}호</td>
			</tr>
			</table></div>
			<br>
			<br>`;
			
	let menuCode = `
	<div id="lecMange" class="selectMenu" onclick="location.href='http://localhost/university/professor/subject_Update.jsp?subject_name=${subject_name}&subject_id=${subject_id}&year=${year}&term=${term}'">강의 계획서 관리</div>
	<div id="attend" class="selectMenu" onclick="location.href='http://localhost/university/professor/attendance.jsp?subject_name=${subject_name}&subject_id=${subject_id}&year=${year}&term=${term}'">출석 입력/수정</div>
	<div id="score" class="selectMenu"  onclick="location.href='http://localhost/university/professor/score.jsp?subject_name=${subject_name}&subject_id=${subject_id}&year=${year}&term=${term}'">성적입력</div>
	<div id="stuManage" class="selectMenu" onclick="location.href='http://localhost/university/professor/courseStuList.jsp?subject_name=${subject_name}&subject_id=${subject_id}&year=${year}&term=${term}'">수강 학생 관리</div>
	`;
	
	$('#lectureInfo').html(infoCode);
	$('#selectMenu').html(menuCode);
}

function subjectUpdateDetail(){
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
            <form id="updatef">
	            <div class="modal1-wrap">
					<div class="sel2-boxs">
						<div class="modal1-wrap-title">과목 설정</div>
						<div class="sel2-box">
			        		<div class="sel2-box-title">과목번호</div>
			        		<div class="sel2-box-result w-260">${subject_id}</div>
			        	</div> 
						<div class="sel2-box">
			        		<div class="sel2-box-title">과목명</div>
			        		<input class="sel2-box-result w-260" value="${subject_name}" name="subject_name" type="text" readonly>
			        	</div> 
						<div class="sel2-box">
			        		<div class="sel2-box-title">과목분류</div>
			        		<input class="sel2-box-result w-260" name="subject_type" value="${subject_type}" readonly>
			        	</div>
			        	<div class="sel2-box">
			        		<div class="sel2-box-title">단과대명</div>
			        		<div class="sel2-box-result w-260">${col_name}</div>
			        	</div> 
			        	<div class="sel2-box">
			        		<div class="sel2-box-title">학과명</div>
			        		<div class="sel2-box-result w-260">${major_name}</div>
			        	</div> 
						
						<div class="sel-box-inline">
							<div class="sel2-box">
				        		<div class="sel2-box-title">학기</div>
				        		<input class="sel2-box-result inline-input" name="subject_term" value="${subject_term}" readonly>
				        	</div> 
							<div class="sel2-box">
				        		<div class="sel2-box-title">학년</div>
				        		<input class="sel2-box-result inline-input" name="subject_grade" value="${subject_grade}" readonly>
				        	</div> 
							<div class="sel2-box">
				        		<div class="sel2-box-title">학점</div>
				        		<input class="sel2-box-result inline-input" name="subject_credit" value="${subject_credit}" readonly>
				        	</div> 
			        	</div> 
						
						<div class="sel-box-inline">
							<div class="sel2-box">
				        		<div class="sel2-box-title">이론시간</div>
				        		<input class="sel2-box-result inline-input" type="text" name="subject_theory" value="${subject_theory}" readonly>
				        	</div> 
							<div class="sel2-box">
				        		<div class="sel2-box-title">실습시간</div>
				        		<input class="sel2-box-result inline-input" type="text" name="subject_training" value="${subject_training}" readonly>
				        	</div> 
			        	</div> 
		        	</div> 
			        	
					
					<div class="item-boxs">
						<div class="modal1-wrap-title">과목 상세</div>
							<div class="item-box">
					        	<div class="item-box-title">개요</div>
				        		<textarea class="item-box-text" name="subject_outline">${subject_outline.replace(/\n/g, "<br>")}</textarea>
				            </div>
				            <div class="item-box">
					        	<div class="item-box-title">목표</div>
				        		<textarea class="item-box-text" name="subject_target">${subject_target.replace(/\n/g, "<br>")}</textarea>
				            </div>
				            <div class="item-box">
					        	<div class="item-box-title">주교재</div>
				        		<textarea class="item-box-text" name="subject_t_book">${subject_t_book.replace(/\n/g, "<br>")}</textarea>
				            </div>
				            <div class="item-box">
					        	<div class="item-box-title">부교재</div>
				        		<textarea class="item-box-text" name="subject_s_book">${subject_s_book.replace(/\n/g, "<br>")}</textarea>
				            </div>
				            <div class="item-box">
					        	<div class="item-box-title">참고자료</div>
				        		<textarea class="item-box-text" name="subject_r_file">${subject_r_file.replace(/\n/g, "<br>")}</textarea>
				            </div>
				            <div class="item-box">
					        	<div class="item-box-title">선행학습자료</div>
				        		<textarea class="item-box-text" name="subject_p_file">${subject_p_file.replace(/\n/g, "<br>")}</textarea>
				            </div>								
						</div>
					</div>	
					<footer class="dialog__footer">
						<button class="submit" id="update" type="button">수정</button>
						<button class="submit" id="cancel" type="button">취소</button>
					</footer>
				</form>	
				`;

				
//            console.log('생성된 HTML 코드:', code);

            $('#lectureInfo').html(code);
		
		},
		dataType : 'json',
		error : function(xhr, status, error){
			console.log(xhr, status, error);
		}
	})
}
/*
function subjectUpdateDetail(){
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

            let code = `<form id="updatef"><div class="table-wrap"><table border="1">
            <tr>
                <th colspan="2">과목번호</th>
                <td colspan="2">${subject_id}</td>
                <th colspan="2">과목명</th>
                <td colspan="2"><input value="${subject_name}" name="subject_name" type="text" readonly></td>
            </tr>
			<tr>
                <th class="th-size">과목분류</th>
                <td><input name="subject_type" value="${subject_type}" readonly></td>
</td>
                <th class="th-size">단과대명</th>
                <td>${col_name}</td>
                <th class="th-size">학과명</th>
                <td>${major_name}</td>
                <th class="th-size">학기</th>
                <td><input name="subject_term" value="${subject_term}" readonly></td>
			</tr>
            <tr>
                <th class="th-size">학년</th>
                <td>
					<input name="subject_grade" value="${subject_grade}" readonly></td>
                <th class="th-size">학점</th>
                <td>
					<input name="subject_credit" value="${subject_credit}" readonly></td>
				</td>
                <th class="th-size">이론시간</th>
                <td><input type="text" name="subject_theory" value="${subject_theory}" readonly></td>
                <th class="th-size">실습시간</th>
                <td><input type="text" name="subject_training" value="${subject_training}" readonly></td>
            </tr>
            <tr>
                <th colspan="8">개요</th>
            </tr>
            <tr>
                <td colspan="8"><textarea name="subject_outline">${subject_outline.replace(/\n/g, "<br>")}</textarea></td>
            </tr>
            <tr>
                <th colspan="8">목표</th>
            </tr>
            <tr>
                <td colspan="8"><textarea name="subject_target">${subject_target.replace(/\n/g, "<br>")}</textarea></td>
            </tr>
            <tr>
                <th colspan="8">주교재</th>
            </tr>
            <tr>
                <td colspan="8"><textarea name="subject_t_book">${subject_t_book.replace(/\n/g, "<br>")}</textarea></td>
            </tr>
            <tr>
                <th colspan="8">부교재</th>
            </tr>
            <tr>
                <td colspan="8"><textarea name="subject_s_book">${subject_s_book.replace(/\n/g, "<br>")}</textarea></td>
            </tr>
            <tr>
                <th colspan="8">참고자료</th>
            </tr>
            <tr>
                <td colspan="8"></td>
            </tr>
            <tr>
                <th colspan="8">선행학습자료</th>
            </tr>
            <tr>
                <td colspan="8"></td>
            </tr>
            </table></div>
			<button class="submit" id="update" idx="${subject_id}" type="button">수정</button>
			<button class="submit" id="cancel" idx="${subject_id}" type="button">취소</button>`;

				
//            console.log('생성된 HTML 코드:', code);

            $('#lectureInfo').html(code);
		
		},
		dataType : 'json',
		error : function(xhr, status, error){
			console.log(xhr, status, error);
		}
	})
}*/

function update(){
	udata = $('#updatef').serializeJSON();
	udata.subject_id = subject_id;
	$.ajax({
		url : `${path}/updateSubject.do`,
		type : "POST",
		data : JSON.stringify(udata),
		success : function(data){
			location.href =`http://localhost/university/lectureMain.do?subject_id=${subject_id}&year=${year}&term=${term}`;
		}
	})
}