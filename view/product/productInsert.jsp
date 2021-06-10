<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='conPath' value="${pageContext.request.contextPath }/"/>


<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link href='../css/productInsert.css' rel='stylesheet'>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="../ckeditor/ckeditor.js"></script>
<script src="${conPath }js/1.js"></script>
<script src="${conPath }js/4.js"></script>
<script src="${conPath }js/5.js"></script>
<script>
window.onload = function(){
   ck = CKEDITOR.replace("editor");
};
</script>
<script type="text/javascript">

 var firstList = new Array("TOP","BOTTOM","OUTER","SHOES/BAG","ACC","SET","HOME/EASY");
        
        // 중분류
        
        var secondList1 = new Array("BL","TEE","SHIRT","KNIT");
        var secondList2 = new Array("PANTS","SKIRT","DRESS");
        var secondList3 = new Array("JACKET","COAT","CARDIGAN","JP","PADDING");
        var secondList4 = new Array("SHOES","BAG");
        var secondList5 = new Array("JEWELRY","HAT","ETC");
        var secondList6 = new Array("SET");
        var secondList7 = new Array("HOME","EASY");
        
          
        // 페이지 로딩시 자동 실행  
        window.onload = function(){
            var v_sidoSelect = document.getElementById("top_name"); // SELECT TAG
              
            for (i =0 ; i<firstList.length; i++){// 0 ~ 3 
                // 새로운 <option value=''>값</option> 태그 생성
                var optionEl = document.createElement("option");
          
                // option태그에 value 속성 값으로 저장
                optionEl.value = firstList[i];
              
                // text 문자열을 새로 생성한 <option> 태그의 값으로 추가
                optionEl.appendChild (document.createTextNode(firstList[i]));
              
                // 만들어진 option 태그를 <select>태그에 추가
                v_sidoSelect.appendChild(optionEl);
            }
          
            var v_gugunSelect = document.getElementById("sub_name"); // SELECT TAG
            v_gugunSelect.style.display = "none";  // 태그 감추기
            var v_gugunSelect = document.getElementById("sub_name"); // SELECT TAG
            v_gugunSelect.style.display = "none";  // 태그 감추기
            var v_gugunSelect = document.getElementById("sub_name"); // SELECT TAG
            v_gugunSelect.style.display = "none";  // 태그 감추기
            var v_gugunSelect = document.getElementById("sub_name"); // SELECT TAG
            v_gugunSelect.style.display = "none";  // 태그 감추기
            var v_gugunSelect = document.getElementById("sub_name"); // SELECT TAG
            v_gugunSelect.style.display = "none";  // 태그 감추기
            var v_gugunSelect = document.getElementById("sub_name"); // SELECT TAG
            v_gugunSelect.style.display = "none";  // 태그 감추기
       
           
          
        }
        
        // 대분류 선택시
        function changeSidoSelect(){
            var v_sidoSelect = document.getElementById("top_name"); // SELECT TAG
            var idx = v_sidoSelect.options.selectedIndex;     // 선택값 0 ~ 8
             
        
            if (idx < 1 && idx > 8){
                return;
            }
          
         	var temp = $("#top_name option:selected").val();
         	console.log(temp);
            gugunSelectFill(idx);   // 중분류 생성
        }
        
        
        function gugunSelectFill(idx){
            var v_gugunSelect = document.getElementById("sub_name"); // SELECT TAG
            var v_gugunSelect = document.getElementById("sub_name");
            var v_gugunSelect = document.getElementById("sub_name");
            var v_gugunSelect = document.getElementById("sub_name");
            var v_gugunSelect = document.getElementById("sub_name");
            var v_gugunSelect = document.getElementById("sub_name");
         
            var data = null;
          
            if (idx == 0) {
                v_gugunSelect.style.display = "none";  // 중분류 태그 감추기
                v_secondSelect.style.display = "none";
                return;
            }
          
            if (idx == 1){
             data = secondList1
           
             }
            if (idx == 2){
             data = secondList2
             
             }
             if (idx == 3){
             data = secondList3
             
             }
             if (idx == 4){
             data = secondList4
             
             }
             if (idx == 5){
             data = secondList5
             
             }
             if (idx == 6){
             data = secondList6
             
             }
             if (idx == 7){
             data = secondList7
             
             }
          
        
            v_gugunSelect.innerHTML = "";  // 태그 출력
              
            for (i =0 ; i<data.length; i++){ 
                // 새로운 <option value=''>값</option> 태그 생성
                var optionEl = document.createElement("option");
          
                // value 속성 태그에 저장
                optionEl.value = data[i];
              
                // text 문자열을 새로 생성한 <option> 태그에 추가
                optionEl.appendChild (document.createTextNode(data[i]));
              
                // 만들어진 option 태그를 <select>태그에 추가
                v_gugunSelect.appendChild(optionEl);
            }
          
        v_gugunSelect.style.display = ""; // 중분류 태그 출력
        
        var kkk = $("#sub_name option:selected").val();
     	console.log(kkk);
        
}

