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
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로젝트</title>
<link href="../css/tab_style.css" rel="stylesheet">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
<script>
        $(function () {
            var $tabBtn = $('.tabArea .tabBtn');
            var $tabCon = $('.tabArea .tabCon');
            $tabBtn.click(function (e) {
                e.preventDefault();              //기본 동작을 취소
                $tabBtn.removeClass('xx');
                $(this).addClass('xx');
                $tabCon.hide();
                $(this).next('.tabCon').show();

            });
        });
    </script>
</head>

<body>
 <c:import url="/WEB-INF/view/include/top_menu.jsp"/>
	</div>
	<!-- 중간에 컨텐츠부분 -->
	<div id="contents2">

    <div class="tabArea">   
        <ul class="tabList" >           
            <c:forEach var="obj" items="${qnaTopList}" >
        	 <li style="text-align: center;"><a href="${conPath }board/main?board_info_idx=${obj.board_info_idx}" style="padding_top:10px; font-size: 17px;  font-weight: bold; line-height: 50px; color:rgb(69, 80, 102);"> ${obj.board_info_name }</a><li>
         	</c:forEach>
                <div class="tabCon_notice" >                
                    <table class="table_table_striped" >
                    <colgroup>
                    <col width="10%">
                    <col width="40%">
                    <col width="20%">
                    <col width="10%">
                    <col width="10%">
                    <col width="10%">
                    </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">번호</th>                               
                                <th scope="col">제목</th>
                                <th scope="col">이미지</th>
                                <th scope="col">작성자</th>
                                <th scope="col">등록일</th>
                                <th scope="col">조회수</th>
                            </tr>
                            
                        </thead>
                        <tbody>
                         <c:forEach var="obj"  items="${contentList}" begin="0">
                            <c:if test="${obj.content_level < 4}">
			<tr>
				<th  scope="row">${obj.content_idx }</th>
				<c:choose>
					<c:when test="${obj.content_level eq 0}">
						<td> 
						<c:if test="${obj.content_secret eq 'N'}" >
           
            <c:choose>
                <c:when test="${obj.content_writer_idx eq loginUserBean.midx || loginUserBean.mlevel eq '1'}">
                    <c:out value="${obj.content_subject}"/>
                </c:when>
                <c:otherwise>비밀글은 작성자와 관리자만 볼 수 있습니다. <img src="../img/ico_lock.gif" alt="비밀글" /></c:otherwise>
            </c:choose>
        </c:if>
        <c:if test="${obj.content_secret eq 'Y'}" >
        </c:if>
        <a href='${conPath }board/read?board_info_idx=${board_info_idx}&content_idx=${obj.content_idx}&page=${page}'>${obj.content_subject}</a></td>
					</c:when>
					<c:when test="${obj.content_level eq 1}">
						<td>&nbsp;&nbsp;<img alt="" src="../img/icon_re.gif"><a href='${conPath }board/read?board_info_idx=${board_info_idx}&content_idx=${obj.content_idx}&page=${page}'>${obj.content_subject}</a></td>
					</c:when>
					<c:when test="${obj.content_level eq 2}">
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="../img/icon_re.gif"><a href='${conPath }board/read?board_info_idx=${board_info_idx}&content_idx=${obj.content_idx}&page=${page}'>${obj.content_subject}</a></td>
					</c:when>
					<c:when test="${obj.content_level eq 3}">
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<img alt="" src="../img/icon_re.gif"><a href='${conPath }board/read?board_info_idx=${board_info_idx}&content_idx=${obj.content_idx}&page=${page}'>${obj.content_subject}</a></td>
					</c:when>
				</c:choose>                           
                            
                                
         
            
               
                <td><img src="${conPath }upload/${obj.content_file }" width="20%"/></td>	
          
 				
                                                             
                                <td>${obj.content_write_name}</td>
                                <td>${obj.content_date}</td>
						  		<td>${obj.content_hit}</td>
                            </tr>
                            </c:if>
                            </c:forEach>
                        </tbody>
                        
                    </table>
                
  		</div>
	 
           </ul>
           </div>
	<div class="content2">
		<a href="${conPath }board/write?board_info_idx=${board_info_idx}"><img src="../img/btn_write.gif" alt="글쓰기"></a>
	</div>
	<div class="content3">
	
	<ul>
		<div class="paging">
				<ul class="pagination">
						<c:if test="${pagemaker.prev }">
							<li>
								<a class="btn btn-outline-primary"
								href='${conPath}product/productContent${pagemaker.makeQuery(pagemaker.startPage - 1)}'>이전</a>
							</li>
						</c:if>
						<c:forEach begin="${pagemaker.startPage }"
							end="${pagemaker.endPage }" var="pageNum">
							<li><a class="btn btn-outline-primary"
								href="${conPath}product/productContent${pagemaker.makeQuery(pageNum)}">${pageNum }</a></li>
						</c:forEach>
						<c:if test="${pagemaker.next && pagemaker.endPage >0 }">
							<li><a class="btn btn-outline-primary"
								href='${conPath}product/productContent${pagemaker.makeQuery(pagemaker.endPage + 1)}'>다음</a>
							</li>
						</c:if>
				</ul>
			</div>


		</ul>
	</div>
	
		
	
	<div class="content4">
		<ul>
			검색어 <select>
			<a><option value="1">일주일</option>
			<option value="2">한달</option>
			<option value="3">세달</option>
			<option value="4">전체</option></select></a>
			<a><select>
				<option value="1">제목</option>
				<option value="2">내용</option>
				<option value="3">글쓴이</option>
				<option value="2">아이디</option>
				<option value="3">별명</option>
				<option value="4">상품정보</option></select></a>
			<a><input placeholder value type="search"> </a>	
			<a><a href="" onclick=""><img src="../img/btn_find.gif"></a></a>
			</ul>
	</div>
    </div>
    


	<c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>
</body>

</html>
</html>