<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/template/mypageHeader.jsp"></jsp:include>

<div class="container-fluid">
	<div class="row text-center mypage-bg">
		<div class="inner">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<div id="pro">
					<h3>프로필</h3>
					<form name="fr" class="form-horizontal" method="post"
						action="profile_update" enctype="multipart/form-data"
						accept=".jpg,.jpeg,.png,.gif,.bmp">
						<div class="pro-wrap">


							<div class="pro-img">
								<%-- <div class="cameraImage" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"><img src="${pageContext.request.contextPath}/res/img/camera.png" alt="cameraImage"></div> --%>

								<div class="profileImage">
									<img src="${pageContext.request.contextPath}/res/img/test.jpg"
										alt="test이미지">
								</div>
								<input type="file" id="pro_img" name="profileimg"
									accept=".jpg,.jpeg,.png,.gif,.bmp"
									style="border: 0px solid black;" />
							</div>
							<c:forEach var="mypro" items="${getMyProfile}">
							<div>
								<div>""</div>
								<span>${mypro.email} /</span> <span>${mypro.nickname}</span>
							</div>
							<div class="text1">
								<textarea name="self" placeholder="자기소개">${mypro.self}</textarea>
							</div>
							<div class="text-right modify">
								<!-- <button class="text-right">수정</button> -->
							</div>
							<div class="text2">
								<textarea name="resume" placeholder="경력소개">${mypro.resume}</textarea>
							</div>
							<div class="text-right modify">
								<!--  <button type="submit" class="text-right">수정</button> -->
							</div>

							<div class="swiper-container">
								<h3>이미지 업로드</h3>
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
							<div class="row">
								<input type="file" id="swiper_img" name="swiperimg"
									accept=".jpg,.jpeg,.png,.gif,.bmp"
									style="border: 0px solid black;" />
								<button type="submit" class="text-right">프로필 수정</button>
							</div>
						</div>
					</form>
					<div class="review">
						<h5>리뷰</h5>
						<c:forEach var="getReview" items="${getMyReview}">
							<!-- S : 반복 -->
							<div class="review-write">
								<div class="col-md-12">
									<div class="row" style="padding: 20px 0px;">
										<div class="col-md-12 text-right">
											<div>
												<a href="#">신고</a>
											</div>
											<div>${getReview.reg}</div>
										</div>
										<div class="col-md-8 text-left">
											<div class="col-md-3"
												style="width: 80px; height: 80px; background-color: aqua; border-radius: 50%; text-align: center; line-height: 80px;">프로필</div>
											<div class="col-md-4">
												<div style="margin-top: 18px;">${getReview.nick}</div>
												<div class="star" style="margin-top: 4px;">${getReview.star}</div>
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
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>