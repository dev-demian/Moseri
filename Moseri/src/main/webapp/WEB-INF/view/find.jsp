<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<title>find</title>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="keywords" content="">
<!-- css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/find.css">
<style>
div {
	/*            border: 1px dotted #000;*/
	
}
</style>
<!-- js -->
<script
	src="${pageContext.request.contextPath}/res/js/jquery-1.12.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e52ea54ccfc578d2022fba92956f687e&libraries=services"></script>
<script src="${pageContext.request.contextPath}/res/js/select.js"></script>
<script src="${pageContext.request.contextPath}/res/js/find.js"></script>
<script></script>
</head>

<body>
	<div id="find-wrap" class="container-fluid">
		<div class="row text-center">
			<div class="col-md-12">
				<h2>고수찾기</h2>
			</div>
		</div>
		<div class="inner">
			<div class="row text-center">
				<div class="col-md-8">
					<div class="left">
						<h3>검색</h3>
						<div>
							<div class="col-sm-12 text-left">
								<h4>분류검색 :</h4>
							</div>
							<div class="col-sm-4">
								<select name="top" id="top">
									<option value="" selected>##대분류##</option>
									<option disabled>-----------------------------</option>
									<c:forEach var="top" items="${list}">
										<option value="${top.name}" data-no="${top.no}">${top.name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-sm-4">
								<select name="mid" id="mid">
									<option value="" selected>##중분류##</option>
									<option disabled>-----------------------------</option>
								</select>
							</div>
							<div class="col-sm-4">
								<select name="bot" id="bot">
									<option value="" selected>##소분류##</option>
									<option disabled>-----------------------------</option>
								</select>
							</div>
						</div>
						<div>
							<div class="col-sm-12 text-left">
								<h4>주소검색 :</h4>
							</div>
							<!-- <div class="col-sm-10">
								<input type="text" name="addr" id="info-address" class="address" readonly
									placeholder="기본주소(주소검색을 클릭하세요.)">
							</div> -->
							<div class="col-sm-10">
								<input type="text" name="addr" id="info-address" class="address"
									placeholder="기본주소(주소검색을 클릭하세요.)">
							</div>
							<div class="col-sm-2">
								<input type="button" onclick="info_execDaumPostcode()"
									value="주소 검색">
							</div>
							<div class="col-sm-12 search-btn">
								<button>검색</button>
							</div>
						</div>
						<div>
							<div class="col-sm-12">
								<div id="map" style="width: 100%; height: 400px;"></div>
							</div>
						</div>
					</div>
				</div>
				<script src="${pageContext.request.contextPath}/res/js/map.js"></script>
				<div class="col-md-4">
					<div class="right">
						<h3>고수목록</h3>
						<div class="btn-wrap">
							<div class="load">
								<p>
									<img
										src="${pageContext.request.contextPath}/res/images/loading.gif"
										alt="loading image">
								</p>
							</div>
							<!-- <button>
								<div class="profile-img">이미지</div>
								<div>★★★★★</div>
								<div>닉네임</div>
							</button> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>