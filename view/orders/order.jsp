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
    <link rel="stylesheet" href="../css/order.css">
    <!-- <link href="css/5.css" rel="stylesheet"> -->
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
<script src="../js/7.js"></script>
</head>
<script>
$(document).ready(function(){<!-- 로드되면 기본적으로 list를 불러옴!-->
	cartvalue();
});

function cartvalue(){// 카트 번호 hidden에 배열로 넘긴다.
	var cartnumArray = new Array();
	
	<c:forEach items="${Checklist}" var="obj">
	
		cartnumArray.push(${obj});
	
	</c:forEach>
		
	$('#cartcid').val(cartnumArray);
	
	
	for(var i=0; i<cartnumArray.length;i++){
		console.log(cartnumArray[i]);
	}
	
}

function contentcheck(){
	var username = $('#username').val();
	var usertel	= $('#usertel').val();
	var useraddress = $('#useraddress').val();
	var useraddress2 = $('#useraddress2').val();
	var userpost = $('#userpost').val();
	
	if($("input:checkbox[id='same']").is(":checked") ==true ){
		console.log("찍찍");
		$('#o_NAME').val(username);
		$('#o_PHONE').val(usertel);
		$('#o_ADDRESS').val(useraddress);
		$('#o_ADDRESS2').val(useraddress2);
		$('#o_post').val(userpost);
	}else{
		console.log("ㅌㅌ");
		$('#o_NAME').val('');
		$('#o_PHONE').val('');
		$('#o_ADDRESS').val('');
		$('#o_ADDRESS2').val('');
		$('#o_post').val('');
	}
	
};
function paymentcheck(a){
	
	var obj = document.getElementsByName("payment");
	
	for(var i=0; i<obj.length; i++){

        if(obj[i] != a){

            obj[i].checked = false;

        }else{
        	
        $('#o_PAYMENT').val(obj[i].value);
		
		}

    }
	
};

function ordercheck(){
	var receivername=$('#o_NAME').val();
	var receivertel=$('#o_PHONE').val();
	var receiveraddress=$('#o_ADDRESS').val();
	var receiverpost=$('#o_post').val();
	var receiveraddress2=$('#o_ADDRESS2').val();
	var o_PAYMENT=$('#o_PAYMENT').val();
	//공백 체크
	if(receivername == null || receivertel == null || receiveraddress == null|| receiverpost == null|| receiveraddress2 == null|| 
		receivername.trim() == "" || receivertel.trim() == "" ||receiveraddress.trim() == "" ||receiverpost.trim() == "" || receiveraddress2.trim() == ""||  o_PAYMENT == null ||  o_PAYMENT.trim() == ""){
		
		alert("공백이 있습니다 ^^;;");
		
		if(receivername == null || receivername.trim() == ""){
			$('#o_NAME').focus();
			alert("받는 사람 이름 공백 ^^;;");
		}
		if(receivertel == null ||receivertel.trim() == ""){
			$('#o_PHONE').focus();
			alert("받는 사람 전화번호 공백 ^^;;");
		}
		if(receiveraddress == null || receiveraddress.trim() == ""){
			$('#o_ADDRESS').focus();
			alert("받는 사람 주소 공백 ^^;;");
		}
		if( receiverpost == null || receiverpost.trim() == ""){
			$('#o_post').focus();
			alert("받는 사람 우편번호 공백 ^^;;");
		}
		if( receiveraddress2 == null ||receiveraddress2.trim() == ""){
			$('#o_ADDRESS2').focus();
			alert("받는 사람 주소 공백 ^^;;");
		}
		if(o_PAYMENT == null ||  o_PAYMENT.trim() == ""){
			alert("결제방식을 선택해 주세요.");
		}
		return false;
	}
	
	return true;
		
};


</script>


