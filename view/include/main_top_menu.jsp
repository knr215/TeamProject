<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:set var="conPath" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link href="../css/main.css" rel="stylesheet">
    <script src="../js/jquery-3.5.1.min.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/slidescript.js"></script>
    <script src="../js/1.js"></script>
    <script src="../js/2.js"></script>
    <script src="../js/4.js"></script>
    <script src="../js/8.js"></script>
</head>
<body>
<script type="text/javascript">

</script>

	<div class="inner">

		<div class="inner1">
			<!-- 로고부분 -->
			<!-- <h1><img src="img/싸다구.png" alt="logo"></h1> -->
			<a href="main"><h1>SSA DA GU</h1></a>
			<!-- 왼쪽사이드메뉴버튼       -->
			<button class="btn1">
				<img src="img/menu11.png" alt="menu-icon">
			</button>
			<!-- 검색창  -->
			<li class="sideMenu3">
				<input type="text" name="keyword" id="keyword" title="검색">
				<button class="btn2" id="Search" value="검색">
					<img src="img/search.png" alt="menu-icon">
				</button>
			</li>

			<!-- <로그인부분> -->
			<div class="menu2">
			
				<ul>
				<c:choose>
					<c:when test="${loginUserBean.userLogin == false }">
					<li><a href="${conPath }user/login">LOGIN</a></li>
					<li><a href="${conPath }user/join">JOIN</a></li>
					<li><a href="${conPath }qtable/notice">NOTICE</a></li>
					<c:forEach var="obj" items="${qnaTopList}">
        	 		<li><a href="${conPath }board/main?board_info_idx=${obj.board_info_idx}"> ${obj.board_info_name }</a> </li>
         			</c:forEach>
					<li><a href="#" id="favorite">★ FAVORITE</a></li>
					<li><a href="#">▼ DESKTOP</a></li>
					</c:when>
					<c:otherwise>
					<c:choose>
					<c:when test="${loginUserBean.mlevel == 0 }">
					<li><a>${loginUserBean.mid}님 반갑습니다</a></li>
					<li><a href="${conPath }user/logout">LOGOUT</a></li>
					<li><a href="${conPath }user/mypage">MYPAGE</a></li>
					<li><a href="${conPath }qtable/notice">NOTICE</a></li>
					<c:forEach var="obj" items="${qnaTopList}">
        	 		<li><a href="${conPath }board/main?board_info_idx=${obj.board_info_idx}"> ${obj.board_info_name }</a> </li>
         			</c:forEach>
					<li><a href="#" id="favorite">★ FAVORITE</a></li>
					<li><a href="#">▼ DESKTOP</a></li>
					</c:when>
					<c:when test="${loginUserBean.mlevel > 0}">
						<li><a>${loginUserBean.mid}님</a></li>
						<li><a href="${conPath }user/logout">LOGOUT</a></li>
						<li><a href="${conPath }review/reviewlist">REVIEW</a></li>
						<li><a href="${conPath }qtable/notice">NOTICE</a></li>
						<c:forEach var="obj" items="${qnaTopList}">
        	 			<li><a href="${conPath }board/main?board_info_idx=${obj.board_info_idx}"> ${obj.board_info_name }</a> </li>
         				</c:forEach>
						<li><a href="${conPath}product/productInsert">PRODUCT</a></li>
						<li><a href="${conPath }orders/orderlist">ORDER</a></li>
						<li><a href="${conPath}members/memberlist">MEMBER</a></li>
					</c:when>
					</c:choose>
					</c:otherwise>					
				</c:choose>
				</ul>
				
			</div>
		</div>
	</div>
	<!-- <헤더메인메뉴> -->

	<nav id="nav1">
		<ul id="nav2">
			<c:forEach items="${topmenulist}" var="obj">
				<c:choose>
					<c:when test="${obj.top_idx < 4 }">
						<li class="mainMenu"><a
							href="${conPath }product/productList?top_idx=${obj.top_idx}">${obj.top_name}</a></li>
					</c:when>
					<c:when test="${(3<obj.top_idx) && (obj.top_idx <8) }">
						<li class="mainMenu"><a
							href="${conPath }product/productList?top_idx=${obj.top_idx}">${obj.top_name}</a>
							<c:forEach var="obj2" items="${ submenulist}">
								<c:if test="${obj.top_idx eq obj2.sub_top_idx }">
									<ul class="subMenu">
										<li><a
											href="${conPath}product/productList?top_idx=${obj.top_idx}&sub_idx=${obj2.sub_idx}">${obj2.sub_name }</a></li>
									</ul>
								</c:if>
							</c:forEach></li>
					</c:when>
					<c:otherwise>
						<li class="mainMenu"><a
							href="${conPath }product/productList?top_idx=${obj.top_idx}">${obj.top_name}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ul>
	</nav>
<script type="text/javascript">
$(function() {
	$('#Search').click(function() {
		var url = "${conPath}";
		url +='product'+'/'+'productList';
		url +="?keyword=" + $("#keyword").val();
		location.href = url;
	});
});
</script>

</body>
</html>