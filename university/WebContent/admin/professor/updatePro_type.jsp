<%@page import="member.vo.ProfessorVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%

ProfessorVO proVo = (ProfessorVO)request.getAttribute("result");

%>
<body>

<form>
	<table border="1" style="margin : 0 auto;">
		<tr>
			<td>교수ID<a href="<%=request.getContextPath()%>/detailProfessor.do?pro_id=<%=proVo.getPro_id()%>"></a></td>
			<td>재직<input type="checkbox" name="checkbox" value=1></td>
			<td>퇴직<input type="checkbox" name="checkbox2" value=2></td>
		</tr>
		<tr>
			<td><input type="button" value="확인" onclick="location.href='<%=request.getContextPath() %>/updatePro_type.do'"></td>
		</tr>
	</table>


	
</form>

</body>
</html>