<body>
	<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
    <!-- 중간에 컨텐츠부분 -->
	<div id="contents2">
        <div id="contents3">
            <div class="section">
            <div class="cart">
                <ul><a href="#"><li>ORDER</li></a></ul>
                
            </div>
            <table border="1" class="table4">
            <tr>
                <th rowspan="2"><h4>혜택정보</h4></th>
                <td><p>${loginUserBean.mname}님은,[일반회원] 회원이십니다.</p></td>
            </tr>
            <tr>
                <td> 
                    <ul>
                    <li><a href="">가용적립금 : 2,000원</a></li>
                    <li><a href="">예치금 : </a></li>
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
                    <li ><a href="#" class="tabBtn">국내배송상품</a>
                    <!--  -->
                    <div class="tabCon notice">
                        <table class="table table-striped">
                            <thead>
                                <tr class="tr2">
                                    <th scope="cols">이미지</th>
                                    <th scope="cols">상품정보</th>
                                    <th scope="cols">판매가</th>
                                    <th scope="cols">수량</th>
                                    <th scope="cols">배송비</th>
                                    <th scope="cols">배송구분</th>
                                    <th scope="cols">합계</th>
                                </tr>
                            </thead>
                            
                            <tbody>    
                            	
                            	<c:forEach items="${cartlist }" var="obj">
                                <tr class="tr12">
                                    
                                    <td><img src="${conPath}upload/${obj.c_pIMAGE1}" width="100px" height="100px" alt="상품이미지"></td>
                                    <td>${obj.c_pNAME }</td>
                                    <c:choose>
                                    	<c:when test="${obj.c_pdiscount == 0 }">
											<td scope="row">
											<c:set var="discountedPrice" value="${obj.c_pPRICE}" />
											<fmt:formatNumber value="${discountedPrice }" pattern="#,###,###" />원
											<input type="hidden" class="" value="${obj.c_pPRICE}">
											</td>		                                    	
                                    	</c:when>
                                    	
                                    	<c:otherwise>
                                    		<c:set var="discountedPrice" value="${obj.c_pPRICE*(1-(obj.c_pdiscount/100)) }" />
											<fmt:formatNumber value="${discountedPrice }" pattern="#,###,###" />원 
                                    	</c:otherwise>
                                    </c:choose>
                                    <td><input type="number" value="${obj.cAmount }" readonly></td>
                                    <td>2.500원</td>
                                    <td>기본배송<br/></td>
                                    
                                    <td><c:set var="partprice" value="${discountedPrice*obj.cAmount }"/>
                                    <fmt:formatNumber value="${partprice }" pattern="#,###,###" />원 </td>
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
                    </div>
                </li>
            
                
    
                </ul>
             </div>
        </ul>
     
     	<form action="${conPath}orders/orderresult" id="orderresult" method="post" >
       	 <table border="1" class="table4">
            <h2>주문정보</h2>
            <tr>
                <th><h5>주문하시는분</h5></th>
                <td><input type="text" id="username" value="${userbean.mname}" readonly></td>
            </tr>
            <tr>
                <th><h5>휴대폰</h5></th>
                <td><input type="text" id="usertel" value="${userbean.mphone }" readonly></td>
            </tr>
            <tr>
                <th rowspan="3"><h5>주소</h5></th>
                <td>주소 : <input type="text" id="useraddress" value="${userbean.maddress }" readonly > </td>
                
            </tr>
            <tr>
            	<td>우편 번호 : <input type="text" id="userpost" value="${userbean.mpost }" readonly></td>
            </tr>
			<tr>
				<td>상세주소 : <input type="text" id="useraddress2" value="${userbean.maddress2 }" readonly ></td>
			</tr>            
            </table>
            <table border="1" class="table4">
                <h2>배송지정보</h2> 
                <br/>
             
             	<h4> <input id="same" type="checkbox" onclick="contentcheck()">&nbsp;&nbsp; 위 주문자와 주소 동일&nbsp; </h4>
                <tr>
                    <th><h5>배송받는분</h5></th>
                <td><input type="text" id="o_NAME" name="o_NAME"></td>
                </tr>
                <tr>
                    <th><h5>휴대폰</h5></th>
                    <td><input type="text" id="o_PHONE" name="o_PHONE"></td>
                </tr>
                <tr>
                    <th rowspan="3"><h5>주소</h5></th>
                    <td>주소 : <input type="text" id="o_ADDRESS" name="o_ADDRESS" readonly>&nbsp;<input type="button" id="addressbtn" value="주소검색" ></td>
                </tr>
                 <tr>
            		 <td>우편 번호 : <input type="text" id="o_post" name="o_post" readonly></td>
            	</tr>
                <tr>
                    <td>상세 주소 : <input type="text" id="o_ADDRESS2" name="o_ADDRESS2"></td>
              	</tr>
              </table>
                
                
                
                <table border="1" class="table1">
                    <h2>결제방법</h2>
                    <tr>
                        <th><h5>계좌이체</h5></th>
                        <td><input type="checkbox" name="payment" id="BankTransfer" value="BankTransfer" onclick="paymentcheck(BankTransfer)"></td>
                        <th><h5>신용카드</h5></th>
                        <td><input type="checkbox" name="payment" id="card" value="card" onclick="paymentcheck(card)"></td>
                        <th><h5>무통장입금</h5></th>
                        <td><input type="checkbox" name="payment" id="bankbook" value="bankbook" onclick="paymentcheck(bankbook)"></td>
                        <th><h5>핸드폰결제</h5></th>
                        <td><input type="checkbox" name="payment" id="phone" value="phone" onclick="paymentcheck(phone)"></td>
                    </tr>
                   </table>

        <div class="section4">
     	   <input type="hidden" id="o_PAYMENT" name="o_PAYMENT" value="">
     	    <input type="hidden" id="cartcid" name="cha[]" value="">
     	     <input type="hidden" id="o_money" name="o_money" value="${allsum }">
           <input type="submit" value="결제하기" onclick='return ordercheck();' >
   		 	<br/>
   		</div>
    	</form>
    	
    	
    <div class="section5">
            <table border="1" class="table4">
                <tr>
                    <th>이용안내</th>
    
                </tr>
                <tr>
                    <td>
                        <ul>
                            <li><h2>세금계산서 발행 안내</h2></li>
                        <li>■ 부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수 있습니다.
                            세금계산서는 사업자만 신청하실 수 있습니다.</li><br/>
                        <li>■ 세금계산서는 사업자만 신청하실 수 있습니다.</li><br/>
                        <li>■ 배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</li><br/>
                        <li>■ [세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로 사업자등록증사본을 보내셔야 세금계산서 발생이 가능합니다.</li><br/>
                        <li>■ [세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</li><br/>
                        <li><h2>무이자할부 이용안내</h2></li>
                        <li>■ 상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</li><br/>
                        <li>■ [전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</li><br/>
                        <li>■ 단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</li><br/>
                    </td>
                </ul>
    
                </tr>
            </table>
        </div>
    </div>
    </div>
    <c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script>
 $("#addressbtn").click(function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	
			var addr = ''; // 주소 변수
			var extraAddr =''; // 참고항목 변수
			
			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
         if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
             addr = data.roadAddress;
         } else { // 사용자가 지번 주소를 선택했을 경우(J)
             addr = data.jibunAddress;
         }			
         // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
         if(data.userSelectedType === 'R'){
             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
             if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                 extraAddr += data.bname;
             }
             // 건물명이 있고, 공동주택일 경우 추가한다.
             if(data.buildingName !== '' && data.apartment === 'Y'){
                 extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
             }
             // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
             if(extraAddr !== ''){
                 extraAddr = ' (' + extraAddr + ')';
             }
             // 조합된 참고항목을 해당 필드에 넣는다.
             $("#receiveraddress2").val(extraAddr);           
	            
         } else {
	                $("#receiveraddress2").val(' ');
	            }
         // 우편번호와 주소 정보를 해당 필드에 넣는다.
         $("#receiverpost").val(data.zonecode);
         $("#receiveraddress").val(addr);
         $("#receiveraddress2").focus();
     	}
	    }).open();
	});	
 </script>
</body>
</html>