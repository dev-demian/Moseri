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
									<div class="map">지도</div>
									<div class="content">
										<h2>${q[0]}</h2><br>
										<h4>${q[1]}</h4><br>
										${requestDto.anser1}<br><br>
										<h4>${q[2]}</h4><br>
										${requestDto.anser2}<br><br>
										<h4>${q[3]}</h4><br>
										${requestDto.anser3}<br><br>
										<h4>${q[4]}</h4><br>
										${requestDto.anser4}<br><br>
										<h4>${q[5]}</h4><br>
										${requestDto.anser5}<br><br>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<h4>내 프로필</h4>
								<div class="profile">
								email - ${profile.nickname}<br>
								star - ${profile.star}<br>
								pro_img - ${profile.proImg}<br>
								self - ${profile.self}<br>
								resume - ${profile.resume}<br>
								img - ${profile.img}<br>
								m_cnt - ${profile.mcnt}
								</div>
								<h4>견적서 작성</h4>
								<div class="right-box">
									<div>
<%-- 										<c:set var="e" value="${estimateDto}"/> --%>
										<textarea name="time_pay" style="height: 30px; resize: none" required><c:if test="${estimateDto ne 'null'}">${estimateDto.time_pay}</c:if></textarea> <span>시급</span>
									</div>
									<div>
										<textarea name="total_pay" style="height: 30px; resize: none" required><c:if test="${estimateDto ne 'null'}">${estimateDto.total_pay}</c:if></textarea> <span>총액</span>
									</div>
									<div>
										<textarea style="resize: none; height: 100px; width: 600px" required 
											name="anser1" placeholder="메시지 입력"><c:if test="${estimateDto ne 'null'}">${estimateDto.anser1}</c:if></textarea>
									</div>
									<c:if test="${estimateDto eq 'null'}"><input type="submit" value="견적서 보내기"></c:if>
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