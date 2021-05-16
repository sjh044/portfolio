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
<form:form  modelAttribute="item" action="register.do"
   enctype="multipart/form-data">
   <form:hidden path="id"/>
   <form:hidden path="pictureUrl"/>
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
								<li><a href="/board/index.html">상품수정 </a></li>
								<li title="현재 위치"><strong>Q&amp;A</strong></li>
							</ol>
						</div>
						<div class="b_title">
							<h2>
								<font color="333333">상품 수정 페이지</font>
							</h2>
							
						</div>
					</div>
					<form:form  modelAttribute="item" action="register.do"
  						 enctype="multipart/form-data" name="f">
						<div
							class="xans-element- xans-board xans-board-write-4 xans-board-write xans-board-4">
					
							<!-- 상품정보선택 -->
							
							<div class="mgy-table typeWrite ">
								<table border="1" summary="">
									<caption>글쓰기 폼</caption>
									<colgroup>
										<col style="width: 130px;">
										<col style="width: auto;">
									</colgroup>
									<tbody>
										<tr >
											
										<td rowspan="3" style="width:470px; height: 370px;">
											
											<img id="blah" src="#" alt="your image" /> 
										</td>
											
											<th style="text-align:center; padding: 50px 11px 11px 11px;"scope="col">상품명</th>
											<td><form:input path="name"
												fw-filter="isFill" fw-label="제목" fw-msg=""
												class="inputTypeText" placeholder="" maxlength="125"
												/> <font color="red"><form:errors path="name" /></font></td>
							
										</tr>
										<tr>
											
											<th style="text-align:center; padding: 50px 11px 11px 11px;"scope="col">가격</th>
												
											<td><form:input path="price"
												fw-filter="isFill" fw-label="제목" fw-msg=""
												class="inputTypeText" placeholder="" maxlength="125"
												/><font color="red"><form:errors path="price" /></font></td>
												
										</tr>
										<tr>
											
											<th style="text-align:center; padding: 50px 11px 11px 11px;"scope="col">상품 간단 설명</th>	
											<td><input id="subject" name="subject"
												fw-filter="isFill" fw-label="제목" fw-msg=""
												class="inputTypeText" placeholder="" maxlength="125"
												value="" type="text"></td>
											
										</tr>
										<tr>
											<th style="text-align:center;"scope="col">상품 이미지  &nbsp &nbsp &nbsp &nbsp &nbsp<input type='file' name="picture" onchange="readURL(this);" /></th>
											<th style="text-align:center;"scope="col"></th>
											<td colspan="3"></td>
										</tr>
			
								
										<tr>
											<td colspan="3" class="clear">
												<textarea id="description" name="description" style="width: 100%; display: none;"
												 class="ec-fr-never-be-duplicated"><</textarea>
											
												 <script>CKEDITOR.replace("description", {
											     filebrowserImageUploadUrl : "imgupload.do"
											   });
											   </script>
											
											</td>
							
									</tbody>
										
									<tbody>

									</tbody>
								</table>
							</div>
							<div class="ec-base-button ">
								<span class="gLeft">
								 <a	href="../item/list.do">상품 목록</a>
								</span> <span class="gRight"> 
									<input type="submit" value="상품스정">
								 	<input type="button" value="수정 취소" onclick="javascript:history.back();">
								</span>
							</div>
						</div>
					</form:form>
				</div>

			</div>
			<div id="sidebar"></div>
		</div>
		<hr class="layout">
	</div>
	</form:form>
</body>

</html>