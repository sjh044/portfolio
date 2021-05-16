<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<title><decorator:title /></title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	
<script src="https://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>

<decorator:head />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	<link rel="stylesheet" href="${path}/css/10-11.css" />
	<script type="text/javascript" src="${path}/js/10-11.js"></script>  

<link rel="stylesheet" href="${path}/css/order.css">
<link rel="stylesheet" href="${path}/css/banner.css">
<link rel="stylesheet" href="${path}/css/main.css">
<link rel="stylesheet" href="${path}/css/itemlist.css">
<link rel="stylesheet" href="${path}/css/menu.css">
<link rel="stylesheet" href="${path}/css/mypage.css">
<link rel="stylesheet" href="${path}/css/entry.css">
<link rel="stylesheet" href="${path}/css/item.css">
<link rel="stylesheet" href="${path}/css/detail.css">
<link rel="stylesheet" href="${path}/css/csss.css">
<link rel="stylesheet" href="${path}/css/cart.css">
<!-- 제이쿼리 불러오기 -->





<!-- 아울 캐러셀 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.theme.default.min.css">
<body style="background-color: #fafbfc;">
	<!-- Header -->
	<header id="header" >
<%-- 		<a class="logo" href="${path}/board/main.do">연당골 농장</a> --%>
		<a class="logo" href="../board/main.do">연당골 농장	</a>
		<nav style="justify-content: space-between;">
	
		<c:if test="${empty sessionScope.loginUser}">
			<a class="btn" href="${path}/user/userEntry.do">회원가입</a>
			<a class="btn" href="${path}/user/login.do">로그인</a>
		</c:if>
		<c:if test="${!empty sessionScope.loginUser}">
			${sessionScope.loginUser.name}님
			<a class="btn" href="../user/mypage.do?id=${loginUser.userid}">마이페이지</a>
		<c:if test="${loginUser.userid eq 'admin' }">
			<a class="btn" href="../admin/list.do">관리자 페이지</a>

		</c:if>
			<a class="btn" href="${path}/user/logout.do">로그아웃</a>
		</c:if>
			<a class="btn" href="${path}/cart/cartView.do">장바구니</a>
		</nav>	
	</header>
	<div id="menu2">
	 <nav>
        <ul class="sss" >
        	<li style="vertical-align: top; padding-top: 10px;">
                <a style="padding: 32px 32px 24px 16px;"href="${path}/board/main.do">
                <img style="border: none; vertical-align: top;"src="../img/logo.jpg" alt="로고"></a>
            
            </li>
            <li>
                <div onclick="location.href='${path}/page/intro.do'" class="dropdown-menu" > 농장소개</div>
            
            </li>
            <li class="dropdown">
                <div class="dropdown-menu"><a style="color:white;"href="../item/list.do">상품구매</a></div>
                <div class="dropdown-content">
                    <a href="../item/list.do">상품목록</a>
                </div>
            </li>
            <li class="dropdown">
                <div class="dropdown-menu"><a style="color:white;"href="../board/list.do?board_no=5">고객 후기</a></div>
                <div class="dropdown-content">
                    <a href="../board/list.do?board_no=5">고객 후기</a>
                </div>
            </li>
            <li class="dropdown">
                <div class="dropdown-menu">뉴스&이벤트</div>
                <div class="dropdown-content">
                    <a href="${path}/board/list.do?board_no=3">뉴스</a>
                    <a href="${path}/board/list.do?board_no=4">이벤트</a>          
                </div>
            </li>
            <li class="dropdown">
                <div class="dropdown-menu">고객센터</div>
                <div class="dropdown-content">
                    <a href="${path}/board/list.do?board_no=1">공지사항</a>
                    <a href="${path}/board/list.do?board_no=2">QnA</a>          
                </div>
            </li>
            
            <li class="dropdown">
                <div onclick="location.href='${path}/page/intro2.do'" class="dropdown-menu">오시는길</div>
            </li>
            
        </ul>
    </nav>
    </div>

	
	<decorator:head />

	<decorator:body />


<div id="footer" style="margin-top:100px;">
        

    <div class="inner cl">
        <div style="margin:40px 0px 75px" class="xans-element- xans-layout xans-layout-footer cl "><div class="f_m01">
                <p class="fm_title"></p>
                <p class="fm_text"><span>I</span><br><br><br><span style="display:block;margin-top:20px;padding:0;"><a href="#">이용안내</a><span>I</span><a href="#">
                    </a><span>I</span><a href="#"></a></span></p>
               
            </div>
<div class="f_m02">
            	<p class="title"> </p>
                <p class="text"></p>
                <p class="call"></p>
                <p class="fm_text"><b></b><br><b></b><br><span> </span></p>
            </div>
<p class="f_img"><a href="#"><img src="/web/upload/mingiya/footer_img.gif"></a></p>
</div>
    <p class="copyright">COPYRIGHT 2021.  ALL RIGHT RESERVED.</p>
<!--scroll top-->
    <script src="http://code.jquery.com/jquery-3.1.0.min.js" charset="UTF-8"></script>
    <script src="/web/mgy_js/scrolltop/jquery.scrolltop.js" charset="UTF-8"></script>

    <!--i class명 변경함 기존 fa fa-chevron-up-->
    <script>
        (function(jQuery1_11_2){

            jQuery1_11_2.scrolltop({
                template: '<i class="mgy_top"></i>',
                class: 'custom-scrolltop'
            });

        })(jQuery);

    </script>   
<!--scroll top--> <!--하단부분정보불러오는소스입니다-->    
</div>

<!-- 참고: 결제를 위한 필수 영역 -->
<div id="progressPaybar" style="display:none;">
    <div id="progressPaybarBackground" class="layerProgress"></div>
    <div id="progressPaybarView">
        <div class="box">
            <p class="graph">
                <span><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/layout/txt_progress.gif" alt="현재 결제가 진행중입니다."></span>
                <span><img src="http://img.echosting.cafe24.com/skin/base/layout/img_loading.gif" alt=""></span>
            </p>
            <p class="txt">
                본 결제 창은 결제완료 후 자동으로 닫히며,결제 진행 중에 본 결제 창을 닫으시면<br>
                주문이 되지 않으니 결제 완료 될 때 까지 닫지 마시기 바랍니다.
            </p>
        </div>
    </div>
</div>
<!-- //참고 -->



<!--스크롤맨위로-->
<!--<script type="text/javascript">    
    window.onload = function() {
        setTimeout (function () {
        scrollTo(0,0);
        }, 100);
    }
</script>-->    
<!--스크롤맨위로-->    
    
</div>

</body>

<script src="${path}/js/owl.js"></script>
<!-- 아울 캐러셀 불러오기 -->
<script src="${path}/js/browser.min.js"></script>
<script src="${path}/js/breakpoints.min.js"></script>
<script src="${path}/js/util.js"></script>
<script src="${path}/js/main.js"></script>
</html>