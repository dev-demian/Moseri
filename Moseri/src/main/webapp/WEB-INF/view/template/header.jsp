<!DOCTYPE html>
<html lang="ko">

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

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:set var="root" value="${pageContext.request.contextPath}"></c:set> --%>

<head>
<title>모서리 홈페이지</title>

<link rel="stylesheet" type="text/css"
	href="http://kenwheeler.github.io/slick/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />

<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/swiper.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/mypage.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/slider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/slick-theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/search.css">
 <style>
    	.title-font{
        		font-size: 35px;
			text-align: center;        		
        		}
        	/* 	div{
        			border: 1px solid;
        		} */
        		}
        		.empty-row{
        		margin-top: 20px;
        		margin-bottom: 5px;
        		}
        		.content-row{
        		font-size: 16px;
        		padding: 5px;
        	
        		
        		}
        		.title-row{
        		font-size:16px;
        		margin-bottom: 20px;
        		background-color: #B7F0B1;	
        		}
        		            
</style> 
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- ///////////////////////////S : 추가 했습니답///////////////////////////////// -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- ///////////////////////////E : 추가 했습니답///////////////////////////////// -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<!--    <script type="text/javascript" src="slick/slick.min.js"></script>-->
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/res/js/slider.js"></script>
<!-- ///////////////////////////S : 추가 했습니답///////////////////////////////// -->
<script src="${pageContext.request.contextPath}/res/js/swiper.min.js"></script>
<script src="${pageContext.request.contextPath}/res/js/mypage.js"></script>
<!-- ///////////////////////////E : 추가 했습니답///////////////////////////////// -->
<script src="${pageContext.request.contextPath}/res/js/search.js"></script>
<!-- /////////////////////////////////20180625추가///////////////////////////////////// -->
<script>
	$(document).ready(function() {
		$("#key-search button").on("click", function() {
		<%if (!("success".equals(session.getAttribute("login")))) {%>
			alert("로그인을 해주세요.");
			$(this).attr("onclick", "location.href='login'");
		<%}%>
		});
	});
</script>
</head>

<body>
	<header id="top" class="container-fluid"
		style="background:url(${pageContext.request.contextPath}/res/img/header_bg.jpg) center center no-repeat;background-size:cover;">
		<!-- <div class="row"> -->
		<div class="menu-wrap">
			<div class="top-menu navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<h1 id="logo" class="text-center">
							<a href="home"><img
								src="${pageContext.request.contextPath}/res/img/Icon.png"
								alt="icon"></a>
						</h1>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav navbar-right">
							<li class="nav-item"><a href="${root}/home">홈으로</a></li>
							<%
									if (!("success".equals(session.getAttribute("login")))) {
								%>
							<li class="nav-item"><a href="${root}/login">로그인</a></li>
							<%
									}
								%>
							<%
									if (!("success".equals(session.getAttribute("login")))) {
								%>
							<li class="nav-item"><a href="${root}/before_regi">회원가입</a></li>
							<%
									}
								%>
							<%
									if ("success".equals(session.getAttribute("login"))) {
								%>
							<li class="nav-item"><a href="${root}/mypage">마이페이지</a></li>
							<%
									}
								%>
							<%
									if ("success".equals(session.getAttribute("login"))) {
								%>
							<li class="nav-item"><a href="${root}/logout">로그아웃</a></li>
							<%
									}
								%>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- </div> -->
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div id="key-search" class="input-group">
					<input type="text" class="form-control"
						placeholder="검색 키워드를 입력하세요!"> <span
						class="input-group-btn">
						<button class="btn btn-secondary" type="button">찾기</button>
					</span>
					<div class="key-word">
						<ul></ul>
					</div>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
	</header>
	