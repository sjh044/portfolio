<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
</head>
<body>		

			
	<div id="wrap" class="cont_linebox">
		<div id="container">
			<div id="contents">

				<div
					class="xans-element- xans-board xans-board-readpackage-4 xans-board-readpackage xans-board-4 ">
					<div
						class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 ">
						<div class="path">
							<span>현재 위치</span>
							<ol>
								<li><a href="/">홈</a></li>
								<li><a href="/board/index.html">게시판</a></li>
								<li title="현재 위치"><strong>Q&amp;A</strong></li>
							</ol>
						</div>
						<c:if test="${board.board_no == 1}">
							<div class="b_title">
								<h2>
									<font color="333333">공지사항 </font>
								</h2>
								<p>공지사항 게시판입니다.</p>
							</div>
						</c:if>
						<c:if test="${board.board_no == 2}">
							<div class="b_title">
								<h2>
									<font color="333333">Q&amp;A</font>
								</h2>
								<p>Q&amp;A 게시판입니다.</p>
							</div>
						</c:if>
						<c:if test="${board.board_no == 3}">
							<div class="b_title">
								<h2>
									<font color="333333">뉴스</font>
								</h2>
								<p>뉴스 게시판입니다.</p>
							</div>
						</c:if>
						<c:if test="${board.board_no == 4}">
							<div class="b_title">
								<h2>
									<font color="333333">이벤트</font>
								</h2>
								<p>이벤트 게시판입니다.</p>
							</div>
						</c:if>
						<c:if test="${board.board_no == 5}">
							<div class="b_title">
								<h2>
									<font color="333333">후기</font>
								</h2>
								<p>후기 게시판입니다.</p>
							</div>
						</c:if>
					</div>
			<form action="detail.do" method="post">
			<input type="hidden" name="num" value="${board.num}"> 
			<input type="hidden" name="board_no" value="${param.board_no}">
							 
						<div
							class="xans-element- xans-board xans-board-read-4 xans-board-read xans-board-4">
							<!--
            $login_page_url = /member/login.html
            $deny_access_url = /board/product/list.html
        -->
							<div class="mgy-table typeWrite ">
								<table border="1" summary="">
									<caption>상품 게시판 상세</caption>
									<colgroup>
										<col style="width: 130px;">
										<col style="width: auto;">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">제목</th>
											<td>${board.subject}</td>
										</tr>
										<tr>
											<th scope="row">작성자</th>
											<td>${board.name}
											</td>
										</tr>
										<tr class=" date">
											<th scope="row">작성일</th>
											<td><fmt:formatDate value="${board.regdate }" pattern="yyyy.MM.dd"/></td>
										</tr>
										<tr class=" hit">
											<th scope="row">조회수</th>
											<td>${board.readcnt}</td>
										</tr>
										<tr>
											<th scope="row">첨부파일</th>
											<td>&nbsp; <c:if test="${!empty board.fileurl}">
													<a href="file/${board.fileurl}">${board.fileurl}</a>
												</c:if>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="detail">
													<div class="fr-view fr-view-article">
														${board.content}</div>
												</div>
											</td>
										</tr>
										<tr class="attach displaynone">
											<th scope="row">첨부파일</th>
											<td></td>
										</tr>
										<tr class="displaynone ">
											<th scope="row">비밀번호</th>
											<td><input id="password" name="password" fw-filter=""
												fw-label="비밀번호" fw-msg=""
												onkeydown="if (event.keyCode == 13 || event.which == 13) { return false; }"
												value="" type="password"> <span
												class="ec-base-help txtInfo">삭제하려면 비밀번호를 입력하세요.</span></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="ec-base-button ">
						<c:if test="${loginUser.name eq board.name }">	
							<span class="gRight">
				                <a href="delete.do?board_no=${board.board_no}&num=${board.num}">삭제</a>
				                <a  href="update.do?board_no=${board.board_no}&num=${board.num}" class="select">수정</a>        
				            </span>
				           </c:if> 
								<span class="gLeft"> 
								 <a href="../board/list.do?board_no=${board.board_no}">목록</a>
								</span> 
							</div>
						</div>
				</form>
				</div>
			
				<c:if test="${rlistcount > 0}">
		
			
				<c:forEach var="reply" items="${replylist}">				
					<div class="xans-element- xans-board xans-board-commentlist-4 xans-board-commentlist xans-board-4"><!--
					            $delete_page_url = /board/product/comment_del.html
					            $delete_success_url = /board/product/read.html
					        -->
					<ul class="boardComment">
					<li class="first  xans-record-">
					                <div class="commentTop">
					                    <strong class="name">${reply.name}</strong>
					                    <span class="date"><fmt:formatDate value="${reply.regdate }" pattern="yyyy.MM.dd"/></span>
					                    <span class="grade displaynone"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/board/ico_point0.gif" alt="0점"></span>
					                </div>
					              <c:if test="${loginUser.name eq reply.name }">	 
					                <span class="button">
					                    <a href="javascript:;" onclick="toggleText()">수정</a>
					                    <a href="rdelete.do?rnum=${reply.rnum}" class="select">삭제</a>
					                </span>
					               </c:if>
					       

									<div id="aa" style='display: none' class="xans-element- xans-board xans-board-commentform-4 xans-board-commentform xans-board-4 ">
										<fieldset>
										 <legend>댓글 수정</legend>
									             <p>비밀번호 : <input id="comment_password" name="comment_password" fw-filter="isFill" fw-label="댓글비밀번호" fw-msg="" value="" type="password"></p>
									            <div class="view">
									                <textarea id="comment_modify" name="comment_modify" fw-filter="isFill" fw-label="댓글내용" fw-msg=""></textarea> <span class="submit">
									                    <a href="#none" onclick="BOARD_COMMENT.comment_update_ok('commentForm');" class="select">수정</a>
									                    <a href="#none" onclick="BOARD_COMMENT.comment_cancel_ok('commentForm');">취소</a>
									                </span>
									            </div>
									            <p class="displaynone"> /  byte</p>
									        </fieldset>
									</div>
								
					               
					                <div class="comment">
					                     <span id="comment_contents2">${reply.comment}</span>           
					                 </div>
					            </li>
					                    </ul>
					 </div>
					</c:forEach>
				</c:if>
		

						<!-- 댓글 쓰기 -->
						<c:if test="${!empty sessionScope.loginUser}">
						<form action="../board/rwrite.do" name="f" method="Post" >
							<input id="num" name="num" value="${param.num}" type="hidden">
							<input id="board_no" name="board_no" value="${param.board_no}" type="hidden">	
						 	<input id="userid" name="userid" value="${loginUser.userid}" type="hidden">
						
							<div
								class="xans-element- xans-board xans-board-commentwrite-4 xans-board-commentwrite xans-board-4 ">
								<!-- 댓글권한 있음 -->
								<div class="">
									<fieldset>
										<legend>댓글 입력</legend>
										<p>
											<strong>댓글달기</strong>
											<span class="">
												이름 : <input id="name" name="name" fw-filter="isFill"
														fw-label="댓글작성자" fw-msg="" class="inputTypeText"
														placeholder="" value="${loginUser.name}" type="text">
											</span>
											      비밀번호 : <input id="comment_password" name="comment_password"
														fw-filter="isFill" fw-label="댓글비밀번호" fw-msg="" value=""
														type="password">
										
										</p>
										<div class="view">
											
											<textarea id="comment" name="comment" fw-filter="isFill"
												fw-label="댓글내용" fw-msg="">
											</textarea>
											<a href="javascript:document.f.submit()"
												class="submit ">확인</a>
										</div>
										<p class="grade displaynone"></p>
										<p class="displaynone">/ byte</p>
										
									</fieldset>
								</div>
							
							</div>
						</form>
						</c:if>
						<!-- 댓글의 댓글 쓰기 -->
					
					<!-- 댓글 쓰기 -->
					<c:if test="${empty sessionScope.loginUser}">
					<div
						class="xans-element- xans-board xans-board-commentwrite-4 xans-board-commentwrite xans-board-4 ">
						<!-- 댓글권한 있음 -->



						<!-- 댓글권한 없음 -->
					
						<div class="">
							<p>회원에게만 댓글 작성 권한이 있습니다.</p>
						</div>
					
						</div>
						</c:if>	
					<!-- 댓글의 댓글 쓰기 -->
				
		
				<div
					class="xans-element- xans-board xans-board-movement-4 xans-board-movement xans-board-4 ">
					<ul>
						<li class="prev "><strong>이전글</strong><a
							href="/article/qa/6/69/">배송문의입니다</a></li>
						<li class="next "><strong>다음글</strong><a
							href="/article/qa/6/66/">배송문의</a></li>
					</ul>
				</div>


				<!-- 관리자 전용 메뉴 -->
				<!-- //관리자 전용 메뉴 -->

			</div>
			<div id="sidebar"></div>
		</div>
		<hr class="layout">
	</div>	
</body>
</html>