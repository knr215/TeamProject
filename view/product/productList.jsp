<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로젝트</title>
<link href="../css/menulist.css" rel="stylesheet">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="../js/cart.js"></script>
<script src="../js/wish.js"></script>
<script>
	$(document).ready(function() {
	});
</script>
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
	<c:if test="${not empty productInsertMsg }">
		<script>
			alert('${productInsertMsg }');
		</script>
	</c:if>
	<c:import url="/WEB-INF/view/include/top_menu.jsp" />
	</div>
	<!-- 중간에 컨텐츠부분 -->
	<div id="contents2">
		<c:if test="${loginUserBean.mlevel > 0}">
			<div class="right">
				<a class="register" href="${conPath}/product/productInsert"> 상품등록 </a>
			</div>
		</c:if>
	<div id="contents3">
		<div id="subject_name">
			<h2 id="span_topmenu_name">
			<c:set value="${top_idx}" var="top"/>
			<c:forEach items="${topmenulist}" var="obj">
				<c:if test="${top eq obj.top_idx }">
					${obj.top_name}
				</c:if>
			</c:forEach>
			
		</h2>
			</div>

					<div id="best">
						<ul>
							<li><a>BEST</a></li>
						</ul>

					</div>
					<!-- 중앙박스  -->
					
							<div id="section">
						<c:choose>
						<c:when test="${empty bestlist }">
								게시물이 없습니다!.
						</c:when>
						<c:otherwise>
						<c:forEach var="obj" items="${bestlist }" >
					
						<div class="left">
							<div class="box">
								<a href="${conPath}product/productContent?pID=${obj.pID}">
								<img src="${conPath }upload/${obj.pIMAGE1 }" class="boximage"></a>
								<p id="buttonp">
									<span class="span1"> 
									<c:choose>
										<c:when test="${loginUserBean.userLogin == true }">

											<c:if test="${loginUserBean.mlevel == 0 }"> 
									<button value="wish" onclick="WISH(${loginUserBean.midx},${obj.pID});"><img id="span_icon"src="../img/icon_2.png"></button>
									<button class="addCart" onclick="addCart(${loginUserBean.midx},${obj.pID});"><img id="span_icon"src="../img/icon_1.png"></button>
									</c:if> 
									</c:when>
									<c:otherwise>
									<c:if test="${loginUserBean.userLogin == false }">
									<button value="wish" onclick="location.href='${conPath}user/login"><img id="span_icon"src="../img/icon_1.png" alt="cart"></button>
									<button class="addCart" onclick="location.href='${conPath}user/login"><img id="span_icon"src="../img/icon_2.png" alt="wish"></button>
													
											</c:if>
										</c:otherwise>
									</c:choose>
									<button class="popup1" onclick="showPopup(${obj.pID})"><img id="span_icon"src="../img/icon_3.png" alt="look"></button>
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
    

			
					<!-- 가로로긴박스 -->
					<div>
						<article class="side3">
						
							<div class="middle">
							
								<c:set value="${top_idx}" var="top"/>
								<c:forEach items="${topmenulist}" var="obj">
			<c:forEach items="${submenulist}" var="obj2">
				<c:choose>		
				<c:when test="${top eq obj.top_idx}">
				
				<c:if  test="${obj.top_idx eq obj2.sub_top_idx }">
				<ul class="subMenu1">
			<li><a href="${conPath}product/productList?top_idx=${obj.top_idx}&sub_idx=${obj2.sub_idx}" id="middle_name">${obj2.sub_name }</a></li>
				</ul>
		</c:if>	
				<c:if  test="${obj2.sub_top_idx == null }">
			<ul class="subMenu1">
			<li><a href="${conPath}product/productList?top_idx=${obj.top_idx}&sub_idx=${obj2.sub_idx}" id="middle_name">${obj.top_name }</a></li>
				</ul>				
		</c:if>
				
					</c:when>				
			</c:choose>
						</c:forEach>
					</c:forEach>		
										
							</div>
							
						</article>
					</div>
					<!-- /* 박스 4개 부분  -->
					<div class="section1">
						<c:choose>
						<c:when test="${empty productlist }">
								게시물이 없습니다!.
						</c:when>
						<c:otherwise>
						<c:forEach var="obj" items="${productlist }" begin="0" end="11">
					
						<div class="container">
							<div class="quick">
								<a href="${conPath}product/productContent?pID=${obj.pID}">
								<img src="${conPath }upload/${obj.pIMAGE1 }" class="img14"></a>
								<p id="buttonp">
									<span class="span1">
									<c:choose>
										<c:when test="${loginUserBean.userLogin == true }">

											<c:if test="${loginUserBean.mlevel == 0 }"> 
									<button value="wish" onclick="WISH(${loginUserBean.midx},${obj.pID});"><img id="span_icon"src="../img/icon_2.png"></button>
									<button class="addCart" onclick="addCart(${loginUserBean.midx},${obj.pID});"><img id="span_icon"src="../img/icon_1.png"></button>
									</c:if> 
									</c:when>
									<c:otherwise>
									<c:if test="${loginUserBean.userLogin == false }">
									<a href="#"><button value="wish" onclick="location.href='${conPath}user/login"><img id="span_icon"src="../img/icon_1.png"></button></a> 
									<a href="#"><button class="addCart" onclick="location.href='${conPath}user/login"><img id="span_icon"src="../img/icon_2.png"></button></a>
													
											</c:if>
										</c:otherwise>
									</c:choose>
									<a href="#"><button class="popup1" onclick="showPopup(${obj.pID})"><img id="span_icon"src="../img/icon_3.png"></button></a>
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
							<li>
								<a class="btn btn-outline-primary"
								href='${conPath}product/productList${pagemaker.makeQuery(pagemaker.startPage - 1)}'>이전</a>
							</li>
						</c:if>
						<c:forEach begin="${pagemaker.startPage }"
							end="${pagemaker.endPage }" var="pageNum">
							<li><a class="btn btn-outline-primary"
								href="${conPath}product/productList${pagemaker.makeQuery(pageNum)}">${pageNum }</a></li>
						</c:forEach>
						<c:if test="${pagemaker.next && pagemaker.endPage >0 }">
							<li><a class="btn btn-outline-primary"
								href='${conPath}product/productList${pagemaker.makeQuery(pagemaker.endPage + 1)}'>다음</a>
							</li>
						</c:if>
						<form name="readform" method="post">
						<input type="hidden" id="page" name="page" value="${scri.page}">
						<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
						<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
						</form>
				</ul>
			</div>
	</div>
	</div>

<c:if test="${not empty CartMsg }">
	<script>
	alert('${CartMsg }');
</script>
</c:if>
<c:if test="${not empty WISHMsg }">
	<script>
	alert('${WISHMsg }');
</script>


</c:if>
	
	<c:import url="/WEB-INF/view/include/bottom_menu.jsp" />


</body>

</html>