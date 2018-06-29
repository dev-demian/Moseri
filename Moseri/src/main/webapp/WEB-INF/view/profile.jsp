<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>
<body>
	<%-- <h2>profile</h2>
	<c:forEach var="pro" items="${pro}">
		<div>번호 : ${pro.no}</div>
		<div>닉네임 : ${pro.nickname}</div>
		<div>email : ${pro.email}</div>
		<div>별점 : ${pro.star}</div>
		<div>프로필 이미지 : ${pro.pro_img}</div>
		<div>self : ${pro.self}</div>
		<div>resume : ${pro.resume}</div>
		<div>img : ${pro.img}</div>
		<div>m_cnt : ${pro.m_cnt}</div>
	</c:forEach>
	<div>소분류번호 : ${getBno}</div>
	<div>소분류이름 : ${getBotName}</div> --%>
	<%-- <button onclick="location.href='writeRequest?categoryno=${getBno}'">견적
		받아보기</button> --%>
	<div class="container-fluid">
		<div class="row text-center mypage-bg">
			<div class="inner">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<div id="pro">
						<div class="text-right"><button class="profile-reqeust-btn" style="padding:5px 10px;" onclick="location.href='writeRequest?categoryno=${getBno}'">견적받아보기</button></div>
						<h3>프로필</h3>
						<div class="pro-wrap">
							<div>
								<h4>${getBotName}</h4>
							</div>
							<c:forEach var="pro" items="${pro}">
							<div class="pro-img">
								
								<div class="profileImage">
									<c:if test="${pro.pro_img != null}" var="result">
                                    <img src="${pageContext.request.contextPath}/res/pro_img/${pro.pro_img}" alt="profile">
                                    </c:if> 
                                    <c:if test="${pro.pro_img == null}" var="result">
                                    <img src="${pageContext.request.contextPath}/res/img/test.jpg" alt="profile">
                                    </c:if>
								</div>
							</div>
							<div>
								<span class="star">별점 : ${pro.star}</span>
							</div>
							<div>
								<span>닉네임 : ${pro.nickname}</span>
							</div>
							<div class="text1">
								<textarea name="" placeholder="자기소개">${pro.self}</textarea>
							</div>
							<div class="text-right modify">
								
							</div>
							<div class="text2">
								<textarea name="" placeholder="경력소개">${pro.resume}</textarea>
							</div>
							<div class="text-right modify">
								
							</div>
							<div class="swiper-container">
								<!-- 이미지 영역 -->
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<img
											src="${pageContext.request.contextPath}/res/img/test1.jpg">
									</div>
									<div class="swiper-slide">
										<img
											src="${pageContext.request.contextPath}/res/img/test2.jpg">
									</div>
									<div class="swiper-slide">
										<img
											src="${pageContext.request.contextPath}/res/img/test3.jpg">
									</div>
								</div>

								<!-- 이동 버튼 -->
								<div class="swiper-button-prev"></div>
								<div class="swiper-button-next"></div>
								<!-- 페이징 버튼 -->
								<div class="swiper-pagination"></div>
							</div>
							</c:forEach>
							
							<c:if test="${granted eq 3}">
							<div class="review">
                                <h5>리뷰</h5>
                                <c:forEach var="getReview" items="${getReview}">
                                <!-- S : 반복 -->
                                <div class="review-write">
                                    <div class="col-md-12">
                                        <div class="row" style="padding:20px 0px;">
                                            <div class="col-md-12 text-right">
                                            	<div><a href="#">신고</a></div>
												<div>${getReview.reg}</div>		                                            
                                            </div>
                                            <div class="col-md-8 text-left">
                                                <div class="col-md-3" style="width:80px;height:80px;background-color:aqua;border-radius:50%;text-align:center;line-height:80px;">프로필</div>
                                                <div class="col-md-4">
                                                    <div style="margin-top:18px;">${getReview.nick}</div>
                                                    <div class="star" style="margin-top:4px;">${getReview.star}</div>
                                                </div>
                                                <div class="col-md-6"></div>
                                            </div>
                                            <div class="col-md-4"></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 text-left">
                                                <div class="col-md-2">댓글 :</div>
                                                <div class="col-md-10">${getReview.text}</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- E : 반복 -->
                                </c:forEach>
                            </div>
                            </c:if> 
                            
						</div>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
	</div>
 <jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>