<%@page import="com.google.gson.Gson"%>
<%@page import="member.vo.MemberVO"%>
<%@page import="member.vo.StuChangeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/university/global/img/favicon.png">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link rel="stylesheet" href="http://localhost/university/global/global.css" />
<link rel="stylesheet" href="http://localhost/university/global/reset.css" />
<link rel="stylesheet" href="http://localhost/university/layout/common.css" />
<link rel="stylesheet" href="http://localhost/university/student/css/course_registration.css" />
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/global/js/col_major.js"></script>
<script src="http://localhost/university/global/js/jquery.serializejson.min.js"></script>
<script src="http://localhost/university/student/js/courseReg.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<%
MemberVO memVo = (MemberVO)session.getAttribute("login");
List<StuChangeVO> tcList = (List<StuChangeVO>)request.getAttribute("tcList");

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
						복학 신청목록
					</div>
					<!-- section-top 끝 -->

					<!-- section-center 시작 -->
					<div class="section-center">
						<input type="button" value="목록으로" onclick="location.href='<%=request.getContextPath()%>/searchStuChangeList.do'">
					<!-- list-items 시작 -->
					<div class="list-items">
						
						<div class="list-item">
							<div id="subjectList">
								<div class="table-wrap">
									<table border="1">
										<tbody>
											<tr>
												<th>이름</th><th>년도</th><th>학기</th>
												<th>학번</th><th>신청일</th><th>구분</th>
												<th>사유</th><th>비고</th>
											</tr> 
											
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
													<td><%=vo.getMem_name()%></td>
													<td><%=vo.getYear()%></td>
													<td><%=vo.getTerm()%></td>
													<td><%=vo.getStu_id()%></td>
													<td><%=vo.getReg_date()%></td>
													<td><%=vo.getReg_type()%></td>
													<td><%=vo.getReg_content()%></td>
													<td><input type="button" value="승인" onclick="location.href='<%=request.getContextPath()%>/reg_typeUpdate.do?stu_id=<%=vo.getStu_id()%>">
													<input type="button" value="미승인" onclick="location.href='<%=request.getContextPath()%>/?stu_id=<%=vo.getStu_id()%>"></td>
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