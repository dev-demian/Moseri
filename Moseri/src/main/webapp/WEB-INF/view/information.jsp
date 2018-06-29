<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <jsp:include page="/WEB-INF/view/template/pheader.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/view/template/mypageHeader.jsp"></jsp:include>    
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e52ea54ccfc578d2022fba92956f687e&libraries=services"></script>
    <script src="${pageContext.request.contextPath}/res/js/info.js"></script>
	 
        
      
        
        <div class="container-fluid">
        	
            <form class="commonForm" action="member_update" method="post">
            
            <div class="row text-center mypage-bg">
            <div class="inner">
                <div class="col-sm-2"></div>
                <div class="col-sm-8">
                    <div id="info">
                        <h3>개인 정보 변경</h3>
                        <%
        				String result = (String)request.getParameter("update_result");
        				if(result!=null){
        				out.println(result);
        				}
        				%>
                        <div class="info-wrap">
                            <div>
                                <span>E-mail</span>
                                <div>
                                    <input type="text"  value= "${sessionScope.email}" readonly>
                                </div>
                            </div>
                            <div>
                                <span>기존 Password</span>
                                <div>
                                    <input  type="password" name="pwd" title="기존 pwd를 입력하세요" >
                                </div>
                            </div>
                            <div>
                                <span>변경할 Password</span>
                                <div>
                                    <input  type="password" name="new_pwd" title="변경할 pwd를 입력하세요" placeholder="하나 이상의 숫자와 8 자 이상의 대소 문자입력"
									pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
									title="최소한 하나 이상의 숫자와 8 자 이상의 대소 문자가 있어야합니다.">
                                </div>
                            </div>
                            
                            
							<div >
								<span>Address</span>
								<div>
									<input type="text" value="${sessionScope.addr}" id="sample5_address" placeholder="주소"  name="addr" readonly>
									
								</div>
								
							</div>
							<div style=>
								<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" style="float : right;"><br>
							</div>
							
							<div>
								<div id="map" style="width:100%;height:300px;margin-top:70px;display:none"></div>
							</div>
							
							<script type="text/javascript"
								src="${pageContext.request.contextPath}/res/js/map.js"></script>
                            
                            <input type="submit" value="수정">
                        </div>
                    </div>
                </div>
                <div class="col-sm-2"></div>
            </div>
        </div>
            
            </form>
        </div>
        <script>
   var lat; //위도
   var lng; //경도

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
       position: new daum.maps.LatLng(37.537187, 127.005476),
       map: map
    });

    // 지도를 표시하는 div 크기를 변경하는 함수입니다
    function resizeMap() {
       var mapContainer = document.getElementById('map');
       mapContainer.style.width = '$( window ).width()'+'px';
       mapContainer.style.height = '500px'; 
       console.log($( window ).width());
    }

    function relayout() {    

    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
    map.relayout();
}

function sample5_execDaumPostcode() {
   new daum.Postcode({
      oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                       extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = fullAddr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        console.log("위도 경도 삽입");
                        lat = result.y;
                        lng = result.x;

                        console.log(result.y,lat);
                        console.log(result.x,lng);
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





$( window ).resize(function() {
  
  resizeMap();
  relayout();
  
  
  

});

</script>
        <jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>