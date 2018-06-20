<!DOCTYPE html>
<html lang="ko">

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    // 세션값 가져오기
    out.println(session.getAttribute("email"));
    out.println(session.getAttribute("granted"));
    out.println(session.getAttribute("login"));
 	// 세션 전체 무효화(로그아웃시 주로 사용)
    //session.invalidate();
 %> 

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>   
    <%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:set var="root" value="${pageContext.request.contextPath}"></c:set> --%>

        <head>
            <title>모서리 홈페이지</title>

            <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
            <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />

            <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


            <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/slider.css">

            <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
            <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
            <!--    <script type="text/javascript" src="slick/slick.min.js"></script>-->
            <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

            <script src="${pageContext.request.contextPath}/res/js/slider.js"></script>




            <style media="screen">
                @import url(${pageContext.request.contextPath}/res/css/btn.css);
                @import url(${pageContext.request.contextPath}/res/css/slider.css);
                @import url(${pageContext.request.contextPath}/res/css/slick-theme.css);
                /*       html,div,body{ */
                /*         border: 1px solid red; */
                /*       } */
                /*       header{ */
                /*         border: 1px solid red; */
                /*       } */
                
                #jumbo {
                    margin-bottom: 0px;
                }
                
                #icon {
                    width: 200px;
                }
                
                #pop_list {
                    padding-top: 9px;
                }
                
                #home_icon {
                    width: 100px;
                }
                
                #gosu {
                    margin: auto;
                }
                
                #people {
                    padding: 15px;
                }
            </style>
        </head>

<body>
   	<header id="top" style="background-image: url(${pageContext.request.contextPath}/res/img/header_bg.jpg); background-size: 100% 100%; ">
                <!-- <div class="container"> -->
                    <nav class="collapse navbar-collapse bs-navbar-collapse" style="padding-bottom: 200px">
                        <ul class="nav navbar-nav">
                            <img id="home_icon" src="${pageContext.request.contextPath}/res/img/Icon.png" alt="icon">
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            
                            <li>
                              	<a href="${root}/home">홈으로</a>
   							</li>
                            <%if(!("success".equals(session.getAttribute("login")))){%>
                            <li>
                                <a href="${root}/login">로그인</a>
                            </li>
                            <%}%> 
                            <%if(!("success".equals(session.getAttribute("login")))){%>
                            <li>
                                <a href="${root}/before_regi">회원가입</a>
                            </li>
                            <%}%> 
                            <%if("success".equals(session.getAttribute("login"))){%>
                            <li>
                                <a href="${root}/mypage">마이페이지</a>
                            </li>
                            <%}%> 
                            <%if("success".equals(session.getAttribute("login"))){%>
                            <li>
                                <a href="${root}/logout">로그아웃</a>
                            </li>
                            <%}%> 
                        </ul>
                    </nav>
                    <nav style="padding-bottom: 100px ;padding-left: 340px; padding-right: 340px;">
                        <!--  <div class="jumbotron p-3 p-md-5 text-white rounded bg-dark" id="jumbo"> -->
                        <!-- <img id="icon" src="./zzalicon.png" alt="icon"> -->
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="검색 키워드를 입력하세요!">
                            <span class="input-group-btn">
                                <button class="btn btn-secondary" type="button">찾기</button>
                            </span>
                        </div>
                        <!-- </div> -->
                    </nav>
               <!--  </div> -->
            </header>
    <div class="">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="container">

                   <ul class="nav navbar-nav ul">
                        <li class="li"><a href="lesson">레슨</a></li>
                        <li class="li"><a href="living">생활서비스</a></li>
                        <li class="li"><a href="construction">시공/수리</a></li>
                        <li class="li"><a href="it">IT/디자인</a></li>
                        <li class="li"><a href="health">건강/미용</a></li>
                        <li class="li"><a href="event">행사</a></li>
                   
                    </ul>


                </div>

            </div>
        </nav>
    </div>