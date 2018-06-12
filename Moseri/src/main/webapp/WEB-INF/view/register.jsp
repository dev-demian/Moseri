<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html lang="ko">

<head>
<title>register</title>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="keywords" content="">
<!-- css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/common.css"
	Content-type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/register.css"
	Content-type="text/css" />
<style>
div {
	/*            border: 1px dotted #000;*/
	
}
</style>
<!-- js -->
<!--    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>-->
<script
	src="${pageContext.request.contextPath}/res/js/jquery-1.12.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e52ea54ccfc578d2022fba92956f687e&libraries=services"></script>

</head>

<body>
	<div id="register" class="container-fluid">
		<div class="row">
			<div class="inner">
				<div class="col-md-3 col-sm-2"></div>
				<div class="col-md-6 col-sm-8">
					<form action="register" method="post">
						<div id="register-wrap">
							<h2 class="text-center">회원가입</h2>
							<div class="row text-left">
								<div class="col-md-4">
									<span>Email</span>
								</div>
								<div class="col-md-8">
									<input type="text" name="id" >
								</div>
							</div>
							<div class="row text-left">
								<div class="col-md-4">
									<span>Password</span>
								</div>
								<div class="col-md-8">
									<input type="password" name="pw" >
								</div>
							</div>
							<div class="row text-left">
								<div class="col-md-4">
									<span>Name</span>
								</div>
								<div class="col-md-8">
									<input type="text" name="name" >
								</div>
							</div>
							<div class="row text-left">
								<div class="col-md-4">
									<span>Phone</span>
								</div>
								<div class="col-md-8">
									<input type="number" name="phone" >
								</div>
							</div>
							<div class="row text-left">
								<div class="col-md-4">
									<span>Gender</span>
								</div>
								<div class="col-md-8">
									<span>남 : </span><input type="radio" name="sex" value="male"
										> / <span>여 : </span><input type="radio"
										name="sex" value="female">
								</div>
							</div>
							<div class="row text-left">
								<div class="col-md-4">
									<span>Address1</span>
								</div>
								<div class="col-md-8">
									<input name="addr1" type="text" id="info-address" readonly>
								</div>
							</div>
							<div class="row text-right">
								<div class="col-md-12">
									<input type="button" onclick="info_execDaumPostcode()"
										value="주소 검색">
								</div>
							</div>
							<div class="row text-left">
								<div class="col-md-4">
									<span>Address2</span>
								</div>
								<div class="col-md-8">
									<input name="addr2" type="text">
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div id="map" style="height: 300px;"></div>
								</div>
							</div>

							<script type="text/javascript"
								src="${pageContext.request.contextPath}/res/js/map.js"></script>
							<div class="row">
								<div class="col-md-4"></div>
								<div class="col-md-4">
									<input type="submit" value="Sign-up">
								</div>
								<div class="col-md-4"></div>
							</div>
						</div>
					</form>
				</div>
				<div class="col-md-3 col-sm-2"></div>
			</div>
		</div>
	</div>
</body>

</html>