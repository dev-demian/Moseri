<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    // 세션값 가져오기
    out.println(session.getAttribute("email"));
    out.println(session.getAttribute("granted"));
    out.println(session.getAttribute("login"));
 	// 세션 전체 무효화(로그아웃시 주로 사용)
    //session.invalidate();
 %> 
<!DOCTYPE html>
<html lang="ko">

<head>
<title>estimate-write</title>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="keywords" content="">
<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/mypage.css">
<style>
div {
/*  	border: 1px dotted #000; */
}
</style>
<!-- bootstrap js -->
<script src="js/jquery-1.12.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/mypage.js"></script>
</head>

<body>
	<header class="container-fluid">
		<div class="row text-center">
			<h2>Mypage</h2>
		</div>
	</header>
	<div class="container-fluid">

		<jsp:include page="/WEB-INF/view/template/mypageHeader.jsp"></jsp:include>

<!-- 		<form action="chat" method="get"> -->
			<div class="row text-center mypage-bg">
				<div class="col-sm-1"></div>
				<div class="col-sm-10">
					<div id="est-write">
						<h3>요청서/견적서 보기</h3>
						<div class="write-wrap">
							<div class="col-lg-6" style="border: 1px solid">
								<h3>지도/세부요청서</h3>
								<div class="left-box">
									<div class="map" style="background-color: #3EC03A">
										<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
									</div>
									<div class="content" style="background-color: #B2C7D9">
										<div style="font-size: 40px">${q[0]}</div>
										<br>
										<div style="font-size: 25px">${q[1]}</div>
										<div style="font-size: 20px">${requestDto.anser1}</div>
										<br>
										<div style="font-size: 25px">${q[2]}</div>
										<div style="font-size: 20px">${requestDto.anser2}</div>
										<br>
										<div style="font-size: 25px">${q[3]}</div>
										<div style="font-size: 20px">${requestDto.anser3}</div>
										<br>
										<div style="font-size: 25px">${q[4]}</div>
										<div style="font-size: 20px">${requestDto.anser4}</div>
										<br>
										<div style="font-size: 25px">${q[5]}</div>
										<div style="font-size: 20px">${requestDto.anser5}</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6" style="border: 1px solid">
								<h3>내 프로필</h3>
								<div class="profile" style="background-color: #FFEB33">
								<div style="font-size: 25px">닉네임</div>
									<div style="font-size: 20px">${profileDto.nickname}</div>
									<br>
									<div style="font-size: 25px">별점</div>
									<div style="font-size: 20px">${profileDto.star}</div>
									<br>
									<div style="font-size: 25px">고수 사진</div>
									<div style="font-size: 20px">${profileDto.pro_img}</div>
									<br>
									<div style="font-size: 25px">자기소개</div>
									<div style="font-size: 20px">${profileDto.self}</div>
									<br>
									<div style="font-size: 25px">이력서</div>
									<div style="font-size: 20px">${profileDto.resume}</div>
									<br>
									<div style="font-size: 25px">고수 활동 관련 사진</div>
									<div style="font-size: 20px">${profileDto.img}</div>
									<br>
									<div style="font-size: 25px">고수 매칭 횟수</div>
									<div style="font-size: 20px">${profileDto.m_cnt}</div>
								</div>
								<h3>견적서 내용</h3>
								<div class="right-box" style="border: 1px solid">
									<div>
										<span>시급</span> <textarea style="height: 30px; resize: none" readonly>${estimateDto.time_pay}</textarea>
									</div>
									<div>
										<span>총액</span> <textarea style="height: 30px; resize: none" readonly>${estimateDto.total_pay}</textarea> 
									</div>
									<div>
										<span>설명글</span> <textarea style="resize: none; height: 100px; width: 600px" readonly>${estimateDto.anser1}</textarea>
									</div>
									<c:set var="e" value="${matchingDto.m_result}"/>
									<c:if test="${e eq 1}"><input type="button" style="height: 35px; width: 600px"
									onclick="location.href='chat?matchingno=${matchingDto.no}&m_result=${matchingDto.m_result}'" value="채팅내용보기"></c:if>
									<c:if test="${e eq 0}"><input type="button" style="height: 35px; width: 600px"
									onclick="location.href='chat?matchingno=${matchingDto.no}&m_result=${matchingDto.m_result}'" value="수락/채팅하기"></c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-1"></div>
			</div>
<!-- 		</form> -->
		
	</div>
</body>

</html>