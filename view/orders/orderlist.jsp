<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var='conPath' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html lang="en">

<head>
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/orderlist.css">
    <!-- <link href="css/5.css" rel="stylesheet"> -->
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
<script src="../js/7.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
<body>
    <div id="ordersList_wrap">
		<div id="ordersList">
			<div class="subject">
				<span>&nbsp; 주문 내역  &nbsp;</span>
			</div>
			<table>
			
			
			
			
			<c:forEach var="obj" items="${list}">
			<tr>
				<td id="oDate">
					${obj.op_date }
				</td>
				<td id="oId">
					${obj.op_oid } <br>
					<a href="${conPath }orders/orderread?o_ID=${obj.op_oid}">				
						상세보기 >
					</a>
				</td>
				<td id="img">
					<a href="${conPath }product/productContent?pID=${obj.op_pID}">										
						<img src="${conPath }upload/${obj.op_pIMAGE1}" width="100px" height="100px" alt="상품사진">							
					</a>
				</td>
				<td id="pName" class="left">
					<a href="${conPath }product/productContent?pID=${obj.op_pID}">		
						${obj.op_pNAME }
					</a>
				</td>
				<td id="pPrice">
					<fmt:formatNumber value="${obj.op_pPRICE }" pattern="#,###,###" />원				
				</td>
				<td id="pAmount">
					${obj.op_amount }개
				</td>
				<td id="odTotsum">
					<fmt:formatNumber value="${obj.op_o_money }" pattern="#,###,###" />원						
				</td>
				<td	id="reviewWrite">
					<button class="btn" onclick="location.href='${conPath }orders/orderread?o_ID=${obj.op_oid}'">상세보기</button>
					<br>
					<c:if test="${(obj.op_pID) eq (loginUserBean.midx) }">
					<button class="btn" onclick="location.href='${conPath }product/productContent?pID=${obj.op_pID}'">재구매</button>
					</c:if>
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="8"></td>
			</tr>
			
			
			
			
			
			
			
			
			
			
			
		</table>
			<div class="paging">
				<c:if test="${startPage > BLOCKSIZE }">
					<a href="${conPath }/ordersList.do?pageNum=${startPage-1}"> 〈  &nbsp; </a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${i eq pageNum }">
						<b> &nbsp; ${i }</b>
					</c:if>
					<c:if test="${i != pageNum }">
						<a href="${conPath }/ordersList.do?pageNum=${i }">&nbsp; ${i }</a>
					</c:if>
				</c:forEach>
				<c:if test="${endPage < pageCnt }">
					<a href="${conPath }/ordersList.do?pageNum=${endPage+1}">  &nbsp; 〉 </a>
				</c:if>
			</div>
		</div>
	</div>
    <c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>
</body>
</html>
</body>
</html>
</body>
</html>