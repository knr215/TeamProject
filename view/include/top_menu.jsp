<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var='conPath' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로젝트</title>
<link href="../css/top_main.css" rel="stylesheet">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/4.js"></script>
<script src="../js/8.js"></script>

</head>

<body>
	<!-- <슬라이드, 로그인,메뉴바 헤더부분> -->
	<div id="contents1">
		<div class="topAreaout">
			<div class="topArea">
				<div class="menu1">
					<ul>
						<li><a href="#">★ FAVORITE</a></li>
						<li><a href="#">▼ DESKTOP ICON</a></li>

					</ul>
				</div>
				<div class="menu2">
					<ul>
						<c:choose>
							<c:when test="${loginUserBean.userLogin == false }">
								<li><a href="${conPath }qtable/notice">NOTICE</a></li>
							<c:forEach var="obj" items="${qnaTopList}">
        	 					<li><a href="${conPath }board/main?board_info_idx=${obj.board_info_idx}"> ${obj.board_info_name }</a> </li>
         					</c:forEach>
								<li><a href="${conPath }user/login">LOGIN</a></li>
								<li><a href="${conPath }user/join">JOIN</a></li>

							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${loginUserBean.mlevel == 0}">
										<li><a href="${conPath }user/logout">LOGOUT</a></li>
										<li><a href="${conPath }qtable/notice">NOTICE</a></li>
									<c:forEach var="obj" items="${qnaTopList}">
        	 							<li><a href="${conPath }board/main?board_info_idx=${obj.board_info_idx}"> ${obj.board_info_name }</a> </li>
         							</c:forEach>
										<li><a href="${conPath }user/mypage">MYPAGE</a></li>
										<li><a>${loginUserBean.mid}님 반갑습니다</a></li>
									</c:when>
									<c:when test="${loginUserBean.mlevel > 0}">
										<li><a href="${conPath }user/logout">LOGOUT</a></li>
										<li><a href="${conPath }review/reviewlist">REVIEW</a></li>
										<li><a href="${conPath }qtable/notice">NOTICE</a></li>
									<c:forEach var="obj" items="${qnaTopList}">
        	 							<li><a href="${conPath }board/main?board_info_idx=${obj.board_info_idx}"> ${obj.board_info_name }</a> </li>
         							</c:forEach>
										<li><a href="${conPath}product/productInsert">PRODUCT</a></li>
										<li><a href="${conPath }orders/orderlist">ORDER</a></li>
										<li><a href="${conPath}members/memberlist">MEMBER</a></li>
										<li><a>${loginUserBean.mid}님 반갑습니다</a></li>

									</c:when>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
		<div class="topAreaout2">
			<div class="topArea2">
				<div class="topArea3">
					<h1>
						<a href="${conPath }main">SSA DA GU</a>
					</h1>
				</div>

				<div class="topArea4">
					<li><a href="#"><img src="../img/insta.png"></a></li>
					<li><a href="#"><img src="../img/face.png"></a></li>
					<li><a href="#"><img src="../img/blog.png"></a></li>
					<li><a href="#"><img src="../img/kakao.png"></a></li>
				</div>
			</div>
		</div>
	</div>

	</div>
	<header>
		<div class="inner">

			<div class="inner1">
				<!-- 왼쪽사이드메뉴버튼       -->
				<button class="btn1">
					<img src="../img/menu11.png" alt="menu-icon">
				</button>
				<!-- 검색창  -->
				<li class="sideMenu3">
					<input type="text" name="keyword" id="keyword" value="${scri.keyword}" title="검색" autocomplete="off">
					<button class="btn2" value="검색" id="Search">
						<img src="../img/search.png" alt="menu-icon">
					</button></li>

				<!-- <로그인부분> -->
				<div class="menu3">
					<ul>
							<c:forEach items="${topmenulist}" var="obj">
				<c:choose>
					<c:when test="${obj.top_idx < 4 }">
						<li class="mainMenu1"><a
							href="${conPath }product/productList?top_idx=${obj.top_idx}">${obj.top_name}</a></li>
					</c:when>
					<c:when test="${(3<obj.top_idx) && (obj.top_idx <8) }">
						<li class="mainMenu1"><a href="${conPath }product/productList?top_idx=${obj.top_idx}">${obj.top_name}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="mainMenu1">
						<a href="${conPath }product/productList?top_idx=${obj.top_idx}">${obj.top_name}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</header>

	
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