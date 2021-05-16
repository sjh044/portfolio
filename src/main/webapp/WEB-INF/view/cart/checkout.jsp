<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문서 작성</title>
</head>
<body>
	<div id="wrap" class="cont_linebox">
		<div id="container">
			<div id="contents">


				<div class="titleArea">
					<h2>주문서작성</h2>
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


					<ul class="ec-base-help controlInfo">
						<li class="txtWarn txt11">상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서
							가능합니다.</li>

					</ul>
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
											<strong> <fmt:formatNumber value="${sessionScope.CART.total}" pattern="###,###"/>원</strong> + 배송비 <span
											id="domestic_ship_fee">0 (무료)</span> = 합계 : <strong
											class="txtEm gIndent10"><span
												id="domestic_ship_fee_sum" class="txt18"><fmt:formatNumber value="${sessionScope.CART.total}" pattern="###,###"/></span>원</strong>
										</td>
									</tr>
								</tfoot>
								<c:forEach items="${sessionScope.CART.itemSetList}"
									var="itemSet" varStatus="stat">
									<tbody
										class="xans-element- xans-order xans-order-normallist center">
										<tr class="xans-record-">
											<td class=""></td>
											<td class="thumb"><a
												href="../item/detail.do?id=${itemSet.item.id}"><img
													src="../${path}/item/img/${itemSet.item.pictureUrl}"
													class="thumb"></a></td>
											<td class="left"><a
												href="../item/detail.do?id=${itemSet.item.id}"><strong>${itemSet.item.name}</strong></a>
											<td class="right">
												<div class="">
													<strong><fmt:formatNumber value="${itemSet.item.price}" pattern="###,###"/>원</strong>

												</div>
											</td>
											<td>${itemSet.quantity}</td>

											<td>[무료]</td>
											<td class="right"><strong><fmt:formatNumber value="${itemSet.item.price *itemSet.quantity}" pattern="###,###"/>원</strong>
											</td>
										</tr>

									</tbody>
								</c:forEach>
							</table>
						</div>

					</div>
				<form action="end.do" method="post" name="f">	
					
					<div class="orderArea">
						<div class="title">
							<h3>배송 정보</h3>
							<p class="required">
								<img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
									alt="필수"> 필수입력사항
							</p>
						</div>
						<div class="ec-base-joinus-table typeWrite">
							<table border="1" summary="">
								<caption>배송 정보 입력</caption>
								<colgroup>
									<col style="width: 139px;">
									<col style="width: auto;">
								</colgroup>
							
								<!-- 국내 배송지 정보 -->
								<tbody class="">

									<tr>
										<th scope="row">받으시는 분 <img
											src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
											alt="필수"></th>
										<td><input id="rname" name="rname" fw-filter="isFill"
											fw-label="수취자 성명" fw-msg="" class="inputTypeText"
											placeholder="" size="15" value="" type="text"></td>
									</tr>
									<tr>
										<th scope="row">주소 <img
											src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
											alt="필수"></th>
										<td><input id="addr1" name="addr1"
											fw-filter="isFill" fw-label="수취자 우편번호1" fw-msg=""
											class="inputTypeText" placeholder="" size="6" maxlength="6"
											readonly="1" value="" type="text"> 
											<a href="#none" onclick="execPostCode();"
											id="btn_search_rzipcode"><img
												src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_zipcode.gif"
												alt="우편번호"></a><br> 
											<input id="addr2" name="addr2"
											fw-filter="isFill" fw-label="수취자 주소1" fw-msg=""
											class="inputTypeText" placeholder="" size="40" readonly="1"
											value="" type="text"> <span class="grid">기본주소</span><br>
											<input id="addr3" name="addr3" fw-filter=""
											fw-label="수취자 주소2" fw-msg="" class="inputTypeText"
											placeholder="" size="40" value="" type="text"> <span
											class="grid">나머지주소</span><span class="grid ">(선택입력가능)</span></td>
									</tr>
								
									<tr class="">
										<th scope="row">휴대전화 <span class=""><img
												src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
												alt="필수"></span>
										</th>
										<td><select id="rphone1" name="rphone1"
											fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
											fw-alone="N" fw-msg="">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
										</select>-<input id="rphone2" name="rphone2" maxlength="4"
											fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
											fw-alone="N" fw-msg="" size="4" value="" type="text">-<input
											id="rphone3" name="rphone3" maxlength="4"
											fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
											fw-alone="N" fw-msg="" size="4" value="" type="text"></td>
									</tr>

								</tbody>

								<!-- 이메일 국내/해외 -->
								<tbody class="email ec-shop-deliverySimpleForm">
									<tr>
										<th scope="row">이메일 <img
											src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
											alt="필수"></th>
										<td>${sessionScope.loginUser.email}</td>
									</tr>
								</tbody>
								<!-- 국내 배송관련 정보 -->
								<tbody class="delivery ">
									<tr class="">
										<th scope="row">배송메시지 <span class="displaynone"><img
												src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
												alt="필수"></span>
										</th>
										<td><textarea id="omessage" name="omessage" fw-filter=""
												fw-label="배송 메세지" fw-msg="" maxlength="255" cols="70"></textarea>
											<div class="devMessage displaynone">
												<label><input id="omessage_autosave0"
													name="omessage_autosave[]" fw-filter=""
													fw-label="배송 메세지 저장" fw-msg="" value="T" type="checkbox"
													disabled=""><label for="omessage_autosave0"></label>
													자동저장</label>
												<ul class="gIndent5">
													<li>배송메시지란에는 배송시 참고할 사항이 있으면 적어주십시오.</li>
													<li>게시글은 비밀글로 저장되며 비밀번호는 주문번호 뒷자리로 자동 저장됩니다.</li>
												</ul>
											</div></td>
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
													class="txt23"><fmt:formatNumber value="${sessionScope.CART.total}" pattern="###,###"/></span>원</strong> <span
													class="displaynone"><span
													id="total_order_price_ref_view"></span></span>
											</div></td>
										<td class="option "><div class="box txt16">
												<strong>-</strong> <strong><span
													id="total_sale_price_view" class="txt23">0</span> <fmt:formatNumber value="${total}" pattern="###,###"/>원</strong> <span
													class="displaynone"><span
													id="total_sale_price_ref_view"></span></span>
											</div></td>
										<td><div class="box txtEm txt16">
												<strong>=</strong> <strong><span
													id="total_order_sale_price_view" class="txt23"> <fmt:formatNumber value="${sessionScope.CART.total}" pattern="###,###"/></span>원</strong>
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
										size="10" readonly="1" value="<fmt:formatNumber value="${sessionScope.CART.total}" pattern="###,###"/>" type="text"><span>원</span>
								</p>
							
								<div class="button">
									<a href="javascript:document.f.submit()" id="btn_payment">결제하기</a>
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
					</form>
				</div>
			</div>
		</div>

	</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=addr1]").val(data.zonecode);
           $("[name=addr2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
</script>
</body>
</html>