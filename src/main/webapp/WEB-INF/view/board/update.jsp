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
<title>글쓰기</title>
<body>

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
								<li><a href="/board/index.html">게시판</a></li>
								<li title="현재 위치"><strong>Q&amp;A</strong></li>
							</ol>
						</div>
						<c:if test="${board_no == 1}">
							<div class="b_title">
								<h2>
									<font color="333333">공지사항</font>
								</h2>
								<p>공지사항 게시판입니다.</p>
							</div>
						</c:if>
						<c:if test="${board_no == 2}">
							<div class="b_title">
								<h2>
									<font color="333333">Q&amp;A</font>
								</h2>
								<p>Q&amp;A 게시판입니다.</p>
							</div>
						</c:if>
						<c:if test="${board_no == 3}">
							<div class="b_title">
								<h2>
									<font color="333333">뉴스</font>
								</h2>
								<p>뉴스 게시판입니다.</p>
							</div>
						</c:if>
						<c:if test="${board_no == 4}">
							<div class="b_title">
								<h2>
									<font color="333333">이벤트</font>
								</h2>
								<p>이벤트 게시판입니다.</p>
							</div>
						</c:if>
						<c:if test="${board_no == 5}">
							<div class="b_title">
								<h2>
									<font color="333333">후기</font>
								</h2>
								<p>후기 게시판입니다.</p>
							</div>
						</c:if>
					</div>
					<form:form modelAttribute="board" action="update.do"
						enctype="multipart/form-data" name="f">
						<input id="board_no" name="board_no" value="${param.board_no}" type="hidden" >
						 <form:hidden path="num" />
						<div
							class="xans-element- xans-board xans-board-write-4 xans-board-write xans-board-4">
	
				
							<div class="mgy-table typeWrite ">
								<table border="1" summary="">
									<caption>글쓰기 폼</caption>
									<colgroup>
										<col style="width: 130px;">
										<col style="width: auto;">
									</colgroup>
									<tbody>
