<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<%-- /webapp/WEB-INF/view/board/delete.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 삭제 화면</title>
</head>
<body>
	<div id="wrap" class="cont_linebox" style="padding:200px;">
		<div id="container">
			<div id="contents">

				<div
					class="xans-element- xans-board xans-board-commentdeletepackage-4 xans-board-commentdeletepackage xans-board-4 ">
			
				<form action="rdelete.do" method="post"
					name="s">
					<input type="hidden" name="rnum" value="${reply.rnum}">
					<input type="hidden" name="num" value="${reply.num}">
					<input type="hidden" name="board_no" value="${reply.board_no}">
					
						<div
							class="xans-element- xans-board xans-board-commentdel-4 xans-board-commentdel xans-board-4 ">
							<div class="commentDel">
								<h3>
									
								</h3>
								<fieldset style="text-align:center;">
									<legend>댓글 삭제</legend>
									
									<p class="info">
										댓글 등록 시 입력한 <strong class="txtEm">비밀번호를 입력하여 주십시요.</strong>
									</p>
									<p class="password">
										<label for="comment_password">비밀번호</label> 
										<input type="password" id="comment_password" name="comment_password" />
									</p>
									
									
									<div class="ec-base-button gBlank30">
										<a href="../board/detail.do?board_no=${reply.board_no}&num=${reply.num}">
										<img
											src="../img/btn_secret_list.gif" alt="목록"></a>
										
										<a href="javascript:document.s.submit()">
										<input type="image" 
											src="../img/btn_secret_submit.gif" alt="확인">
											</a>
										&nbsp;
									</div>
								</fieldset>
							</div>
						</div>
					</form>
				</div>

			</div>
			<div id="sidebar"></div>
		</div>
		<hr class="layout">
	</div>
</body>
</html>