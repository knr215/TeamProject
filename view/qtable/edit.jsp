<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로젝트</title>
<link href="../css/writeetc.css" rel="stylesheet">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
<script src="../ckeditor/ckeditor.js"></script>
<script>
window.onload = function(){
   ck = CKEDITOR.replace("editor");
};
</script>
</head>

	<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
        </div>
        <!-- 중간에 컨텐츠부분 -->
        <div id="contents2">
            <div id="contents3">
                <input type="button" value="Q & A">
        </div>
            <div id="contents4">
           
			<form:form action="${conPate }edit_pro?q_idx=${modifyQtableBean.q_idx}" method="post" modelAttribute="modifyQtableBean" enctype="multipart/form-data">			
       <table border="1" class="table">
       
	  
                    <th>IMAGE</th>
                    <td><img src="${conPath }upload/${editQtableBean.q_file  }" width="20%"/></td>
                </table>
                
        <table border="1" class="table">
        

        <tr>
                <th>글번호</th>
                <td colspan="3">${editQtableBean.q_idx }</td>  
            </tr>
            <tr>
                <th>제목</th>
                <td colspan="1"><input type="text" name="q_title" value="${editQtableBean.q_title }"></td>   
            </tr>
            <tr>
                <th>작성자</th>
               <td><input type="text" name="q_name" value="${editQtableBean.q_name }"></td>
                
            </tr>
   
            <tr>
            	<th>등록일</th>
                <td>${editQtableBean.q_date }</td>  
            </tr>
            <tr>
                <th>조회수</th>
                <td>${editQtableBean.q_hit } </td> 
            </tr>
            <tr class="tr20">              
                <td colspan="2"><textarea name="q_content" value="${editQtableBean.q_content } " id="editor">${editQtableBean.q_content }</textarea></td>
            <tr>
                <th>첨부파일</th>
                <td colspan="1">               
               
				<form:input type='file' path='upload_file' class="form-control" accept="image/*"/>
				
				</td>	
            </tr>
            <tr>
                <th>비밀번호</th>
                <td colspan="1"><input type="password" name="q_pwd" ">수정하려면 비밀번호를 입력하세요.</td>	
            </tr>
        
     </table>
        <div class="section3">
             <c:if test="${loginUserBean.mlevel > 0}">
             <input type="submit" value="등록" >
			 <a href="${conPath }qtable/delete?q_idx=${editQtableBean.q_idx}"><img src="../img/btn_delete.gif" alt="삭제"></a>
			</c:if>
			<a href="${conPath }qtable/notice"><img src="../img/btn_list.gif" alt="목록"></a>
            </div>
                    </form:form> 
       </div>
    <c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>
</body>
</html>