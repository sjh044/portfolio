<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
		<div id="wrap" class="cont_linebox" style="padding:300px;">
		<div id="container">
			<div id="contents">
			
				<form action="delete.do" method="post" name="deleteform">
					<input type="hidden" name="userid" value="${param.id}">
					<div class="xans-element- xans-board xans-board-commentdel-4 xans-board-commentdel xans-board-4 ">
							<div class="commentDel">
								<h3>
									
								</h3>
								<fieldset style="text-align:center;">
									<legend>회원탈퇴</legend>
									<p class="info">
										 탈퇴 하시겠습니까? 
								<strong class="txtEm">비밀번호를 입력하여 주십시요.</strong>
									</p>
									<p class="password">
										<label for="comment_password">비밀번호</label> 
										<input type="password" name="password"> 
									</p>
									<div class="ec-base-button gBlank30">
										<a href="../user/mypage.do?id=${param.id}">
											<img src="../img/btn_secret_list.gif" alt="목록">
										</a>
										<a href="javascript:deleteform.submit()">
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
	</div>
</body>
</html>