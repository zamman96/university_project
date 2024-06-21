<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//insert, update, delete실행 시 사용되는 뷰페이지
	//각 controller에서 결과값을 request에 저장 시 "result" 이름으로 저장 되어야 함

	int res = (Integer) request.getAttribute("result");
	
	if(res > 0){
%>
	{ "flag" : "성공" }
<% } else{ %>
	{ "flag" : "실패" }
<% } %>