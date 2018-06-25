<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="granted" value="${sessionScope.granted}"/>
<!--  -->
<div class="container-fluid">
	<div class="row text-center menu">
		<!-- 5.수정(두산) -->
		<div class="col-sm-1"></div>
		<c:if test="${granted eq 3}">
			<div class="col-sm-2"><a href="request">요청</a></div>
		</c:if>
	        <div class="col-sm-2"><a href="estimate">견적서</a></div>
	        <div class="col-sm-2"><a href="myprofile">프로필</a></div>
	        <div class="col-sm-2"><a href="notification">알림</a></div>
	        <div class="col-sm-2"><a href="information">개인정보</a></div>
	    <c:if test="${granted eq 2}">
			<div class="col-sm-2"><a href="approval">고수인증</a></div>
		</c:if> 
			<!-- <div class="col-sm-2"><a href="home">홈으로</a></div> -->
		<div class="col-sm-1"></div>
	</div>
</div>