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
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로젝트</title>
<link href="../css/order.css" rel="stylesheet">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
<script src="../js/7.js"></script>
<script>
$(document).ready(function(){<!-- 로드되면 기본적으로 list를 불러옴!-->
	wishvalue();
});

function wishvalue(){// 카트 번호 hidden에 배열로 넘긴다.
	var wishnumArray = new Array();
	
	<c:forEach items="${Checklist}" var="obj">
	
	wishnumArray.push(${obj});
	
	</c:forEach>
		
	$('#wishwid').val(wishnumArray);
	
	
	for(var i=0; i<wishnumArray.length;i++){
		console.log(wishnumArray[i]);<!-- 여기-->
	}
	
}



</script>

<script type="text/javascript">
$(document).ready(function(){<!-- 로드되면 기본적으로 list를 불러옴!-->
		cartlist();
});

function cartlist(){
	var cartlisturl = "${conPath}cart/cartlist";
	var midx=${loginUserBean.midx};

	$.ajax({
		url : cartlisturl+'/'+midx,
		type : 'POST',
		dataType : 'json',
		success : function(result){
	 		var rootpath = ${conPath}; 
	 		var cartitem = "";
	 		var payinfo ="";
	 		var cost = 0;<!--원래 가격!-->
	 		var price =0;<!--할인 된 가격!-->
	 		var point=0;<!--적립금!-->
	 		var sumprice=0;<!--해당 상품의 price * amount 값!-->

	 		<!--String 사용자에게 보여질 값!-->
	 		var viewprice="";
	 		var viewsumprice="";
	 		var viewpoint="";
	 		
	 		if(result.length < 1){
		 		cartitem = "장바구니가 비었습니다.";
	 		}else{
		 
			$(result).each(function(){
			
			if(this.c_pdiscount==0){<!-- 할인된 값 및 포인트 사전에 정의!-->
				price = this.c_pPRICE;
				point = (price*(1/100))*this.cAmount;
				sumprice = price*this.cAmount;
				
				viewprice = moneyunit(price)+'원'; 
				viewpoint = moneyunit(point)+'point';
				viewsumprice = moneyunit(sumprice)+'원';
				
			}else{
				price = this.c_pPRICE*(1-(this.c_pdiscount/100));
				point = (price*(1/100))*this.cAmount;
				sumprice = price*this.cAmount;
				
				viewprice = moneyunit(price)+'원';
				viewpoint = point = moneyunit(point)+'point';
				viewsumprice = moneyunit(sumprice)+'원';
			}
			
			
			cartitem +='<tr class="tr12" id="cID'+this.cID+'">';
			cartitem +='<td scope="row">';
			cartitem +='<input type="checkbox" name="checkitem" value="'+this.cID+'" onclick="check(2);"></td>';
			cartitem +='<td><img src="'+rootpath+'upload/'+this.c_pIMAGE1+'"width="100px" height="100px" alt="상품사진1"></td>';
			cartitem +='<td>'+this.c_pNAME+'</td>';
			cartitem +='<td scope="row">';
			cartitem +='<input type="hidden" class="jsprice" value="'+price+'">';
			cartitem +='<span>'+viewprice+'</span>';
			cartitem +='</td>';
			cartitem +='<td>';
			cartitem +='<input type="number" class="jsamount" value="'+this.cAmount+'"min="1" max="'+this.c_pSTOCK+'"step="1" onchange="cartamountchange('+this.cID+')">';
			cartitem +='</td>';
			cartitem +='<td>';
			cartitem +='<input type="hidden" class="jspoint" value="'+point+'">';
			cartitem +='<span>'+viewpoint+'</span>';
			cartitem +='</td>';
			cartitem +='<td>[기본배송]<br/></td>';
			cartitem +='<td>';
			cartitem +='<input type="hidden" class"jssumvar" value="'+sumprice+'">';
			cartitem +='<span class="jssumprice">'+viewsumprice+'</span>';
			cartitem +='</td>';
			cartitem +='<td>';
			cartitem +='<input type="button" value="삭제하기" onclick="deletecheck('+this.cID+')">';
			cartitem +='</td>';
			cartitem +='</tr>';
		});
		
		payinfo = value_check();
				 
	 }
	 	$("#cartlistdiv").html(cartitem);
		$(".section3").html(payinfo);
		
		
		
		
		
		}, error : function(result){
		
		console.log("에러");
	}
	
});

}

