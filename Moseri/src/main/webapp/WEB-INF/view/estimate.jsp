<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
    
<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>
        <div class="container-fluid">
            <div class="row text-center menu">
                <div class="col-sm-2"><a href="request">요청</a></div>
                <div class="col-sm-2"><a href="estimate">견적서</a></div>
                <div class="col-sm-2"><a href="myprofile">프로필</a></div>
                <div class="col-sm-2"><a href="notification">알림</a></div>
                <div class="col-sm-2"><a href="information">개인정보</a></div>
                <div class="col-sm-2"><a href="approval">고수인증</a></div>
            </div>
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