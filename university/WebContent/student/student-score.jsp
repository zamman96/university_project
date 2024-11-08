<%@page import="com.google.gson.Gson"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학적프로그램</title>
<link rel="shortcut icon" href="http://localhost/university/global/img/favicon.png">
<link rel="stylesheet" href="http://localhost/university/global/global.css" />
<link rel="stylesheet" href="http://localhost/university/global/reset.css" />
<link rel="stylesheet" href="http://localhost/university/layout/common.css" />
<link rel="stylesheet" href="http://localhost/university/student/css/student-score.css" />
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/global/js/col_major.js"></script>
<script src="http://localhost/university/global/js/jquery.serializejson.min.js"></script>
<script src="http://localhost/university/student/js/student-score.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<%
MemberVO memVo = (MemberVO)session.getAttribute("login");

Gson gson = new Gson();
String json = gson.toJson(memVo);
String mem_id = memVo.getMem_id();
%>
<script>
path = '<%=request.getContextPath()%>';
	stu_id = <%=mem_id %>
year = '';
term = '';

yearterm = [];
num = '';

	$(function(){
		yearTerm();
		allSum();
		
		$('#prev').on('click',function(){
			if(num-1<0){
				// 0보다 작아진다면 실행 X
			} else{
				--num;
				let text_term = yearterm[num].course_term;
				term = yearterm[num].term;
				year = yearterm[num].year;
				$('#year-term').text(text_term);
				partSum();
				scoreList();
			}
		})
		
		$('#next').on('click',function(){
			if(num+1==yearterm.length){
				// 넘어선 숫자는 실행 X
			} else{
				++num;
				let text_term = yearterm[num].course_term;
				term = yearterm[num].term;
				year = yearterm[num].year;
				$('#year-term').text(text_term);
				partSum();
				scoreList();
			}
		})
	})
</script>
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
						전체 성적 조회
					</div>
					<!-- section-top 끝 -->

					<!-- section-center 시작 -->
					<div class="section-center">
						
						<!-- section-list 시작 -->
						<div class="section-list">
						
							
					<div class="list-items">
							<!-- list-item 시작 -->
						<div class="list-item">
							<!-- item-title 시작 -->
							<div class="item-title">총 계</div>
	                	  	<!-- item-title 끝 -->
							
							<!-- item-content 시작 -->
							<div class="item-content">
								<div class="item-lists">
									<div class="item-list">
										<div class="list-row">교양(필수)</div>
										<div class="list-colums">
											<div class="list-colum" id="agrs"></div>
										</div>
									</div>
									<div class="item-list">
										<div class="list-row">교양(선택)</div>
										<div class="list-colums">
											<div class="list-colum" id="agss"></div>
										</div>
									</div>
									<div class="item-list">
										<div class="list-row">전공(필수)</div>
										<div class="list-colums">
											<div class="list-colum" id="amrs"></div>
										</div>
									</div>
									<div class="item-list">
										<div class="list-row">전공(선택)</div>
										<div class="list-colums">
											<div class="list-colum" id="amss"></div>
										</div>
									</div>
									<div class="item-list">
										<div class="list-row">교직</div>
										<div class="list-colums">
											<div class="list-colum" id="ates"></div>
										</div>
									</div>
									<div class="item-list">
										<div class="list-row">취득학점</div>
										<div class="list-colums">
											<div class="list-colum" id="acre"></div>
										</div>
									</div>
									<div class="item-list">
										<div class="list-row">평점합계</div>
										<div class="list-colums">
											<div class="list-colum" id="asum"></div>
										</div>
									</div>
									<div class="item-list">
										<div class="list-row">평균평점</div>
										<div class="list-colums">
											<div class="list-colum" id="aavg"></div>
										</div>
									</div>
								</div>
							</div>						
							<!-- item-content 끝 -->
						</div>
						<!-- list-item 끝 -->
						
						
						<!-- list-item 시작 -->
						<div class="list-item">
							<!-- item-title 시작 -->
							<div class="item-title">
								<div class="item-title-left">년도 학기 별</div>
								<div class="item-title-right">
								
								<!-- section-search 시작 -->
							<div class="section-search">
								<form id="subf">
									<div class="select-boxs">
										<div class="select-boxs-left">
											<div class="sel-box">
												<div class="year-term-box">
													<div id="prev" class="yt-box-left yt-box">&lt;</div>
													<div id="year-term" class="yt-box-content yt-box"></div>
													<div id="next" class="yt-box-right yt-box">&gt;</div>
												</div>
											</div>
											
										</div>
										
									</div>
								</form>
							</div> 
							<!-- section-search 끝 -->
								
								<!-- item-title-right끝 -->
								</div>
							</div>
	                	  	<!-- item-title 끝 -->
							
							<!-- item-content 시작 -->
							<div class="item-content">
								<div class="item-lists">
									<div class="item-list">
										<div class="list-row">교양(필수)</div>
										<div class="list-colums">
											<div class="list-colum" id="grs"></div>
										</div>
									</div>
									<div class="item-list">
										<div class="list-row">교양(선택)</div>
										<div class="list-colums">
											<div class="list-colum" id="gss"></div>
										</div>
									</div>
									<div class="item-list">
										<div class="list-row">전공(필수)</div>
										<div class="list-colums">
											<div class="list-colum" id="mrs"></div>
										</div>
									</div>
									<div class="item-list">
										<div class="list-row">전공(선택)</div>
										<div class="list-colums">
											<div class="list-colum" id="mss"></div>
										</div>
									</div>
									<div class="item-list">
										<div class="list-row">교직</div>
										<div class="list-colums">
											<div class="list-colum" id="tes"></div>
										</div>
									</div>
									<div class="item-list">
										<div class="list-row">취득학점</div>
										<div class="list-colums">
											<div class="list-colum" id="cre"></div>
										</div>
									</div>
									<div class="item-list">
										<div class="list-row">평점합계</div>
										<div class="list-colums">
											<div class="list-colum" id="sum"></div>
										</div>
									</div>
									<div class="item-list">
										<div class="list-row">평균평점</div>
										<div class="list-colums">
											<div class="list-colum" id="avg"></div>
										</div>
									</div>
								</div>
							</div>						
							<!-- item-content 끝 -->
						</div>
						<!-- list-item 끝 -->
					<!-- table 시작 -->
					<div class="table-wrap">
					</div>
					<!-- table  -->
					</div>
					<!-- list-items 끝 -->
					
				</div>
				<!-- section-list 끝 -->
						
					</div> <!-- section-center 끝 -->
				</div> <!-- section-content 끝 -->
			</section> <!-- section 끝 -->
		</div> <!-- container-right 끝 -->
	</div><!-- container 끝 -->
	
</body>
</html>