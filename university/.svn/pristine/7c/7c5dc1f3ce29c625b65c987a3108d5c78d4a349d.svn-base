/**
 * 
 */
function regChkStu(){
	$.ajax({
			url : `${path}/regPageChk.do`,
			type : "GET",
			success : function(data){
				let openTime = data.openTime;
				let openDate = data.openDate;
				let closeTime = data.closeTime;
				let closeDate = data.closeDate;
				
				let today = new Date();
				let time = today.getHours();
				
				
				let startDate = new Date(openDate);
				let endDate = new Date(closeDate);
				
				let date = today.getFullYear() + '-' + ((today.getMonth() + 1 < 10) ? '0' : '') + (today.getMonth() + 1) + '-' + ((today.getDate() < 10) ? '0' : '') + today.getDate();
				if (isDateBetween(today, startDate, endDate)){ // open~close 날짜 사이
					if(date==openDate){// 만약 open날과 같을 때
						if(time>=openTime){
							location.href='http://localhost/university/student/courseRegistration.jsp?';
						} else{
							Swal.fire({
							  title: "실패",
 							  text: `수강신청은 ${openTime}시부터 가능합니다`,
							  icon: "error"
							});
						}
					} else if(date==closeDate){ // close날과 같을 때
						if(time<closeTime){
							location.href='http://localhost/university/student/courseRegistration.jsp?';
						} else{
							Swal.fire({
							  title: "실패",
 							  text: `수강신청 기간동안만 가능합니다`,
							  icon: "error"
							});
						} // 시간 조건 끝
					} else{
						location.href='http://localhost/university/student/courseRegistration.jsp?';
					}
				} else{ // 그 사이가 아닐때
					Swal.fire({
							  title: "실패",
 							  text: `수강신청 기간동안만 가능합니다`,
							  icon: "error"
							});
				}
			},
//			dataType : "json",
			error : function(xhr){
				console.log("에러"+xhr.status);
			}
		})
}

function isDateBetween(date, start, end) {
    return start <= date && date <= end;
}
