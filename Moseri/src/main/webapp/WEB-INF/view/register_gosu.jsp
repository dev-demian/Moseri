<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/res/js/select.js"></script>
<script src="${pageContext.request.contextPath}/res/js/register.js"></script>

</head>

<body>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e52ea54ccfc578d2022fba92956f687e&libraries=services"></script>
	<div id="register" class="container-fluid">
		<div class="row">
			<div class="inner">
				<div class="col-md-3 col-sm-2"></div>
				<div class="col-md-6 col-sm-8">
					<form  class="commonForm" action="register_gosu" method="post" onsubmit="return check()">
						<div id="register-wrap">
							<h2 class="text-center">회원가입</h2>
							<div class="row text-left">
								<div class="col-md-4">
									<span>Email</span>
								</div>
								<div id= "divInputId" class="col-md-8" >
									<input id="useremail" type="text" name="email" 
									pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
									title="이메일 형식을 갖추어 입력하세요." placeholder="이메일 형식을 갖추어 입력하세요." >
									
								</div>
							</div>
							<div class="row text-left">
								<div class="col-md-4">
									<span>Password</span>
								</div>
								<div class="col-md-8">
										<input id="pwd" type="password" name="pwd" placeholder="하나 이상의 숫자와 8 자 이상의 대소 문자입력"
									pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
									title="최소한 하나 이상의 숫자와 8 자 이상의 대소 문자가 있어야합니다." >
								</div>
							</div>
							<div class="row text-left">
								<div class="col-md-4">
									<span>Nick</span>
								</div>
								<div class="col-md-8">
									<input id="nick" type="text" name="nickname" placeholder="4글자 이상 8글자 이하 ,닉네임은 중복 될 수 없습니다."
									pattern=".{4,8}" >
								</div>
							</div>
							<div class="row text-left">
								<div class="col-md-4">
									<span>Phone</span>
								</div>
								<div class="col-md-8">
									<input id="phone" type="text" name="phone" placeholder="-없이 입력해 주세요" 
									pattern="01{1}[016789]{1}[0-9]{7,8}"
									title="-없이 입력해 주세요.">
								</div>
							</div>
							<div class="row text-left">
								<div class="col-md-4">
									<span>Gender</span>
								</div>
								<div class="col-md-8">
									<span>남 : </span><input type="radio" name="sex" value="남자">
									/ <span>여 : </span><input type="radio" name="sex" value="여자">
								</div>
							</div>
							<div class="row text-left">
								<div class="col-md-4">
									<span>활동 카테고리</span>
								</div>
								<div class="col-md-8">
									<form>
										<div id="find-wrap">
											<select name="top" id="top">
												<option value="">선택1</option>
												<option disabled>---------------------</option>
												<c:forEach var="top" items="${list}">
													<option value="${top.name}" data-no="${top.no}">${top.name}</option>
												</c:forEach>
											</select> <select name="mid" id="mid">
												<option value="">선택2</option>
												<option disabled>---------------------</option>
											</select> <select name="bot" id="bot">
												<option value="" >선택3</option>
												<option disabled>---------------------</option>
											</select>
										</div>
									</form>
								</div>
							</div>
							<div class="row text-left">
								<div class="col-md-4">
									<span>distance</span>
								</div>
								<div class="col-md-8">
									<select name="distance">
										<option>3km</option>
										<option>5km</option>
										<option>10km</option>
										<option>무관</option>
									</select>
								</div>
							</div>
							<div class="row text-left">
								<div class="col-md-4">
									<span>Address</span>
								</div>
								<div class="col-md-8">
									<input type="text" id="sample5_address" placeholder="주소"
										name="addr">
								</div>
							</div>
							<div class="row text-right">
								<div class="col-md-12">
									<input type="button" onclick="sample5_execDaumPostcode()"
										value="주소 검색"><br>
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
							<div id="map"
								style="width: 100%; height: 300px; margin-top: 70px; display: none"></div>
							<input id="lat" type="hidden" name="lat"> 
							<input id="lng" type="hidden" name="longi">
							
						</div>
					</form>
				</div>
				<div class="col-md-3 col-sm-2"></div>
			</div>
		</div>
	</div>
	<script>
		var lat; //위도
		var lng; //경도
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};
		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(37.537187, 127.005476),
			map : map
		});
		// 지도를 표시하는 div 크기를 변경하는 함수입니다
		function resizeMap() {
			var mapContainer = document.getElementById('map');
			mapContainer.style.width = '$( window ).width()' + 'px';
			mapContainer.style.height = '500px';
			console.log($(window).width());
		}
		function relayout() {
			// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
			// 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
			// window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
			map.relayout();
		}
		function sample5_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullAddr = data.address; // 최종 주소 변수
							var extraAddr = ''; // 조합형 주소 변수
							// 기본 주소가 도로명 타입일때 조합한다.
							if (data.addressType === 'R') {
								//법정동명이 있을 경우 추가한다.
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								// 건물명이 있을 경우 추가한다.
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
								fullAddr += (extraAddr !== '' ? ' ('
										+ extraAddr + ')' : '');
							}
							// 주소 정보를 해당 필드에 넣는다.
							document.getElementById("sample5_address").value = fullAddr;
							// 주소로 상세 정보를 검색
							geocoder.addressSearch(data.address, function(
									results, status) {
								// 정상적으로 검색이 완료됐으면
								if (status === daum.maps.services.Status.OK) {
									var result = results[0]; //첫번째 결과의 값을 활용
									// 해당 주소에 대한 좌표를 받아서
									var coords = new daum.maps.LatLng(result.y,
											result.x);
									console.log("위도 경도 삽입");
									lat = result.y;
									lng = result.x;
									console.log(result.y, lat);
									console.log(result.x, lng);
									$("#lat").val(lat);
									$("#lng").val(lng);
									// 지도를 보여준다.
									mapContainer.style.display = "block";
									map.relayout();
									// 지도 중심을 변경한다.
									map.setCenter(coords);
									// 마커를 결과값으로 받은 위치로 옮긴다.
									marker.setPosition(coords)
								}
							});
						}
					}).open();
		}
		$(window).resize(function() {
			resizeMap();
			relayout();
		});
	</script>
</body>
</html>