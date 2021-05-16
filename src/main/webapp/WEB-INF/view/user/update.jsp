<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<title>회원 정보 수정</title>
<body>
	<div id="wrap" class="cont_linebox">
		<div id="container">
			<div id="contents">

				<div class="path">
					<span>현재 위치</span>
					<ol>
						<li><a href="/">홈</a></li>
						<li title="현재 위치"><strong>회원 정보 수정</strong></li>
					</ol>
				</div>

				<div class="titleArea">
					<h2>회원정보 수정</h2>
				</div>

				<div class="xans-element- xans-myshop xans-myshop-asyncbenefit">
					<div class="ec-base-box typeMember gMessage ">
						<div class="information">
							<p class="thumbnail">
								<img
									src="//img.echosting.cafe24.com/skin/base_ko_KR/member/img_member_default.gif"
									alt=""
									onerror="this.src='http://img.echosting.cafe24.com/skin/base/member/img_member_default.gif';"
									class="myshop_benefit_group_image_tag">
							</p>
					
							</div>
						</div>
						<h3 class="displaynone ">기본정보</h3>
						<p class="required displaynone">
							<img
								src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif"
								alt="필수"> 필수입력사항
						</p>
						<div class="ec-base-table typeWrite">
							<table border="1" summary="">
								<caption>회원 기본정보</caption>
								<colgroup>
									<col style="width: 150px;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">아이디 <img
											src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif"
											alt="필수"></th>
										<td><input id="member_id" name="member_id"
											fw-filter="isFill&amp;isFill&amp;isMin[4]&amp;isMax[16]&amp;isIdentity"
											fw-label="아이디" fw-msg="" class="inputTypeText" placeholder=""
											readonly="readonly" value="" type="text"> (영문소문자/숫자,
											4~16자)</td>
									</tr>
									<tr>
										<th scope="row">비밀번호 <img
											src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif"
											class="" alt="필수"></th>
										<td><input id="passwd" name="passwd"
											fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="비밀번호"
											fw-msg="" autocomplete="off" maxlength="16"
											0="disabled" value="" type="password"> (영문
											대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)</td>
									</tr>
									<tr class="">
										<th scope="row">비밀번호 확인 <img
											src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif"
											alt="필수"></th>
										<td><input id="user_passwd_confirm"
											name="user_passwd_confirm"
											fw-filter="isFill&amp;isMatch[passwd]" fw-label="비밀번호 확인"
											fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16"
											0="disabled" value="" type="password"> <span
											id="pwConfirmMsg"></span></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">새 비밀번호</th>
										<td><input id="new_passwd" name="new_passwd"
											fw-filter="isFill&amp;isMin[4]&amp;isMax[16]"
											fw-label="새 비밀번호" fw-msg="" maxlength="16"
											0="disabled" value="" type="password"> (영문
											대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)</td>
									</tr>
									<tr class="displaynone">
										<th scope="row">새 비밀번호 확인</th>
										<td><input id="new_passwd_confirm"
											name="new_passwd_confirm"
											fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="비밀번호"
											fw-msg="" maxlength="16" 0="disabled" value=""
											type="password"> <span id="new_pwConfirmMsg"></span>
										</td>
									</tr>
									<tr class="displaynone">
										<th scope="row">비밀번호 확인 질문 <img
											src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif"
											alt="필수"></th>
										<td><select id="hint" name="hint" fw-filter=""
											fw-label="hint" fw-msg="">
												<option value="hint_01" selected="selected">기억에 남는
													추억의 장소는?</option>
												<option value="hint_02">자신의 인생 좌우명은?</option>
												<option value="hint_03">자신의 보물 제1호는?</option>
												<option value="hint_04">가장 기억에 남는 선생님 성함은?</option>
												<option value="hint_05">타인이 모르는 자신만의 신체비밀이 있다면?</option>
												<option value="hint_06">추억하고 싶은 날짜가 있다면?</option>
												<option value="hint_07">받았던 선물 중 기억에 남는 독특한 선물은?</option>
												<option value="hint_08">유년시절 가장 생각나는 친구 이름은?</option>
												<option value="hint_09">인상 깊게 읽은 책 이름은?</option>
												<option value="hint_10">읽은 책 중에서 좋아하는 구절이 있다면?</option>
												<option value="hint_11">자신이 두번째로 존경하는 인물은?</option>
												<option value="hint_12">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
												<option value="hint_13">초등학교 때 기억에 남는 짝꿍 이름은?</option>
												<option value="hint_14">다시 태어나면 되고 싶은 것은?</option>
												<option value="hint_15">내가 좋아하는 캐릭터는?</option>
										</select></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">비밀번호 확인 답변 <img
											src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif"
											alt="필수"></th>
										<td><input id="hint_answer" name="hint_answer"
											fw-filter="" fw-label="비밀번호 확인시 답변" fw-msg=""
											class="inputTypeText" placeholder="" value="" type="text"></td>
									</tr>
									<tr style="display: 1">
										<th scope="row" id="">이름 <img
											src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif"
											alt="필수"></th>
										<td><input id="name" name="name"
											fw-filter="isFill&amp;isMax[30]" fw-label="이름" fw-msg=""
											class="ec-member-name" placeholder="" maxlength="30"
											readonly="readonly" value="신준호" type="text"></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">이름(영문) <img
											src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif"
											class="displaynone" alt="필수"></th>
										<td><input id="name_en" name="name_en"
											fw-filter="isMax[30]&amp;isAlphaSpace" fw-label="이름(영문)"
											fw-msg="" class="ec-member-name" placeholder=""
											maxlength="30" value="" type="text"> (이름 - 성 형식으로 입력해
											주세요.)</td>
									</tr>
									<tr class="displaynone">
										<th scope="row"></th>
										<td></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">법인명 <img
											src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif"
											alt="필수"></th>
										<td></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">법인번호 <img
											src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif"
											alt="필수"></th>
										<td></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">상호명 <img
											src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif"
											alt="필수"></th>
										<td></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">사업자번호 <img
											src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif"
											alt="필수"></th>
										<td></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">국적 <img
											src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif"
											alt="필수"></th>
										<td></td>
									</tr>
									<tr class="">
										<th scope="row">주소 <img
											src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif"
											class="displaynone" alt="필수"></th>
										<td><input id="postcode1" name="postcode1"
											fw-filter="isLengthRange[1][14]" fw-label="우편번호1" fw-msg=""
											class="inputTypeText" placeholder="" readonly="readonly"
											maxlength="14" value="" type="text"> <a href="#none"
											onclick="ZipcodeFinder.Opener.bind('postBtn', 'postcode1', 'postcode2', 'addr1', 'layer', 'ko_KR');"
											id="postBtn"><img
												src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_zipcode.gif"
												alt="우편번호"></a><br> <input id="addr1" name="addr1"
											fw-filter="" fw-label="주소" fw-msg="" class="inputTypeText"
											placeholder="" readonly="readonly" value="" type="text">
											기본주소<br> <input id="addr2" name="addr2" fw-filter=""
											fw-label="주소" fw-msg="" class="inputTypeText" placeholder=""
											value="" type="text"> 나머지주소</td>
									</tr>
									<tr class="">
										<th scope="row">일반전화 <img
											src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif"
											class="" alt="필수"></th>
										<td><select id="phone1" name="phone[]"
											fw-filter="isNumber&amp;isFill&amp;isNumber" fw-label="일반전화"
											fw-alone="N" fw-msg="">
												<option value="02">02</option>
												<option value="031">031</option>
												<option value="032">032</option>
												<option value="033">033</option>
												<option value="041">041</option>
												<option value="042">042</option>
												<option value="043">043</option>
												<option value="044">044</option>
												<option value="051">051</option>
												<option value="052">052</option>
												<option value="053">053</option>
												<option value="054">054</option>
												<option value="055">055</option>
												<option value="061">061</option>
												<option value="062">062</option>
												<option value="063">063</option>
												<option value="064">064</option>
												<option value="0502">0502</option>
												<option value="0503">0503</option>
												<option value="0504">0504</option>
												<option value="0505">0505</option>
												<option value="0506">0506</option>
												<option value="0507">0507</option>
												<option value="070">070</option>
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
												<option value="0508">0508</option>
										</select>-<input id="phone2" name="phone[]" maxlength="4"
											fw-filter="isNumber&amp;isFill&amp;isNumber" fw-label="일반전화"
											fw-alone="N" fw-msg="" value="" type="text">-<input
											id="phone3" name="phone[]" maxlength="4"
											fw-filter="isNumber&amp;isFill&amp;isNumber" fw-label="일반전화"
											fw-alone="N" fw-msg="" value="" type="text"></td>
									</tr>
									<tr class="">
										<th scope="row">휴대전화 <img
											src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif"
											class="displaynone" alt="필수"></th>
										<td><select id="mobile1" name="mobile[]"
											fw-filter="isNumber" fw-label="휴대전화" fw-alone="N" fw-msg="">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
										</select>-<input id="mobile2" name="mobile[]" maxlength="4"
											fw-filter="isNumber" fw-label="휴대전화" fw-alone="N" fw-msg=""
											value="" type="text">-<input id="mobile3"
											name="mobile[]" maxlength="4" fw-filter="isNumber"
											fw-label="휴대전화" fw-alone="N" fw-msg="" value="" type="text"></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">SMS 수신여부 <img
											src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif"
											alt="필수"></th>
										<td><input id="is_sms0" name="is_sms" fw-filter=""
											fw-label="is_sms" fw-msg="" value="T" type="radio"><label
											for="is_sms0">수신함</label> <input id="is_sms1" name="is_sms"
											fw-filter="" fw-label="is_sms" fw-msg="" value="F"
											type="radio" checked="checked"><label for="is_sms1">수신안함</label>
										<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p></td>
									</tr>
									<tr>
										<th scope="row">이메일 <img
											src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif"
											alt="필수"></th>
										<td><input id="email1" name="email1"
											fw-filter="isFill&amp;isEmail" fw-label="이메일" fw-alone="N"
											fw-msg="" value="" type="text"> <span id="emailMsg"></span>
											<p class="displaynone">
												이메일 주소 변경 시 로그아웃 후 재인증을 하셔야만 로그인이 가능합니다.<br>인증 메일은 24시간
												동안 유효하며, 유효 시간이 만료된 후에는 가입 정보로 로그인 하셔서 재발송 요청을 해주시기 바랍니다.
											</p></td>
									</tr>
									<tr class="">
										<th scope="row">이메일 수신여부 <img
											src="http://img.echosting.cafe24.com/skin/base/common/ico_required.gif"
											alt="필수"></th>
										<td><input id="is_news_mail0" name="is_news_mail"
											fw-filter="isFill" fw-label="is_news_mail" fw-msg=""
											value="T" type="radio" checked="checked"><label
											for="is_news_mail0">수신함</label> <input id="is_news_mail1"
											name="is_news_mail" fw-filter="isFill"
											fw-label="is_news_mail" fw-msg="" value="F" type="radio"><label
											for="is_news_mail1">수신안함</label>
										<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p></td>
									</tr>
								</tbody>
							</table>
						</div>
						
						</div>
						<div class="ec-base-button justify">
							<a href="#none" onclick="memberEditAction()" class="select">회원정보수정</a>
							<a href="/index.html">취소</a> <span class="gRight"> <a
								href="#none" onclick="memberDelAction(0, -1, -1)"
								style="width: 74px;">회원탈퇴</a>
							</span>
						</div>
						
					</div>
					<input type="hidden" name="agree_information_check_display"
						value="T"><input type="hidden"
						name="agree_consignment_check_display" value="T">
				</form>
			</div>
			<div id="sidebar"></div>
		</div>
		<hr class="layout">
	</div>
</body>
</html>