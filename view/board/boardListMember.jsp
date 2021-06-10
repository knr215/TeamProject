<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href='../css/qnaList.css' rel='stylesheet'>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
<script>
$(document).ready(function(){
   
});
</script>
</head>
<body>
<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
   <div id="memberList_wrap">
      <div id="memberList">
         <div class="subject">
            <span>&nbsp; QnA &nbsp;</span>
         </div>
         <div id="reviewList">
            <table>
            <tr><td class="title">번호</td>
               <td class="title">제목</td>
               <td class="title">사진</td>
               <td class="title">Q&A</td>
               <td class="title">작성날짜</td>
               <td class="title">작성자</td>
               <td class="title">조회수</td>
            </tr>
            <c:if test="${boardsList.size() eq 0 }">
               <tr>
                  <td colspan="8">등록한 문의가 없습니다.</td>
               </tr>
            </c:if>
            <c:forEach items="${boardsList}" var="list">
            ${list.content_writer_idx}
            ${loginUserBean.midx}
            <c:choose>
            
            
             <c:when test="${list.content_writer_idx eq loginUserBean.midx }">
             <c:if test="${boardsList.size() != 0 }">
                  
            
            
                  <tr>
                     <td>${list.content_idx}</td>
                     <td>${list.content_subject }</td>
                     <c:if test="${empty list.content_file }">
                        <td>x</td>
                     </c:if>
                     <c:if test="${not empty list.content_file }">
                     <td><img src="${conPath}/upload/${list.content_file}" width="25%"></td>                        
                     </c:if>
                      
               
                     <td><a href="${conPath}/board/read?midx=${readContentBean.content_writer_idx}&board_info_idx=1&content_idx=${list.content_idx}&page=${page}">문의바로가기</a></td>
                     <td>${list.content_date }</td>
                     <td>${list.content_write_name}</td>
                     <td>${list.content_hit}</td>
                  
                  </tr>
                  
               
               </c:if>
                </c:when>
            
            </c:choose>
            </c:forEach>
            
         </table>
            <div class="paging">
            <ul class="pagination">
                  <c:if test="${pagemaker.prev }">
                     <li>
                        <a class="btn btn-outline-primary"
                        href='${conPath}/review/reviewlist${pagemaker.makeQuery(pagemaker.startPage - 1)}'>이전</a>
                     </li>
                  </c:if>
                  <c:forEach begin="${pagemaker.startPage }"
                     end="${pagemaker.endPage }" var="pageNum">
                     <li><a class="btn btn-outline-primary"
                        href="${conPath}/review/reviewlist${pagemaker.makeQuery(pageNum)}">${pageNum }</a></li>
                  </c:forEach>
                  <c:if test="${pagemaker.next && pagemaker.endPage >0 }">
                     <li><a class="btn btn-outline-primary"
                        href='${conPath}/review/reviewlist${pagemaker.makeQuery(pagemaker.endPage + 1)}'>다음</a>
                     </li>
                  </c:if>
            </ul>
            </div>
            
            
            
            
         </div>
      </div>
   </div>
  <c:import url="/WEB-INF/view/include/bottom_menu.jsp"/> 
</body>
</html>