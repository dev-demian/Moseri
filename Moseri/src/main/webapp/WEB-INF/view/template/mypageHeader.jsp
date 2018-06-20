<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="granted" value="${sessionScope.granted}"/>
	
<div class="row text-center menu">
	<c:if test="${granted eq 3}">
		<div class="col-sm-2"><a href="request">요청</a></div>
	</c:if>
   	<div class="col-sm-2"><a href="estimate">견적서</a></div>
   	<div class="col-sm-2"><a href="#">프로필</a></div>
   	<div class="col-sm-2"><a href="#">알림</a></div>
   	<div class="col-sm-2"><a href="#">개인정보</a></div>
	<div class="col-sm-2"><a href="home">홈으로</a></div>
</div>