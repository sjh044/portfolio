<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<section id="main" class="wrapper">

		<div id="wrapper">
<div id="hd_login_msg">구라신님 로그인 중 <a href="http://bhu.co.kr/bbs/logout.php">로그아웃</a></div>
<!-- 회원 비밀번호 확인 시작 { -->
<div id="mb_confirm" class="mbskin">
    <h1>회원 비밀번호 확인</h1>

    <p>
        <strong>비밀번호를 한번 더 입력해주세요.</strong>
                회원님의 정보를 안전하게 보호하기 위해 비밀번호를 한번 더 확인합니다.
            </p>

    <form name="fmemberconfirm" action="register_form.php" onsubmit="return fmemberconfirm_submit(this);" method="post">
    <input type="hidden" name="mb_id" value="sjh044">
    <input type="hidden" name="w" value="u">

    <fieldset>
        회원아이디
        <span id="mb_confirm_id">sjh044</span>

        <label for="confirm_mb_password">비밀번호<strong class="sound_only">필수</strong></label>
        <input type="password" name="mb_password" id="confirm_mb_password" required="" class="required frm_input" size="15" maxlength="20">
        <input type="submit" value="확인" id="btn_submit" class="btn_submit">

            </fieldset>

    </form>

    <div class="btn_confirm">
        <a href="http://bhu.co.kr">메인으로 돌아가기</a>
    </div>

</div>

<script>
function fmemberconfirm_submit(f)
{
    document.getElementById("btn_submit").disabled = true;

    return true;
}
</script>
<!-- } 회원 비밀번호 확인 끝 -->

<!-- ie6,7에서 사이드뷰가 게시판 목록에서 아래 사이드뷰에 가려지는 현상 수정 -->
<!--[if lte IE 7]>
<script>
$(function() {
    var $sv_use = $(".sv_use");
    var count = $sv_use.length;

    $sv_use.each(function() {
        $(this).css("z-index", count);
        $(this).css("position", "relative");
        count = count - 1;
    });
});
</script>
<![endif]-->

<script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>

</div>
</section>
</body>
</html>