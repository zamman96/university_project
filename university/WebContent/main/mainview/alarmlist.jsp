<%@page import="com.google.gson.Gson"%>
<%@page import="member.vo.StuChangeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<StuChangeVO> list = (List<StuChangeVO>) request.getAttribute("list");
	
	// 역직렬화
	Gson gson = new Gson();
	String res = gson.toJson(list);
	
	out.print(res);
	out.flush();

%>