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
<div id="hd_login_msg">����Ŵ� �α��� �� <a href="http://bhu.co.kr/bbs/logout.php">�α׾ƿ�</a></div>
<!-- ȸ�� ��й�ȣ Ȯ�� ���� { -->
<div id="mb_confirm" class="mbskin">
    <h1>ȸ�� ��й�ȣ Ȯ��</h1>

    <p>
        <strong>��й�ȣ�� �ѹ� �� �Է����ּ���.</strong>
                ȸ������ ������ �����ϰ� ��ȣ�ϱ� ���� ��й�ȣ�� �ѹ� �� Ȯ���մϴ�.
            </p>

    <form name="fmemberconfirm" action="register_form.php" onsubmit="return fmemberconfirm_submit(this);" method="post">
    <input type="hidden" name="mb_id" value="sjh044">
    <input type="hidden" name="w" value="u">

    <fieldset>
        ȸ�����̵�
        <span id="mb_confirm_id">sjh044</span>

        <label for="confirm_mb_password">��й�ȣ<strong class="sound_only">�ʼ�</strong></label>
        <input type="password" name="mb_password" id="confirm_mb_password" required="" class="required frm_input" size="15" maxlength="20">
        <input type="submit" value="Ȯ��" id="btn_submit" class="btn_submit">

            </fieldset>

    </form>

    <div class="btn_confirm">
        <a href="http://bhu.co.kr">�������� ���ư���</a>
    </div>

</div>

<script>
function fmemberconfirm_submit(f)
{
    document.getElementById("btn_submit").disabled = true;

    return true;
}
</script>
<!-- } ȸ�� ��й�ȣ Ȯ�� �� -->

<!-- ie6,7���� ���̵�䰡 �Խ��� ��Ͽ��� �Ʒ� ���̵�信 �������� ���� ���� -->
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