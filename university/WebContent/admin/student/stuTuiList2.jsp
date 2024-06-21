<%@page import="com.google.gson.Gson"%>
<%@page import="member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사관리 시스템</title>
<link rel="shortcut icon" href="http://localhost/university/global/img/favicon.png">
<link rel="stylesheet" href="http://localhost/university/global/global.css" />
<link rel="stylesheet" href="http://localhost/university/global/reset.css" />
<link rel="stylesheet" href="http://localhost/university/layout/common.css" />
<link rel="stylesheet" href="http://localhost/university/admin/css/studentList.css" />
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/global/js/jquery.serializejson.min.js"></script>
<script src="http://localhost/university/student/js/student.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<%
MemberVO memVo = (MemberVO)session.getAttribute("login");
List<MemberVO> tuiList2 = 
					(List<MemberVO>)request.getAttribute("tuiList2");

Gson gson = new Gson();
String json = gson.toJson(memVo);
String mem_id = memVo.getMem_id();
%>
</head>

<body>


<!-- container 시작 -->
	<div id="container">

		<!-- container-left 시작 -->
		<div id="container-left">

			<!-- side-menu 시작 -->
			<jsp:include page="/layout/side-menu/side-menu.jsp" />
			<!-- side-menu 끝 -->

		</div>
		<!-- container-left 끝 -->

		<!-- container-right 시작 -->
		<div id="container-right">

			<!-- header 시작 -->
			<jsp:include page="/layout/header/header.jsp"/>
			<!-- header 끝 -->

			<!-- section 시작 -->
			<section>

				<!-- section-content 시작 -->
				<div class="section-content">
							
					<!-- section-top 시작 -->
					<div class="section-top">
						등록금 미납 학생 목록
					</div>
					<!-- section-top 끝 -->

					<!-- section-center 시작 -->
					<div class="section-center">
					
						<div class="btns">
							<input type="button" value="목록으로" onclick="location.href='<%=request.getContextPath()%>/getAllStudent.do'">
						</div>
						<!-- list-items 시작 -->
						<div class="list-items">
							
							<div class="list-item">
								<div id="subjectList">
									<div class="table-wrap stu-list">
										<table border="1">
											<tbody>
												<tr>
													<th>이름</th>
													<th>학과명</th>
													<th>주소</th>
								     		    	<th>전화번호</th> 
												</tr>
												
												<%
													if(tuiList2==null || tuiList2.size()==0){
												%>
													<tr>
														<td colspan="7">학생 리스트가 없습니다!!</td>
													</tr>
												<%
													}else{
														for(MemberVO vo : tuiList2){
															
												%>
													<tr>
														<td><%=vo.getMem_name() %></td>
														<td><%=vo.getMajor_name() %></td>
														<td><%=vo.getMem_add() %></td>
														<td><%=vo.getMem_tel() %></td>
													</tr>
												<%
														}
														
													}
												%>
				
						
											</tbody>
										</table>
									</div>
								</div>
							</div> <!-- list-item 끝 -->
							
							
							
						</div><!-- list-items 끝 -->

					</div> <!-- section-center 끝 -->
				</div> <!-- section-content 끝 -->
			</section> <!-- section 끝 -->
		</div> <!-- container-right 끝 -->
	</div> <!-- container 끝 -->


</body>
</html>