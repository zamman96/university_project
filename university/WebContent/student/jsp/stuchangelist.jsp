<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="member.vo.StuChangeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<StuChangeVO> list = (List<StuChangeVO>) request.getAttribute("list");
	
	// 자바 List 객체를 json 형태로 직렬화
	Gson gson = new GsonBuilder().setPrettyPrinting().create();
	
	// json 형태의 문자열로 전환됨
	String result = gson.toJson(list); 
	
	out.print(result);
	out.flush();
	
%>
 