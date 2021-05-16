<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<%-- /WEB-INF/view/user/mypage.jsp --%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyPage</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#minfo").show(); //회원정보는 보이도록
		$("#oinfo").hide(); //주문내역은 안보이도록
		$(".saleLine").each(function() {
			$(this).hide();
		})
		$("#tab1").addClass("select");
	})
	function disp_div(id, tab) {
		$(".info").each(function() {
			$(this).hide();
		})
		$(".tab").each(function() {
			$(this).removeClass("select");
		})
		$("#" + id).show();
		$("#" + tab).addClass("select");
	}
	function list_disp(id) {
		$("#" + id).toggle(); //
	}
</script>
<style type="text/css">
.select {
	text-align: center;
	padding: 15px;
	background-color: #e93c40ed;
}

.select>a {
	color: #ffffff;
	text-decoration: none;
	font-weight: bold;
}

.tab {
	width: 30%;
}

.rightnum {
	text-align: right;
}

#tbody {
	solid: 0.5px;
}
</style>
</head>
<body class="is-preload">
	<div id="wrap" class="cont_linebox" style="padding:150px;">
		<div id="container">
			<div id="contents">

				<div class="xans-element- xans-product xans-product-menupackage ">
					<div
						class="xans-element- xans-product xans-product-headcategory path ">
						<span>현재 위치</span>
						<ol>
							<li><a href="/">홈</a></li>
							<li class=""><a href="/category/shop/24/">SHOP</a></li>
						</ol>
					</div>
					<div
						class="xans-element- xans-product xans-product-headcategory title ">
						<p class="banner"></p>
						<h2>
							<span>mypage</span>
						</h2>

					</div>


				</div>

				<table>
					<tr>
						<td
							style="text-align: center; padding: 15px; border: 1.5px solid #e93c40;"
							id="tab1" class="tab"><a
							href="javascript:disp_div('minfo','tab1')">회원 정보</a></td>
						<td
							style="text-align: center; padding: 15px; border: 1.5px solid #e93c40;"
							id="tab2" class="tab"><a
							href="javascript:disp_div('oinfo','tab2')">주문 정보</a></td>
						<td
							style="text-align: center; padding: 15px; border: 1.5px solid #e93c40;"
							id="tab3" class="tab"><a
							href="javascript:disp_div('binfo','tab3')">작성글 보기</a></td>
					</tr>
				</table>
				<%-- oinfo : 주문 정보 출력 --%>
				<div id="oinfo" class="info" style="display: none; width: 100%;">
					<table class="ordertable">
						<tr>
							<th width="98px;">주문번호</th>
							<th width="98px;">주문고객</th>
							<th width="98px;">연락처</th>
							<th width="98px;">주문일자</th>
							<th width="98px;">총주문금액</th>
						</tr>
						<c:forEach items="${salelist}" var="sale" varStatus="stat">
							<tr>
								<td align="center"><a
									href="javascript:list_disp('saleLine${stat.index}')">
										${sale.saleid}</a></td>
								<td align="center">&nbsp;<a
									href="javascript:list_disp('saleLine${stat.index}')"> 
								<c:if test="${! empty sale.user}">
       										${sale.user.name}(${sale.user.userid})</c:if></a></td>
								<td align="center">${sale.user.phone1}-${sale.user.phone2}-${sale.user.phone3}</td>
								<td align="center"><fmt:formatDate
										value="${sale.updatetime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td class="rightnum"><fmt:formatNumber
										value="${sale.total}" pattern="###,###" />원</td>
							</tr>
							<tr id="saleLine${stat.index }" class="saleLine">
								<td colspan="6" align="center">
									<table style="border: solid 0.5px;">
										<tbody>
											<tr>
												<th width="14%">상품이미지</th>
												<th width="25%">상품명</th>
												<th width="25%">상품가격</th>
												<th width="13%">구매수량</th>
												<th width="25%">상품총액</th>
											</tr>
											<c:forEach items="${sale.itemList }" var="saleItem">
												<tr>
													<td style="text-align: center; max-width: 70px;"
														class="thumb"><a href="../item/detail.do?id=${saleItem.item.id}"><img
														style="max-width: 70px; vertical-align: middle;"
														src="../${path}/item/img/${saleItem.item.pictureUrl}"
														class="thumb"></a></td>
													<td style="text-align: center; vertical-align: middle;"
														class="title">${saleItem.item.name}</td>
													<td style="text-align: center; vertical-align: middle;"
														class="rightnum"><fmt:formatNumber
															value="${saleItem.item.price}" pattern="###,###" />원</td>
													<td style="text-align: center; vertical-align: middle;"
														class="rightnum">${saleItem.quantity}개</td>
													<td style="text-align: center; vertical-align: middle;"
														class="rightnum"><fmt:formatNumber
															value="${saleItem.quantity * saleItem.item.price}"
															pattern="###,###" />원</td>
												</tr>
											</c:forEach>
											
									<tr>
										<th colspan="2"scope="row">받으시는 분 <img
											src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
											alt="필수"></th>
										<td colspan="3">${sale.rname}</td>
									</tr>
									<tr>
										<th colspan="2" scope="row">주소 </th>
										<td colspan="3">
										${sale.addr1}<br>
										${sale.addr2}<br>
										${sale.addr3}
											
										 <span
											class="grid"></span></td>
									</tr>
									<tr class="">
										<th colspan="2" scope="row">휴대전화 <span class=""><img
												src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
												alt="필수"></span>
										</th>
										<td colspan="3">${sale.rphone}
										</td>
									</tr>
									<tbody class="delivery ">
									<tr class="">
										<th colspan="2" scope="row">배송메시지 <span class="displaynone"><img
												src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
												alt="필수"></span>
										</th>
										<td colspan="3">${sale.omessage}
										</td>
									</tr>
								</tbody>
								
									</table>
								</td>
							</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
				<%--minfo : 회원 정보 출력 --%>

				<div id="minfo" class="info">
					<div class="ec-base-joinus-table typeWrite">
						<table border="1" summary="">
							<caption>회원 기본정보</caption>
							<colgroup>
								<col style="width: 150px;">
								<col style="width: auto;">
							</colgroup>
							<div class="xans-element- xans-myshop xans-myshop-asyncbenefit">
								<div class="ec-base-box typeMember gMessage ">
									<div class="information">
										<p class="thumbnail">
											<img
												src="//img.echosting.cafe24.com/skin/base_ko_KR/member/img_member_default.gif"
												alt=""
												onerror="this.src='http://img.echosting.cafe24.com/skin/base/member/img_member_default.gif';"
												class="myshop_benefit_group_image_tag">
										</p>
										<div class="description">
											<p>
												<strong class="txtEm"><span><span
														class="xans-member-var-name">&nbsp;&nbsp;&nbsp;${loginUser.name}</span></span>님</strong>
											</p>
										
									
										</div>
									</div>
								</div>
							</div>

							<tbody>
								<tr>
									<th scope="row">아이디</th>
									<td>${loginUser.userid}</td>
								</tr>


								<tr>
									<th scope="row" id="nameTitle">이름
									<td><span id="nameContents">${loginUser.name}</span></td>
								</tr>
								<tr>
									<th scope="row">주소
									<td><span>${loginUser.uaddr1}</span><br>
										<span>${loginUser.uaddr2}</span><br>
										<span>${loginUser.uaddr3}</span></td>
								</tr>	

								<tr class="">
									<th scope="row">휴대전화</th>
									<td>${loginUser.phone1}- ${loginUser.phone2} -
										${loginUser.phone3}</td>
								</tr>
								<tr>
									<th scope="row">이메일
									<td><span>${loginUser.email}</span></td>
								</tr>
								<tr>
									<th scope="row">가입일
									<td><span><fmt:formatDate
												value="${loginUser.regdate}" pattern="yyyy년 MM월 dd일" /></span></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="ec-base-button justify">

						<c:if test="${loginUser.userid != 'admin'}">
							<span class="gRight"> <a
								href="update.do?id=${loginUser.userid}">회원정보수정</a>&nbsp; <a
								href="delete.do?id=${loginUser.userid}">회원 탈퇴</a>&nbsp;
							</span>
						</c:if>
						<span class="gRight"> <c:if
								test="${loginUser.userid == 'admin'}">
								<a href="../admin/list.do">회원목록</a>&nbsp;
       </c:if>
						</span>
					</div>
				</div>
				<br>






		
				<div id="binfo" class="info" style="display: none; width: 100%;">

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
										<th scope="col">번호</th>
										<th scope="col" class="displaynone">카테고리</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col" class="">작성일</th>
										<th scope="col" class="">조회</th>
									</tr>
								</thead>
							</table>
							<p
								class="xans-element- xans-board xans-board-empty-1002 xans-board-empty xans-board-1002 message  ">작성한
								글이 없습니다.</p>
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
										<th scope="col" style="padding: 10px;">번호</th>
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

									<c:forEach var="board" items="${list}">
										<tr style="background-color: #FFFFFF; color: #555555;"
											class="xans-record-">
											<td style="padding: 10px;">${board.num}</td>
											<td class="thumb"></td>
											<td class="subject left txtBreak"><span
												style="padding-right: 15px; color: #333"></span> <a
												href="../board/detail.do?board_no=${board.board_no}&num=${board.num}"
												style="color: #555555;">${board.subject}</a> <span
												class="txtEm"></span></td>
											<td>${board.name}</td>
											<td class=""><span class="txtNum"><fmt:formatDate
														value="${loginUser.regdate}" pattern="yyyy.MM.dd" /></span></td>
											<td class=""><span class="txtNum">${board.readcnt}</span></td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
							<p
								class="xans-element- xans-board xans-board-empty-4 xans-board-empty xans-board-4 message displaynone "></p>
						</div>
					</c:if>


				</div>
				<br>
			</div>
		</div>
	</div>

</body>
</html>