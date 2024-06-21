<%@page import="member.vo.StuChangeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/global/js/jquery.serializejson.min.js"></script>
<script src="http://localhost/university/student/js/student.js"></script>
<script src="http://localhost/university/student/student-recode.jsp"></script>

<title>Insert title here</title>
</head>
<script>
$(function(){
	$('#send').on('click',function(){
		data = $('#form').serializeJSON();
		console.log(data);
		
		updateStuChange();
		
		$('#form .indata').val("");
		$('#Modal').modal('hide');
	})
})

</script>
<%
// StuChangeVO scVO = (StuChangeVO)request.getAttribute("scVO");
%>





<body>
<h3>휴/복학 변경(ing...)</h3>
<!-- <form action="<%=request.getContextPath() %>/stuChange.do" 
 		method="POST" enctype="multipart/form-data"> -->
		
 <!-- 글쓰기 The Modal -->
<div class="modal" id="Modal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
<!--       <div class="modal-header"> -->
<!--         <h4 class="modal-title">Modal Heading</h4> -->
<!--         <button type="button" class="btn-close" data-bs-dismiss="modal"></button> -->
<!--       </div> -->

      <!-- Modal body -->
      <div class="modal-body">
        <form id="form" name="form">
        	구분
	        	<select name="reg_type" id="reg_tyep">
                    <option value="휴학" selected>휴학</option>
                    <option value="복학">복학</option>
                </select> <br>
        	
<!--         	<label>신청사유</label> -->
<!--         	<textarea rows="5" cols="50" class="indata" name="reg_content" id="reg_content"></textarea> -->
        	
        	
        	<br><br>
        	<input type="button" class="indata" id="send" value="전송">
        	<input type="submit" class="indata" id="reset" value="초기화">
        	
        </form>
      </div>

      <!-- Modal footer -->
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button> -->
<!--       </div> -->

    </div>
  </div>
</div>

</body>
</html>