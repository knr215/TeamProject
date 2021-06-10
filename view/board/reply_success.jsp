<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='conPath' value='${pageContext.request.contextPath }/'/>
<script>
	alert('저장되었습니다')
	location.href = '${conPath}board/main?content_bno=${replyContentBean.content_bno}&content_step=${replyContentBean.content_step}&content_level=${replyContentBean.content_level}&board_info_idx=${replyContentBean.content_board_idx}&content_idx=${replyContentBean.content_idx}&page=${page}'
</script>