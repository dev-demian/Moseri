<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <title>request</title>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <!-- bootstrap css -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/common.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/mypage.css">
        <style>
            div {
/*                 border: 1px dotted #000; */
            }
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
        <!-- bootstrap js -->
        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e52ea54ccfc578d2022fba92956f687e&libraries=services"></script>
        <script src="${pageContext.request.contextPath}/res/js/mypage.js"></script>
    </head>

    <body>
        <!--     <header class="container-fluid"> -->
        <!--         <div class="row text-center"> -->
        <!--             <h2>Mypage</h2> -->
        <!--         </div> -->
        <!--     </header> -->
        <header id="top" style="background-image: url(${pageContext.request.contextPath}/res/img/header_bg.jpg); background-size: 100% 100%; ">
            <div class="container">
                <nav class="collapse navbar-collapse bs-navbar-collapse" style="padding-bottom: 200px">
                    <ul class="nav navbar-nav">
                        <img id="home_icon" src="${pageContext.request.contextPath}/res/img/Icon.png" alt="icon">
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <button type="button" class="btn btn-info">Info</button>
                        </li>
                        <li>
                            <button type="button" class="btn btn-primary">로그인</button>
                        </li>
                        <li>
                            <button type="button" class="btn btn-success">회원가입</button>
                        </li>
                        <li>
                            <button type="button" class="btn btn-primary" onclick="location.href='mypage'">마이페이지</button>
                        </li>
                        <li>
                            <button type="button" class="btn btn-success">로그아웃</button>
                        </li>
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
            </div>
        </header>
        <div class="container-fluid">
            <div class="row text-center menu">
                <div class="col-sm-2"><a href="request">요청</a></div>
                <div class="col-sm-2"><a href="estimate">견적서</a></div>
                <div class="col-sm-2"><a href="profile">프로필</a></div>
                <div class="col-sm-2"><a href="notification">알림</a></div>
                <div class="col-sm-2"><a href="information">개인정보</a></div>
                <div class="col-sm-2"><a href="approval">고수인증</a></div>
            </div>
            <div class="row text-center mypage-bg">
            <div class="inner">
                <div class="col-sm-2"></div>
                <div class="col-sm-8">
                    <div id="info">
                        <h3>개인정보</h3>
                        <div class="info-wrap">
                            <div>
                                <span>Email</span>
                                <div>
                                    <input type="text">
                                </div>
                            </div>
                            <div>
                                <span>Password</span>
                                <div>
                                    <input type="password">
                                </div>
                            </div>
                            <div>
                                <span>Name</span>
                                <div>
                                    <input type="text">
                                </div>
                            </div>
                            <div class="info-address">
                                <span>Address1</span>
                                <div>
                                    <input name="addr1" type="text" id="info-address" readonly>
                                </div>
                            </div>
                            <div class="text-right">
                                <input type="button" onclick="info_execDaumPostcode()" value="주소 검색">
                            </div>
                            <div>
                                <span>Address2</span>
                                <div>
                                    <input name="addr2" type="text">
                                </div>
                            </div>
                            <!--
                            <div>
                                <input type="button" onclick="info_execDaumPostcode()" value="주소 검색">
                            </div>
