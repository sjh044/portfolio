<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/item/detail.jsp --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 보기</title>
<script>
var sell_price = ${item.price};
var quantity;

function init () {
	sell_price = document.form.sell_price.value;
	quantity = document.form.quantity.value;
	document.form.sum.value = sell_price;
	change();
}

function add () {
	hm = document.form.quantity;
	sum = document.form.sum;
	hm.value ++ ;

	sum.value = parseInt(hm.value) * sell_price;
}

function del () {
	hm = document.form.quantity;
	sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
}

function change () {
	hm = document.form.quantity;
	sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * sell_price;
}  

</script>

</head>
<body>
	<div id="wrap" class="cont_linebox" style="margin-top: 100px;">
		<div id="container">
			<div id="contents">

				<!--
    $category_page = /product/list.html
    $project_page = /product/project.html
    $jointbuy_page = /product/jointbuy.html
-->
				<div
					class="xans-element- xans-product xans-product-headcategory path ">
					<span>현재 위치</span>
					<ol>

						<li><a href="/">홈</a></li>
						<li class=""><a href="/category/shop/24/">SHOP</a></li>
						<li class="displaynone"><a href=""></a></li>
						<li class="displaynone"><a href=""></a></li>
						<li class="displaynone"><strong><a href=""></a></strong></li>
					</ol>
				</div>

				<!-- 상단 제품 정보  -->
				<div class="xans-element- xans-product xans-product-detail">
					<div class="headingArea ">
						<h2>${item.name}</h2>

					</div>
					<div class="detailArea ">
						<!-- 이미지 영역 -->
						<div class="xans-element- xans-product xans-product-image imgArea">
							<div class="keyImg ">
								<div class="thumbnail">

									<img src="img/${item.pictureUrl}">


								</div>
							</div>
							<!-- 참고 : 뉴상품관리 전용 모듈입니다. 뉴상품관리 이외의 곳에서 사용하면 정상동작하지 않습니다. -->
							<div
								class="xans-element- xans-product xans-product-addimage listImg">
								<ul>
									<li style="float: none !important;" class="xans-record-"><img
										src="//bossapple.com/web/product/small/201708/19_shop1_748869.jpg"
										class="ThumbImage" alt=""></li>
								</ul>
							</div>
							<!-- //참고 -->

							<!-- 참고 : 뉴상품관리 전용 모듈입니다. 뉴상품관리 이외의 곳에서 사용하면 정상동작하지 않습니다. -->
							<div class="color displaynone"></div>
							<!-- //참고 -->
							<!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
							<div
								class="xans-element- xans-product xans-product-action ec-base-button ">
								<a href="#none" onclick="recommend_mail_pop('19', '24', '1')"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_recommend_email.gif"
									alt="추천메일 보내기"></a> <a href="#none" onclick=""
									class="displaynone"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_product_request.gif"
									alt="상품조르기"></a> <a href="/board/inquiry/write.html"
									class="displaynone"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_large_purchase.gif"
									alt="대량구매문의"></a>
							</div>
							<!-- //참고 -->
						</div>
						<!-- //이미지 영역 -->

						<!-- 상세정보 내역 -->
						<form action="../cart/cartAdd.do" name="form">
							<input type="hidden" name="id" value="${item.id}">
						
							<div class="infoArea">
								<div class="icon"></div>
								<div
									class="xans-element- xans-product xans-product-detaildesign">
									<!--
                    출력 갯수 지정 변수, 없으면 설정된 전체가 나옵니다.
                    count = 10
                -->
									<table border="1" summary="">
										<caption>기본 정보</caption>
										<tbody>
											<tr class=" xans-record-">
												<th scope="row" class="displaynone"><span
													style="font-size: 20px; color: #282828; font-weight: bold;">상품명</span></th>
												<td colspan="2" style="padding: 7px 6px 0px 0px"><span
													style="font-size: 20px; color: #282828; font-weight: bold;">${item.name}
												</span></td>
											</tr>
											<tr class=" xans-record-">
												<th scope="row" class="displaynone"><span
													style="font-size: 12px; color: #555555;">상품요약정보</span></th>
												<td colspan="2"
													style="letter-spacing: -0.03em; border-bottom: 1px solid #444; padding-top: 10px; line-height: 20px; padding-bottom: 15px;"><span
													style="font-size: 12px; color: #555555;">${item.subject}</span></td>
											</tr>
											<tr class=" xans-record-">
												<th scope="row"><span
													style="font-size: 12px; color: #282828; font-weight: bold;">판매가</span></th>
												<td><span
													style="font-size: 12px; color: #282828; font-weight: bold;"><strong
														id="span_product_price_text"> <fmt:formatNumber
																value="${item.price}" type="CURRENCY" currencySymbol="" />원
													</strong> </span></td>
											</tr>
											<tr>
												<th>수량</th>
												<td align=center><span class="quantity"> 
													<input id="quantity" type="text" name="quantity" value="1" size="3"
														onchange="change();"> 
													<a href="#none"
														onclick="add();"> <img src="../img/btn_count_up.gif"
															alt="수량증가" class="QuantityUp up">
													</a> 
													<a href="#none" onclick="del();"> 
													<img src="../img/btn_count_down.gif" alt="수량증가"
															class="QuantityUp up">
													</a>
												</span></td>
											</tr>
											
											<tr class=" xans-record-">
												<th scope="row"><span
													style="font-size: 12px; color: #555555;">배송비</span></th>
												<td>
													<span style="font-size: 12px; color: #555555;">
													<span class="delv_price_B">
													<select name="delivery_cost_prepaid" id="delivery_cost_prepaid">
																<option value="P" selected="selected">주문시
																	결제(선결제)</option>
																<option value="C">수령시 결제(착불)</option>
														</select><strong><fmt:formatNumber value="${item.shipping}" type="CURRENCY" currencySymbol="" />원</strong></span></span></td>
											</tr>

										</tbody>
									</table>
								</div>

								<!-- 참고 : 뉴상품관리 전용 모듈입니다. 뉴상품관리 이외의 곳에서 사용하면 정상동작하지 않습니다. -->
								<!-- //참고 -->

								<!-- 참고 : 뉴상품관리 전용 모듈입니다. 뉴상품관리 이외의 곳에서 사용하면 정상동작하지 않습니다. -->
								<!-- //참고 -->

								<!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
								<div id="totalProducts" class="">

									<table border="1" summary="">

										<tfoot>
											<tr>
												<td colspan="3"><strong>총 상품금액</strong>(수량) : <span
													class="total"> <strong><em>
													<input type="text" size="11" 
																style="background-color: transparent; border: 0 solid black; text-align: center; width: 100px"
																name="sum" value="<fmt:formatNumber value="${item.price}" type="CURRENCY" currencySymbol="" />"readonly>원</em></strong>

												</span></td>
											</tr>
										</tfoot>
									</table>
								</div>
								<!-- //참고 -->

								<!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
								<div class="xans-element- xans-product xans-product-action ">
									<div class="ec-base-button trans">
										<a href="#none" class="first  buynow rollover"
											onclick="product_submit(1, '/exec/front/order/basket/', this)"
											id="btnBuy"><p>바로구매하기</p>
											<p class="over">바로구매하기</p> <img
											src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_reserve.gif"
											alt="예약주문" class="displaynone" id="btnReserve"
											style="display: none;"></a> <a
											href="javascript:form.submit();" class=" rollover"
											style="display: block;">
											<p>장바구니 담기</p>

										</a> <span class="displaynone rollover"
											style="display: block; float: left;"><p>품절</p>
											<p class="over">품절</p></span> <a href="#none"
											onclick="add_wishlist_nologin('/member/login.html');"
											class=" rollover" style="margin-left: 6px;"><p>관심상품등록</p>
											<p class="over">관심상품등록</p></a>
									</div>
									<!--게시판 숫자표시 추가-->
									<div class="detail_additioninfo cl">
										<ul>
											<li class="review"
												style="margin-left: 0px !important; padding-left: 0px !important;"><a
												href="#prdReview">Review (0)</a></li>
											<li class="qna"><a href="#prdQnA">Q&amp;A(0)</a></li>
										</ul>
										<ul class="social" style="display: none;">
											<li><a href="#"><i class="fa fa-facebook fa-lg"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-twitter fa-lg"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>


								</div>
								<!-- //참고 -->
							</div>
						</form>
					</div>

				</div>


				<div class="xans-element- xans-product xans-product-additional ">
					<!-- 상품상세정보 -->
					<div id="prdDetail" class="detail_tab">
						<ul class="menu">
							<li class="selected"><a href="#prdDetail">상품상세정보</a></li>
							<li><a href="#prdInfo">상품구매안내</a></li>
							<li><a href="#prdReview">상품사용후기</a></li>
							<li><a href="#prdQnA">상품Q&amp;A</a></li>
						</ul>
						<div class="cont" style="text-align: center;">
							${item.description}</div>
					</div>
					<!-- //상품상세정보 -->
					<!-- 상품구매안내 -->
					<div id="prdInfo" class="detail_tab">
						<ul class="menu">
							<li><a href="#prdDetail">상품상세정보</a></li>
							<li class="selected"><a href="#prdInfo">상품구매안내</a></li>
							<li><a href="#prdReview">상품사용후기</a></li>
							<li><a href="#prdQnA">상품Q&amp;A</a></li>
						</ul>
						<div>
							<div class="cont">
								<h3>상품결제정보</h3>
								고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인
								명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다. &nbsp; <br>
								<br> 무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접
								입금하시면 됩니다. &nbsp;<br> 주문시 입력한&nbsp;입금자명과 실제입금자의 성명이 반드시
								일치하여야 하며, 7일 이내로 입금을 하셔야 하며&nbsp;입금되지 않은 주문은 자동취소 됩니다. <br>
							</div>
							<div class="cont">
								<h3>배송정보</h3>
								<ul class="delivery">
									<li>배송 방법 : 택배</li>
									<li>배송 지역 : 전국지역</li>
									<li>배송 비용 : 3,500원</li>
									<li>배송 기간 : 3일 ~ 7일</li>
									<li>배송 안내 : - 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.<br>
										고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수
										있습니다.<br>
									</li>
								</ul>
							</div>
							<div class="cont">
								<h3>교환 및 반품정보</h3>
								<b>교환 및 반품이 가능한 경우</b><br> - 상품을 공급 받으신 날로부터 7일이내 단, 가전제품의<br>
								&nbsp;&nbsp;경우 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.<br>
								- 공급받으신 상품 및 용역의 내용이 표시.광고 내용과<br> &nbsp;&nbsp;다르거나 다르게 이행된
								경우에는 공급받은 날로부터 3월이내, 그사실을 알게 된 날로부터 30일이내<br> <br> <b>교환
									및 반품이 불가능한 경우</b><br> - 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단,
								상품의 내용을 확인하기 위하여<br> &nbsp;&nbsp;포장 등을 훼손한 경우는 제외<br>
								- 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우<br> &nbsp;&nbsp;(예 :
								가전제품, 식품, 음반 등, 단 액정화면이 부착된 노트북, LCD모니터, 디지털 카메라 등의 불량화소에<br>
								&nbsp;&nbsp;따른 반품/교환은 제조사 기준에 따릅니다.)<br> - 고객님의 사용 또는 일부
								소비에 의하여 상품의 가치가 현저히 감소한 경우 단, 화장품등의 경우 시용제품을 <br>
								&nbsp;&nbsp;제공한 경우에 한 합니다.<br> - 시간의 경과에 의하여 재판매가 곤란할 정도로
								상품등의 가치가 현저히 감소한 경우<br> - 복제가 가능한 상품등의 포장을 훼손한 경우<br>
								&nbsp;&nbsp;(자세한 내용은 고객만족센터 1:1 E-MAIL상담을 이용해 주시기 바랍니다.)<br>
								<br> ※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.<br>
								&nbsp;&nbsp;(색상 교환, 사이즈 교환 등 포함)<br>
							</div>
							<div class="cont">
								<h3>서비스문의</h3>
							</div>
						</div>
					</div>
					<!-- //상품구매안내 -->
					<!--관련상품 -->
					<!--관련상품 -->
					<!-- 상품사용후기 -->
					<div id="prdReview" class="detail_tab">
						<ul class="menu">
							<li><a href="#prdDetail">상품상세정보</a></li>
							<li><a href="#prdInfo">상품구매안내</a></li>
							<li class="selected"><a href="#prdReview">상품사용후기</a></li>
							<li><a href="#prdQnA">상품Q&amp;A</a></li>
						</ul>
						<div class="board">
							<h3>REVIEW</h3>
							<p class="desc">상품의 사용후기를 적어주세요.</p>

							<p class="nodata">게시물이 없습니다</p>
							<p class="ec-base-button typeBorder"
								style="border: 0; padding: 10px 0px 0px">
								<span class="detail_page_b_btn"> <a
									href="/board/product/write.html?board_no=4&amp;product_no=19&amp;cate_no=24&amp;display_group=1"
									class="select">리뷰작성하기</a> <a
									href="/board/product/list.html?board_no=4">모두 보기</a>
								</span>
							</p>

						</div>
					</div>
					<!-- //상품사용후기 -->
					<!-- 상품 Q&A -->
					<div id="prdQnA" class="detail_tab">
						<ul class="menu">
							<li><a href="#prdDetail">상품상세정보</a></li>
							<li><a href="#prdInfo">상품구매안내</a></li>
							<li><a href="#prdReview">상품사용후기</a></li>
							<li class="selected"><a href="#prdQnA">상품Q&amp;A</a></li>
						</ul>
						<div class="board">
							<h3>Q&amp;A</h3>
							<p class="desc">상품에 대해 궁금한 점을 해결해 드립니다.</p>

							<p class="nodata">게시물이 없습니다</p>
							<p class="ec-base-button typeBorder"
								style="border: 0; padding: 10px 0px 0px">
								<span class="detail_page_b_btn"> <a
									href="/board/product/write.html?board_no=6&amp;product_no=19&amp;cate_no=24&amp;display_group=1"
									class="select">상품문의하기</a> <a
									href="/board/product/list.html?board_no=6">모두 보기</a>
								</span>
							</p>

						</div>
					</div>
					<!-- //상품Q&A -->
				</div>



			</div>
			<div id="sidebar"></div>
		</div>
		<hr class="layout">
	</div>
</body>
</html>