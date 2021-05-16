<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
</head>


<title>연당골 농장</title>
<body class="is-preload">
	<!-- Header -->

	<!-- Banner -->
	<div class="slider-1">
		<div class="owl-carousel owl-theme">
			<div onclick="location.href='../item/detail.do?id=1'" class="item"
				style="background-image: url(../banner/main_img01.jpg);">
				<div class="txt-box">
			
				</div>
			</div>
			<div onclick="location.href='../item/list.do'" class="item text-color-white"
				style="background-image: url(../banner/main_img02.jpg);">
				<div class="txt-box">
				
				</div>
			</div>
			<div onclick="location.href='../item/detail.do?id=16'"class="item text-color-white" 
				style="background-image: url(../banner/main_img03.jpg); cursor:pointer;">
			
				<div class="txt-box">
				
				</div>
			</div>
			<div onclick="location.href='../page/intro.do'" class="item text-color-white"
				style="background-image: url(../banner/main_img04.jpg);">
			
				<div class="txt-box">
					
				</div>
			</div>
		</div>
	</div>


	<!-- Highlights -->
	<div id="wrap" class="cont_linebox">
		<div id="container">

			<!--오른쪽Quick불러오는소스입니다-->
			<div id="contents">



				<div style="margin-top: 20px;"
					class="xans-element- xans-product xans-product-listmain-1 xans-product-listmain xans-product-1">
					<!--
        $count = 30
        $basket_result = /product/add_basket.html
        $basket_option = /product/basket_option.html
    -->
					<div class="m_title">
						<h2>연당골 농장 상품</h2>
					</div>
				<ul class="prdList column3">
					<c:forEach items="${itemList2}" var="item" end="5">
						<li id="anchorBoxId_12" class="item xans-record-">
							<div class="box">
								<p class="prdImg">
									<a
										href="../item/detail.do?id=${item.id}"
										name="anchorBoxName_12">
										<img src="../item/img/${item.pictureUrl}" id="eListPrdImage12_2" alt="" class="thumb"></a> <span
										class="wishIcon"></span>
								</p>
								<div class="status">
									<div class="icon"></div>
									<div class="button">
										<ul class="options">
											<li class="optionicon option"></li>
											<li class="zoomicon"><img
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"
												onclick="zoom('12', '1', '2','', '');"
												style="cursor: pointer" alt="상품 큰 이미지 보기"></li>
											<li class="carticon"></li>
											<li class="likeButton displaynone"><button type="button">
													<strong></strong>
												</button></li>
										</ul>
									</div>
								</div>
								<div class="disc">
									<p class="summary ">${item.subject}</p>
									<p class="name">
										<a href="../item/detail.do?id=${item.id}"
											class=""><span class="title displaynone"><span
												style="font-size: 12px; color: #555555;">상품명</span> :</span> <span
											style="font-size: 12px; color: #555555;">${item.name}</span></a>
									</p>
									<p class="custom displaynone">
										<strike>${item.price}원</strike>
									</p>
									<p class="price ">${item.price}</p>
								</div>
							</div>
						</li>
					</c:forEach>	
					</ul>
				</div>
			</div>
			<div id="sidebar"></div>
		</div>
		<hr class="layout">
	</div>

	<!-- CTA -->
	<div id="center_cont">



		<div id="mixedSlider"
			class="xans-element- xans-board xans-board-listpackage-8 xans-board-listpackage xans-board-8">
			<div class="md_title">
				<p class="title">상품후기</p>
			</div>

			<div class="MS-controls">
				<button class="MS-left">
					<i class="fa fa-angle-left" aria-hidden="true"></i>
				</button>
				<button class="MS-right">
					<i class="fa fa-angle-right" aria-hidden="true"></i>
				</button>
			</div>
	</div>

	</div>

	<!-- Testimonials -->
	<section class="wrapper">
		<div class="inner">
			<header class="special">
			
			</header>
			<div class="testimonials">
				<section>
					<div class="content">
					
					</div>
				</section>
				<section>
					<div class="content">
				
					</div>
				</section>
				<section>
					<div class="content">
				
					</div>
				</section>
			</div>
		</div>

	</section>
	<script>
$('.slider-1 > .owl-carousel').owlCarousel({
    autoplay:true, // 오토 플레이
    autoplayTimeout:6000, // 오토 플레이 시에 다음 슬라이드로 넘어가는 주기, 2초
    loop:true,
    margin:0,
    nav:true,
    navText:['<img src="http://www.inavi.com/Content2/Images/main/icon-prev.png">', '<img src="http://www.inavi.com/Content2/Images/main/icon-next.png">'],
    responsive:{
        0:{
            items:1
        }
    }
});

var $firstDot = $('.slider-1 > .owl-carousel > .owl-dots > .owl-dot.active');

$firstDot.removeClass('active');

setTimeout(function() {
    $firstDot.addClass('active');
}, 100);
</script>
<script>
	function popup(){
		var url = "../board/popup.do";
		window.open(url,"","width=400,height=400,left=600");
	}
</script>
	<script>
			jQuery1_11_2('#basicSlider').multislider({
				continuous : true,
				duration : 2000
			});
			jQuery1_11_2('#mixedSlider').multislider({
				duration : 750,
				interval : 3000
			});
		</script>
</body>
</html>