/**
 * 
 */
function openReg(){
	$.ajax({
			url : `${path}/regPageOpen.do`,
			data : lvo,
			type : "POST",
			success : function(data){
				Swal.fire({
  title: "변경 완료",
  text: "해당 날짜에 수강신청하도록 설정했습니다",
  icon: "success"
});
			}
		})
}

function regChk(){
	console.log("chk");
	$.ajax({
			url : `${path}/regPageChk.do`,
			type : "GET",
			success : function(data){
				console.log(data);
//				if(data!=''){
				let openTime = data.openTime;
				let openDate = data.openDate;
				let closeTime = data.closeTime;
				let closeDate = data.closeDate;
				
				$('#openDate').val(openDate);
				$('#openTime').val(openTime);
				$('#closeDate').val(closeDate);
				$('#closeTime').val(closeTime);
//				}
			},
//			dataType : "json",
			error : function(xhr){
				console.log("에러"+xhr.status);
			}
		})
}