function cartamountchange(cID){<!--수량 변경시 ajax로 그 수량들을 보냄.!-->

	var cartamounturl = "${conPath}cart/cartchange";
	var cidvar = cID;
	var c_m_IDx = ${loginUserBean.midx};
	var amountvar = $('#cID'+cidvar+' .jsamount').val();

	$.ajax({
		url : cartamounturl+'/'+cidvar+'/'+c_m_IDx+'/'+amountvar,
		type : 'POST',
		dataType: 'json',
		success : function(result){
		
			sumcal(cidvar);
			cartlist();
		
		}, error : function(result){
		
			console.log(result.result);			
	
		}
});
}

function deletecart(cID){<!--장바구니에서 해당 상품 삭제!-->
	var cartdelete = "${conPath}cart/cartdelete";
	var cidvar= cID;

	$.ajax({
		url : cartdelete+'/'+cidvar,
		type : 'POST',
		dataType: 'json',
		success : function(result){
		
		alert("삭제되었습니다.");				
		cartlist();
		
		}, error : function(result){
		
			console.log(result.result);			
	
		}
	});

};


function deletecheck(cID){<!--장바구니에서 해당 상품 삭제시 물어보고 확인 누를 시 ajax delete 실행!-->
	if(confirm("장바구니에서 지우시겠습니까? ")== true){
		var cidvar= cID;
		deletecart(cidvar);
	}else {
		return;
	}
}

