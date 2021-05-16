<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
function goSubmit() {
    window.opener.name = "write"; // 부모창의 이름 설정
    document.myForm.target = "write"; // 타켓을 부모창으로 설정
    document.myForm.action = "../board/write.do";
    document.myForm.submit();
    self.close();
}
</script>
</head>
<link rel="stylesheet" href="../css/popup.css">
<body id="popup">
	<div
		class="xans-element- xans-search xans-search-frompackage ec-base-layer ">
		<div class="header">
			<h1>상품검색</h1>
		</div>
		<div class="content">
			<form id="searchForm" name=""
				action="/product/search_board_list.html" method="get" target="_self"
				enctype="multipart/form-data">
				<div class="xans-element- xans-search xans-search-boardform ">
					<fieldset class="ec-base-box">
						<legend>상품검색</legend>
						<select id="search_type" name="search_type" fw-filter=""
							fw-label="상품검색" fw-msg="">
							<option value="product_name">상품명</option>
							<option value="product_code">상품코드</option>
							<option value="ma_product_code">자체상품코드</option>
							<option value="manu_name">제조사</option>
							<option value="prd_model">모델명</option>
							<option value="prd_brand">브랜드명</option>
							<option value="prd_trand">트랜드명</option>
						</select> <input id="keyword" name="keyword" fw-filter="isFill"
							fw-label="검색어" fw-msg="" class="inputTypeText" placeholder=""
							size="15" value="" type="text"> <input type="image"
							src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_board_search.gif"
							alt="검색" class="btn"> &nbsp;
					</fieldset>
					<div class="resultArea">
						<p class="total">
							총 <strong>0</strong>개 의 상품이 검색되었습니다.
						</p>
						<p class="limit">
							<select id="limit" name="limit" fw-filter="" fw-label="보기개수"
								fw-msg="">
								<option value="5">5개씩 보기</option>
								<option value="10">10개씩 보기</option>
								<option value="20">20개씩 보기</option>
								<option value="30">30개씩 보기</option>
							</select>
						</p>
					</div>
				</div>
			</form>
			<form name="myForm" method="post" action="../board/write.do">
			<div class="ec-base-table typeList">
				<table border="1" summary="">
					<caption>제품 검색결과입니다</caption>
					<colgroup>
						<col style="width: 100px">
						<col style="width: auto">
						<col style="width: 80px">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">상품 이미지</th>
							<th scope="col">상품 정보</th>
							<th scope="col">선택</th>
						</tr>
					<c:forEach items="${itemList2}" var="item">	
						<tr class="xans-element- xans-search xans-search-boardlist xans-record-">
							<td class="thumb">
								<img src="../item/img/${item.pictureUrl}" alt="">
							</td>
							<td class="left">${item.name} <strong
								class="gBlank5 txtEm">${item.price}원</strong>
							</td>
							<td><input type="button" onclick="goSubmit()" value="선택"></td>
						</tr>
					</c:forEach>	
					</thead>
					<tbody class="center"></tbody>
				</table>
			</div>
	</form>
		</div>
	</div>
	<script type="text/javascript"
		src="/ind-script/i18n.php?lang=ko_KR&amp;domain=front&amp;v=2101271196"
		charset="utf-8"></script>

	<script type="text/javascript"
		src="/ind-script/optimizer.php?filename=tVTNbtswDH4BXfccQvYD7Lp26K3o0LXYWZHpWAklqhTVNn360Vm3pcscO2mDHCLI_H4kfpTtKIKdvWfbsovwQLyyDIUqe7DLYsPsczLL8s7uq6shO7-yy7sKvH7--2A-mdmBSHgU4OSwPG8YT7QK8FqWynjUEQx4k8hTajF4OYpiZj7q7yhx_SrE_xw-My0U_6JFjROQoAVRq5JY8JebxY8g3c3TVyfOxJAO4MEwVxTc6HocVTKHJO0EevK1t3VBHM8pCRMi8DjuG9byJeczDs1igp8qAcerWlYH9tElTXjSuGQGmWJmCycQM-o1_R_kcraXNA8I9noL7ylGSntMDuAiNVW3ykPIhwm2NXkJKql1TdUUx8FMTWXYY0KTY29_hXmbAt3TGsk1B4FiFdfrXs0L8P1QcwbAmXDdBpychAZaV1H6KyjRsZy5lIYk-6LvHeUXghcbmvNNe293ujs68xnrImio7h0GnUPi36_Anw2jC1deTds_jqkpu_TKkCkVOJ1CB5jh5OfoXGp23pW3FNAohnZ9On6NrbzZNSF5p_O8ovFB-OtgWX4C&amp;type=js&amp;k=89f5e415a342cfb25ee54703e12b558ae0550b55&amp;t=1610476507"></script>
	<script type="text/javascript"
		src="/ind-script/optimizer.php?filename=rZRBTsMwEEUPULacw4IbQJBgkYqqFLGeONNmGsdjje1WuT1R6IKKgpCnG0uR85-_nRebjgc0d_digvBOYDAQglmChx2aNUbOYtHsozli43h3s4-35kfEUWPeKYDtzyJVFkFvRxM7DosgZFGRt6enxZZlgKRtci1MTuQuQ-RbskuDQ58oEcbLb_9y7BBHb7_G4tyAQ4NSHH-VFsX6VAx4hNhj0hP-MOjfjJVwm215k4pzYK_Zy5IcTvPF-ScMHKl8_Q-KXU1RB7CcFUcgaFERX8_xDSdwlarHbHa5UOhxS1qpaxgVHZ4F2nKVHnLi6Q4kO2PeOj6WW51dohWHHMoRY009nn5Q3Yc9Q6lkr-mAjnzPXmfZy1SCZbyCryfSBpoCToDUCTtcHMBRCxNognwC&amp;type=js&amp;k=0f9e681f92e21c3fafd37709e3c4ffc2b32dfadc&amp;t=1611685093"></script>
	<script type="text/javascript"
		src="/ind-script/optimizer.php?filename=08_Iz03VNzQq0i8oyk8vSszVTywo0PdNzEtMT9UPSi3OLy1KTtXPKtZPLK7MS4aQPD75iSk8WcWi-sRqBkqnlCaXkKQnNzU3KbWIOyc_PTMPqBEA&amp;type=js&amp;k=b5ab0cb8adb891a5017dd5f2c3777afd9dd678d2&amp;t=1609872152"></script>
	<script type="text/javascript"
		src="/ind-script/optimizer.php?filename=nczLEYAgDAXAAvBqHW_GE5bDJyMgkIyBg92rLbgFLBI3AgUzlS6FE6lk991Cpq85mDRahUYykTQfHXrmvqEoArfGfSm64ldR3c1zwDvN4fuEZcrbPQ&amp;type=js&amp;k=3482d54e67231bb5dc1a5ab513544e83d2021650&amp;t=1501227978&amp;user=T"></script>
	<script type="text/javascript">
		var EC_MOBILE = false;
		var EC_MOBILE_DEVICE = false;
		var EC_MOBILE_USE = true;
		localStorage.setItem('EC_JQUERY_VERSION', '1.4.4');
		var mobileWeb = false;
		var aLogData = {
			"log_server1" : "eclog2-213.cafe24.com",
			"log_server2" : "eclog2-213.cafe24.com",
			"mid" : "apple8998",
			"stype" : "e",
			"domain" : "",
			"shop_no" : "1",
			"lang" : "ko_KR",
			"ver" : 2,
			"etc" : ""
		};
		var sMileageName = '적립금';
		var sMileageUnit = '[:PRICE:]원';
		var sDepositName = '예치금';
		var sDepositUnit = '원';
		var SHOP_CURRENCY_INFO = {
			"1" : {
				"aShopCurrencyInfo" : {
					"currency_code" : "KRW",
					"currency_no" : "410",
					"currency_symbol" : "\uffe6",
					"currency_name" : "South Korean won",
					"currency_desc" : "\uffe6 \uc6d0 (\ud55c\uad6d)",
					"decimal_place" : 0,
					"round_method_type" : "F"
				},
				"aShopSubCurrencyInfo" : null,
				"aBaseCurrencyInfo" : {
					"currency_code" : "KRW",
					"currency_no" : "410",
					"currency_symbol" : "\uffe6",
					"currency_name" : "South Korean won",
					"currency_desc" : "\uffe6 \uc6d0 (\ud55c\uad6d)",
					"decimal_place" : 0,
					"round_method_type" : "F"
				},
				"fExchangeRate" : 1,
				"fExchangeSubRate" : null,
				"aFrontCurrencyFormat" : {
					"head" : "",
					"tail" : "\uc6d0"
				},
				"aFrontSubCurrencyFormat" : {
					"head" : "",
					"tail" : "\uc6d0"
				}
			}
		};
		var EC_ASYNC_LIVELINKON_ID = '';
		if (EC$('[async_section=before]').length > 0) {
			EC$('[async_section=before]').addClass('displaynone');
		}
		var EC_FRONT_JS_CONFIG_MANAGE = {
			"sSmartBannerScriptUrl" : "https:\/\/app4you.cafe24.com\/SmartBanner\/tunnel\/scriptTags?vs=1563164396689206",
			"sMallId" : "apple8998",
			"sDefaultAppDomain" : "https:\/\/app4you.cafe24.com",
			"sWebLogOffFlag" : "F"
		};
	</script>
	<iframe
		src="/exec/front/eclog/main/?&amp;rloc=http%3A//bossapple.com/product/search_board_list.html&amp;rref=http%3A//bossapple.com/board/product/write.html%3Fboard_no%3D6&amp;udim=1536*864&amp;rserv=eclog2-213.cafe24.com&amp;cid=CIDec1ef54d7d4105e5cd097630ac68698f&amp;role_path=ETC&amp;stype=e&amp;shop_no=1&amp;lang=ko_KR&amp;ver=2"
		id="log_realtime" style="display: none;"></iframe>
	<script
		src="http://eclog2-213.cafe24.com/weblog.html?uid=apple8998&amp;udim=1536*864&amp;uref=http://bossapple.com/board/product/write.html?board_no=6&amp;uname=apple8998&amp;url=http://bossapple.com/product/search_board_list.html&amp;r_ref=http://bossapple.com/board/product/write.html?board_no=6&amp;shop_no=1&amp;t=1611910515888"></script>
	<script type="text/javascript"
		src="//eclog2-213.cafe24.com/weblog.js?uid=apple8998&amp;uname=apple8998&amp;r_ref=http://bossapple.com/board/product/write.html?board_no=6&amp;shop_no=1&amp;t=1611910515888"
		id="log_script"></script>
</body>
</html>