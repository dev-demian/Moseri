<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
	<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>
     <script>
            		$("#btnWrite").click(function(){
            			location.href="${root}/boardwrite";
            			
            		});
            		
            	function list(page){
            		location.href="${root}/boardhome?curPage="+page;
            	}
            
            </script>        
           
       <div class="container">
       <div class="row">
       <div class="col-sm-4"></div>
       <div class="col-sm-4 title-font">게시판</div>
       <div class="col-sm-4"></div>
		</div>
			<div class="empty-row"></div>
		
		     <div class="row text-center content-font title-row">
	<div class="col-sm-1">번호</div>       
	<div class="col-sm-6">제목</div>       
	<div class="col-sm-2">작성자</div>       
	<div class="col-sm-2">날짜</div>             
	<div class="col-sm-1">조회수</div>       
       </div> 
       
		<c:forEach var="row" items="${map.list}">
		
       <div class="row text-center content-font content-row">
	<div class="col-sm-1">${row.bno}</div>       
	<div class="col-sm-6"><a href="${root}/view?bno=${row.bno}">
						${row.title}</a></div>       
	<div class="col-sm-2">${row.writer}</div>       
	<div class="col-sm-2"><fmt:formatDate value="${row.regdate}"
			pattern="yyyy-MM-dd HH:mm:ss"/></div>            
	<div class="col-sm-1">${row.viewcnt}</div>       
       </div>
       
        </c:forEach>
        
	<div class="content-row"></div>			
       <div class="text-right">
       	<a href="${root}/boardwrite"><button type="button" id="btnWrite" style="background-color:#6799FF; border-color: #6799FF; color: white">글쓰기</button></a>
       </div>
        
        <!-- 페이지 네비게이션 출력 -->
       <div class="row text-center">
    
       		<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('1')">[처음]</a>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('${map.pager.prevPage}')">
				[이전]</a>
			</c:if>
			<c:forEach var="num" 
				begin="${map.pager.blockBegin}"
				end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
					<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
						<span style="color:red;">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="#" onclick="list('${num}')">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<a href="#" 
				onclick="list('${map.pager.nextPage}')">[다음]</a>
			</c:if>
			<c:if test="${map.pager.curPage < map.pager.totPage}">
				<a href="#" 
				onclick="list('${map.pager.totPage}')">[끝]</a>
			</c:if>
       </div>
        
        
        
        
        
       </div>  <!-- 컨테이너 끝나는 부분 -->
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
      
      <jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>