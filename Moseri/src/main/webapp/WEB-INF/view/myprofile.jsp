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
	                    <div id="pro">
	                        <h3>프로필</h3>
	                        <div class="pro-wrap">
	                            <div class="pro-img">
	                                <div class="cameraImage" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"><img src="${pageContext.request.contextPath}/res/img/camera.png" alt="cameraImage"></div>
	                                <div class="profileImage"><img src="${pageContext.request.contextPath}/res/img/test.jpg" alt="test이미지"></div>
	                            </div>
	                            <div>
	                                <span>아이디 /</span>
	                                <span>이름</span>
	                            </div>
	                            <div class="text1">
	                                <textarea name="" placeholder="자기소개"></textarea>
	                            </div>
	                            <div class="text-right modify">
	                                <button class="text-right">수정</button>
	                            </div>
	                            <div class="text2">
	                                <textarea name="" placeholder="경력소개"></textarea>
	                            </div>
	                            <div class="text-right modify">
	                                <button class="text-right">수정</button>
	                            </div>
	                            <div class="swiper-container">
	                                <!-- 이미지 영역 -->
	                                <div class="swiper-wrapper">
	                                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/res/img/test1.jpg"></div>
	                                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/res/img/test2.jpg"></div>
	                                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/res/img/test3.jpg"></div>
	                                </div>
	
	                                <!-- 이동 버튼 -->
	                                <div class="swiper-button-prev"></div>
	                                <div class="swiper-button-next"></div>
	                                <!-- 페이징 버튼 -->
	                                <div class="swiper-pagination"></div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-sm-2"></div>
	            </div>
	        </div>
        </div>
<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>