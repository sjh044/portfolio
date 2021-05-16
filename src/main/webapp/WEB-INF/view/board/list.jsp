<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
</head>

<title>게시판</title>
<script>
	function listdo(page) {
		document.searchform.pageNum.value =page;
		document.searchform.submit();
	}
</script>
<body class="is-preload">
	<form action="list.do" name="searchform"
					enctype="multipart/form-data">
					<input type="hidden" name="board_no" value="${board_no}">
					<input type="hidden" name="pageNum" value="1">
	<div id="wrap" class="cont_linebox">
		<div id="container">
			<div id="contents">

				<div
					class="xans-element- xans-board xans-board-listpackage-4 xans-board-listpackage xans-board-4 ">
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
						<c:if test="${board_no == 1}">
							<div class="b_title">
								<h2>
									<font color="333333">공지사항</font>
								</h2>
								<p>공지사항 게시판입니다.</p>
							</div>
						</c:if>
						<c:if test="${board_no == 2}">
							<div class="b_title">
								<h2>
									<font color="333333">Q&amp;A</font>
								</h2>
								<p>Q&amp;A 게시판입니다.</p>
							</div>
						</c:if>
						<c:if test="${board_no == 3}">
							<div class="b_title">
								<h2>
									<font color="333333">뉴스</font>
								</h2>
								<p>뉴스 게시판입니다.</p>
							</div>
						</c:if>
						<c:if test="${board_no == 4}">
							<div class="b_title">
								<h2>
									<font color="333333">이벤트</font>
								</h2>
								<p>이벤트 게시판입니다.</p>
							</div>
						</c:if>
						<c:if test="${board_no == 5}">
							<div class="b_title">
								<h2>
									<font color="333333">후기</font>
								</h2>
								<p>후기 게시판입니다.</p>
							</div>
						</c:if>
					</div>
					<div class="boardSort">
						<span
							class="xans-element- xans-board xans-board-replysort-4 xans-board-replysort xans-board-4 "></span>
					</div>
		<c:if test="${listcount == 0}">
		
					<div class="mgy-table typeList gBorder">
						<table border="1" summary="">
							<caption>게시판 목록</caption>
							<colgroup
								class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
								<col style="width: 70px;">
								<col style="width: 135px;" class="displaynone">
								<col style="width: auto;">
								<col style="width: 84px;">
								<col style="width: 77px;" class="">
								<col style="width: 55px;" class="">
								<col style="width: 55px;" class="displaynone">
								<col style="width: 80px;" class="displaynone">
							</colgroup>
							<thead
								class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
								<tr style="">
									<th scope="col"style="padding:15px;">번호</th>
									<th scope="col" class="displaynone">카테고리</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col" class="">작성일</th>
									<th scope="col" class="">조회</th>
								</tr>
							</thead>
						</table>
						<p
							class="xans-element- xans-board xans-board-empty-1002 xans-board-empty xans-board-1002 message  ">검색결과가
							없습니다.</p>
					</div>
	</c:if>


			<c:if test="${listcount > 0}">
					<div class="mgy-table typeList gBorder">
						<table border="1" summary="">
						
							<colgroup
								class="xans-element- xans-board xans-board-listheader-4 xans-board-listheader xans-board-4 ">
								<col style="width: 70px;">
								<col style="width: 70px;">
								<col style="width: auto;">
								<col style="width: 84px;">
								<col style="width: 77px;" class="">
								<col style="width: 55px;" class="">

							</colgroup>
							<thead
								class="xans-element- xans-board xans-board-listheader-4 xans-board-listheader xans-board-4 ">
								<tr style="">
									<th scope="col" style="padding:15px;">번호</th>
									<th scope="col"></th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col" class="">작성일</th>
									<th scope="col" class="">조회</th>
								</tr>
							</thead>
							<tbody
								class="xans-element- xans-board xans-board-list-4 xans-board-list xans-board-4 center">
								<!--
                $product_name_cut = 30
                $login_page_url = /member/login.html
                $deny_access_url = /index.html
            -->

								<c:forEach var="board" items="${boardlist}">
									<tr style="background-color: #FFFFFF; color: #555555;"
										class="xans-record-">
										<td style="padding:17px;">${boardno}</td>
										<c:set var="boardno" value="${boardno - 1 }" />
										<td class="thumb"></td>
										<td class="displaynone"></td>
										<td class="subject left txtBreak"><span
											style="padding-right: 15px; color: #333"></span>
											<span class="displaynone"> <a href="#none"
												onclick="BOARD.viewTarget('64','6',this);"><img
													src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif"
													alt="내용 보기"></a>
										</span> <a href="detail.do?board_no=${board.board_no}&num=${board.num}" style="color: #555555;">${board.subject}</a>
											<span class="txtEm"></span></td>
										<td>${board.name}</td>
										<td class=""><span class="txtNum"><fmt:formatDate value="${board.regdate}" pattern="yyyy.MM.dd"/></span></td>
										<td class=""><span class="txtNum">${board.readcnt}</span></td>
										<td class="displaynone"><span class="txtNum">0</span></td>
										<td class="displaynone"><img
											src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
											alt="0점"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<p
							class="xans-element- xans-board xans-board-empty-4 xans-board-empty xans-board-4 message displaynone "></p>
					</div>
			</c:if>
					<div
						class="xans-element- xans-board xans-board-buttonlist-4 xans-board-buttonlist xans-board-4  mgy-button typeBG ">
						<c:if test="${board_no == 1}">
							<c:if test="${loginUser.userid eq 'admin'}">
							<span class="gRight">
								<a href="write.do?board_no=${board_no}" class=" mgy_btn01">글쓰기</a>
							</span>	
							</c:if>
						</c:if>
						<c:if test="${board_no != 1}">
						<c:if test="${!empty sessionScope.loginUser}">
							<span class="gRight"> <a
								href="write.do?board_no=${board_no}" class=" mgy_btn01">글쓰기</a>
							</span>
						</c:if>
						</c:if>
					</div>
				</div>

				<div class="xans-element- xans-product xans-product-normalpaging mgy-paginate">
				
				 <c:if test="${pageNum > 1}">
       					<a href="javascript:listdo(${pageNum - 1})"><img src="../img/btn_page_prev.gif" alt="이전 페이지"></a></c:if>
       			<c:if test="${pageNum <= 1}"><img src="../img/btn_page_prev.gif" alt="이전 페이지"></c:if>
       			
       			<c:forEach var="a" begin="${startpage }" end="${endpage}">
         			
         			<li class="xans-record-">
         			<c:if test="${a == pageNum}">
         			<a href="javascript:listdo(${a})" class="this">${a}</a>
         			</c:if>
         			</li>
         			<li class="xans-record-">
         			<c:if test="${a != pageNum}">
         			<a href="javascript:listdo(${a})" class="this">${a}</a></c:if>
         			</li>
       			</c:forEach>
       			 <%-- 다음 페이지 존재 link 연결--%>
       			<c:if test="${pageNum < maxpage}">
       			<a href="javascript:listdo(${pageNum + 1})"><img src="../img/btn_page_next.gif" alt="다음 페이지"></a></c:if>
      			 <%-- 다음 페이지 없음 --%>
       			<c:if test="${pageNum >= maxpage}"><img src="../img/btn_page_next.gif" alt="다음 페이지"></c:if>	
				</div>

			
					 
					<table>
						<tr>
							<td colspan="5">
								<div style="display: inline;">

									<select name="searchtype" style="width: 100px;">
										<option value="">선택해주세요.</option>
										<option value="subject">제목</option>
										<option value="content">내용</option>
									</select>
								
									<script type="text/javascript">
										searchform.searchtype.value = "${param.searchtype}";
									</script>
									
									<input type="text" name="searchcontent"
										value="${param.searchcontent }" style="width: 250px;">
									<input type="submit" value="" class="btn_submit">
									
								</div>
							</td>
						</tr>
					</table>
					
				
			</div>
			<div id="sidebar"></div>
		</div>
		<hr class="layout">
	</div>
	</form>
</body>
</html>