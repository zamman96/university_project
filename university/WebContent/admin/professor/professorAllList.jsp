<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="member.vo.MemberVO"%>
<%@page import="member.vo.ProfessorVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사프로그램</title>
<link rel="shortcut icon" href="http://localhost/university/global/img/favicon.png">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link rel="stylesheet" href="http://localhost/university/global/global.css" />
<link rel="stylesheet" href="http://localhost/university/global/reset.css" />
<link rel="stylesheet" href="http://localhost/university/layout/common.css" />
<link rel="stylesheet" href="http://localhost/university/admin/css/professorAllList.css" />
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/global/js/col_major.js"></script>
<script src="http://localhost/university/global/js/jquery.serializejson.min.js"></script>
<script src="http://localhost/university/student/js/courseReg.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<%
MemberVO memVo = (MemberVO)session.getAttribute("login");

Gson gson = new Gson();
String json = gson.toJson(memVo);
String mem_id = memVo.getMem_id();
List<ProfessorVO> pfVO = 
				(List<ProfessorVO>)request.getAttribute("proAllList");
 ProfessorVO pvo = (ProfessorVO)request.getAttribute("memVO");  
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
						교수 목록
					</div>
					<!-- section-top 끝 -->

					<!-- section-center 시작 -->
					<div class="section-center">
						
					<!-- list-items 시작 -->
					<div class="list-items">
						
						<div class="list-item">
							<div id="subjectList">
								<div class="table-wrap pro-list">
									<table border="1">
										<thead>
											<tr>
												<!-- <th>상세조회</th> -->
												<th>단과명</th>
												<th>학과명</th>
												<th>교수명</th>
												<th>생일</th>
												 <th>성별</th>
												 <th>주소</th>
												 <th>전화번호</th>
												 <th>메일</th>
											</tr>
										</thead> 
										<tbody>	
											<%
												if(pfVO==null){
													
											%>
												<tr>
													<td colspan="7">교수 정보가 없습니다!!</td>
												</tr>
											<%
												}else{
													for(ProfessorVO vo : pfVO){
														
														Date date = new Date();
														SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy. MM. dd");
														String bir = simpleDateFormat.format(date);
											%>
											<tr>
												<%-- <td>
													<input type="button" value="강의내역 조회" onclick="location.href='<%=request.getContextPath()%>/'">
													<input type="button" value="교수 재직상태 변경" onclick="location.href='<%=request.getContextPath()%>/updatePro_type.do?pro_id<%=vo.getPro_id()%>'">
												</td> --%>
												<td><%=vo.getCol_name() %></td>
												<td><%=vo.getMajor_name() %></td>
												<td><%=vo.getMem_name() %></td>
												<td><%=bir %></td>
												<td><%=vo.getMem_gender() %></td>
												<td><%=vo.getMem_add() %></td>
												<td><%=vo.getMem_tel() %></td>
												<td><%=vo.getMem_mail() %></td>
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

</table>
<!-- <ul class="pagination"> -->
<!--   <li class="page-item"><a class="page-link" href="">이전</a></li> -->
<!--   <li class="page-item"><a class="page-link" href="">1</a></li> -->
<!--   <li class="page-item"><a class="page-link" href="">2</a></li> -->
<!--   <li class="page-item"><a class="page-link" href="">3</a></li> -->
<!--   <li class="page-item"><a class="page-link" href="">4</a></li> -->
<!--   <li class="page-item"><a class="page-link" href="">5</a></li> -->
<!--   <li class="page-item"><a class="page-link" href="">다음</a></li> -->
<!-- </ul> -->
</body>
  


</html>