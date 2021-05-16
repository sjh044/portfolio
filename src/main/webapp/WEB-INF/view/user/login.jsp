<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form:form modelAttribute="user" method="post" action="login.do" name="s">
		<input type="hidden" name="name" value="의미없는 이름"/>
	<div id="wrap" class="cont_linebox" style="margin-top:50px;">
		<div id="container">
			<div id="contents">
				<div
					style="border: 1px solid rgb(215, 213, 213); min-height: 450px; - -darkreader-inline-border-top: #3c4143; - -darkreader-inline-border-right: #3c4143; - -darkreader-inline-border-bottom: #3c4143; - -darkreader-inline-border-left: #3c4143;"
					class="xans-element- xans-member xans-member-login cl ">
		 
		
					<div class="login">
						<div class=" loginbox">
							<h3>
								로그인
								
							</h3>
							<fieldset>
							<spring:hasBindErrors name="user">
									<font color="red"> <c:forEach items="${errors.globalErrors}"
											var="error">
											<spring:message code="${error.code}" />
										</c:forEach>
									</font>
							</spring:hasBindErrors>
								
								<label class="id ePlaceholder" title="ID">
									<form:input path="userid" fw-filter="isFill" fw-label="아이디" fw-msg=""
									 class="inputTypeText" placeholder="ID" />									
								</label>
								<font color="red"><form:errors path="userid" /></font>  
								
								<label	class="password ePlaceholder" title="PW">
									<form:input path="password" fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="패스워드"
									fw-msg="" autocomplete="off" value="" type="password"
									placeholder="PW"/>		
								</label> 
								<font color="red"><form:errors path="password" /></font>
								
								<a href="javascript:s.submit();" class="select">로그인</a>

								<div class="cl"
									style="border-bottom: 1px solid rgb(229, 229, 229); - -darkreader-inline-border-bottom: #373c3e;"
									data-darkreader-inline-border-bottom="">

									<ul class="finder">
										<li><a href="/member/id/find_id.html">아이디 찾기 /</a></li>
										<li><a href="/member/passwd/find_passwd_info.html">
												비밀번호 찾기</a></li>
									</ul>
								</div>

							</fieldset>
						</div>
						<div class="loginjoinbox">
							<h3>회원가입</h3>
							<p class="link">
								<a href="../user/userEntry.do"
									style="display: block; line-height: 60px;" class="select">회원가입</a>
								<span
									style="display: block; margin-top: 10px; font-size: 11px; color: rgb(102, 102, 102); text-align: center; - -darkreader-inline-color: #a8a095;"
									data-darkreader-inline-color="">회원가입을 하시면 다양하고 특별한 혜택이
									준비되어 있습니다.</span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form:form>
</body>
</html>