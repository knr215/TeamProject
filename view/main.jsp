<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link href="css/main.css" rel="stylesheet">
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/slidescript.js"></script>
<script src="js/1.js"></script>
    <script src="js/4.js"></script>
    <script src="js/8.js"></script>
    <script src="js/wish.js"></script>
<script src="js/cart.js"></script>
<script>
	function showPopup(a) {
		window
				.open(
						"${conPath}popup/popup1?pID="+a,
						"veiwimg",
						"width=1050, height=800, left=300, top=500, toolbar=no,scrollbars=no,status=no,location=no");
	}
</script>

</head>

<body>

	<!-- <슬라이드, 로그인,메뉴바 헤더부분> -->
	<div id="contents1">
		<!-- 상단배너 -->
		<div class="slideShow">
			<!-- 슬라이드 -->
			<div class="slideArea">
				<a href="#" class="slide"><img src="img/bn4.jpg" alt=""></a> <a
					href="#" class="slide"><img src="img/bn5.jpg" alt=""></a> <a
					href="#" class="slide"><img src="img/bn7.jpg" alt=""></a> <a
					href="#" class="slide"><img src="img/bn8.jpg" alt=""></a>
			</div>
			<!-- 좌우버튼 -->
			<div class="slideNav">
				<a src="img/sprites.png" href="#" class="prev">이전</a> <a
					href="img/sprites.png" class="next">다음</a>
			</div>
			<div class="slideIndicator">
				<a src="img/sprites.png"></a>
			</div>
		</div>

		<header>

			<c:import url="/WEB-INF/view/include/main_top_menu.jsp"></c:import>

		</header>

	</div>
	<!-- 중간에 컨텐츠부분 -->
	<div id="contents2">
		<div id="contents3">
			<div id="top">
				<div class="left">
					<ul>
						<c:if test="${bestlist.size() eq 0 }">
							<li><img src="img/111.jpg" class="img1"
								onclick="showPopup();"></li>
							<li><img src="img/222.jpg" class="img2"
								onclick="showPopup();"></li>
							<li><img src="img/333.jpg" class="img3"
								onclick="showPopup();"></li>
						</c:if>
						<c:if test="${bestlist.size() != 0 }">
							<c:forEach items="${bestlist}" var="bestlist">
							<li><img src="${conPath }upload/${bestlist.pIMAGE1 }" class="img1"
								onclick="location.href='${conPath}product/productContent?pID=${bestlist.pID}'"></li>
							</c:forEach>
						</c:if>
	
					</ul>

					<p class="nex">
						<img src="img/btn_next.png" alt="이전으로">
					</p>
					<p class="pre">
						<img src="img/btn_prev.png" alt="다음으로">
					</p>
				</div>
				<div class="right">
					
					<c:if test="${bestlist.size() eq 0 }">
							<a href="#"><img src="img/444.jpg" class="img4"
						onclick="showPopup();"></a> <a href="#"><img
						src="img/555.jpg" class="img5" onclick="showPopup();"></a>
					</c:if>
						<c:if test="${bestlist.size() != 0 }">
							<c:forEach items="${desclist}" var="desclist" begin="0" end="1">
							
							<a href="#"><img src="${conPath }upload/${desclist.pIMAGE1 }" class="img4"
						onclick="location.href='${conPath}product/productContent?pID=${desclist.pID}'"></a> 
							</c:forEach>
						</c:if>
				</div>
			</div>

			<!-- 중앙박스  -->
			<div id="section">
				<h2 id="subject_name">
					<span id="span_topmenu_name"> <c:set value="${top_idx}"
							var="top" /> <c:forEach items="${topmenulist}" var="obj">
							<c:if test="${top eq obj.top_idx }">
					${obj.top_name}
				</c:if>
						</c:forEach>
					</span>
				</h2>
				<div id="best">
					<ul>
						<li><a href="#">BEST</a></li>
					</ul>
				</div>
				<div id="section1">
					<c:choose>
						<c:when test="${empty bestlist }">
								게시물이 없습니다!.
						</c:when>
						<c:otherwise>
							<c:forEach var="obj" items="${bestlist }" begin="0" end="7">
								<div class="left">
									<div class="box">
										<a href="${conPath}product/productContent?pID=${obj.pID}">
											<img src="${conPath }upload/${obj.pIMAGE1 }" class="boximage">
										</a>
										<p id="buttonp">
											<span class="span1"> <c:choose>
													<c:when test="${loginUserBean.userLogin == true }">

																<c:if test="${loginUserBean.mlevel == 0 }"> 
									<button value="WISH" onclick="WISH(${loginUserBean.midx}, ${obj.pID});"><img id="span_icon"src="img/icon_2.png"></button>
									<button class="addCart" onclick="addCart( ${loginUserBean.midx}, ${obj.pID});"><img id="span_icon"src="img/icon_1.png"></button>
									</c:if> 
													</c:when>
													<c:otherwise>
														<c:if test="${loginUserBean.userLogin == false }">
															<button value="wish"
																	onclick="location.href='${conPath}user/login">
																	<img id="span_icon" src="img/icon_1.png">
																</button>
															<button class="addCart"
																	onclick="location.href='${conPath}user/login">
																	<img id="span_icon" src="img/icon_2.png">
																</button>

														</c:if>
													</c:otherwise>
												</c:choose> <button class="popup1"
														onclick="showPopup(${obj.pID})">
														<img id="span_icon" src="img/icon_3.png">
													</button>
											</span>
										</p>
										<a href="${conPath}product/productContent?pID=${obj.pID}">
											<h3>${obj.pNAME }</h3>
											<p>￦${obj.pPRICE }</p>
										</a>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>





				</div>

			</div>

			<!-- 가로로긴박스 -->
			<div>
				<article class="side3">
					<a href="#">
						<h3>NEW</h3>
					</a>
				</article>
			</div>
			<!-- /* 박스 4개 부분  -->

			<div id="section2">
				<c:choose>
					<c:when test="${empty desclist }">
								게시물이 없습니다!.
						</c:when>
					<c:otherwise>
						<c:forEach var="obj" items="${desclist }" >

							<div class="container">
								<div class="quick">
									<a href="${conPath}product/productContent?pID=${obj.pID}">
										<img src="${conPath }upload/${obj.pIMAGE1 }" class="img14">
									</a>
									<p id="buttonp">
										<span class="span1"> <c:choose>
												<c:when test="${loginUserBean.userLogin == true }">

															<c:if test="${loginUserBean.mlevel == 0 }"> 
									<button value="WISH" onclick="WISH(${loginUserBean.midx}, ${obj.pID});"><img id="span_icon"src="img/icon_2.png"></button>
									<button class="addCart" onclick="addCart( ${loginUserBean.midx}, ${obj.pID});"><img id="span_icon"src="img/icon_1.png"></button>
									</c:if> 
												</c:when>
												<c:otherwise>
													<c:if test="${loginUserBean.userLogin == false }">
														<a href="#"><button value="wish"
																onclick="location.href='${conPath}user/login">
																<img id="span_icon" src="img/icon_1.png">
															</button></a>
														<a href="#"><button class="addCart"
																onclick="location.href='${conPath}user/login">
																<img id="span_icon" src="img/icon_2.png">
															</button></a>

													</c:if>
												</c:otherwise>
											</c:choose> <a href="#"><button class="popup1" onclick="showPopup()">
													<img id="span_icon" src="img/icon_3.png">
												</button></a>
										</span>
									</p>
									<a href="${conPath}product/productContent?pID=${obj.pID}">
										<h3>${obj.pNAME }</h3>
										<p>￦${obj.pPRICE }</p>
									</a>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>

			<div class="paging">
				<ul class="pagination">
					<c:if test="${pagemaker.prev }">
						<li><a class="btn btn-outline-primary"
							href='${conPath}main${pagemaker.makeQuery(pagemaker.startPage - 1)}'>이전</a>
						</li>
					</c:if>
					<c:forEach begin="${pagemaker.startPage }"
						end="${pagemaker.endPage }" var="pageNum">
						<li><a class="btn btn-outline-primary"
							href="${conPath}main${pagemaker.makeQuery(pageNum)}">${pageNum }</a></li>
					</c:forEach>
					<c:if test="${pagemaker.next && pagemaker.endPage >0 }">
						<li><a class="btn btn-outline-primary"
							href='${conPath}main${pagemaker.makeQuery(pagemaker.endPage + 1)}'>다음</a>
						</li>
					</c:if>
					<form name="readform" method="post">
						<input type="hidden" id="page" name="page" value="${scri.page}">
						<input type="hidden" id="perPageNum" name="perPageNum"
							value="${scri.perPageNum}"> <input type="hidden"
							id="keyword" name="keyword" value="${scri.keyword}">
					</form>
				</ul>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/view/include/bottom_menu2.jsp" />

</body>

</html>

