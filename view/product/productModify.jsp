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

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='../css/productInsert.css' rel='stylesheet'>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="../ckeditor/ckeditor.js"></script>
 <script src="../js/1.js"></script>
    <script src="../js/4.js"></script>
<script>
window.onload = function(){
   ck = CKEDITOR.replace("editor");
};
</script>
</head>
<body>
<c:import url="/WEB-INF/view/include/top_menu.jsp"/>

	<div id="productInsert_wrap">
		<form name="readform" method="post">
		<input type="hidden" id="pID" name="pID" value="${pID}">
		<input type="hidden" id="page" name="page" value="${scri.page}">
		<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
		</form>
		<div id="productInsert">
			<form action="${conPath}product/productModifyok" method="post" enctype="multipart/form-data">
				<input type="hidden" name="pID" value="${pID}">
				<table>
					<tr>
						<td class="title">
							카테고리
						</td>
						<td>
							<c:forEach items="${topmenulist}" var="obj">
								<c:if test="${obj.top_idx eq productbean.p_top_idx}">
									<select id="pCategory" name="pCategory">
										<option selected>${obj.top_name}</option>
									</select>	
								</c:if>	
							</c:forEach>
							
							<c:forEach items="${submenulist}" var="obj">
								<c:if test="${obj.sub_idx eq productbean.p_sub_idx}">
									<select id="pCategory" name="pCategory">
										<option selected>${obj.sub_name}</option>
									</select>	
								</c:if>			
							</c:forEach>
														
							<span id="pCategoryMsg"> &nbsp; &nbsp; </span>
						</td>
						
					</tr>
					<tr>
						<td class="title">
							상품명
						</td>
						<td>
							<input type="text" class="content" id="pNAME" name="pNAME" value="${productbean.pNAME }" required="required" autofocus="autofocus">
							<span id="pNameMsg"> &nbsp; &nbsp; </span>
						</td>
					</tr>
					<tr>
						<td class="title">
							상품 가격
						</td>
						<td>
							<input type="text" class="content" id="pPRICE" name="pPRICE" value="${productbean.pPRICE }" required="required"> 원
							<span id="pPriceMsg"> &nbsp; &nbsp; </span>
						</td>
					</tr>
					<tr>
						<td class="title">
							상품 할인율(%)
						</td>
						<td>
							<input type="text" class="content" id="pdiscount" name="pdiscount" value="${productbean.pdiscount }" readonly> %
							<span id="pDiscountMsg"> &nbsp; &nbsp; </span>
						</td>
					</tr>
					<tr>
						<td class="title">
							대표 이미지
							<br/>(1개 필수//최대 2개)
						</td>
						<td>
							<c:if test="${not empty productbean.pIMAGE1}">
								<p>기존 첨부 파일 : <img src="${conPath}upload/${productbean.pIMAGE1}" width="100px" height="100px"></p>
								<c:if test="${not empty productbean.pIMAGE2}">
								<p>2번째 이미지 : <img src="${conPath}upload/${productbean.pIMAGE2}" width="100px" height="100px"></p>
								</c:if>
							</c:if>
						</td>
						<td>
							
						</td>
					</tr>
					<tr>
						<td class="title">
							교환/환불 규정
						</td>
						<td>
							<input type="text" class="content" id="pPolicy1" name="pPolicy1" 
								value="${dto.pPolicy1 }" readonly>
							<span id="pPolicy1Msg"> &nbsp; &nbsp; </span>
						</td>
					</tr>
					<tr>
						<td class="title">
							배송 규정
						</td>
						<td>
							<input type="text" class="content" id="pPolicy2" name="pPolicy2" 
								value="${dto.pPolicy2 }" readonly>
							<span id="pPolicy2Msg"> &nbsp; &nbsp; </span>
						</td>
					</tr>
					<tr>
						<td class="title">
							재고 수량
						</td>
						<td>
							<input type="text" class="content" id="pStock" name="pStock" value="${productbean.pSTOCK}"> 개
							<span id="pStockMsg"> &nbsp; &nbsp; </span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea name="pCONTENT" id="pCONTENT">${productbean.pCONTENT }</textarea>
							<script>
								CKEDITOR.replace('pCONTENT');
							</script>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="colspan">
							<input type="submit" value="Modify" class="btn">
							<input type="button" value="List" class="btn" onclick="history.back()">
						</td>
					</tr>					
				</table>				
			</form>
		</div>
	</div>
	
<c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>
</body>
</html>