function changeSecondSelect(){
	
	var kkk = $("#sub_name option:selected").val();
 	console.log(kkk);
}
       

 </script>
</head>


<body>

<c:import url="/WEB-INF/view/include/top_menu.jsp"></c:import>


	<div id="productInsert_wrap">
		<div id="productInsert">
		<form name="readform" method="post">
		<input type="hidden" id="page" name="page" value="${scri.page}">
		<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
		</form>
			<form action="${conPath }product/productInsertGo" method="post" enctype="multipart/form-data">
				<table>
					<tr id=sido>
						<td class="title" id="sample">
							카테고리
						</td>
						<td id="pCategory">
						
						
							<select id="top_name" onChange="changeSidoSelect();" name="top_name">
								<option value="">대분류를 선택하세요.</option>
							</select>
							
							<select id="sub_name" onChange="changeSecondSelect();" name="sub_name">
              			  		<option value="">중분류 선택하세요.</option>
            				</select>		
            			
						
            				
            				<span id="pCategoryMsg"> &nbsp; &nbsp; </span>					
						</td>
						
					</tr>
					
						<td class="title">
							상품명
						</td>
						<td>
							<input type="text" class="content" id="pNAME" name="pNAME" autofocus="autofocus">
							<span id="pNAMEMsg"> &nbsp; &nbsp; </span>
						</td>
					</tr>
					<tr>
						<td class="title">
							상품 가격
						</td>
						<td>
							<input type="text" class="content" id="pPRICE" name="pPRICE"> 원
							<span id="pPRICEMsg"> &nbsp; &nbsp; </span>
						</td>
					</tr>
					<tr>
						<td class="title">
							상품 할인율(%)
						</td>
						<td>
							<input type="text" class="content" id="pdiscount" name="pdiscount"> %
							<span id="pDiscountMsg"> &nbsp; &nbsp; </span>
						</td>
					</tr>
					<tr>
                			<td>첫번째 이미지(필수)</td>
                			<td colspan="1"><input type="file" id="imgfile" accept="image/*" name="upload_file"></td>	
          		  	</tr>
         			<tr>
            				<td>두번째 이미지</td>
                			<td colspan="1">
                			<input type="file" id="imgfile2" accept="image/*" name="upload_file2"></td>
            		</tr>
					
					<tr>
						<td class="title">
							교환/환불 규정
						</td>
						<td>
							<input type="text" class="content" 
								value="제품 하자 시 30일 이내 무상 교환">
							<span id="pPolicy1Msg"> &nbsp; &nbsp; </span>
						</td>
					</tr>
					<tr>
						<td class="title">
							배송 규정
						</td>
						<td>
							<input type="text" class="content"  
								value="배송비 기본 1만 원, 10만 원 이상 배송비 무료">
							<span id="pPolicy2Msg"> &nbsp; &nbsp; </span>
						</td>
					</tr>
					<tr>
						<td class="title">
							재고 수량
						</td>
						<td>
							<input type="text" class="content" id="pSTOCK" name="pSTOCK"> 개
							<span id="pSTOCKMsg"> &nbsp; &nbsp; </span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea name="pCONTENT" id="pCONTENT" cols="20" rows="20" style="resize:none"></textarea>
							<script>
								CKEDITOR.replace('pCONTENT');
							</script>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="colspan">
							<input type="submit" id="submit" value="Write" class="btn">
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