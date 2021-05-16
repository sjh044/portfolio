<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/item/list.jsp --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<script type="text/javascript">
function listdo(page) {
	document.searchform.pageNum.value= page;
	document.searchform.submit();
}
</script>

</head>
<body>
	<div id="wrap" class="cont_linebox">
		<div id="container">
	<form action="list.do" method="get" name="searchform">
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
							<span>SHOP</span>
						</h2>
						<span class="likeButton displaynone"><button type="button">
								<strong></strong>
							</button></span>
					</div>
					<ul class="menuCategory cl" style="display: none;">
					</ul>
				</div>

				<!-- 추천상품 -->
				<!-- //추천상품 -->

				<!-- 신상품 -->
				<!-- //신상품 -->

				<!-- 일반상품 -->
				<!-- 등록제품 TAB -->
				<div class="xans-element- xans-product xans-product-normalpackage ">
					<div class="xans-element- xans-product xans-product-normalmenu ">
						<!--
            $compare_page = /product/compare.html
        -->
						<div class="title" id="Product_ListMenu">
							<h3>
								<span></span>
							</h3>
						</div>
						<div class="function">
							<p class="prdCount">
								등록 제품 : <strong>${listcount}</strong>개
							</p>
							<ul id="type"
								class="xans-element- xans-product xans-product-orderby">
								<li class="xans-record-"><a
									href="?cate_no=24&amp;sort_method=5#Product_ListMenu">신상품</a></li>
								<li class="xans-record-"><a
									href="?cate_no=24&amp;sort_method=1#Product_ListMenu">상품명</a></li>
								<li class="xans-record-"><a
									href="?cate_no=24&amp;sort_method=3#Product_ListMenu">낮은가격</a></li>
								<li class="xans-record-"><a
									href="?cate_no=24&amp;sort_method=4#Product_ListMenu">높은가격</a></li>
							
							</ul>
							<span class="compare displaynone"><a href="#none"
								onclick="EC_ListAction.setProductCompare();"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_compare.gif"
									alt="상품비교"></a></span>
						</div>

					</div>
					<!-- 등록제품 TAB -->
					<div class="xans-element- xans-product xans-product-listnormal">
						<!--
            $count = 12
                ※ 노출시킬 상품의 갯수를 숫자로 설정할 수 있습니다.
                ※ 상품 노출갯수가 많으면 쇼핑몰에 부하가 발생할 수 있습니다.
            $basket_result = /product/add_basket.html
            $basket_option = /product/basket_option.html
        -->
						<div class="title">
							<h3>
								<span></span>
							</h3>
						</div>	
						<ul class="prdList column4">
					
							<c:forEach items="${itemList}" var="item">
								<li id="anchorBoxId_19" class="item xans-record-">
									<div class="box">
										<p class="prdImg">
											<a href="detail.do?id=${item.id}" name="anchorBoxName_19">
												<img src="img/${item.pictureUrl}" id="eListPrdImage19_1" alt="" class="thumb">
											</a> <span class="wishIcon"></span>
										</p>
										<div class="status">
											<div class="icon"></div>
										</div>
										<p class="summary ">${item.subject}</p>
										<p class="name">
											<a
												href="detail.do?id=${item.id}"
												class=""><span class="title displaynone">${itemno}<span
													style="font-size: 12px; color: #555555;">상품명</span>
													<c:set var="itemno" value="${itemno - 1}" /> :</span> <span
												style="font-size: 12px; color: #555555;">${item.name}</span></a>
										</p>
										<p class="price ">
											<fmt:formatNumber value="${item.price}" type="CURRENCY"
												currencySymbol="" />
											원
										</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<table>
  <tr><td colspan="5">
    <div style="display :inline;">
      
         <input type="hidden" name="pageNum" value="1">
         <select name="searchtype" style="width:100px;">
         <option value="">선택하세요.</option>
         <option value="name">상품명</option>
         <option value="price">가격</option>
         </select>
         <script type="text/javascript">
             searchform.searchtype.value="${param.searchtype}";
         </script>
         <input type="text" name="searchcontent"
         value="${param.searchcontent }" style="width:250px;">
         <input type="submit" value="" class="btn_submit">
      </div></td></tr>
      </table>
      
      		
				<div class="xans-element- xans-board xans-board-buttonlist-4 xans-board-buttonlist xans-board-4  mgy-button typeBG ">
					<c:if test="${loginUser.userid eq 'admin' }">
					<span class="gRight"> <a href="create.do" class=" mgy_btn01">글쓰기</a>
					</span>
					</c:if>
				</div>
		 		
				<!-- 일반상품 -->
				
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
				
			</div>
	</form>
			<div id="sidebar"></div>
		</div>
		<hr class="layout">
	</div>
</body>
</html>