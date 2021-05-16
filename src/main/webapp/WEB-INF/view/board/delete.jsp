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
					
				<form:form modelAttribute="board" action="delete.do" method="post"
					name="f">
					<input type="hidden" name="board_no" value="${param.board_no}">
					
					<form:hidden path="num" />
					
						<div
							class="xans-element- xans-board xans-board-commentdel-4 xans-board-commentdel xans-board-4 ">
							<div class="commentDel">
								<h3>
									<!--<img src="//img.echosting.cafe24.com/skin/base_ko_KR/board/h3_comment.gif" alt="댓글삭제" />-->
								</h3>
								<fieldset style="text-align:center;">
									<legend>게시글 삭제</legend>
									
									<p class="info">
										게시글 등록 시 입력한 <strong class="txtEm">비밀번호를 입력하여 주십시요.</strong>
									</p>
									<p class="password">
										<label for="comment_password">비밀번호</label> 
										<form:password path="pass" />
									</p>
									
									 <spring:hasBindErrors name="board">
										<font color="red"><c:forEach items="${errors.globalErrors}"
												var="error">
												<spring:message code="${error.code }" />
											</c:forEach> </font>
									</spring:hasBindErrors>
									
									<div class="ec-base-button gBlank30">
										<a href="../board/list.do?board_no=${param.board_no}">
										<img
											src="../img/btn_secret_list.gif" alt="목록"></a>
										<a href="javascript:document.f.submit()">
										<input type="image" 
											src="../img/btn_secret_submit.gif" alt="확인">
											</a>
										&nbsp;
									</div>
								</fieldset>
							</div>
						</div>
					</form:form>
				</div>

			</div>
			<div id="sidebar"></div>
		</div>
		<hr class="layout">
	</div>
</body>
</html>