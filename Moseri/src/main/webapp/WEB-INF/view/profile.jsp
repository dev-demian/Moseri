<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>
 
 
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
	<div>소분류번호 : ${getBno}</div>
	<div>소분류이름 : ${getBotName}</div>
	<div class="container">
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				Modal content
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
	</div> -->
	<div class="row" style="text-align: center; margin: 10px">
		<form action="requestInsert" method="get">
			<!-- 모달 팝업 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true"
				data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h1 class="modal-title" id="myModalLabel">요청서 작성</h1>
						</div>
						<div class="modal-body">
							<label style="font-size: 35px">${sessionScope.q0}</label> <br>
							<label>원하는 고수 성별 선택&nbsp&nbsp</label> <label>남</label><input
								type="radio" name="sex" value="남자"> <label>/</label> <label>여</label><input
								type="radio" name="sex" value="여자"> <label>/</label> <label>무관</label><input
								type="radio" name="sex" value="무관" checked="checked">
							<br> <label>${sessionScope.q1}</label> <br>
							<textarea name="a1"
								style="height: 100px; width: 500px; resize: none;"></textarea>
							<br> <label>${sessionScope.q2}</label> <br>
							<textarea name="a2"
								style="height: 100px; width: 500px; resize: none;"></textarea>
							<br> <label>${sessionScope.q3}</label> <br>
							<textarea name="a3"
								style="height: 100px; width: 500px; resize: none;"></textarea>
							<br> <label>${sessionScope.q4}</label> <br>
							<textarea name="a4"
								style="height: 100px; width: 500px; resize: none;"></textarea>
							<br> <label>${sessionScope.q5}</label> <br>
							<textarea name="a5"
								style="height: 100px; width: 500px; resize: none;"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
							<button type="submit" class="btn btn-primary">작성 완료</button>
						</div>
					</div>
				</div>
			</div>
		</form>
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
								<h4>${getBotName}</h4>
							</div>
							<div class="pro-img">
								
								<div class="profileImage">
									<img
										src="${pageContext.request.contextPath}/res/img/test.jpg"
										alt="test이미지">
								</div>
							</div>
							<c:forEach var="pro" items="${pro}">
							<div>
								<span>별점 : ${pro.star}</span>
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
							<div class="review">
                                <h5>리뷰</h5>
                                <!-- S : 반복 -->
                                <div class="review-write">
                                    <div class="col-md-12">
                                        <div class="row" style="padding:20px 0px;">
                                            <div class="col-md-12 text-right">
                                            	<div><a href="#">신고</a></div>
												<div>2018-06-21</div>		                                            
                                            </div>
                                            <div class="col-md-8 text-left">
                                                <div class="col-md-3" style="width:80px;height:80px;background-color:aqua;border-radius:50%;text-align:center;line-height:80px;">프로필</div>
                                                <div class="col-md-4">
                                                    <div style="margin-top:18px;">배기태</div>
                                                    <div style="margin-top:4px;">★★★★★</div>
                                                </div>
                                                <div class="col-md-6"></div>
                                            </div>
                                            <div class="col-md-4"></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 text-left">
                                                <div class="col-md-2">댓글 :</div>
                                                <div class="col-md-10">안녕하세요 저는 배기태입니다. 반갑습니다.</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- E : 반복 -->
                            </div>
						</div>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
	</div>
 <jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>