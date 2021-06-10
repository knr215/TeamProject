<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var='conPath' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<head>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Product Content</title>
<link href='../css/productContent.css' rel='stylesheet'>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
</head>
<body>

	<c:import url="/WEB-INF/view/include/top_menu.jsp" />
	<div id="productContent_wrap" style="height:1500px">
		<form name="readform" method="post">
		<input type="hidden" id="pID" name="pID" value="${pID}">
		<input type="hidden" id="page" name="page" value="${scri.page}">
		<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
		</form>
		
		<div id="top">
			<div id="productImage">
				<div class="pImage">

					<img src="${conPath}upload/${productbean.pIMAGE1}" alt="상품사진1">

				</div>
			</div>
			<div id="product_info">
			<h1>상품 삭제</h1>
				<div id="accordion">
					
					<h3>${productbean.pNAME }</h3>
				</div>

				<div id="productPrice">
					<form action="${conPath }/cartInsert.do" method="get">
						<input type="hidden" id="pId" name="pId" value="${pID}">


						<table>
							<tr>
								<th>판매가격</th>
								<td><fmt:formatNumber value="${productbean.pPRICE}" pattern="#,###,###" />원</td>
							</tr>
							<c:if test="${productbean.pdiscount != 0 }">
								<tr>
									<th>할인가격</th>
									<td>
									<c:set var="discountedPrice" value="${productbean.pPRICE*(1-(productbean.pdiscount/100)) }" />
										<fmt:formatNumber value="${discountedPrice }" pattern="#,###,###" />원 
										<span>(${productbean.pdiscount }%할인) </span></td>
								</tr>
							</c:if>
							<tr>
								<td colspan="2">
									<c:choose>
										<c:when test="${loginUserBean.userLogin == true }">
											<c:if test="${loginUserBean.mlevel > 0 }">
												<input type="button" value="상품 삭제" class="guestBtn"
													onclick="location.href='${conPath}product/productDeleteok?pID=${pID}'">
											</c:if>
										</c:when>
									</c:choose></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	
	</div>




	<c:import url="/WEB-INF/view/include/bottom_menu.jsp" />
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
  $( function() {
    $( "#accordion" ).accordion({
      	collapsible: true
    });  
    $("h3").click(function(){
    	$(this).css("background-color","white").css("color","black");
    });
  });
  
  $( function() {
	  function setCookie(cookie_name, value, days){
		  
	  }
	  
  });
  </script>
</body>
</html>