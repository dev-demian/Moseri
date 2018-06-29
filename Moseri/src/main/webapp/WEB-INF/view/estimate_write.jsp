<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/view/template/mypageHeader.jsp"></jsp:include>    
        <div class="container-fluid">
            <form action="estimateInsert" method="get">
			<div class="row text-center mypage-bg">
				<div class="col-sm-1"></div>
				<div class="col-sm-10">
					<div id="est-write">
						<h3>견적서작성</h3>
						<div class="write-wrap">
							<div class="col-lg-6">
								<h4>지도/세부요청서</h4>
								<div class="left-box">
									<div class="map"></div>
									<div class="content">
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
							<div class="col-lg-6">
								<h4>내 프로필</h4>
								<div class="profile" style="background-color: #FFEB33">
									<div style="font-size: 25px">닉네임</div>
									<div style="font-size: 20px">${profile.nickname}</div>
									<br>
									<div style="font-size: 25px">별점</div>
									<div style="font-size: 20px">${profile.star}</div>
									<br>
									<div style="font-size: 25px">고수 사진</div>
									<div style="font-size: 20px">${profile.pro_img}</div>
									<br>
									<div style="font-size: 25px">자기소개</div>
									<div style="font-size: 20px">${profile.self}</div>
									<br>
									<div style="font-size: 25px">이력서</div>
									<div style="font-size: 20px">${profile.resume}</div>
									<br>
									<div style="font-size: 25px">고수 활동 관련 사진</div>
									<div style="font-size: 20px">${profile.img}</div>
									<br>
									<div style="font-size: 25px">고수 매칭 횟수</div>
									<div style="font-size: 20px">${profile.m_cnt}</div>
								</div>
								<h4>견적서 작성</h4>
								<div class="right-box">
									<div>
<%-- 										<c:set var="e" value="${estimateDto}"/> --%>
										<textarea name="time_pay" style="height: 45px; resize: none" required><c:if test="${estimateDto ne 'null'}">${estimateDto.time_pay}</c:if></textarea> <span>시급</span>
									</div>
									<div>
										<textarea name="total_pay" style="height: 45px; resize: none" required><c:if test="${estimateDto ne 'null'}">${estimateDto.total_pay}</c:if></textarea> <span>총액</span>
									</div>
									<div>
										<textarea style="resize: none; height: 100px; width: 600px" required 
											name="anser1" placeholder="메시지 입력"><c:if test="${estimateDto ne 'null'}">${estimateDto.anser1}</c:if></textarea>
									</div>
									<c:if test="${estimateDto eq 'null'}"><input type="submit" value="견적서 보내기"></c:if>
									<!-- 14.추가(두산) -->
									<c:set var="m" value="${matchingDto.m_result}"/>
									<c:set var="gosu_end" value="${matchingDto.gosu_end}"/>
									<c:if test="${gosu_end eq 0}"><c:if test="${m eq 1}"><input style="height: 35px; width: 600px" type="button" onclick="location.href='chat?matchingno=${matchingDto.no}&m_result=${matchingDto.m_result}'" value="채팅내용보기"></c:if></c:if>    
									<!-- 14.추가(두산) -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-1"></div>
			</div>
		</form>
        </div>
        
        
        <jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>