-->
                            <div id="map"></div>
                            <script>
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

                                function info_execDaumPostcode() {
                                    new daum.Postcode({
                                        oncomplete: function(data) {
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
                                                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                                }
                                                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                                                fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
                                            }

                                            // 주소 정보를 해당 필드에 넣는다.
                                            document.getElementById("info-address").value = fullAddr;
                                            // 주소로 상세 정보를 검색
                                            geocoder.addressSearch(data.address, function(results, status) {
                                                // 정상적으로 검색이 완료됐으면
                                                if (status === daum.maps.services.Status.OK) {

                                                    var result = results[0]; //첫번째 결과의 값을 활용

                                                    // 해당 주소에 대한 좌표를 받아서
                                                    var coords = new daum.maps.LatLng(result.y, result.x);
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
                            <input type="submit" value="수정">
                        </div>
                    </div>
                </div>
                <div class="col-sm-2"></div>
            </div>
        </div>
        </div>
        <footer class="footer" style="background-color: #F2F2F2;">
            <div class="container">
                <div class="row">
                    <div class="row">
                        <div class="col-sm-5 col-md-5 about">
                            <div>
                                <a href="https://www.facebook.com/" target="_blank" wrc_done="true">
                                    <img src="https://soomgo.s3.ap-northeast-2.amazonaws.com/static/img/home/ico_footer_facebook1.png" class="social-ico">
                                </a>
                                <span class="wrc1 wrc_icon wrc_injected"></span>
                                <a href="http://www.naver.com/" target="_blank" wrc_done="true">
                                    <img src="https://soomgo.s3.ap-northeast-2.amazonaws.com/static/img/home/ico_footer_blog1.png" class="social-ico">
                                </a>
                                <span class="wrc1 wrc_icon wrc_injected"></span>
                                <a href="http://post.soomgo.com" target="_blank" wrc_done="true">
                                    <img src="https://soomgo.s3.ap-northeast-2.amazonaws.com/static/img/home/ico_footer_post.png" class="social-ico">
                                </a>
                                <span class="wrc1 wrc_icon wrc_injected"></span>
                                <a href="http://news.soomgo.com" target="_blank" wrc_done="true">
                                    <img src="https://soomgo.s3.ap-northeast-2.amazonaws.com/static/img/home/ico_footer_tistory.png" class="social-ico">
                                </a>
                                <span class="wrc1 wrc_icon wrc_injected"></span>
                            </div>
                            <p>(개발1팀)모서리컴퍼니</p>
                            <p>사업자등록번호: 000-00-00000 홈페이지 UI관리자: 곽재훈, 장준혁</p>
                            <p>서울시 구로구 구일로 8길 79, 영화아파트 1303호</p>

                            <p><a href="/terms/privacy">개인정보 처리방침</a> · <a href="/terms/usage">이용약관</a> · <a href="/terms/membership">멤버십 약관</a> · 고객센터: 0000-0000</p>
                            <p class="copy">© Moseri</p>
                        </div>
                        <div class="col-sm-3 col-md-2">
                            <h4 class="app-download">앱 다운로드</h4>
                            <ul class="menu">
                                <div class="app-download-wrap">
                                    <div class="app-download-btn">
                                        <a href="https://soomgo.app.link/SZeaREjJcE" target="_blank" wrc_done="true">
                                            <img src="https://soomgo.s3.ap-northeast-2.amazonaws.com/static/img/home/footer_googleplay_btn.png" class="footer-app-btn">
                                        </a>
                                        <span class="wrc0 wrc_icon wrc_injected"></span>
                                    </div>
                                    <div class="app-download-btn">
                                        <a href="https://soomgo.app.link/SZeaREjJcE" wrc_done="true">
                                            <img src="https://soomgo.s3.ap-northeast-2.amazonaws.com/static/img/home/footer_appstore_btn.png" class="footer-app-btn">
                                        </a>
                                        <span class="wrc0 wrc_icon wrc_injected"></span>
                                    </div>
                                </div>
                                <li>
                                    <a href="/" target="_blank">
                                        <img src="https://soomgo.s3.ap-northeast-2.amazonaws.com/static/img/home/footer_mobile_ico.png">모바일 앱 안내
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-sm-4 col-md-3">
                            <div class="col-sm-4 col-md-4 footer-list">
                                <h4>모서리<div class="switch"></div></h4>
                                <ul class="menu hide">
                                    <li>
                                        <a href="/about">프로젝트 소개</a>
                                    </li>

                                </ul>
                            </div>
                            <div class="col-sm-4 col-md-4 footer-list">
                                <h4>요청자<div class="switch"></div></h4>
                                <ul class="menu hide">
                                    <li><a href="/how-it-works">1.</a></li>
                                    <li><a href="/safety">2.</a></li>
                                    <li><a href="/prices">3.</a></li>
                                    <li><a href="/search/pro">4.</a></li>
                                </ul>
                            </div>
                            <div class="col-sm-4 col-md-4 footer-list">
                                <h4>고수<div class="switch"></div></h4>
                                <ul class="menu hide">
                                    <li>
                                        <a href="/how-soomgo-works">1.</a></li>
                                    <li><a href="/subscriptions/info">2.</a></li>
                                    <li><a href="/pro">3.</a></li>
                                    <li><a href="/pro-center">4.</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-3 col-md-2 footer-list-help">
                            <h4 class="app-download">도움이 필요하신가요?</h4>
                            <ul class="menu">
                                <li>
                                    <a href="https://soomgohelp.zendesk.com/hc/ko" target="_blank" wrc_done="true">
                                        <button class="btn footer-list-help-btn">
                                            <img src="https://soomgo.s3.ap-northeast-2.amazonaws.com/static/img/home/footer_help_ico.png">
                                            <span>도움요청하기</span>
                                        </button>
                                    </a>
                                    <span class="wrc0 wrc_icon wrc_injected"></span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>

    </html>