function moneyunit(number){

	return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


function sumArraycal(array){<!--배열을 받아와서 그것을 다 더함.!-->

	var cal = array;
	var sumcal = 0;
		for(var i=0; i<cal.length;i++){
			sumcal += cal[i];
		};
	return sumcal;
}

function sumcal(cID){<!--수량 변경시 수량*가격을 표시!-->

 	var cidvar = cID;
 
 	var amountvar = $('#cID'+cidvar+' .jsamount').val();
 
	 var price=	$('#cID'+cidvar+' .jsprice').val();
 
	 var sumprice = amountvar*price;
 
 	sumprice = moneyunit(sumprice)+'원';
 
 	$('#cID'+cidvar+' .jssumprice').text(sumprice);
 
}

function check(checkflag){
	
	var payinfo ="";
	
	if(checkflag === 1 ){<!--전체 선택, 전체 해제!-->
	
		if($("input:checkbox[id='allcheck']").is(":checked") ==true ){
	
			$("input:checkbox[name='checkitem']").prop("checked", true);	
			payinfo = value_check();
			$(".section3").html(payinfo);
		}else{
	
			$("input:checkbox[name='checkitem']").prop("checked", false);
			payinfo = value_check();
			$(".section3").html(payinfo);
		} 
	}else if(checkflag === 2 ){<!--하위 요소 하나하나 전부 선택시에만 전체 선택이 체크가 됨.-->
		
		if($("input:checkbox[name='checkitem']:checked").length == $("input:checkbox[name='checkitem']").length){
			
			$("input:checkbox[id='allcheck']").prop("checked", true);
			payinfo = value_check();
			$(".section3").html(payinfo);
		}else if($("input:checkbox[name='checkitem']:checked").length != $("input:checkbox[name='checkitem']").length){
			
			$("input:checkbox[id='allcheck']").prop("checked", false);
			payinfo = value_check();
			$(".section3").html(payinfo);
			
		}
		
	}
	
};


function value_check(){
	  var checkcount = document.getElementsByName("checkitem").length;
	 
	  var allsumprice = 0;
	  var postcost = 2500;
	  var sumpoint = 0;
		
	  
	  var payinfo ="";
	  var discountcostvar=0;<!--총 할인된 금액!-->
	  var sumpriceArray = new Array();<!--해당 상품의 최종 가격을 배열로 저장!-->
	  var pointArray = new Array();<!--총 적립금 배열!-->
	  
	  for(var i=0; i<checkcount; i++){
		    if (document.getElementsByName("checkitem")[i].checked == true) {
                var cidvar = document.getElementsByName("checkitem")[i].value;
				var price = $('#cID'+cidvar+' .jsprice').val();
				var amount = $('#cID'+cidvar+' .jsamount').val();
				var point = $('#cID'+cidvar+' .jspoint').val();
				
				sumpriceArray.push(price*amount);
				pointArray.push(point*amount);
            };
	  };
	  
	  var allsumprice = sumArraycal(sumpriceArray);<!--총 결제 금액!-->
	  if(allsumprice > 50000){
			postcost = 0;
	  }
	  sumpoint = sumArraycal(pointArray);<!--총 적립금!-->
	  allsum = (allsumprice+postcost);
		
	  	
	  	
		viewpostcost = moneyunit(postcost);
		viewallsumprice = moneyunit(allsumprice);
		var viewsumpoint = moneyunit(sumpoint);
		viewallsum = moneyunit(allsum);<!--최종 결제금액!-->
		
		payinfo +='<table border="1" class="table3">';
		payinfo +='<h2>총 주문금액</h2>';
		payinfo +='<tr>';
		payinfo +='<th>총상품금액</th>';
		payinfo +='<th>총 배송비</th>';
		payinfo +='<th>결제예정금액</th>';
		payinfo +='</tr>';
		payinfo +='<tr>';
		payinfo += '<input type="hidden" id="allsumprice" value="'+allsumprice+'">';
		payinfo += '<input type="hidden" id="postcost" value="'+postcost+'">';
		payinfo += '<input type="hidden" id="allsum" value="'+allsum+'">';
		payinfo +='<td>['+viewallsumprice+'] 원</td>';
		payinfo +='<td>+ ['+viewpostcost+'] 원</td>';
		payinfo +='<td>= ['+viewallsum+'] 원</td>';
		payinfo +='</tr>';
		payinfo +='</table>';
		payinfo +='<br />';
		
		return payinfo;

}


function ordercheck(kind){
	
	if($("input:checkbox[name='checkitem']:checked").length < 1){
		
		alert("상품을 선택해주세요!");
		return;
		
	}else {
		var allsumprice =$('#allsumprice').val();
		var postcost=$('#postcost').val();
		var allsum=$('#allsum').val();
		
		
		if(kind === 1 ){
		
			var orderArray = new Array();
			console.log(orderArray.length);
			$("input:checkbox[name='checkitem']").each(function(){
				orderArray.push($(this).val());
				console.log(orderArray.length);
			});
		
			$('#charray').val(orderArray);
			$('#suballsumprice').val(allsumprice);
			$('#subpostcost').val(postcost);
			$('#suballsum').val(allsum);
		
			console.log($('#charray').val());
		
			if(confirm("주문하시겠습니까?")==true){
			
				$('#orderform').submit();
			
			}else {
				return;
			}
		
			for(var i=0;i< orderArray.length;i++){<!--배열 확인 용 !-->
			console.log(orderArray[i]);
			};
		
		}else if(kind === 2){
			var orderArray = new Array();
		
			$("input:checkbox[name='checkitem']:checked").each(function(){
			orderArray.push($(this).val());
			});
		
			$('#charray').val(orderArray);
			$('#suballsumprice').val(allsumprice);
			$('#subpostcost').val(postcost);
			$('#suballsum').val(allsum);
		
			if(confirm("주문하시겠습니까?")==true){

				$('#orderform').submit();
			
			}else {
				return;
			}
		
			for(var i=0;i< orderArray.length;i++){<!--배열 확인 용 !-->
				console.log(orderArray[i]);
			};
		
		}
	}
}

</script>

</head>
<body>
	<c:import url="/WEB-INF/view/include/top_menu.jsp" />
	<!-- 중간에 컨텐츠부분 -->
	<div id="contents2">
		<div id="contents3">
			<div class="section">
				<div class="cart">
					<ul>
						<a href="#"><li>CART</li></a>
					</ul>

				</div>
				<table border="1" class="table1">
					<tr>
						<th rowspan="2"><h4>혜택정보</h4></th>
						<td><p>${loginUserBean.mname}님은,[일반회원] 회원이십니다.</p></td>
					</tr>
					<tr>
						<td>
							<ul>
								<li><a href="">가용적립금 : 2,000원</a></li>
								<li><a href="">예치금 : </a></li>
								<li><a href="">쿠폰 : 1개</a></li>
							</ul>
						</td>
					</tr>
				</table>
			</div>
			<!-- 탭 -->
			<ul class="section1">
				<div class="tabArea">
					<ul class="tabList">
					 <li>
                    <a href="#" class="tabBtn">해외배송상품</a>
                    <div class="tabCon notice">
                        <table class="table table-striped">
                            <thead>
                                <tr class="tr2">
                                    <th scope="cols"><input class="th1" type="checkbox" onclick=""></th>
                                    <th scope="cols">이미지</th>
                                    <th scope="cols">상품정보</th>
                                    <th scope="cols">판매가</th>
                                    <th scope="cols">수량</th>
                                    <th scope="cols">적립금</th>
                                    <th scope="cols">배송구분</th>
                                    <th scope="cols">배송비</th>
                                    <th scope="cols">합계</th>
                                    <th scope="cols">선택</th>
                                </tr>
                            </thead>
                            <tbody>    
                                <tr class="tr12">
                                    <td scope="row"><a href=""><input type="checkbox" onclick=""></a></td>
                                    <td><img src="" alt=""></td>
                                    <td><a href=""><img src="" alt="">상품옵션
                                        <select size="" id="">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select></a><br/>
                                        <input type="submit" value="추가">
                                        <input type="submit" value="변경">
                                        <input type="reset" value="삭제">
                                    </td>
                                    <td scope="row">원</td>
                                    <td><input type="number" value="" min="0" max="100" step="1"></td>
                                    <td>원</td>
                                    <td>해외배송</td>
                                    <td>원<br/>해외배송</td>
                                    <td>원</td>
                                    <td><a href="" onclick=""><input type="button" value="삭제하기"></a></td>
                                </tr>
                                <tr class="tr13">
                                    <th colspan="10" scope="row">
                                        <p>[해외배송]</p>                    
                                        <a>상품구매금액 + 배송비 = 합계 : 원</a>
                                    </th>
                                </tr>
                            </table>
                        </div>
                    </li>
						<li><a href="#" class="tabBtn">국내배송상품</a>
							<div class="tabCon notice" style="overflow:auto">
								<table class="table table-striped">

									<thead>
										<tr class="tr2">
											<th><input class="th1" type="checkbox" id="allcheck" onclick="check(1);"></th>
											<th>이미지</th>
											<th>상품정보</th>
											<th>판매가</th>
											<th>수량</th>
											<th>적립금</th>
											<th>배송구분</th>
											<th>합계</th>
											<th>선택</th>
										</tr>
									</thead>
									<tbody id="cartlistdiv">
									
									<c:forEach items="${wishlist }" var="obj">
                                <tr class="tr12">
                                    <td><input type="checkbox" name="checkitem" onclick="check(2);"></td>
                                    <td><img src="${conPath}upload/${obj.w_pIMAGE1}" width="100px" height="100px" alt="상품이미지"></td>
                                    <td>${obj.w_pNAME }</td>
                                    <c:choose>
                                    	<c:when test="${obj.w_pdiscount == 0 }">
											<td scope="row">
											<c:set var="discountedPrice" value="${obj.w_pPRICE}" />
											<fmt:formatNumber value="${discountedPrice }" pattern="#,###,###" />원
											<input type="hidden" class="" value="${obj.w_pPRICE}">
											</td>		                                    	
                                    	</c:when>
                                    	
                                    	<c:otherwise>
                                    		<c:set var="discountedPrice" value="${obj.w_pPRICE*(1-(obj.w_pdiscount/100)) }" />
											<fmt:formatNumber value="${discountedPrice }" pattern="#,###,###" />원 
                                    	</c:otherwise>
                                    </c:choose>
                                    <td><input type="number" value="${obj.wAmount }" readonly></td>
                                    <td>2.500원</td>
                                    <td>기본배송<br/></td>
                                    
                                    <td><c:set var="partprice" value="${discountedPrice*obj.wAmount }"/>
                                    <fmt:formatNumber value="${partprice }" pattern="#,###,###" />원 </td>
                                    <td><input type="button" value="주문하기"><br/><input type="button" value="삭제하기" onclick="deletecheck('+this.cID+')"></td>
                                </tr>
                                </c:forEach>
                                
                                <tr class="tr13">
                                    <th colspan="10" scope="row">
                                        <p>[기본배송]</p>
                                        <a>상품구매금액<c:set var="sumprice" value="${pricemap['sumprice'] }"/>
                                        <fmt:formatNumber value="${sumprice }" pattern="#,###,###" />원 +
                                         배송비 <c:set var="postcost" value="${pricemap['postcost'] }"/>
                                         <fmt:formatNumber value="${postcost }" pattern="#,###,###" />원 = 
                                         합계 :<c:set var="allsum" value="${pricemap['allsum'] }"/> 
                                         <fmt:formatNumber value="${allsum }" pattern="#,###,###" />원</a>
                                    </th>
                                </tr>
									</tbody>
								</table>
							</div></li>
					</ul>
				</div>
			</ul>


			<div class="section3">
				
			</div>
			<div class="section4">
				<form action="${conPath }orders/orderwrite" method="post" id="orderform" autocomplete="off">
				<input type="hidden" name="cha[]" id="charray" value="">
				<input type="hidden" id="suballsumprice" name="allsumprice" value="">
				<input type="hidden" id="subpostcost" name="postcost" value="">
				<input type="hidden" id="suballsum" name="allsum" value="">
				
				
				<input type="button" value="전체상품주문" id="allorder" onclick="ordercheck(1)" >
				<input type="button" value="선택상품주문" id="onepartorder" onclick="ordercheck(2)" >
				<input type="button" value="쇼핑계속하기" >
				</form>
				<br /> <br />
			</div>
			<div class="section5">
				<table border="1" class="table4">
					<tr>
						<th>이용안내</th>

					</tr>
					<tr>
						<td>
							<ul>
								<li><h2>장바구니 이용안내</h2></li>
								<br />
								<li>■ 해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기
									바랍니다.</li>
								<br />
								<li>■ 해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수
									있습니다.</li>
								<br />
								<li>■ 선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
								<br />
								<li>■ [쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
								<br />
								<li>■ 장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.</li>
								<br />
								<li><h2>무이자할부 이용안내</h2></li>
								<br />
								<li>■ 상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러
									주문/결제 하시면 됩니다.</li>
								<br />
								<li>■ [전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가
									이루어집니다.</li>
								<br />
								<li>■ 단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</li>
								<br />
							</ul>
						</td>


					</tr>
				</table>
				 
   		 	<br/>
   		</div>
			</div>
		</div>
	
	<c:import url="/WEB-INF/view/include/bottom_menu.jsp" />
	
</body>
</html>