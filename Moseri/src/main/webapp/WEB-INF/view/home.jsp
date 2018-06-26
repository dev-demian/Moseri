<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>
            
            
            
            
            <div class="container">
                
                <div class="row">
                    <div class="cardsize"  style="margin-bottom: 100px; margin-top: 100px;" >
                    <div class="container row text-right">
                     <div class="inner">
                        <div class="col-md-4 col-md-offset-8 col-sm-8 col-sm-offset-4">
                        <h4>
                           <a href="find">
                              <span class="glyphicon glyphicon-search"> 고수검색</span>
                           </a>
                        </h4>
                           
                        </div>
                     </div>
                  </div>
                    	
                    	
                        <div class="multi-items container text-center">
                            <!-- S : 반복 -->
                        	<c:forEach var="list" items="${getProfileList}">
                            <div class="outcard">
                                <div class="innercard">
                                    <div class="row topmargin">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-4 img">
                                           <c:if test="${list.pro_img != null}" var="result">
                                            <img src="${pageContext.request.contextPath}/res/pro_img/${list.pro_img}" alt="profile">
                                           </c:if> 
                                           <c:if test="${list.pro_img == null}" var="result">
                                            <img src="${pageContext.request.contextPath}/res/img/profile.jpg" alt="profile">
                                           </c:if>

                                           
                                        </div>
                                        <div class="col-sm-4 text-center text">
                                            <div class="row">${list.nickname}</div>
                                            <div class="row star">${list.star}</div>
                                        </div>
                                    </div>
                                    <div class="row title ">${list.cname}</div>
                                    <a href="profile?no=${list.no}">profile?no=${list.no}</a>
                                </div>
                            </div>
                            </c:forEach>
                            <!-- E : 반복 -->
                        </div>
                    </div>
                </div>
              <div class="row">
              	<div class="introimg">
                	<div class="col-sm-12" style="margin-bottom: 50px; margin-top: 50px;" >
                   		<img src ="${pageContext.request.contextPath}/res/img/home_img1.png" style="max-width: 100%; height: auto;">
                    </div>
                </div> 
                <div class="infoimg" > 
                    <div class="col-sm-12" style="margin-bottom: 50px; margin-top: 50px;" > 
                    <img src ="${pageContext.request.contextPath}/res/img/home_img2.png" style="max-width: 100%; height: auto;">
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12" > 
                    
                		<div class="signupnow">
                		<h4>고수로 가입하면 무료로 고객들의 요청서를 받아볼 수 있습니다</h4> 
                		<a href="register_gosu"><button class="btn btn-primary btn-lg">고수로 가입하기</button></a>
                		</div>
                    </div>
                    
                </div>
            	
            
            </div>
                    
       </div>
      
      <jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>