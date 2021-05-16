<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/cart/cart.jsp --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>

	<div id="wrap" class="cont_linebox">
	<form action="../cart/cart.do" name="form">
			<input type="hidden" name="id" value="${item.id}">
		<div id="container">
			<div id="contents">

				<div class="path">
					<span>현재 위치</span>
					<ol>
						<li><a href="/">홈</a></li>
						<li title="현재 위치"><strong>장바구니</strong></li>
					</ol>
				</div>
	
				<div class="titleArea">
					<h2>장바구니</h2>
				</div>
					
	
				<!-- 장바구니 모듈 Package -->
			<c:if test="${cart.itemSetList == null}">	
				<div class="xans-element- xazs-order xans-order-basketpackage ">
				
				
						<!-- 장바구니에 담긴 상품이 0일떼 -->
						
					<div
						class="xans-element- xans-order xans-order-tabinfo order-tab typeLight ">
						<ul class="menu">
							<li class="selected "><a>배송상품</a></li>
						</ul>
						<p class="right displaynone">장바구니에 담긴 상품은 7일 동안 보관됩니다.</p>
					</div>
					<!-- 장바구니 비어있을 때 -->
					<div class="xans-element- xans-order xans-order-empty ">
						<p>장바구니가 비어 있습니다.</p>
					</div>
					<!-- 일반상품 -->
					<div class="orderListArea mgy-table typeList">

						<!-- 일반상품 (기본배송) -->
						<!-- 일반상품 (업체기본배송) -->
						<!-- 일반상품 (개별배송) -->
						<!-- 일반상품 (해외배송) -->
					</div>
					<!-- 무이자상품 -->
					<div class="orderListArea">

						<!-- 무이자상품 (기본배송)-->
						<!-- 무이자상품 (개별배송)-->
						<!-- 무이자상품 (해외배송) -->
					</div>
					<!-- 무이자할부 정보 (카드이미지 등) -->
					<!-- 선택상품 제어 버튼 -->
					<!-- 총 주문금액 : 국내배송상품 -->
					<!-- 총 주문금액 : 해외배송상품 -->
					<!-- 주문 버튼 -->
				
				</div>
			</c:if>
			<c:if test="${cart.itemSetList != null}">		
				<div class="xans-element- xans-order xans-order-basketpackage ">
			
				<!-- 장바구니에 담긴 상품이 있을떼 -->
					<div
						class="xans-element- xans-order xans-order-tabinfo order-tab typeLight ">
						<ul class="menu">
							<li class="selected "><a href="#">배송상품</a></li>
						</ul>
					
					</div>
				
				
					
					
					<div class="orderListArea mgy-table typeList">
						<div style="padding: 13px;"class="xans-element- xans-order xans-order-normtitle title ">
							<h3>상품</h3>
						</div>

						<!-- 일반상품 (기본배송) -->
						<table border="1" summary=""
							class="xans-element- xans-order xans-order-normnormal xans-record-">
							<caption>기본배송</caption>
							<colgroup>
								<col style="width: 27px">
								<col style="width: 112px">
								<col style="width: auto">
								<col style="width: 98px">
								<col style="width: 75px">
								<col style="width: 98px">
								<col style="width: 98px">
								<col style="width: 85px">
								<col style="width: 98px">
								<col style="width: 110px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><input type="checkbox"
										onclick="Basket.setCheckBasketList('basket_product_normal_type_normal', this);"></th>
									<th scope="col">이미지</th>
									<th scope="col">상품정보</th>
									<th scope="col">판매가</th>
									<th scope="col">수량</th>
									<th scope="col">배송비</th>
									<th scope="col">합계</th>
									<th scope="col">선택</th>
								</tr>
							</thead>
							
			
						
							
							<c:set var="tot" value="${0}"/>	
							<c:forEach items="${cart.itemSetList}" var="itemSet"
								varStatus="stat">
							<tbody class="xans-element- xans-order xans-order-list center">
								<tr class="xans-record-">
									<td><input type="checkbox" id="basket_chk_id_0"
										name="basket_product_normal_type_normal"></td>
									<td class="thumb">
										<img src="../${path}/item/img/${itemSet.item.pictureUrl}"  class="thumb">
									</td>
									<td class="left"><a
										href="../item/detail.do?id=${itemSet.item.id}"><strong>${itemSet.item.name}</strong>
									</a></td>
									<td class="right"><fmt:formatNumber
																value="${itemSet.item.price}" type="CURRENCY" currencySymbol="" />원
											

									</td>
									<td><span class="">${itemSet.quantity}</span></td>

								
									<c:set var="tot"
											value="${tot +(itemSet.quantity * itemSet.item.price)}" /> 
									<td>
										<fmt:formatNumber value="${itemSet.item.shipping}" type="CURRENCY" currencySymbol="" />
									</td>
									<td class="right"><strong><fmt:formatNumber
																value="${itemSet.quantity * itemSet.item.price}" type="CURRENCY" currencySymbol="" />&nbsp;원
									
							</strong>
										</td>
									<td class="button">
									    <a href="javascript:;" onclick="Basket.orderBasketItem(0);" class="oder_select">주문하기</a>
										<a href="cartDelete.do?index=${stat.index}">삭제</a>
									</td>
								</tr>
							</tbody>
							
							</c:forEach>
									<tfoot class="right">

									<tr>
										<td colspan="10"> 상품구매금액
											<strong><fmt:formatNumber value="${tot}" pattern="###,###"/> <span class="displaynone">()</span></strong><span
											class="displaynone"> </span> + 배송비 0 (무)<span
											class="displaynone"> </span> = 합계 : <strong class="txtEm gIndent10"><span
												class="txt18"><fmt:formatNumber value="${tot}" pattern="###,###"/></span>원</strong> </td>
									</tr>
								</tfoot>
						</table>
						<!-- 일반상품 (업체기본배송) -->
						<!-- 일반상품 (개별배송) -->
						<!-- 일반상품 (해외배송) -->
					</div>
					<!-- 무이자상품 -->
					<div class="orderListArea">

						<!-- 무이자상품 (기본배송)-->
						<!-- 무이자상품 (개별배송)-->
						<!-- 무이자상품 (해외배송) -->
					</div>
					
					<div
						class="xans-element- xans-order xans-order-selectorder ec-base-button ">
						<span class="gLeft"> <strong class="text">선택상품을</strong> <a
							href="#none" onclick="Basket.deleteBasket()" class="btn_delet">삭제하기</a>
						</span> <span class="gRight"> <a href="#none"
							onclick="Basket.emptyBasket()">장바구니비우기</a>
						</span>
					</div>
					<!-- 총 주문금액 : 국내배송상품 -->
					<div
						class="xans-element- xans-order xans-order-totalsummary ec-base-table typeList gBorder total  ">
						<table border="1" summary="">
							<caption>총 주문금액</caption>
							<colgroup>
								<col style="width: 23%;">
								<col style="width: 24%;">
								<col style="width: 23%;" class="displaynone">
								<col style="width: auto;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><strong>총 상품금액</strong> <a href="#none"
										onclick="OrderLayer.onDiv('order_layer_detail', event);"
										class="more displaynone"><img
											src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_list.gif"
											alt="내역보기"></a></th>
									<th scope="col"><strong>총 배송비</strong></th>
									<th scope="col" class="displaynone"><strong>총
											할인금액</strong> <a href="#none"
										onclick="OrderLayer.onDiv('order_layer_benefit', event);"><img
											src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_list.gif"
											alt="내역보기"></a></th>
									<th scope="col"><strong>결제예정금액</strong></th>
								</tr>
							</thead>
							<tbody class="center">
								<tr>
									<td><div class="box txt16">
											<strong><span class="txt23"><fmt:formatNumber value="${tot}" pattern="###,###"/></span>원</strong> <span
												class="txt14 displaynone"></span>
										</div></td>
										
									<td><div class="box txt16">
											<strong class="txt23">+ </strong><strong><span
												class="txt23">0</span>원</strong> <span class="txt14 displaynone"></span>
										</div></td>

									<td><div class="box txtEm txt16">
											<strong class="txt23">= </strong><strong><span
												class="txt23"><fmt:formatNumber value="${tot}" pattern="###,###"/></span>원</strong> <span class="txt14 displaynone"></span>
										</div></td>
								</tr>
							</tbody>
						</table>
						<!-- 총 상품금액 상세내역 레이어 -->
						<div id="order_layer_detail" class="totalDetail ec-base-layer">
							<div class="header">
								<h3>총 상품금액 상세내역</h3>
							</div>
							<div class="content">
								<p class="txtEm txt16">
									<strong>33,000원</strong>
								</p>
								<ul class="ec-base-desc typeDot gLarge rightDD">
									<li><strong class="term">상품금액</strong><span class="desc"></span>
									</li>
									<li class="displaynone"><strong class="term">부가세</strong><span
										class="desc">0원</span></li>
								</ul>
							</div>
							<a href="#none" class="close"
								onclick="OrderLayer.offDiv('order_layer_detail');"><img
								src="http://img.echosting.cafe24.com/skin/base/common/btn_close.gif"
								alt="닫기"></a>
						</div>
						<!-- 총 할인금액 내역보기 레이어 -->
						<div id="order_layer_benefit" class="totalDetail ec-base-layer">

							<a href="#none" class="close"
								onclick="OrderLayer.offDiv('order_layer_benefit');"><img
								src="http://img.echosting.cafe24.com/skin/base/common/btn_close.gif"
								alt="닫기"></a>
						</div>
					</div>
			
					<!-- 주문 버튼 -->
					<div
						class="xans-element- xans-order xans-order-totalorder ec-base-button justify">
						<a href="checkout.do" class=" all_order ">상품 주문하기</a> 
						<!--<span class="gRight">
            <a href="/">쇼핑계속하기</a>
        </span>-->
						<!-- 네이버 체크아웃 구매 버튼  -->
					
					</div>
				</div>
				</c:if>
	
			


				<!-- 이용안내 -->
				<div class="xans-element- xans-order xans-order-basketguide helps ">
					<h3>이용안내</h3>
					<div class="inner">
						<h4>장바구니 이용안내</h4>
						<ol>
							<li class="item1">해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로
								결제해 주시기 바랍니다.</li>
							<li class="item2">해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로
								이동하여 결제하실 수 있습니다.</li>
							<li class="item3">선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면
								됩니다.</li>
							<li class="item4">[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
							<li class="item5">장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로
								등록하실 수 있습니다.</li>
							<li class="item6">파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로
								교체됩니다.</li>
						</ol>
						<h4>무이자할부 이용안내</h4>
						<ol>
							<li class="item1">상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기]
								버튼을 눌러 주문/결제 하시면 됩니다.</li>
							<li class="item2">[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에
								대한 주문/결제가 이루어집니다.</li>
							<li class="item3">단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수
								없습니다.</li>
						</ol>
					</div>
				</div>
			</div>
			<div id="sidebar"></div>
		</div>
		</form>
		<hr class="layout">
	</div>
</body>
</html>