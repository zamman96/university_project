function timetable(){
	let arr = [];
	
	$.ajax({
		url : `${path}/course/timetable.do`,
		data : {
			id : uvo.mem_id,
			year : syear,
			term : sterm
		},	
		type : "GET",
		success : function(data){
			let tableCode = 
				`<div class="time">
					<div>1교시</div>
					<div>2교시</div>
					<div>3교시</div>
					<div>4교시</div>
					<div>5교시</div>
					<div>6교시</div>
					<div>7교시</div>
					<div>8교시</div>
					<div>9교시</div>
				</div>
							
				<table class="calendar-table">
					<thead>
						<tr>
							<th>월</th>
							<th>화</th>
							<th>수</th>
							<th>목</th>
							<th>금</th>
						</tr>
					</thead>
				<tbody>`;
			for(let cla=1; cla<=9; cla++){
					tableCode+=`<tr>`;
					for(let week=1; week<=5; week++){
						let weekStr = "월";
						if(week==2){
							weekStr = "화";
						} else if(week==3){
							weekStr ="수";
						}else if(week==4){
							weekStr ="목";
						}else if(week==5){
							weekStr ="금";
						}
						let course = "false"
						let subject_name = "";
						let subjectNum = 100;
			$.each(data, function(i,v){
				if(this.time_class==cla && this.time_week==weekStr){
					course = "true";
					subject_name = this.subject_name;
					console.log(arr);
					console.log(weekStr+"요일"+cla+"교시");
					for(var i=0; i<arr.length; i++){
						if(arr[i]==subject_name){
							subjectNum=i+1;
						}
					}
					if(subjectNum==100){
						arr.push(subject_name);
						subjectNum=arr.length;
					}
				}
			})
						if(course=="true"){
							tableCode+=`<td class=lecture-${subjectNum}>${subject_name}</td>`;
						} else {
							tableCode+=`<td></td>`;
						}
					}
					tableCode+=`</tr>`;
				}
			tableCode+=`</tbody></table>`;				
			
			$('.lecture-calendar').html(tableCode);
				
		},
		error : function(xhr){
			console.log(xhr.status);
		},
		dataType : "json"
	})

}

function timetablePro(){
	let arr = [];
	
	$.ajax({
		url : `${path}/course/timetablePro.do`,
		data : {
			id : uvo.mem_id,
			year : syear,
			term : sterm
		},
		type : "GET",
		success : function(data){
			let tableCode = 
				`<div class="time">
					<div>1교시</div>
					<div>2교시</div>
					<div>3교시</div>
					<div>4교시</div>
					<div>5교시</div>
					<div>6교시</div>
					<div>7교시</div>
					<div>8교시</div>
					<div>9교시</div>
				</div>
							
				<table class="calendar-table">
					<thead>
						<tr>
							<th>월</th>
							<th>화</th>
							<th>수</th>
							<th>목</th>
							<th>금</th>
						</tr>
					</thead>
				<tbody>`;
			for(let cla=1; cla<=9; cla++){
					tableCode+=`<tr>`;
					for(let week=1; week<=5; week++){
						let weekStr = "월";
						if(week==2){
							weekStr = "화";
						} else if(week==3){
							weekStr ="수";
						}else if(week==4){
							weekStr ="목";
						}else if(week==5){
							weekStr ="금";
						}
						let course = "false"
						let subject_name = "";
						let subjectNum = 100;
			$.each(data, function(i,v){
				if(this.time_class==cla && this.time_week==weekStr){
					course = "true";
					subject_name = this.subject_name;
					console.log(arr);
					console.log(weekStr+"요일"+cla+"교시");
					for(var i=0; i<arr.length; i++){
						if(arr[i]==subject_name){
							subjectNum=i+1;
						}
					}
					if(subjectNum==100){
						arr.push(subject_name);
						subjectNum=arr.length;
					}
				}
			})
						if(course=="true"){
							tableCode+=`<td class=lecture-${subjectNum}>${subject_name}</td>`;
						} else {
							tableCode+=`<td></td>`;
						}
					}
					tableCode+=`</tr>`;
				}
			tableCode+=`</tbody></table>`;				
			
			$('.lecture-calendar').html(tableCode);
				
		},
		error : function(xhr){
			console.log(xhr.status);
		},
		dataType : "json"
	})

}