<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <c:set var="conPath" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로젝트</title>
<link href="../css/bottom_main.css" rel="stylesheet">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/3.js"></script>
<script src="../js/2.js"></script>

</head>

<body>
	
	<!-- 푸터 -->
	<div id="footer">
		<div class="left">
			<ul>
				<li><a href="#">법적고지</a></li>
				<li><a href="#">이메일무단수집거부</a></li>
				<li><a href="#">이용약관</a></li>
				<li><a href="#">개인정보취급방침</a></li>
				<li><a href="#">고객센터</a></li>
				<li><a href="#">입찰공고</a></li>
			</ul>
		</div>
		<div class="right">
			<select>
				<option>바로가기</option>
				<option>aaaa</option>
				<option>bbbb</option>
				<option>cccc</option>
				<option>dddd</option>
				<option>eeee</option>
			</select>
		</div>
	</div>


	<!-- /* 왼쪽사이드바 */ -->
	<aside id="aside">
		<nav id="aside nav">
			<ul>
			<c:forEach items="${topmenulist}" var="obj">
				<c:choose>
					<c:when test="${obj.top_idx < 4 }">
						<li class="sideMenu1"><a
							href="${conPath }product/productList?top_idx=${obj.top_idx}">${obj.top_name}</a></li>
					</c:when>
					<c:when test="${(3<obj.top_idx) && (obj.top_idx <8) }">
						<li class="sideMenu1"><a
							href="${conPath }product/productList?top_idx=${obj.top_idx}">${obj.top_name}</a>
							<c:forEach var="obj2" items="${ submenulist}">
								<c:if test="${obj.top_idx eq obj2.sub_top_idx }">
									<ul class="subMenu1">
										<li><a
											href="${conPath}product/productList?top_idx=${obj.top_idx}&sub_idx=${obj2.sub_idx}">${obj2.sub_name }</a></li>
									</ul>
								</c:if>
							</c:forEach></li>
					</c:when>
					<c:otherwise>
						<li class="sideMenu1"><a
							href="${conPath }product/productList?top_idx=${obj.top_idx}">${obj.top_name}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
				</ul>
		</nav>
	</aside>
				
		
	<!-- /* 오른쪽사이드바 */ -->
	<right-sidebar>
	<div class="right">
		<ul class="subMenu2">
			<li><a href="${conPath }cart/cart?midx=${loginUserBean.midx}"><img src="../img/ico_cart_b.png"> CART</a></li>
			<li><a href="${conPath }orders/orderlist"><img src="../img/ico_order_b.png"> ORDER</a></li>
			<li><a href="${conPath }wishlist/wish?midx=${loginUserBean.midx}"><img src="../img/my_icon2.png"> WISHLIST</a></li>	
            <li><a href="${conPath }qtable/notice"><img src="../img/rsi_22.png"> EVENT</a></li>
            <li><a href="${conPath }board/main?board_info_idx=1"><img src="../img/lsi_theday_off.png"> Q&A</a></li>
			<li><a href="${conPath }review/allreviewlist"><img src="../img/lsi_best50_off.png"> REVIEW</a></li>
		</ul>
		<button class="up1">
			<img src="../img/up1.png">
		</button>
		<a href="#"><button class="up">
				<img src="../img/up.png">
			</button></a>
	</div>
	</right-sidebar>
</body>

</html>
</body>
</html>