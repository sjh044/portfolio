<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문확정</title>
</head>
<body>
	<div id="wrap" class="cont_linebox">
		<div id="container">
			<div id="contents">


				<div class="titleArea">
					<h2>주문 완료</h2>
				</div>
				<div class="xans-element- xans-order xans-order-form xans-record-">



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


					
					<div class="orderListArea ">
						<div class="title">
							<h3>배송상품 주문내역</h3>

						</div>

						<!-- 기본배송 -->
						<div class="mgy-table typeList ">
							<table border="1" summary="">
								<caption>기본배송</caption>
								<colgroup>
									<col style="width: 27px" class="">
									<col style="width: 92px">
									<col style="width: auto">
									<col style="width: 98px">
									<col style="width: 75px">
									<col style="width: 98px">
									<col style="width: 98px">
									<col style="width: 85px">
									<col style="width: 98px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class=""></th>
										<th scope="col">이미지</th>
										<th scope="col">상품정보</th>
										<th scope="col">판매가</th>
										<th scope="col">수량</th>

										<th scope="col">배송비</th>
										<th scope="col">합계</th>
									</tr>
								</thead>
								<tfoot class="right">
									<tr>
										<td class=""></td>
										<td colspan="8"><span class="gLeft">[구매 금액]</span> 상품구매금액
											<strong><fmt:formatNumber value="${total}" pattern="###,###"/>원</strong> + 배송비 <span
											id="domestic_ship_fee">0 (무료)</span> = 합계 : <strong
											class="txtEm gIndent10"><span
												id="domestic_ship_fee_sum" class="txt18"><fmt:formatNumber value="${total}" pattern="###,###"/></span>원</strong>
										</td>
									</tr>
								</tfoot>
								<c:forEach items="${sale.itemList}"
									var="saleitem" varStatus="stat">
									<tbody
										class="xans-element- xans-order xans-order-normallist center">
										<tr class="xans-record-">
											<td class=""></td>
											<td class="thumb"><a
												href="../item/detail.do?id=${itemSet.item.id}"><img
													src="../${path}/item/img/${saleitem.item.pictureUrl}"
													class="thumb"></a></td>
											<td class="left"><a
												href="../item/detail.do?id=${saleitem.item.id}"><strong>${saleitem.item.name}</strong></a>
											<td class="right">
												<div class="">
													<strong>${saleitem.item.price}</strong>

												</div>
											</td>
											<td>${saleitem.quantity}</td>

											<td>[무료]</td>
											<td class="right"><strong>${saleitem.item.price *saleitem.quantity}원</strong>
											</td>
										</tr>

									</tbody>
								</c:forEach>
							</table>
						</div>

					</div>
					<div class="orderArea">
						<div class="title">
							<h3>배송 정보</h3>
							
						</div>
						<div class="ec-base-joinus-table typeWrite">
							<table border="1" summary="">
								<caption>배송 정보</caption>
								<colgroup>
									<col style="width: 139px;">
									<col style="width: auto;">
								</colgroup>
							
							
							
								<tbody class="">

									<tr>
										<th scope="row">받으시는 분 <img
											src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
											alt="필수"></th>
										<td>${sessionScope.loginUser.name}</td>
									</tr>
									<tr>
										<th scope="row">주소 <img
											src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
											alt="필수"></th>
										<td><span>${sale.addr1}</span><br>
											<span>${sale.addr2}</span><br>
											<span>${sale.addr3}</span></td>
									</tr>
								
									<tr class="">
										<th scope="row">휴대전화 
										</th>
										<td>${sale.rphone}</td>
									</tr>

								</tbody>

								<!-- 이메일 국내/해외 -->
								<tbody class="email ec-shop-deliverySimpleForm">
									<tr>
										<th scope="row">이메일 </th>
										<td>${sessionScope.loginUser.email}</td>
									</tr>
								</tbody>
								<!-- 국내 배송관련 정보 -->
								<tbody class="delivery ">
									<tr class="">
										<th scope="row">배송메시지 
										</th>
										<td>${sale.omessage}</td>
									</tr>
								</tbody>


							</table>
						</div>
						<div class="title">
					        <h3>결제 예정 금액</h3>
					    </div>
						<div class="ec-base-table typeList gBorder total">
							<table border="1" summary="">
								<caption>결제 예정 금액</caption>
								<colgroup>
									<col style="width: 33.33%">
									<col style="width: 33.33%" class="">
									<col style="width: 33.33%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col"><strong>총 주문 금액</strong> <a href="#none"
											onclick="EC_SHOP_FRONT_ORDERFORM_DISPLAY.onDiv('order_layer_detail', event);"
											class="more"><img
												src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_list.gif"
												alt="내역보기"></a></th>
										<th scope="col" class=""><strong>총 </strong><strong
											id="total_addsale_text" class="">할인</strong><strong
											id="plus_mark" class=""> + </strong><strong
											id="total_addpay_text" class="">부가결제</strong><strong>
												금액</strong></th>
										<th scope="col"><strong>총 결제예정 금액</strong></th>
									</tr>
								</thead>
								<tbody class="center">
									<tr>
										<td class="price"><div class="box txt16">
												<strong><span id="total_order_price_view"
													class="txt23"><fmt:formatNumber value="${total}" pattern="###,###"/></span>원</strong> <span
													class="displaynone"><span
													id="total_order_price_ref_view"></span></span>
											</div></td>
										<td class="option "><div class="box txt16">
												<strong>-</strong> <strong><span
													id="total_sale_price_view" class="txt23">0</span>원</strong> <span
													class="displaynone"><span
													id="total_sale_price_ref_view"></span></span>
											</div></td>
										<td><div class="box txtEm txt16">
												<strong>=</strong> <strong><span
													id="total_order_sale_price_view" class="txt23"><fmt:formatNumber value="${total}" pattern="###,###"/></span>원</strong>
												<span class="displaynone"><span
													id="total_order_sale_price_ref_view"></span></span>
											</div></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="title">
						        <h3>결제</h3>
						    </div>
						<div class="payArea">
							<div class="payment">
						
						
							</div>

							<!-- 최종결제금액 -->
							<div class="total">
								<h4>
									<strong id="current_pay_name">카드 결제</strong> <span>최종결제
										금액</span>
								</h4>
								<p class="price">
									<span></span><input id="total_price" name="total_price"
										fw-filter="isFill" fw-label="결제금액" fw-msg=""
										class="inputTypeText" placeholder=""
										style="text-align: right; ime-mode: disabled; clear: none; border: 0px; float: none;"
										size="10" readonly="1" value="<fmt:formatNumber value="${total}" pattern="###,###"/>" type="text"><span>원</span>
								</p>
							
								<div class="button">
									<a href="../board/main.do" id="btn_payment">결제완료</a>
								</div>
								<div class="mileage ">
									<dl class="ec-base-desc gLarge right">
										<dt>
											<strong>총 적립예정금액</strong>
										</dt>
										<dd id="mAllMileageSum" class="txtWarn" style="">0원</dd>
									</dl>
									<dl class="ec-base-desc gLarge right">
										<dt>상품별 적립금</dt>
										<dd id="mProductMileage">0원</dd>
										<dt>회원 적립금</dt>
										<dd id="mMemberMileage">0원</dd>
										<dt>쿠폰 적립금</dt>
										<dd id="mCouponMileage">0원</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>