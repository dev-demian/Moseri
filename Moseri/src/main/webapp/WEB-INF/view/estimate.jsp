<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
    
<jsp:include page="/WEB-INF/view/template/pheader.jsp"></jsp:include>
<jsp:include page="template/mypageHeader.jsp"></jsp:include> <!-- 7.수정(두산) -->
        <div class="container-fluid">
        
        
           
            <div class="row text-center mypage-bg">
            <div class="inner">
                <div class="col-sm-2"></div>
                <div class="col-sm-8">
                    <div id="est">
                    	<h2>받은 견적서</h2>
                        <c:forEach items="${list2}" var="list2">
						<div class="col-sm-12">
						<c:set var="e" value="${list2.m_result}"/>
						<h4><a href="estimateRead?matchingno=${list2.no}">${list2.gosu_email}님 견적서 
						<c:if test="${e eq 1}"> (최종 매칭 완료)</c:if></a></h4>
						</div>
						</c:forEach>
                    </div>
                </div>
                <div class="col-sm-2"></div>
            </div>
        </div>
        </div>
<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>