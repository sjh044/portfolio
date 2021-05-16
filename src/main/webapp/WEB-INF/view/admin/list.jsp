<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/admin/list.jsp --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<script type="text/javascript">
	function allchkbox(allchk) {
		//getElementsByName : name 속성이 idchks 태그목록
		//	   var chks = document.getElementsByName("idchks");
		//	   for(var i = 0; i < chks.length;i++) {
		//		   chks[i].checked = allchk.checked;
		//	   }
		$("input[name=idchks]").prop("checked", allchk.checked)
		//       $(".idchks").attr("checked",allchk.checked)
	}
</script>
</head>
<body>
	<form action="mailForm.shop" method="post">
		<div style="">
			<h3>회원 관리</h3>
		
		</div>
		<div style="width:1500px; margin:auto; margin-top:150px;"id="container">
		<table>
			
			
			<tr>
			<th style="width: 10%;"><input type="checkbox" name="allchk"
					onchange="allchkbox(this)">선택</th>
				<th style="width:20%;">아이디</th>
				<th style="width:20%;">이름</th>
				<th style="width:20%;">전화</th>
				<th>이메일</th>
				<th>가입일</th>
				<th>비고&nbsp;</th>
				
			</tr>
			<c:forEach items="${list}" var="user">
				<tr>
					<td><input type="checkbox" name="idchks" class="idchks"
						value="${user.userid}"></td>
					<td>${user.userid}</td>
					<td>${user.name}</td>
					<td>${user.phone1}- ${user.phone2} - ${user.phone3}</td>
					<td>${user.email}</td>
					<td>${user.regdate}</td>
					<td><a href="../user/update.shop?id=${user.userid}">수정</a> <a
						href="../user/delete.shop?id=${user.userid}">탈퇴</a> <a
						href="../user/mypage.shop?id=${user.userid}">회원정보</a></td>
					
				</tr>
			</c:forEach>
			<tr>
				<td colspan="7"><input type="submit" value="메일보내기"></td>
			</tr>
		</table>
		</div>
	</form>	
</body>
</html>