<!-- 										<tr> -->
<!-- 											<th scope="row">게시판 분류</th> -->
<!-- 											<td><select style="width:100px;"> -->
<!-- 														 <option value="">선택하세요</option> -->
<%-- 												         <option value="${param.board_no == 5}">후기</option> --%>
<%-- 												         <option value="${param.board_no == 2}">QnA</option> --%>
<!-- 												         </select></td> -->
<!-- 										</tr> -->
										<tr>
											<th scope="row">제목</th>
											<td><form:input path="subject"
												fw-filter="isFill" fw-label="제목" fw-msg=""
												class="inputTypeText" placeholder="" maxlength="125"
												value="" type="text"/> <font color="red"><form:errors path="subject" /></font></td>
										
									
										</tr>
										<tr>
											<th scope="row">작성자</th>
											<td><form:input path="name"
												fw-filter="isFill" fw-label="제목" fw-msg=""
												class="inputTypeText" placeholder="" maxlength="125"
												value="" readonly="true" type="text"/> <font color="red"><form:errors path="name" /></font></td>
										
									
										</tr>
										<tr>
										 
											<td colspan="2" class="clear">
												<form:textarea path="content" style="width: 100%; display: none;"
													class="ec-fr-never-be-duplicated"/>
												<!-- CSS -->
												<link rel="stylesheet"
													href="//img.echosting.cafe24.com/editors/froala/3.2.2/css/froala_editor.pkgd.min.css">
												<link rel="stylesheet"
													href="//img.echosting.cafe24.com/editors/froala/css/themes/ec_froala.css">

												<!-- HTML -->
												
											
												
								<!-- JavaScript --> <script
													type="text/javascript"
													src="//img.echosting.cafe24.com/editors/froala/js/polyfill.min.js"></script>
												<script type="text/javascript"
													src="//img.echosting.cafe24.com/editors/froala/3.2.2/js/froala_editor.pkgd.min.js"></script>
												<script type="text/javascript"
													src="//img.echosting.cafe24.com/editors/froala/js/i18n/ko_KR.js"></script>

												<!-- Run Froala Script --> <script>
													var EC_FROALA_ID = null;
													// isSimplexEditorFill 체크시에 필요함
													var EC_FROALA_INSTANCE = null;
													(function() {
														var d = "";
														try {
															var o = {
																"key" : "DUA2yF3G1E1A5A2A2pZGCTRSAPJWTLPLZHTQQe1JGZxC4B3A3E2B5A1E1E4I1C2==",
																"toolbarSticky" : false,
																"theme" : "ec-froala",
																"attribution" : false,
																"htmlRemoveTags" : [ "script" ],
																"htmlAllowedEmptyTags" : [ "*" ],
																"iframe" : true,
																"iframeStyle" : ".fr-view{font-size: 12px;}",
																"iframeStyleFiles" : [ "\/\/img.echosting.cafe24.com\/editors\/froala\/css\/froala_style.min.css" ],
																"heightMin" : 400,
																"language" : "ko_KR",
																"paragraphFormatSelection" : true,
																"fontFamilySelection" : true,
																"fontSize" : [
																		"8",
																		"9",
																		"10",
																		"12",
																		"14",
																		"16",
																		"18",
																		"20",
																		"22",
																		"24",
																		"26",
																		"28",
																		"30" ],
																"fontSizeSelection" : true,
																"linkInsertButtons" : [ "linkBack" ],
																"quickInsertButtons" : [
																		"ul",
																		"ol",
																		"hr" ],
																"codeMirror" : false,
																"imageEditButtons" : [
																		"imageAlign",
																		"imageRemove",
																		"|",
																		"imageLink",
																		"linkOpen",
																		"linkEdit",
																		"linkRemove",
																		"-",
																		"imageDisplay",
																		"imageStyle",
																		"imageAlt",
																		"imageSize" ],
																"tableEditButtons" : [],
																"tableResizer" : false,
																"tableInsertHelper" : false,
																"imageDefaultMargin" : 0,
																"imageDefaultWidth" : 0,
																"imageUpload" : false,
																"imageInsertButtons" : [ "imageUpload" ],
																"imageMaxSize" : 5242880,
																"filesManagerMaxSize" : 5242880,
																"toolbarButtons" : {
																	"moreText" : {
																		"buttons" : [
																				"paragraphFormat",
																				"fontFamily",
																				"fontSize",
																				"bold",
																				"italic",
																				"underline",
																				"strikeThrough",
																				"textColor",
																				"backgroundColor",
																				"subscript",
																				"superscript",
																				"clearFormatting" ],
																		"buttonsVisible" : 5
																	},
																	"moreParagraph" : {
																		"buttons" : [
																				"formatOL",
																				"formatUL",
																				"alignLeft",
																				"alignCenter",
																				"alignRight",
																				"outdent",
																				"indent",
																				"alignJustify",
																				"lineHeight" ],
																		"buttonsVisible" : 5
																	},
																	"moreRich" : {
																		"buttons" : [
																				"insertTable",
																				"insertLink",
																				"insertHR",
																				"emoticons",
																				"specialCharacters" ],
																		"buttonsVisible" : 0
																	},
																	"moreMisc" : {
																		"buttons" : [
																				"undo",
																				"redo",
																				"fullscreen",
																				"html",
																				"print",
																				"spellChecker",
																				"selectAll" ],
																		"align" : "right",
																		"buttonsVisible" : 2
																	}
																},
																"toolbarButtonsSM" : {
																	"moreText" : {
																		"buttons" : [
																				"paragraphFormat",
																				"fontFamily",
																				"fontSize",
																				"bold",
																				"italic",
																				"underline",
																				"strikeThrough",
																				"textColor",
																				"backgroundColor",
																				"subscript",
																				"superscript",
																				"clearFormatting" ],
																		"buttonsVisible" : 4
																	},
																	"moreParagraph" : {
																		"buttons" : [
																				"formatOL",
																				"formatUL",
																				"alignLeft",
																				"alignCenter",
																				"alignRight",
																				"outdent",
																				"indent",
																				"alignJustify",
																				"lineHeight" ],
																		"buttonsVisible" : 2
																	},
																	"moreRich" : {
																		"buttons" : [
																				"insertTable",
																				"insertLink",
																				"insertHR",
																				"emoticons",
																				"specialCharacters" ],
																		"buttonsVisible" : 0
																	},
																	"moreMisc" : {
																		"buttons" : [
																				"undo",
																				"redo",
																				"fullscreen",
																				"html",
																				"print",
																				"spellChecker",
																				"selectAll" ],
																		"align" : "right",
																		"buttonsVisible" : 2
																	}
																},
																"toolbarButtonsXS" : {
																	"moreText" : {
																		"buttons" : [
																				"paragraphFormat",
																				"textColor",
																				"backgroundColor",
																				"bold",
																				"italic",
																				"underline",
																				"strikeThrough" ],
																		"buttonsVisible" : 1
																	},
																	"moreParagraph" : {
																		"buttons" : [
																				"formatOL",
																				"formatUL",
																				"alignLeft",
																				"alignCenter",
																				"alignRight" ],
																		"buttonsVisible" : 0
																	},
																	"moreRich" : {
																		"buttons" : [ "insertLink" ]
																	},
																	"moreMisc" : {
																		"buttons" : [
																				"undo",
																				"redo",
																				"html" ],
																		"buttonsVisible" : 0,
																		"align" : "right"
																	}
																},
																"htmlDoNotWrapTags" : [
																		"script",
																		"style",
																		"meta",
																		"link" ],
																"htmlAllowedStyleProps" : [ ".*" ],
																"htmlAllowedTags" : [ ".*" ],
																"htmlAllowedAttrs" : [ ".*" ],
																"fontFamily" : {
																	"Dotum,sans-serif" : "Dotum",
																	"Gulim,sans-serif" : "Gulim",
																	"Batang,sans-serif" : "Batang",
																	"Gungsuh,sans-serif" : "Gungsuh",
																	"Arial,Helvetica,sans-serif" : "Arial",
																	"Tahoma,Geneva,sans-serif" : "Tahoma",
																	"Verdana,Geneva,sans-serif" : "Verdana",
																	"Fixedsys,sans-serif" : "Fixedsys",
																	"'Times New Roman',Times,serif" : "Times New Roman",
																	"helvetica,sans-serif" : "Helvetica",
																	"sans-serif" : "Sans-serif",
																	"palatino,sans-serif" : "Palatino",
																	"'Comic Sans MS',sans-serif" : "Comic Sans MS",
																	"sand,sans-serif" : "Sand",
																	"'Courier New',sans-serif" : "Courier New",
																	"courier,sans-serif" : "Courier",
																	"monospace,sans-serif" : "Monospace",
																	"Georgia,serif" : "Georgia",
																	"SimSun,sans-serif" : "SimSun",
																	"SimHei,sans-serif" : "SimHei",
																	"'MS PGothic',sans-serif" : "MS PGothic",
																	"'MS PMincho',sans-serif" : "MS PMincho",
																	"'MS UI PGothic',sans-serif" : "MS UI PGothic",
																	"Meiryo,sans-serif" : "Meiryo"
																},
																"colorsText" : [
																		"#FF0000",
																		"#FF6C00",
																		"#FFAA00",
																		"#FFEF00",
																		"#A6CF00",
																		"#009E25",
																		"#00B0A2",
																		"#0075C8",
																		"#3A32C3",
																		"#7820B9",
																		"#EF007C",
																		"#000000",
																		"#252525",
																		"#464646",
																		"#636363",
																		"#7D7D7D",
																		"#9A9A9A",
																		"#FFE8E8",
																		"#F7E2D2",
																		"#F5EDDC",
																		"#F5F4E0",
																		"#EDF2C2",
																		"#DEF7E5",
																		"#D9EEEC",
																		"#C9E0F0",
																		"#D6D4EB",
																		"#E7DBED",
																		"#F1E2EA",
																		"#ACACAC",
																		"#C2C2C2",
																		"#CCCCCC",
																		"#E1E1E1",
																		"#EBEBEB",
																		"#FFFFFF",
																		"#E97D81",
																		"#E19B73",
																		"#D1B274",
																		"#CFCCA2",
																		"#61B977",
																		"#53AEA8",
																		"#518FBB",
																		"#6A65BB",
																		"#9A54CE",
																		"#E573AE",
																		"#5A504B",
																		"#767B86",
																		"#951015",
																		"#6E391A",
																		"#785C25",
																		"#5F5B25",
																		"#4C511F",
																		"#1C4827",
																		"#0D514C",
																		"#1B496A",
																		"#2B285F",
																		"#45245B",
																		"#721947",
																		"#352E2C",
																		"#3C3F45" ],
																"colorsBackground" : [
																		"#FF0000",
																		"#FF6C00",
																		"#FFAA00",
																		"#FFEF00",
																		"#A6CF00",
																		"#009E25",
																		"#00B0A2",
																		"#0075C8",
																		"#3A32C3",
																		"#7820B9",
																		"#EF007C",
																		"#000000",
																		"#252525",
																		"#464646",
																		"#636363",
																		"#7D7D7D",
																		"#9A9A9A",
																		"#FFE8E8",
																		"#F7E2D2",
																		"#F5EDDC",
																		"#F5F4E0",
																		"#EDF2C2",
																		"#DEF7E5",
																		"#D9EEEC",
																		"#C9E0F0",
																		"#D6D4EB",
																		"#E7DBED",
																		"#F1E2EA",
																		"#ACACAC",
																		"#C2C2C2",
																		"#CCCCCC",
																		"#E1E1E1",
																		"#EBEBEB",
																		"#FFFFFF",
																		"#E97D81",
																		"#E19B73",
																		"#D1B274",
																		"#CFCCA2",
																		"#61B977",
																		"#53AEA8",
																		"#518FBB",
																		"#6A65BB",
																		"#9A54CE",
																		"#E573AE",
																		"#5A504B",
																		"#767B86",
																		"#951015",
																		"#6E391A",
																		"#785C25",
																		"#5F5B25",
																		"#4C511F",
																		"#1C4827",
																		"#0D514C",
																		"#1B496A",
																		"#2B285F",
																		"#45245B",
																		"#721947",
																		"#352E2C",
																		"#3C3F45" ]
															};
															o["events"] = {
																"image.error" : function(
																		error,
																		response) {
																	if (typeof JSON != "undefined") {
																		r = JSON
																				.parse(response);
																		alert(r["error"]);
																	}
																},
																"filesManager.error" : function(
																		error,
																		response) {
																	if (typeof JSON != "undefined") {
																		r = JSON
																				.parse(response);
																		alert(r["error"]);
																	}
																}
															};

															EC_FROALA_INSTANCE = new FroalaEditor(
																	"textarea#content.ec-fr-never-be-duplicated",
																	o,
																	function() {
																		EC_FROALA_ID = this.id;
																		if (d != "") {
																			this.html
																					.set(this.clean
																							.html(d));
																			// 타겟 textarea 태그에 change 트리거링
																			this.undo
																					.saveStep();
																		}
																		var script = document
																				.createElement("script");
																		script.src = "//img.echosting.cafe24.com/editors/froala/js/polyfill.min.js";
																		this.$iframe
																				.get(0).contentWindow.document.head
																				.appendChild(script);
																	});
															EC_FROALA_INSTANCE.isEmptyContent = function() {
																var c = getContentFromFroala();
																// 스페이스바만 입력 저장시, validation을 위해 처리
																var val = c
																		.replace(
																				/\<br\/?\>|\<\/?p\>|\s|&nbsp;/gi,
																				"");
																if ("" == val)
																	return true;
																return false;
															}
														} catch (e) {
															document
																	.getElementById("content").value = d;
															console.error(e);
														} finally {
														}
													})();

													//플로알라 에디터 내용 조회
													function getContentFromFroala() {
														try {
															var oEditor = FroalaEditor.INSTANCES
																	.filter(function(
																			instance) {
																		return instance.id === EC_FROALA_ID;
																	});
															if (oEditor[0].codeView
																	.isActive()) {
																oEditor[0].codeView
																		.toggle();
															}
															return oEditor[0].html
																	.get(true);
														} catch (e) {
															console.error(e);
															return false;
														}
													}

													//플로알라 에디터 내용 적용
													function applyContentToFroala(
															content) {
														try {
															var oEditor = FroalaEditor.INSTANCES
																	.filter(function(
																			instance) {
																		return instance.id === EC_FROALA_ID;
																	});
															oEditor[0].html
																	.set(oEditor[0].clean
																			.html(content));
															// textarea 태그에 change 트리거링
															oEditor[0].undo
																	.saveStep();
															return true;
														} catch (e) {
															console.error(e);
															return false;
														}
													}

													//플로알라 front reset CSS 가져오기
													//Deprecated
													function getFroalaResetCSS() {
														return "//img.echosting.cafe24.com/editors/froala/css/froala_editor_reset.css;"
													}

													//플로알라 front style CSS 가져오기
													function getFroalaStyleCSS() {
														return "//img.echosting.cafe24.com/editors/froala/css/froala_style.min.css";
													}

													//플로알라 front style EC CSS 가져오기
													function getFroalaECStyleCSS() {
														return "//img.echosting.cafe24.com/editors/froala/css/froala_style_ec.min.css";
													}
												</script>
											</td>
										</tr>
										<tr class="ucc">
										<th scope="row">첨부파일</th>
										<form:hidden path="fileurl"/> 
                   			 			<td><input type="file" name="file1"></td>
               								</tr>
									</tbody>
										
									<tbody>
										<tr class="">
											<th scope="row">비밀번호</th>
											<td><form:input path="pass"
												fw-filter="isFill" fw-label="비밀번호" fw-msg="" value=""
												type="password"/> <font color="red"><form:errors path="pass" /></font></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="ec-base-button ">
								<span class="gLeft"> <a
									 href="list.do?board_no=${param.board_no}">목록</a>
								</span> <span class="gRight"> 
								<a href="javascript:document.f.submit()"
									class="select">수정</a> 
								<a onclick="javascript:history.back();">취소</a>
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
</body>
</html>