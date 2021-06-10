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
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
 
    <link href="../css/main.css" rel="stylesheet">
    <script src="../js/jquery-3.5.1.min.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/slidescript.js"></script>
    <script src="../js/1.js"></script>
    <script src="../js/4.js"></script>
    <script >
        function showPopup() { 
        	window.open("${conPath}popup/popup1", "veiwimg", "width=1050, height=600, left=300, top=500, toolbar=no,scrollbars=no,status=no,location=no"); 
        	}
	</script>    
<body>
</div>
        <!-- 중간에 컨텐츠부분 -->
        <div id="contents2">
        <c:choose>
						<c:when test="${empty productlist }">
								게시물이 없습니다!.
						</c:when>
						<c:otherwise>
						<c:forEach var="obj" items="${productlist }">
            <div id="top">
                <div class="left">
                    <ul>
                        <li> <img src="${conPath }upload/${obj.pIMAGE1 }" class="img1" onclick="showPopup();"></li>
                        <li><img src="${conPath }upload/${obj.pIMAGE1 }" class="img2" onclick="showPopup();"></li>
                        <li><img src="${conPath }upload/${obj.pIMAGE1 }" class="img3" onclick="showPopup();"></li>
                    </ul>
    
                    <p class="nex"><img src="img/btn_next.png" alt="이전으로"></p>
                    <p class="pre"><img src="img/btn_prev.png" alt="다음으로"></p>
                </div>
                <div class="right">
                    <a href="#"><img src="${conPath }upload/${obj.pIMAGE1 }" class="img4" onclick="showPopup();"></a>
    
                    <a href="#"><img src="${conPath }upload/${obj.pIMAGE1 }" class="img5" onclick="showPopup();"></a>
  
                </div>
            </div>
    
            <!-- 중앙박스  -->
            <div id="section">
                <div id="best">           
                    <ul>
                       <li><a href="#">BEST</a></li> 
                    </ul>                            
            </div>
                <div class="left">
                    <div class="box">
                        <a href="${conPath }productContent"><img src="${conPath }upload/${obj.pIMAGE1 }" id="image"></a>
                        <p id="buttonp">
                            <span class="span1">						
                                <a href="#"><img id="span_icon" src="img/z.png"></a>
                                <a href="#"><img id="span_icon" src="img/x.png"></a>
                                <a href="#"><img id="span_icon" src="img/c.png"></a>
                                <a href="#"><button class="popup1" onclick="showPopup()" ><img id="span_gif" src="img/v.gif"></button></a>
                            </span>
                        <a href="#"><h3>${obj.pNAME }</h3></a>
                        <a href="#"><p>￦${obj.pPRICE }</p></a>
                    </div>
                    <div class="box">
                        <a href="${conPath }productContent"><img src="${conPath }upload/${obj.pIMAGE1 }" id="image"></a>
                        <p id="buttonp">
                            <span class="span1">						
                                <a href="#"><img id="span_icon" src="img/z.png"></a>
                                <a href="#"><img id="span_icon" src="img/x.png"></a>
                                <a href="#"><img id="span_icon" src="img/c.png"></a>
                                <a href="#"><img id="span_gif" src="img/v.gif"></a>
                            </span>
                        <a href="#"><h3>${obj.pNAME }</h3></a>
                        <a href="#"><p>￦${obj.pPRICE }</p></a>
                    </div>
                    <div class="box">
                        <a href="${conPath }productContent"><img src="${conPath }upload/${obj.pIMAGE1 }" id="image"></a>
                        <p id="buttonp">
                            <span class="span1">						
                                <a href="#"><img id="span_icon" src="img/z.png"></a>
                                <a href="#"><img id="span_icon" src="img/x.png"></a>
                                <a href="#"><img id="span_icon" src="img/c.png"></a>
                                <a href="#"><img id="span_gif" src="img/v.gif"></a>
                            </span>
                        <a href="#"><h3>${obj.pNAME }</h3></a>
                        <a href="#"><p>￦${obj.pPRICE }</p></a>
                    </div>
                    <div class="box">
                        <a href="${conPath }productContent"><img src="${conPath }upload/${obj.pIMAGE1 }" id="image"></a>
                        <p id="buttonp">
                            <span class="span1">						
                                <a href="#"><img id="span_icon" src="img/z.png"></a>
                                <a href="#"><img id="span_icon" src="img/x.png"></a>
                                <a href="#"><img id="span_icon" src="img/c.png"></a>
                                <a href="#"><img id="span_gif" src="img/v.gif"></a>
                            </span>
                        <a href="#"><h3>${obj.pNAME }</h3></a>
                        <a href="#"><p>￦${obj.pPRICE }</p></a>
                    </div>
                    <div class="box">
                        <a href="${conPath }productContent"><img src="${conPath }upload/${obj.pIMAGE1 }" id="image"></a>
                        <p id="buttonp">
                            <span class="span1">						
                                <a href="#"><img id="span_icon" src="img/z.png"></a>
                                <a href="#"><img id="span_icon" src="img/x.png"></a>
                                <a href="#"><img id="span_icon" src="img/c.png"></a>
                                <a href="#"><img id="span_gif" src="img/v.gif"></a>
                            </span>
                        <a href="#"><h3>${obj.pNAME }</h3></a>
                        <a href="#"><p>￦${obj.pPRICE }</p></a>
                    </div>
                    <div class="box">
                        <a href="${conPath }productContent"><img src="${conPath }upload/${obj.pIMAGE1 }" id="image"></a>
                        <p id="buttonp">
                            <span class="span1">						
                                <a href="#"><img id="span_icon" src="img/z.png"></a>
                                <a href="#"><img id="span_icon" src="img/x.png"></a>
                                <a href="#"><img id="span_icon" src="img/c.png"></a>
                                <a href="#"><img id="span_gif" src="img/v.gif"></a>
                            </span>
                        <a href="#"><h3>${obj.pNAME }</h3></a>
                        <a href="#"><p>￦${obj.pPRICE }</p></a>
                    </div>
                </div>
                <div class="right">
                    <a href="${conPath }productContent"><img src="${conPath }upload/${obj.pIMAGE1 }" id="img12"></a>
                        <p id="buttonp">
                            <span class="span1">						
                                <a href="#"><img id="span_icon" src="img/z.png"></a>
                                <a href="#"><img id="span_icon" src="img/x.png"></a>
                                <a href="#"><img id="span_icon" src="img/c.png"></a>
                                <a href="#"><img id="span_gif" src="img/v.gif"></a>
                            </span>
                        <a href="#"><h3>${obj.pNAME }</h3></a>
                        <a href="#"><p>￦${obj.pPRICE }</p></a>
                </div>
            </div>
    
            <!-- 가로로긴박스 -->
            <div>
                <article class="side3">
                    <a href="#">
                        <h3>NEW</h3>
                    </a>
                </article>
            </div>
            <!-- /* 박스 4개 부분  -->
    
            <div class="section1">
                <div class="container">
                    <div class="quick">
                        <a href="${conPath }productContent"><img src="${conPath }upload/${obj.pIMAGE1 }" id="image"></a> 
                        <p id="buttonp">
                           <span class="span1">						
                               <a href="#"><img id="span_icon" src="img/z.png"></a>
                               <a href="#"><img id="span_icon" src="img/x.png"></a>
                               <a href="#"><img id="span_icon" src="img/c.png"></a>
                               <a href="#"><img id="span_gif" src="img/v.gif"></a>
                           </span>
                           </p>
                            <a href="#">
                               <h3>${obj.pNAME }</h3>
                               <p>￦${obj.pPRICE }</p>
                           </a>
                   </div>
                   <div class="quick">
                    <a href="${conPath }productContent"><img src="${conPath }upload/${obj.pIMAGE1 }" id="image"></a> 
                    <p id="buttonp">
                       <span class="span1">						
                           <a href="#"><img id="span_icon" src="img/z.png"></a>
                           <a href="#"><img id="span_icon" src="img/x.png"></a>
                           <a href="#"><img id="span_icon" src="img/c.png"></a>
                           <a href="#"><img id="span_gif" src="img/v.gif"></a>
                       </span>
                       </p>
                        <a href="#">
                           <h3>${obj.pNAME }</h3>
                           <p>￦${obj.pPRICE }</p>
                       </a>
               </div>
               <div class="quick">
                <a href="${conPath }productContent"><img src="${conPath }upload/${obj.pIMAGE1 }" id="image"></a> 
                <p id="buttonp">
                   <span class="span1">						
                       <a href="#"><img id="span_icon" src="img/z.png"></a>
                       <a href="#"><img id="span_icon" src="img/x.png"></a>
                       <a href="#"><img id="span_icon" src="img/c.png"></a>
                       <a href="#"><img id="span_gif" src="img/v.gif"></a>
                   </span>
                   </p>
                    <a href="#">
                       <h3>${obj.pNAME }</h3>
                       <p>￦${obj.pPRICE }</p>
                   </a>
           </div>
           <div class="quick">
            <a href="${conPath }productContent"><img src="${conPath }upload/${obj.pIMAGE1 }" id="image"></a> 
            <p id="buttonp">
               <span class="span1">						
                   <a href="#"><img id="span_icon" src="img/z.png"></a>
                   <a href="#"><img id="span_icon" src="img/x.png"></a>
                   <a href="#"><img id="span_icon" src="img/c.png"></a>
                   <a href="#"><img id="span_gif" src="img/v.gif"></a>
               </span>
               </p>
                <a href="#">
                   <h3>${obj.pNAME }</h3>
                   <p>￦${obj.pPRICE }</p>
               </a>
       </div>
                </div>
                <div class="container">
                    <div class="quick">
                        <a href="${conPath }productContent"><img src="${conPath }upload/${obj.pIMAGE1 }" id="image"></a> 
                        <p id="buttonp">
                           <span class="span1">						
                               <a href="#"><img id="span_icon" src="img/z.png"></a>
                               <a href="#"><img id="span_icon" src="img/x.png"></a>
                               <a href="#"><img id="span_icon" src="img/c.png"></a>
                               <a href="#"><img id="span_gif" src="img/v.gif"></a>
                           </span>
                           </p>
                            <a href="#">
                               <h3>${obj.pNAME }</h3>
                               <p>￦${obj.pPRICE }</p>
                           </a>
                   </div>
                   <div class="quick">
                    <a href="${conPath }productContent"><img src="${conPath }upload/${obj.pIMAGE1 }" id="image"></a> 
                    <p id="buttonp">
                       <span class="span1">						
                           <a href="#"><img id="span_icon" src="img/z.png"></a>
                           <a href="#"><img id="span_icon" src="img/x.png"></a>
                           <a href="#"><img id="span_icon" src="img/c.png"></a>
                           <a href="#"><img id="span_gif" src="img/v.gif"></a>
                       </span>
                       </p>
                        <a href="#">
                           <h3>${obj.pNAME }</h3>
                           <p>￦${obj.pPRICE }</p>
                       </a>
               </div>
               <div class="quick">
                <a href="${conPath }productContent"><img src="${conPath }upload/${obj.pIMAGE1 }" id="image"></a> 
                <p id="buttonp">
                   <span class="span1">						
                       <a href="#"><img id="span_icon" src="img/z.png"></a>
                       <a href="#"><img id="span_icon" src="img/x.png"></a>
                       <a href="#"><img id="span_icon" src="img/c.png"></a>
                       <a href="#"><img id="span_gif" src="img/v.gif"></a>
                   </span>
                   </p>
                    <a href="#">
                       <h3>${obj.pNAME }</h3>
                       <p>￦${obj.pPRICE }</p>
                   </a>
           </div>
           <div class="quick">
            <a href="${conPath }productContent"><img src="${conPath }upload/${obj.pIMAGE1 }" id="image"></a> 
            <p id="buttonp">
               <span class="span1">						
                   <a href="#"><img id="span_icon" src="img/z.png"></a>
                   <a href="#"><img id="span_icon" src="img/x.png"></a>
                   <a href="#"><img id="span_icon" src="img/c.png"></a>
                   <a href="#"><img id="span_gif" src="img/v.gif"></a>
               </span>
               </p>
                <a href="#">
                   <h3>${obj.pNAME }</h3>
                   <p>￦${obj.pPRICE }</p>
               </a>
       </div>
                </div>
                <div class="container">
                    <div class="quick">
                        <a href="${conPath }productContent"><img src="${conPath }upload/${obj.pIMAGE1 }" id="image"></a> 
                        <p id="buttonp">
                           <span class="span1">						
                               <a href="#"><img id="span_icon" src="img/z.png"></a>
                               <a href="#"><img id="span_icon" src="img/x.png"></a>
                               <a href="#"><img id="span_icon" src="img/c.png"></a>
                               <a href="#"><img id="span_gif" src="img/v.gif"></a>
                           </span>
                           </p>
                            <a href="#">
                               <h3>${obj.pNAME }</h3>
                               <p>￦${obj.pPRICE }</p>
                           </a>
                   </div>
                   <div class="quick">
                    <a href="${conPath }productContent"><img src="${conPath }upload/${obj.pIMAGE1 }" id="image"></a> 
                    <p id="buttonp">
                       <span class="span1">						
                           <a href="#"><img id="span_icon" src="img/z.png"></a>
                           <a href="#"><img id="span_icon" src="img/x.png"></a>
                           <a href="#"><img id="span_icon" src="img/c.png"></a>
                           <a href="#"><img id="span_gif" src="img/v.gif"></a>
                       </span>
                       </p>
                        <a href="#">
                           <h3>${obj.pNAME }</h3>
                           <p>￦${obj.pPRICE }</p>
                       </a>
               </div>
               <div class="quick">
                <a href="${conPath }productContent"><img src="${conPath }upload/${obj.pIMAGE1 }" id="image"></a> 
                <p id="buttonp">
                   <span class="span1">						
                       <a href="#"><img id="span_icon" src="img/z.png"></a>
                       <a href="#"><img id="span_icon" src="img/x.png"></a>
                       <a href="#"><img id="span_icon" src="img/c.png"></a>
                       <a href="#"><img id="span_gif" src="img/v.gif"></a>
                   </span>
                   </p>
                    <a href="#">
                       <h3>${obj.pNAME }</h3>
                       <p>￦${obj.pPRICE }</p>
                   </a>
           </div>
           <div class="quick">
            <a href="${conPath }productContent"><img src="${conPath }upload/${obj.pIMAGE1 }" id="image"></a> 
            <p id="buttonp">
               <span class="span1">						
                   <a href="#"><img id="span_icon" src="img/z.png"></a>
                   <a href="#"><img id="span_icon" src="img/x.png"></a>
                   <a href="#"><img id="span_icon" src="img/c.png"></a>
                   <a href="#"><img id="span_gif" src="img/v.gif"></a>
               </span>
               </p>
                <a href="#">
                   <h3>${obj.pNAME }</h3>
                   <p>￦${obj.pPRICE }</p>
               </a>
                 	</c:forEach>
						</c:otherwise>
					</c:choose>
       </div>
                </div>
            </div> 
            <div class="paging">
				<c:if test="${startPage > BLOCKSIZE }">
					<a href="${conPath }/productList.do?pageNum=${startPage-1}"> 〈  &nbsp; </a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${i eq pageNum }">
						<b> &nbsp; ${i }</b>
					</c:if>
					<c:if test="${i != pageNum }">
						<a href="${conPath }/productList.do?pageNum=${i }">&nbsp; ${i }</a>
					</c:if>
				</c:forEach>
				<c:if test="${endPage < pageCnt }">
					<a href="${conPath }/productList.do?pageNum=${endPage+1}">  &nbsp; 〉 </a>
				</c:if>
			</div>      
        </div>
</body>
</html>