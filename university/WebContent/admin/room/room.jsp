<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 개설</title>
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link rel="stylesheet"
	href="http://localhost/university/global/global.css" />
<link rel="stylesheet"
	href="http://localhost/university/global/reset.css" />
<link rel="stylesheet"
	href="http://localhost/university/layout/common.css" />
<link rel="stylesheet"
	href="http://localhost/university/admin/room/css/room.css" />
<script src="http://localhost/university/admin/room/js/room.js"></script>
<script src="http://localhost/university/global/js/jquery-3.7.1.js"></script>
<script src="http://localhost/university/global/js/jquery.serializejson.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
path = `<%=request.getContextPath()%>`;
	currentPage = 1;
	totalPage = 0;
		room_id = "";
	$(function() {
		let tag = $('#buildList');
		buildList(tag, "bid");
		listPerPage();
		
		// 페이지 번호 클릭이벤트
		$(document).on('click','.pageno',function(){
			let page = parseInt($(this).text().trim());
			currentPage = page;
			listPerPage();
		})
		
		// 다음버튼 클릭 이벤트
		$(document).on('click','#next',function(){
			currentPage = parseInt($('.pageno').last().text() )+1;
			listPerPage();
		})
		// 이전버튼 클릭 이벤트
		$(document).on('click','#prev',function(){
			currentPage = parseInt($('.pageno').first().text() )-1;
			listPerPage();
		})
		$(document).on('click','#first',function(){
			currentPage = 1;
			listPerPage();
		})
		$(document).on('click','#last',function(){
			currentPage = totalPage;
			listPerPage();
		})
		
		// 검색
		$(document).on('change','#numval, #roomAVA, #bid', function(){
			currentPage = 1;
			listPerPage();
		})
		
		// 선택
		$(document).on('click','.roomSelect',function(){
			room_id = $('#id',this).text();
			room_num = $('#num',this).text();
			room_available = $('#ava',this).attr('idx');
			room_remark = $('#remark',this).text();
			updateList();
		})
		
		$(document).on('change','#bid',function(){
			let resetCode = '<select name="room_num" id="numval"> <option value="">전체</option> </select>';
			$('#numList').html(resetCode);
			room_id = $('#bid').val();
			let tagN = $('#numval');
			numList(tagN);
		})
		
		// 수정
		$(document).on('click','#update',function(){
			update();
			console.log("수정");
		})
		
		// 삭제(잘못 입력된 값 삭제)
		$(document).on('click','#delete',function(){
			room_num = $('#numval').val();
			deleteRoom();
		})
		
		$('#insertBtn').on('click',function(){
			buildList2();
		})
		$(document).on('change','#ibId',function(){
			$('#newId').prop('disabled',true);
			room_id = $('#ibId').val();
			if(room_id==""){
			$('#newId').prop('disabled',false);
			} 
		})
		
		$('#insert').on('click',function(){
			room_id = $('#ibId').val();
			if(room_id==""){
				room_id = $('#newId').val();
			} 
			room_num = $('#inum').val();
			
			insert();
		})
	})
</script>
<style>
</style>
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
			<jsp:include page="/layout/header/header.jsp" />
			<!-- header 끝 -->

			<!-- section 시작 -->
			<section>

				<!-- section-content 시작 -->
				<div class="section-content">

					<!-- section-top 시작 -->
					<div class="section-top">
						<div class="section-top-left"></div>
					<div class="section-top">
						강의실 관리
					</div>
					</div>
					<div class="section-top-right"></div>
				</div>
				<!-- section-top 끝 -->

				<!-- section-center 시작 -->
				<div class="section-center">
				<div class="title-top">
					<div class="list-title top">
						강의실 관리
						<button type="button" id="insertBtn"  data-bs-toggle="modal" data-bs-target="#myModal2"><span>&#43;</span> 강의실 추가</button>
					</div>
					<form id="roomf">
					<div class="select-boxs">
										<div class="sel-box">
											<span id="buildList"></span>
										</div>
										<div id="numList" class="sel-box">
       										<select name="room_num" id="numval">
       										<option value="">호수</option>
        									</select>
       									</div>
										
										<div class="sel-box">
											<select name="room_available" id="roomAVA">
												<option value="-1">사용가능 여부</option>
												<option value="1">사용가능</option>
												<option value="0">사용불가능</option>
											</select> 
										</div>
									</div>
								</form>
							</div>
					<div id="roomList"></div>
					<!-- 페이지네이션 시작 -->
					<div id='pageList'></div>
					<!-- 페이지네이션 끝 -->
					</div>
					<!-- section-center 끝 -->
				</div>
				<!-- section-content 끝 -->

			</section>
			<!-- section 끝 -->

		</div>
		<!-- container-right 끝 -->

	</div>
	<!-- container 끝 -->
	
	
<!-- 변경/삭제 Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">변경할 값</h4>
        <button type="button" class="btnClose" data-bs-dismiss="modal">╳</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div class="update-modal">
          <div>건물</div>
          <div id="idT"></div>
          <div>호수</div>
          <div id="numT"></div>
          <div id="avaT"></div>
        </div>
          <div colspan="4"><textarea id="remarkT" placeholder="비고"></textarea></div>
      </div> 
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <input type="button" id="update" class="btn-modal-button" value="수정" data-bs-dismiss="modal">
        <input type="button" id="delete" class="btn-modal-button" value="삭제" data-bs-dismiss="modal">
        <button type="button" class="btn-modal-button" data-bs-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>
	<!-- 추가 Modal -->
<div class="modal fade" id="myModal2">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">강의실 추가</h4>
        <button type="button" class="btnClose" data-bs-dismiss="modal">╳</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       	<div class="modal-wrap-title">건물</div> 
       			<div id="idI" class="modal-input-text"></div>
       	<div class="modal-wrap-title">호수</div> 
       			<div id="numI" class="modal-input-text"><input type="text" id="inum" placeholder="호"></div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">

        <input type="button" class="btn-modal-button" id="insert" value="추가" data-bs-dismiss="modal">
        <button type="button" class="btn-modal-button" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>