<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>profile</title>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="keywords" content="">
<!-- css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/swiper.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/mypage.css">
<!-- js -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/res/js/swiper.min.js"></script>
<script src="${pageContext.request.contextPath}/res/js/mypage.js"></script>
</head>
<body>
	<h2>profile</h2>
	<c:forEach var="pro" items="${pro}">
		<div>번호 : ${pro.no}</div>
		<div>닉네임 : ${pro.nickname}</div>
		<div>email : ${pro.email}</div>
		<div>별점 : ${pro.star}</div>
		<div>프로필 이미지 : ${pro.proImg}</div>
		<div>self : ${pro.self}</div>
		<div>resume : ${pro.resume}</div>
		<div>img : ${pro.img}</div>
		<div>m_cnt : ${pro.mcnt}</div>
	</c:forEach>
	<div class="container">
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<p>Some text in the modal.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<button type="button" data-toggle="modal" data-target="#myModal">견적
		받아보기</button>
	<div class="container-fluid">
		<div class="row text-center mypage-bg">
			<div class="inner">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<div id="pro">
						<h3>프로필</h3>
						<div class="pro-wrap">
							<div>
								<h4>축구레슨(소항목)</h4>
							</div>
							<div class="pro-img">
								<div class="cameraImage">
									<img
										src="${pageContext.request.contextPath}/res/images/camera.png"
										alt="cameraImage">
								</div>
								<div class="profileImage">
									<img
										src="${pageContext.request.contextPath}/res/images/test.jpg"
										alt="test이미지">
								</div>
							</div>
							<div>
								<span>★★★★★</span>
							</div>
							<div>
								<span>닉네임 : O O O O O O O O O</span>
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
									<div class="swiper-slide">
										<img
											src="${pageContext.request.contextPath}/res/images/test1.jpg">
									</div>
									<div class="swiper-slide">
										<img
											src="${pageContext.request.contextPath}/res/images/test2.jpg">
									</div>
									<div class="swiper-slide">
										<img
											src="${pageContext.request.contextPath}/res/images/test3.jpg">
									</div>
								</div>

								<!-- 이동 버튼 -->
								<div class="swiper-button-prev"></div>
								<div class="swiper-button-next"></div>
								<!-- 페이징 버튼 -->
								<div class="swiper-pagination"></div>
							</div>
							<div class="review">
								<h4 class="text-center">리뷰</h4>
								<div class="review-content">
									<div class="col-sm-12">
										<div class="col-sm-2">
											<div class="review-img">이미지</div>
										</div>
										<div class="col-sm-2" style="margin-top: 20px;">
											<div>배기태</div>
											<div>★★★★★</div>
										</div>
										<div class="col-sm-5"></div>
										<div class="col-sm-3 text-right">
											<span>2018-06-14</span>
										</div>
									</div>
									<div class="col-sm-12">
										<div class="col-sm-1"></div>
										<div class="col-sm-10 text-left" style="margin: 10px 0px;">
											안녕하세요 배기태입니다 잘부탁 드립니다.안녕하세요 배기태입니다 잘부탁 드립니다.</div>
										<div class="col-sm-1"></div>
									</div>
									<button>수정</button>
									<div class="col-sm-12 reply">
										<div>작성자 : 배기태 / 날짜 : 2018-06-20</div>
										<div class="text-left">댓글작성 :</div>
										<div>
											<textarea name="" id="" cols="30" rows="10"></textarea>
										</div>
										<div class="text-right">
											<input type="submit" value="확인">
										</div>
									</div>
								</div>
								<div class="review-content">
									<div class="col-sm-12">
										<div class="col-sm-2">
											<div class="review-img">이미지</div>
										</div>
										<div class="col-sm-2" style="margin-top: 20px;">
											<div>배기태</div>
											<div>★★★★★</div>
										</div>
										<div class="col-sm-5"></div>
										<div class="col-sm-3 text-right">
											<span>2018-06-14</span>
										</div>
									</div>
									<div class="col-sm-12">
										<div class="col-sm-1"></div>
										<div class="col-sm-10 text-left" style="margin: 10px 0px;">
											안녕하세요 배기태입니다 잘부탁 드립니다.안녕하세요 배기태입니다 잘부탁 드립니다.</div>
										<div class="col-sm-1"></div>
									</div>
									<button>수정</button>
									<div class="col-sm-12 reply">
										<div class="text-left">댓글작성 :</div>
										<div>
											<textarea name="" id="" cols="30" rows="10"></textarea>
										</div>
									</div>
								</div>
								<div class="review-content">
									<div class="col-sm-12">
										<div class="col-sm-2">
											<div class="review-img">이미지</div>
										</div>
										<div class="col-sm-2" style="margin-top: 20px;">
											<div>배기태</div>
											<div>★★★★★</div>
										</div>
										<div class="col-sm-5"></div>
										<div class="col-sm-3 text-right">
											<span>2018-06-14</span>
										</div>
									</div>
									<div class="col-sm-12">
										<div class="col-sm-1"></div>
										<div class="col-sm-10 text-left" style="margin: 10px 0px;">
											안녕하세요 배기태입니다 잘부탁 드립니다.안녕하세요 배기태입니다 잘부탁 드립니다.</div>
										<div class="col-sm-1"></div>
									</div>
									<button>수정</button>
									<div class="col-sm-12 reply">
										<div class="text-left">댓글작성 :</div>
										<div>
											<textarea name="" id="" cols="30" rows="10"></textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
	</div>
</body>
</html>