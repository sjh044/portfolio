<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
td {
	border-style: solid;
	border-color: white;
}
</style>
<title>상품등록</title>

<body>
	<form:form modelAttribute="item" action="register.do"
		enctype="multipart/form-data">
		
		<div id="wrap" class="cont_linebox">
			<div id="container">
				<div id="contents">

					<div
						class="xans-element- xans-board xans-board-writepackage-4 xans-board-writepackage xans-board-4 ">
						<div
							class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 ">
							<div class="path">
								<span>현재 위치</span>
								<ol>
									<li><a href="/">홈</a></li>
									<li><a href="/board/index.html">상품등록 </a></li>
									<li title="현재 위치"><strong>Q&amp;A</strong></li>
								</ol>
							</div>
							<div class="b_title">
								<h2>
									<font color="333333">상품 등록 페이지</font>
								</h2>

							</div>
						</div>
							<div
								class="xans-element- xans-board xans-board-write-4 xans-board-write xans-board-4">

								<!-- 상품정보선택 -->

								<div class="xans-element- xans-product xans-product-detail">
									<div class="detailArea ">
										<h3>배너 이미지 등록</h3>
									<table>	
										<tbody>
										
										<tr>
											<td rowspan="3" colspan="3" style="width:470px; height: 370px;">
											<img id="blah1" src="#" /> 
											</td>
										</tr>
												
									</tbody>
										<tbody>
										<tr>
											<td scope="col">배너 이미지  &nbsp &nbsp &nbsp &nbsp &nbsp <input type='file' name="banner" onchange="readURL1(this);" /></td>
										</tr>
										</tbody>
								
								 </table>
								     </div>
								     <h3>상품 이미지 등록</h3>
									<div class="detailArea ">
										<!-- 이미지 영역 -->
										<div
											class="xans-element- xans-product xans-product-image imgArea">
									<table>	
										<tbody>
										
										<tr>
											<td rowspan="3" colspan="3" style="width:470px; height: 370px;">
											<img id="blah" src="#" /> 
											</td>
										</tr>
												
									</tbody>
										<tbody>
										<tr>
											<td scope="col">상품 이미지  &nbsp &nbsp &nbsp &nbsp &nbsp <input type='file' name="picture" onchange="readURL(this);" /></td>
										</tr>
										</tbody>
								
								</table>	
										</div>
										<!-- //이미지 영역 -->

										<!-- 상세정보 내역 -->
										<div class="infoArea" style="margin-right:60px; margin-top:50px;">
											<div class="icon"></div>
											<div class="xans-element- xans-product xans-product-detaildesign">
											
								<table border="1" summary="" style="border-line:solid;">
									<caption>글쓰기 폼</caption>
									<colgroup>
										<col style="width: 130px;">
										<col style="width: auto;">
									</colgroup>
								
							
									<tbody style="border-line:solid;">		
										<tr>
											<th style="text-align:center; padding: 20px 0px 0px 0px;"scope="col">상품명</th>
											<td><form:input path="name"
												fw-filter="isFill" fw-label="제목" fw-msg=""
												class="inputTypeText" placeholder="" maxlength="125"
												/> <font color="red"><form:errors path="name" /></font></td>
							
										</tr>
										<tr>
											
											<th style="text-align:center; padding: 20px 10px 0px 10px;"scope="col">가격</th>
												
											<td><form:input path="price"
												fw-filter="isFill" fw-label="제목" fw-msg=""
												class="inputTypeText" placeholder="" maxlength="125"
												/><font color="red"><form:errors path="price" /></font></td>
												
										</tr>
										<tr>
											
											<th style="text-align:center; padding: 20px 10px 0px 10px;"scope="col">배송비</th>
												
											<td><input id="shipping" name="shipping"
												fw-filter="isFill" fw-label="제목" fw-msg=""
												class="inputTypeText" placeholder="" maxlength="125"
												value="" type="text"></td>
												
										</tr>
									
										<tr>
											
											<th style="text-align:center; padding: 10px 10px 0px 10px;"scope="col">상품 간단 설명</th>	
											<td><input id="subject" name="subject"
												fw-filter="isFill" fw-label="제목" fw-msg=""
												class="inputTypeText" placeholder="" maxlength="125"
												value="" type="text"></td>
										</tr>
										
								</tbody>
								</table>
						
						

											</div>
										</div>
									</div>
										
								</div>
								<table>
									<tbody>
										<tr>
											<td colspan="3" class="clear"><textarea id="description"
													name="description" style="width: 100%; display: none;"
													class="ec-fr-never-be-duplicated"></textarea> <script>
														CKEDITOR
																.replace(
																		"description",
																		{
																			filebrowserImageUploadUrl : "imgupload.do"
																		});
													</script></td>
									</tbody>

									<tbody>

									</tbody>
								</table>
							</div>
							<div class="ec-base-button ">
								<span class="gLeft"> <a href="../item/list.do">상품 목록</a>
								</span> <span class="gRight"> <input type="submit" value="상품등록">
									<input type="button" value="등록 취소"
									onclick="javascript:history.back();">
								</span>
							</div>
					</div>
	>
	</div>

	</div>
	<div id="sidebar"></div>
	</div>
	<hr class="layout">
	</form:form>
<script type="text/javascript">
			function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
						reader.onload = function (e) {
						$('#blah').attr('src', e.target.result);
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
</script>
<script type="text/javascript">
			function readURL1(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
						reader.onload = function (e) {
						$('#blah1').attr('src', e.target.result);
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
</script>
</body>

</html>