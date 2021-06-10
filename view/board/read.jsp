<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="conPath" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<body>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로젝트</title>
<link href="../css/view.css" rel="stylesheet">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
                <script>
                
                var text = ${readContentBean.content_text};
                
                text = text.replace(/<br\/>/ig, "\n");
                text = text.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");


                text = text.replace(/(<([^>]+)>)/gi, "");
                text = text.replace(/&nbsp;/gi,"");
                
                $('#board_content').val(text);
                
                </script>
</head>


<c:import url="/WEB-INF/view/include/top_menu.jsp"/>

    
        <!-- 중간에 컨텐츠부분 -->
        <div id="contents2">
            <div id="contents3">
                <input class="qna" type="button" value="Q & A">
        </div>
       
            <div id="contents4">
           
           
            <table border="1" class="table">
             
             
         <c:if test="${readContentBean.content_file !=null}">
                <th>IMAGE</th>
                <td colspan="3"><img src="${conPath }upload/${readContentBean.content_file }" width="15%"/></td>	
            </c:if>               
                </table>
            
        <table border="1" class="table">
        
            <tr>
                <th>글번호</th>
                <td colspan="3"><input type="text" id="content_idx" value="${content_idx}" readonly></td>  
            </tr>
            <tr>
                <th>제목</th>
                <td colspan="3"><input type="text" id="content_subject" name="board_subject" class="form-control" value="${readContentBean.content_subject }" disabled="disabled"/></td>  
            </tr>
            <tr>
                <th>작성자</th>
                <td colspan="3" ><input type="text" id="content_write_name" name="board_writer_name" class="form-control" value="${readContentBean.content_write_name }" disabled="disabled"/></td>
                
            </tr>
         
             <tr>
                <th>등록일</th>
                <td><input type="text" id="content_date" name="board_date" class="form-control" value="${readContentBean.content_date }" disabled="disabled"/></td>  
            </tr>
            <tr>
                <th>조회수</th>
                <td><input type="text" id="content_hit" name="board_hit" class="form-control" value="${content_hit }" disabled="disabled"/></td> 
            </tr>
            <tr class="tr20">
                
                <td colspan="4"><textarea id="board_content" name="board_content" class="form-control" rows="10" style="resize:none" disabled="disabled">${readContentBean.content_text }</textarea></td>
          
 
		
            
        </table>
        
        
        </form>
        <div class="section3">
       
        
		<c:if test="${readContentBean.content_writer_idx  >= 0}">
		
		<input type="hidden" name="content_idx" value="${content_idx }" />
	<input type="hidden" name="content_bno" value="${readContentBean.content_bno }" />
	<input type="hidden" name="page" value="${page }" />
		
          <a href="${conPath }board/main?board_info_idx=${board_info_idx}"><img src="../img/btn_list.gif" alt="목록"></a>
            </c:if>
           
             <c:choose>
			<c:when test="${loginUserBean.mlevel > 0}">
			<a href="${conPath }board/delete?board_info_idx=${board_info_idx}&content_idx=${content_idx}"><img src="../img/btn_delete.gif" alt="삭제"></a>
			<a href="${conPath }board/reply?content_bno=${readContentBean.content_bno}&board_info_idx=${board_info_idx}&content_idx=${content_idx}&page=${page}"><img src="../img/btn_reply.gif" alt="답변"></a>
			
			</c:when>
			
			
			<c:when test="${readContentBean.content_writer_idx == loginUserBean.midx}">
            
            <a href="${conPath }board/modify?board_info_idx=${board_info_idx}&content_idx=${content_idx}&page=${page}"><img src="../img/btn_modify.gif" alt="수정"></a>
			<a href="${conPath }board/delete?board_info_idx=${board_info_idx}&content_idx=${content_idx}&board_info_idx=${board_info_idx}&content_idx=${content_idx}&page=${page}"><img src="../img/btn_delete.gif" alt="삭제"></a>
			
           </c:when>
           	</c:choose>
           	
           	<div id="re_comment">
                 <fieldset>
        		<legend>댓글 입력</legend>
                <p><strong>댓글달기</strong>
                <span class="comments"> 
                이름 : <input  id="comment_name" name="comment_name" fw-filter="isFill" fw-label="댓글작성자" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"/></span>
                비밀번호 : <input id="comment_password" name="comment_password" fw-filter="isFill" fw-label="댓글비밀번호" fw-msg="" value="" type="password"/>
                <span class="secret displaynone">
               
    <input type="checkbox" name="content_secret" id="content_secret" value="Y" class="checkbox" /><span class="ml_10">공개</span>&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="checkbox" name="content_secret" id="content_secret" value="N" class="checkbox" /><span class="ml_10">비공개</span>&nbsp;
</span><a href="#none" onclick="" class="displaynone">
                <img src="../img/btn_co.gif" alt="관리자답변보기"></a></p>
                 <div class="view">
                 <textarea id="comment_text" name="comment" fw-filter="isFill" fw-label="댓글내용" fw-msg=""></textarea>                    
                 <a href="#none" onclick="BOARD_COMMENT.comment_insert('/exec/front/Board/CommentWrite/4');" class="co_submit ">
                 <img src="../img/btn_submit.gif" alt="확인"></a>
                  </div>
                 <!--   <p class="grade displaynone"></p>
                   <p class="displaynone"> /  byte</p>
                   <p class="captcha displaynone">
                   <span class="ec-base-help txtInfo">왼쪽의 문자를 공백없이 입력하세요.(대소문자구분)</span>
                        </p>-->
                    </fieldset>
        		</div>
           	
           	
           	
           	
           	
           	
		
		<script>

function moveReply(){

location="${conPath }board/reply?content_bno=${board.content_bno}&board_info_idx=${board_info_idx}&content_idx=${content_idx}&page=${page}";

// board.jsp에서 버튼 누르면 Controller의 String reply 호출

}

</script>



		
		
			
		
            
            </div>     
       </div>
       </div>
  <c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>

</body>
</html>



</html>