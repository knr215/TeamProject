<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <c:set var="conPath" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>

</head>
<body>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로젝트</title>
<link href="../css/writeetc.css" rel="stylesheet">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
<script src="../js/7.js"></script>
<script src="../ckeditor/ckeditor.js"></script>
<script>
window.onload = function(){
   ck = CKEDITOR.replace("editor");
};
</script>
</head>


<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
        
        <!-- 중간에 컨텐츠부분 -->
        <div id="contents2">
            <div id="contents3">
                <input type="button" value="Q & A">
        </div>
            <div id="contents4">
           
<form:form action='${conPath }board/write_pro' method='post' enctype="multipart/form-data" modelAttribute="writeContentBean">
        <form:hidden path="content_idx"/>
		<form:hidden path="content_board_idx"/>
		<input type="hidden" value="${page}"/>
        <table border="1" class="table">
            <tr>
                <th>제목</th>
                <td colspan="1"><form:input path="content_subject"  name="q_title"/></td>				
				
            </tr>
            <tr>
                <th>작성자</th>
                <td><form:input path="content_write_name" name="q_name"/></td>
                
            </tr>           
            <tr class="tr20">
                
                <td colspan="2" ><form:textarea path="content_text" id="editor" />
                </td>
                
            <tr>
                <th><form:label path="content_file">첨부 이미지</form:label></th>
                <td><form:input type='file' path='upload_file' class="form-control" accept="image/*"/></td>
          	
            </tr>
            <tr>
                <th>비밀번호</th>
                <td colspan="1"><input type="password" name="mpw"></td>	
            </tr>
            <tr>
                <th>비밀글설정</th>
                <td colspan="1">
    <input type="checkbox" name="content_secret" id="content_secret" value="Y" class="checkbox" /><span class="ml_10">공개</span>&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="checkbox" name="content_secret" id="content_secret" value="N" class="checkbox" /><span class="ml_10">비공개</span>&nbsp;
</td>
	
            </tr>
            <tr class="tr21">
                <th class="tha">개인정보 수집 및 이용동의</th>
                <td colspan="1"><textarea >■ 개인정보의 수집·이용 목적
					서비스 제공 및 계약의 이행, 구매 및 대금결제, 물품배송 또는 청구지 발송, 회원관리 등을 위한 목적
						■ 수집하려는 개인정보의 항목
						이름, 주소, 연락처, 이메일 등
						■ 개인정보의 보유 및 이용 기간
						회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외없이 해당정보를 파기합니다. 
                </textarea><br/>
                <br/>
                    개인정보 수집 및 이용에 동의하십니까?<input type="checkbox">동의함<input type="checkbox">동의안함 
                </td>	
            </tr>
        </table>
        <div class="section3">
               <form:button><img src="../img/btn_register.gif" alt="등록"></form:button>
                 <a href="${conPath }board/delete?board_info_idx=${ board_info_idx}"><img src="../img/btn_delete.gif" alt="삭제"></a>
            <a href="${conPath }board/main?board_info_idx=${ board_info_idx}"><img src="../img/btn_list.gif" alt="목록"></a>
            </div>
            </form:form>     
       </div>
       </div>
   <c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>    
  
</body>
</html>