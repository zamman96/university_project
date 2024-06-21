<%@page import="member.vo.StuChangeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%

List<StuChangeVO> tcList = (List<StuChangeVO>)request.getAttribute("tcList");

%>
<body>

<h3>휴학신청 학생 조회</h3>
<input type="button" value="목록으로" onclick="location.href='<%=request.getContextPath()%>/searchStuChangeList.do'">
<input type="button" value="복학신청 학생조회" onclick="location.href='<%=request.getContextPath()%>/reg_typeChangeList2.do'">


<table border="1">
<thead>
		
	<tr>
		<th>이름</th><th>년도</th><th>학기</th><th>학번</th><th>신청일</th><th>구분</th><th>사유</th><th>승인/반려</th>
	</tr>	
</thead>
<tbody>
<%
	if(tcList==null || tcList.size()==0){
%>
	<tr>
		<td colspan="7">학생 리스트가 없습니다!!</td>
	</tr>
<%
	}else{
		for(StuChangeVO vo : tcList){
			
%>
	<tr>
		<td><%=vo.getMem_name() %></td>
		<td><%=vo.getYear() %></td>
		<td><%=vo.getTerm() %></td>
		<td><%=vo.getStu_id() %></td>
		<td><%=vo.getReg_date() %></td>
		<td><%=vo.getReg_type() %></td>
		<td><%=vo.getReg_content() %></td>
		<td><input type="button" value="승인" onclick="location.href='<%=request.getContextPath()%>/reg_typeUpdate.do?stu_id=<%=vo.getStu_id()%>'"></td>
		
<%-- 		<td><%=vo.getApply_type() %></td> --%>
<%-- 		<td><%=vo.getProcess_date() %></td> --%>
	</tr>
<%
		}
		
	}
%>
</tbody>
</table>

</body>
</html>