<%@page import="com.google.gson.Gson"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학적프로그램</title>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/global/global.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/global/reset.css" />
<link rel="stylesheet" href="http://localhost/university/layout/common.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/layout/header/css/header.css" />
<script src="http://localhost/university/global/js/jquery.serializejson.min.js"></script>
<%
	MemberVO memVo = (MemberVO)session.getAttribute("login");
	
	Gson gson = new Gson();
	String json = gson.toJson(memVo);
	
%>
</head>
<body>
<header>
	<div class="header-left header-item">
		<%-- <img class="header-icon" alt="" src="<%=request.getContextPath() %>/layout/header/img/vuesaxoutlinemap.svg"/>
		 학생관리 --%>
		<img class="header-icon" alt="" src="<%=request.getContextPath() %>/layout/header/img/vuesaxoutlineusersquare.svg" />
		 <%=memVo.getMem_name() %> (<%=memVo.getMem_id() %>)
	</div>
	<div class="header-right">
		<div class="header-user header-item">
		</div>
		<div class="header-logout header-item" onclick="location.href='<%=request.getContextPath() %>/member/logout.do'">
			<img class="header-icon" alt="" src="<%=request.getContextPath() %>/layout/header/img/vuesaxoutlinelogout.svg"/>
			 로그아웃
		</div>
	</div>
</header>
</body>
</html>