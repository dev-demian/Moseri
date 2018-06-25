<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>


    <!-- views/board/reply_list.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글 목록 페이지</title>

 <link rel="stylesheet" type="text/css" href="${root}/res/css/boardwrite.css">
    <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css"/>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="${root}/res/js/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${root}/res/js/common.js"></script>

</head>
<body>
	          
<table style="width:700px">

<c:forEach var="row" items="${list}">   
	<tr>
		<td>
			<div><span style="color:#003399">${row.replyer}</span> 
			
			( <fmt:formatDate value="${row.regdate}"
				 pattern="yyyy-MM-dd a HH:mm:ss" />)<br></div>
			${row.replytext}
		</td>
	</tr>
</c:forEach>	
</table>

</body>
</html>
