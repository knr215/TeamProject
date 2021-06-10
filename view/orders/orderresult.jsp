<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var='conPath' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!DOCTYPE html>
<html lang="en">

<head>
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/orderresult.css">
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
    
    <div id="ordersResult_wrap">
		<div id="ordersResult">
			<div class="subject">
				<span>&nbsp; 주문 상세 내역  &nbsp;</span>
			</div>
				<div class="subject">
					감사합니다. 주문이 완료되었습니다. (주문번호 : ${vieworderbean.o_title } )
				</div>	
		<table>
			<tr>
				<td colspan="2" class="firstrow">
					주문 배송 처리 현황
				</td>
			</tr>
			<tr>
				<c:choose>
					<c:when test="${vieworderbean.o_INVOICE ==0 }">
						<td class="title">
							배송 준비 중
						</td>
						<td>
							<c:if test="${loginUserBean.mlevel > 0 }">
								<input type="submit" class="btn" value="배송 하기">
							</c:if>
						</td>
					</c:when>
					<c:otherwise>
						<td class="title">
							 배송 중
						</td>
						<td>
							송장번호
							<input type="text" class="oInvoice" name="oInvoice" value="">
							<input type="submit" class="btn" value="배송완료" readonly>	
						</td>
					</c:otherwise>
				</c:choose>			
			</tr>
		</table>
		<table>
			<tr>
				<td colspan="6" class="firstrow">
					주문 상품 정보	
				</td>
			</tr>
			<c:set var="sum" value="0"/>
			
			<c:forEach var="product" items="${vieworderproductlist }">
			
			<tr>
				<td id="img">
					<a href="${conPath }/productContent?pID=${product.op_pID}">										
						<img src="${conPath }upload/${product.op_pIMAGE1}" width="100px" height="100px" alt="상품사진">							
					</a>
				</td>
				<td id="name">
					<a href="${conPath }/productContent?pID=${product.op_pID}">			
						${product.op_pNAME }
					</a>
				</td>
				<td id="price">
					<fmt:formatNumber value="${product.op_pPRICE }" pattern="#,###,###" />원				
				</td>
				<td id="amount">
					${product.op_amount }개
				</td>
				<td id="totsum">
					<fmt:formatNumber value="${product.op_o_money }" pattern="#,###,###" />원						
				</td>
				<td	id="reviewWrite">
							배송 준비 중
				</td>
			</tr>
			
			</c:forEach>
		
		</table>
		<table>
			<tr>
				<td colspan="2" class="firstrow">
					구매자 정보
				</td>
			</tr>
			<tr>
				<td class="title">
					주문자
				</td>
				<td>
					${vieworderbean.o_mname }
				</td>
			</tr>
			<tr>
				<td class="title">
					이메일 주소
				</td>
				<td>
					${vieworderbean.o_memail }
				</td>
			</tr>
			<tr>
				<td class="title">
					휴대폰 번호
				</td>
				<td>
					${vieworderbean.o_mphone }
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td colspan="2" class="firstrow">
					결제 정보
				</td>
			</tr>
			<tr>
				<td class="title">
					결제 금액
				</td>
				<td>
					<fmt:formatNumber value="${vieworderbean.o_money }" pattern="#,###,###"/> 원
					
				</td>
			</tr>
			<tr>
				<td class="title">
					결제 수단
				</td>
				<td>
					<c:set var="payment" value="${vieworderbean.o_PAYMENT }"/>
					<c:choose>
						<c:when test="${payment eq 'BankTransfer' }">
							계좌이체
						</c:when>
						<c:when test="${payment eq 'card' }">
							신용카드
						</c:when>
						<c:when test="${payment eq 'bankbook' }">
							무통장입금
						</c:when>
						<c:when test="${payment eq 'phone' }">
							핸드폰결제
						</c:when>
					</c:choose>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td colspan="2" class="firstrow">
					배송지 정보
				</td>
			</tr>
			<tr>
				<td class="title">
					받는 사람
				</td>
				<td>
					${vieworderbean.o_NAME }
				</td>
			</tr>
			<tr>
				<td class="title">
					휴대폰 번호
				</td>
				<td>
					${vieworderbean.o_PHONE }
				</td>
			</tr>
			<tr>
				<td class="title">
					주소
				</td>
				<td>
					${vieworderbean.o_post }
					${vieworderbean.o_ADDRESS }
					${vieworderbean.o_ADDRESS2 }
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td class="lastrow">
					<form action="${conPath}orders/orderlist" method="get" >
						<input type="submit" class="btn" id="lastbtn" value="List">
					</form>		
				</td>
			</tr>
		</table>
		</div>
	</div>

<c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>

</body>
</html>
</body>
</html>