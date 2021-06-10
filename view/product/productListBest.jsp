<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='conPath' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product List</title>
<link href='../css/productList.css' rel='stylesheet'>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	
});
</script>
</head>
<body>
<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
	<div id="productList_wrap">
		<div id="productList">
			<div class="subject">
				<span>&nbsp; BEST 30 &nbsp;</span>
			</div>
			<table id="product_wrap">
				<tr>
					<c:set var="idx" value="0" scope="page"/>
					<c:forEach var="dto" items="${productListBest }">
						<td>
							<div class="productImg">
								<a href="${conPath }/productContent.do?pId=${dto.pId}&pageNum=${pageNum}">
									<img src="${conPath }/productImg/${dto.pImage1}" alt="상품사진">
								</a>
							</div>
							<div class="productName">
								<a href="${conPath }/productContent.do?pId=${dto.pId}&pageNum=${pageNum}">
									<b> ${dto.pName }</b>							
								</a>
							</div>
							<div class="productPrice">
								<fmt:formatNumber value="${dto.pPrice }" pattern="#,###,###"/>
							</div>
						<c:set var="idx" value="${idx+1 }"/>
						</td>
						<c:if test="${idx%3==0 }">
							</tr><tr>
						</c:if>
					</c:forEach>
				</tr>
			</table>
		</div>
	</div>
<c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>
</body>
</html>